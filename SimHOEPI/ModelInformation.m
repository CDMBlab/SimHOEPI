classdef ModelInformation
    properties
        order  % The number of SNPs in this model.
        vars   % Values for the variables present in the original model.
        pt     % Array of symbolic penetrances values.
        site   % locus
    end
        methods (Access = private)
        function [s] = to_txt(obj, fmask, mafs)
            attributes = ['Attribute names:\t' char(join(arrayfun(@(x) sprintf("SNP%i", obj.site(x)), 1:obj.order), char(9))) '\n'];
            solution = char(join(cellfun(@(x) sprintf(string(['%s: ' fmask '\n']), x, vpa(obj.vars.(x))), fieldnames(obj.vars)), ''));
            maf = ['Minor allele frequencies:\t' char(join(arrayfun(@(x) sprintf("%.3f", x), mafs), char(9))) '\n'];
            
            prevalence = sprintf(['Prevalence: ' fmask '\n'], obj.prevalence(mafs));
            heritability = sprintf(['Heritability: ' fmask '\n\n'], obj.heritability(mafs));
            table = ['Table:\n\n' recursive_table(obj.pt, obj.order)];
            s = [attributes maf solution prevalence heritability table];
            
            function s = recursive_table(pt, o)
                n = length(pt) / 3;
                if o > 2
                    s = [recursive_table(pt(1:n), o - 1) '\n' recursive_table(pt(n + 1:2 * n), o - 1) '\n' recursive_table(pt(2 * n + 1:end), o - 1)];
                elseif o == 2
                    s = [recursive_table(pt(1:n), o - 1) recursive_table(pt(n + 1:2 * n), o - 1) recursive_table(pt(2 * n + 1:end), o - 1)];
                else
                    s = [char(join(arrayfun(@(x) string(sprintf(fmask, vpa(x))), pt), ", ")) '\n'];
                end
            end
        end
    end
    methods (Static = true)
        function out = format_csv()
            out = 0;
        end
        
        function out = format_txt()
            out = 1;
        end
    end
    methods
        function obj = ModelInformation(model, values,site)
            obj.order = model.order;
            obj.vars = struct(char(model.variables(1)), values(1), char(model.variables(2)), values(2));
            obj.site = site(1,:);
            obj.pt = subs(model.penetrances, model.variables, values);
            obj.pt = vpa(obj.pt);
            MAX = 0;
            MAX =max(obj.pt(:,1));
            for i=1:size(obj.pt,1)
                if MAX >= 1
                    obj.pt(i,1) = obj.pt(i,1)/(MAX+1);
                end
                i = i+1;
            end

        end
    function p = prevalence(obj, mafs, gp)
        
            if nargin < 3
                gp = genotype_probabilities(mafs);
            end
            
            p = vpa(sum(obj.pt .* gp));
        end
        
        function h = heritability(obj, mafs)
            
            gp = genotype_probabilities(mafs);
            p = obj.prevalence(mafs, gp);
            h = vpa(sum((obj.pt - p).^2 .* gp) / (p * (1 - p)));
        end
        
        function mp = marginal_penetrances(obj, mafs)

            mp = sym(zeros(obj.order, 3));
            gp = genotype_probabilities(mafs);
            sp = arrayfun(@toxo.genotype_probabilities, mafs, 'UniformOutput', false);
            
            for i = 1:obj.order
                for j = 1:length(obj.pt)
                    geno = mod(fix((j - 1) / 3^(obj.order - i)), 3) + 1;
                    mp(i, geno) = mp(i, geno) + obj.pt(j) * gp(j) / sp{i}(geno);
                end
            end
            mp = vpa(mp);
        end
        
        function write(obj, path, format, varargin)
            
            fmask = sprintf('%%.%if', fix(digits()/4));
            switch format
                case obj.format_csv
                    s = arrayfun(@(x) {[char(x) char(x)], [char(x) lower(char(x))], [lower(char(x)) lower(char(x))]}, (0:obj.order - 1) + 'A', 'UniformOutput', false);
                    writetable(table(cell2mat(toxo.nfold(s)), arrayfun(@(x) sprintf(fmask, vpa(x)), obj.pt, 'UniformOutput', false)), path, 'WriteVariableNames', false);
                case obj.format_txt
                    % Variable arguments for GAMETES format:
                    %   mafs: array of doubles
                    fid = fopen(path, 'w+');
                    fprintf(fid, obj.to_txt(fmask, varargin{1}));
                    fclose(fid);
            end
        end
    end
end