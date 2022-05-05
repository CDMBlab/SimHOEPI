function SNP = simulation(D, control_num, case_num, pt,SNP_num)
            SNP_num = SNP_num;
            Case_Num = case_num;
            Control_Num = control_num; 
            inds = Case_Num + Control_Num;
            Current_Case_Num = 0;
            Current_Control_Num = 0;
%             class = zeros(1,inds);
%            MAFs = zeros(1,m.order);
%            ModelInformation.site = site(1,:);
            i = 0;
            while i<inds
                brk = get_breaks(D);%Randomly generate breakpoints
                j =0;
                i = i+1;
                snp = Splicing(brk,D);%splice data
                while j < SNP_num
                    j = j+1;
                    SNP(i,j) = snp(j);
                end
                %            MAF =find(maf >= 0.5);
                Status=StatusDecision(SNP(i,:),pt);
                if (Status==1) % case
                    if Current_Case_Num < Case_Num
                        SNP(end,j+1)=Status;
                        Current_Case_Num=Current_Case_Num+1;
                    else
                        i = i-2;
                    end
                else
                    if Current_Control_Num < Control_Num
                        SNP(end,j+1)=Status;
                        Current_Control_Num=Current_Control_Num+1;
                    else
                        i = i-1;
                    end
                end
%                 if SNP(end,j-1) == 0
%                     i= i+1;
%                 end
            end   
            % disp(SNP);
        end

        
function brk = get_breaks(d)
    %Randomly generate breakpoints
    %Returns a matrix: a matrix of integers showing the location of data breakpoints for each sample 
    num = round(rand(1,1)*size(d,2));
    brk = sort(round(rand(1,num)*size(d,2)));
    brk = unique(brk);
    brk(find(brk==0))=[];
    brk(end+1)=inf;
end
    
 function SNP  = Splicing(brk, d)
 % splice data
     brk_num = 1;
     column= 1;
     j = round(rand(1,1)*(size(d,1)-2)) + 1;
%      while j ==0
%          j = round(rand(1,1)*(size(d,1)-1));
%      end
     while  column<=size(d,2)
         if column ~= brk(brk_num)
             SNP(column) = d(j,column);
             column = column + 1 ;
         else
             j = round(rand(1,1)*(size(d,1)-1));
             while j ==0
                 j = round(rand(1,1)*(size(d,1)-1));
             end
             SNP(column) = d(j,column);
             column = column + 1;
             brk_num = brk_num+1;
         end
     end
end
        
 function Status=StatusDecision(SNPs,ModelInformation)
     num = 0;
     for j=1:ModelInformation.order
         num=num+(SNPs(1,ModelInformation.site(j))-1)*3^(ModelInformation.order-j);
     end
     R=ModelInformation.pt(num+1,1);
     UR=1-R;
     ProCase=1;
     ProCase=ProCase*UR;
     ProCase=1-ProCase;
     a =rand;
     if a <=ProCase
         Status=1;
     else
         Status=0;
     end
 end
