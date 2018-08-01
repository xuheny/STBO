function [ group ] = AdaptFunc( group ,dim ,kinds)
%ADAPTFUNC Summary of this function goes here
%   Detailed explanation goes here

switch kinds
    case 1          %Sphere
        group(:,dim*2+1)=sum(group(:,1:dim)'.^2)';
    case 2           %Schwefel 2.22
        [m,n]=size(group);
        temp=ones(m,1);
        for i=1:dim
            temp=temp.*abs(group(:,i));
        end
        group(:,dim*2+1)=sum(abs(group(:,1:dim)'))'+temp;
        %group(:,dim*2+1)=sum(abs(group(:,1:dim)'))';
    case 3          %Schwefel 1.2
        [m,n]=size(group);
        for j=1:m
            temp3=0;
            for i=1:dim
                temp3=temp3+sum(group(j,1:i)).^2;
            end
            group(j,dim*2+1)=temp3;
            
        end
        %         temp3=zeros(m,1);
        %         for i=1:dim
        %             temp3=temp3+sum(group(:,1:i),2).^2;
        %         end
        %         group(:,dim*2+1)=temp3;
    case 4          %Rosenbrock
        [m,n]=size(group);
        temp4=zeros(m,1);
        for i=1:(dim-1)
            temp4=temp4+100*(group(:,i).^2-group(:,i+1)).^2+(1-group(:,i)).^2;
        end
        group(:,dim*2+1)=temp4;
    case 5           %Rastrigin
        [m,n]=size(group);
        temp11=zeros(m,1);
        for i=1:dim
            temp11=temp11+group(:,i).^2-10*cos(2*pi*group(:,i))+10;
        end
        group(:,dim*2+1)=temp11;
    case 6           %Quartic
        [m,n]=size(group);
        temp6=zeros(m,1);
        for i=1:dim
            temp6=temp6+i.*(group(:,i).^4);
        end
        group(:,dim*2+1)=temp6+rand(m,1);
        
    case 7      %F4
        [m,n]=size(group);
        group(:,dim*2+1)=418.9829*dim*ones(m,1)+sum(-group(:,1:dim).*sin(sqrt(abs(group(:,1:dim)))),2);
        
    case 8   %Dixon&Price
        [m,n]=size(group);
        temp8=zeros(m,1);
        for i=2:dim
            temp8=temp8+i.*(2.*group(:,i).^2-group(:,i-1)).^2;
        end
        group(:,dim*2+1)=temp8+(group(:,1)-ones(m,1)).^2;
    case 9   %% Sum of Squares
        [m,n]=size(group);
        temp6=zeros(m,1);
        for i=1:dim
            temp6=temp6+i.*(group(:,i).^2);
        end
        group(:,dim*2+1)=temp6;
        
    case 10  %za
        [m,n]=size(group);
        temp10=zeros(m,1);
        for i=1:dim
            temp10=temp10+0.5.*i.*group(:,i);
        end
        group(:,dim*2+1)=sum(group(:,1:dim)'.^2)'+temp10.^2+temp10.^4;
    case 11  %ackley
        [m,n]=size(group);
        temp11=zeros(m,1);
        for i=1:m
            group(i,dim*2+1)= -20*exp(-0.2*sqrt(1/dim*sum(group(i,1:dim).^2)))-exp(1/dim*sum(cos(2*pi*group(i,1:dim))))+20+exp(1);
        end
    case 12  %Griewank
        [m,n]=size(group);
        for i=1:m
            temp12=1;
            for j=1:dim
                temp12=temp12*cos(group(i,j)/sqrt(j));
            end
            group(i,dim*2+1)=1/4000*sum(group(i,1:dim).^2)-temp12+1;
        end
        
    case 13   %Powelll
        
        [m,n]=size(group);
        for j=1:m
            temp14=0;
            for i=1:fix(dim/4)
                temp14=temp14+(group(j,4*i-3)+10*group(j,4*i-2)).^2+5*(group(j,4*i-1)-group(j,4*i)).^2+(group(j,4*i-2)-group(j,4*i-1)).^4+10*(group(j,4*i-3)-group(j,4*i)).^4;
            end
            group(j,dim*2+1)=temp14;
        end
    case 14 %Salomon
        [m,n]=size(group);
        for i=1:m
            group(i,dim*2+1)=1-cos(2*pi*sqrt(sum(group(i,1:dim).^2)))+0.1*sqrt(sum(group(i,1:dim).^2));
        end
        
    case 15
        a=[0.1957,0.1947,0.1735,0.1600,0.0844,0.0627,0.0456,0.0342,0.0323,0.0246,0.0235];
        b=[0.25,0.5,1,2,4,6,8,10,12,14,16];
        [m,n]=size(group);
        for j=1:m
            temp=0;
            for i=1:11
                temp=temp+(a(i)-(group(j,1)*(b(i)*b(i)+b(i)*group(j,2)))/(b(i)*b(i)+b(i)*group(j,3)+group(j,4))).^2;
            end
            group(j,dim*2+1)=temp;
        end
        
    case 16
        A=[10,3,17,3.5,1.7,8;0.05,10,17,0.1,8,14;3,3.5,17,10,17,8;17,8,0.05,10,0.1,14];
        c=[1,1.2,3,3,2];
        P=[0.131,0.169,0.556,0.012,0.828,0.588;
            0.232,0.413,0.830,0.373,0.100,0.999;
            0.234,0.141,0.352,0.288,0.304,0.665;
            0.404,0.882,0.873,0.574,0.109,0.038];
        
         [m,n]=size(group);
        for j=1:m
            temp=0;
            for i=1:4
                temp1=0;
                for k=1:dim
                    temp1=temp1+A(i,k)*(group(j,k)-P(i,k)).^2;
                end
                temp=temp+c(i)*exp(-temp1); 
            end
            group(j,dim*2+1)=temp;
        end
    case 17
         [m,n]=size(group);
        for j=1:m
            group(j,dim*2+1)=(1.5-group(j,1)*(1-group(j,2))).^2+(2.25-group(j,1)*(1-group(j,2))).^2+(2.625-group(j,1)*(1-group(j,2))).^2;
        end
        
end 
group(:,dim*2+1)=1./(group(:,dim*2+1)+0.01);
end

