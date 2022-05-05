
classdef Model  
    properties
        name          % Name of the model.
        order         % Number of locus defined in the model.
        penetrances   % Array of symbolic expressions, representing the epistatic model.
        variables     % List of symbolic variables used throughout the model.
    end
         
    
    methods (Access = private)
        function [x,y] = solve(obj, varargin,x)
            assume(obj.variables(1) == x );
            assume(in(obj.variables(2), 'Real') & obj.variables(2) > 0 );
            [Sx, Sy, par, cond]= solve([varargin], obj.variables, 'ReturnConditions' ,true);
            if isempty(Sx)
                ME = MException("toxo:Model:incompatible", "There is no solution to the problem defined.");
                throwAsCaller(ME);
            elseif isempty(par)
                x = Sx;
                y = Sy;
            else
                lastwarn('');
                warning('off', 'symbolic:solve:SolutionsDependOnConditions');
                warning('off', 'symbolic:solve:ParametrizedFamily');
                S = solve(cond, par);
                warning('on', 'symbolic:solve:SolutionsDependOnConditions');
                warning('on', 'symbolic:solve:ParametrizedFamily');
                [~, wid] = lastwarn();
                if strcmp(wid, 'symbolic:solve:SolutionsDependOnConditions') || strcmp(wid, 'symbolic:solve:ParametrizedFamily')
                    ME = MException("toxo:Model:incapable", "Could not find a solution to the problem defined.");
                    throwAsCaller(ME);
                else
                    x = subs(Sx, par, S);
                    y = subs(Sy, par, S);
                end
            end
        end
    end
        
    methods
        function obj = Model(path)
            
            [~, obj.name, ~] = fileparts(path);
            fid = fopen(path, 'r');
            content = textscan(fid, "%[^,], %[^,\n]", "CommentStyle", "#", "TextType", "string", "CollectOutput", true, "ReturnOnError", false);
            fclose(fid);
            content = content{1};
            [~, index] = sort(content(:,1));
            obj.penetrances = str2sym(content(index,2));
            obj.variables = symvar(obj.penetrances);
            obj.order = strlength(content(1,1)) / 2;
        end  

      function pt = use_heritability(obj, mafs, h, x, site)
            if length(obj.variables) ~= 2
                ME = MException("toxo:Model:unsupported", "Toxo does not support models with %i variables.", length(obj.variables));
                throwAsCaller(ME);
            end
            
            c1 = heritability(mafs) == h;
            [x, y] = obj.solve(c1,x);
            pt = ModelInformation(obj, [x, y],site);
            
           function h = heritability(mafs)
                gp = genotype_probabilities(mafs);
                p = sum(obj.penetrances .* gp);
                h = sum((obj.penetrances - p).^2 .* gp) / (p * (1 - p));
           end
      end
      
        function pt = use_prevalence(obj, mafs, p ,x,site)
            if length(obj.variables) ~= 2
                ME = MException("Model:unsupported","SimHOEPI does not support models with %i variables.", length(obj.variables));
                throwAsCaller(ME);
            end

            c1 = prevalence(mafs) == p;
            [x, y] = obj.solve(c1,x);
            pt = ModelInformation(obj, [x, y],site);

            
            function p = prevalence(mafs)
                gp = genotype_probabilities(mafs);
                p = sum(obj.penetrances .* gp);
            end
        end
    end
end