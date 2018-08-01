function [ group ] = Crossover( group,dim ,pc )
%CROSSOVER Summary of this function goes here
%   Detailed explanation goes here
[i,j]=find(group(:,dim*2+2)==2);
Temp=group(i,:);
[m,n]=size(Temp);
for k=1:2:m-1
    if rand()<=pc
          in=floor(rand()*(dim-1))+1; 
          Temp(k,1:dim)=[Temp(k,1:in) Temp(k+1,in+1:dim)];
          Temp(k+1,1:dim)=[Temp(k+1,1:in) Temp(k,in+1:dim)];
          Temp(k,dim+1:dim*2)=[Temp(k,dim+1:dim+in) Temp(k+1,dim+in+1:dim*2)];
          Temp(k+1,dim+1:dim*2)=[Temp(k+1,dim+1:dim+in) Temp(k,dim+in+1:dim*2)];
          Temp(k,dim*2+2)=floor((in)/dim*Temp(k,dim*2+2)+(1-(in)/dim)*Temp(k+1,dim*2+2));
          Temp(k+1,dim*2+2)=floor((in)/dim*Temp(k+1,dim*2+2)+(1-(in)/dim)*Temp(k,dim*2+2));
    end
end
group(i,:)=Temp;
end

