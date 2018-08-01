function [ S ] = H( group ,groupNum,dim )
%H �˴���ʾ�йش˺����ժ�?
%   �˴���ʾ��ϸ˵��
%% ת�����?
minZ=min(group(1:groupNum,1:dim));
maxZ=max(group(1:groupNum,1:dim));
zb=zeros(groupNum,dim);
for i=1:groupNum
    for j=1:dim
         if minZ(1,j)==maxZ(1,j)
             zb(i,j)=groupNum;
         else
        zb(i,j)=floor(groupNum*((group(i,j)-minZ(1,j))/(maxZ(1,j)-minZ(1,j))));
         end
         if zb(i,j)==0
             zb(i,j)=1;
         end
    end
end

%% ��
S=0;
A=1:1:groupNum;
n=histc(zb,A)/(groupNum*dim);
for i=1:groupNum
    for j=1:dim
        if(n(i,j)~=0)
            S=S+(-1)*(n(i,j)*(log(n(i,j))));
        end
    end    
end
end

