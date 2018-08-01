function [ group ] = Follow(group, groupNum,dim,w,c,maxL ,minL ,kinds)
%FOLLOW Summary of this function goes here
%   Detailed explanation goes here
for k=1:groupNum
    if group(k,dim*2+2)>=2
         TempV=w*group(k,dim+1:2*dim)+c*rand()*(group(1,1:dim)-group(k,1:dim));
         for h=1:dim
             if TempV(:,h)>maxL*0.1
                 TempV(:,h)=maxL*0.1;
             end
             if TempV(:,h)<minL*0.1
                 TempV(:,h)=minL*0.1+1e-10;
             end
         end
         group(k,dim+1:dim*2)=TempV;
         %TempPos=group(k,1:dim)+3*ones(1,dim).*((maxL-minL)/S)*((group(1,1:dim)-group(k,1:dim))/abs((group(1,1:dim)-group(k,1:dim))));
        TempPos=group(k,1:dim)+TempV;
         for h=1:dim
             if TempPos(:,h)>maxL
                 TempPos(:,h)=maxL;
             end
             if TempPos(:,h)<=minL
                 TempPos(:,h)=minL+1e-10;
             end
         end
         group(k,1:dim)=TempPos;
         group(k,:) = AdaptFunc( group(k,:) ,dim ,kinds);
         if group(k,dim*2+1)>group(1,dim*2+1)
             temp=group(1,1:dim*2+1);
             group(1,1:dim*2+1)=group(k,1:dim*2+1);
             group(k,1:dim*2+1)=temp;
         end
    end
end
end

