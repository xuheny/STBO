function [ group ] = Mutation( group,dim,pm ,maxL,minL ,groupNum,kinds)
%MUTATION Summary of this function goes here
%   Detailed explanation goes here
% [i,j]=find(group(:,dim*2+2)==2);
% Temp=group(i,:);
% [m,n]=size(Temp);
% for k=1:m
%     if rand<pm
%        Temp(k,1:dim*2)=rand(1,dim*2)*(maxL-minL)+(minL);
%     end
% end
% group(i,:)=Temp;
for k=2:groupNum
    if rand<pm
        group(k,unidrnd(dim))=rand(1)*(maxL-minL)+(minL);
        group(k,:) = AdaptFunc( group(k,:) ,dim ,kinds);
         if group(k,dim*2+1)>group(1,dim*2)
             temp=group(1,:);
             group(1,:)=group(k,:);
             group(k,:)=temp;
         end
    end
end
end

