function A=main(kinds,maxL,minL,dim)
for sss=1:1

groupNum=50;          
iteNum=1000;          
leaderThreshold=0.2;  
abandonThreshold=0.1; 
pm=0.4;               
pc=0.9;               
c=2;                  
w=0.01;                
S=1000;
%dim=50;               
%maxL=500;
%minL=-500;
%kinds=7;
flag=1;
flag1=1;
SSSS=0;
group = GroupInit( groupNum,dim,maxL,minL);
group = AdaptFunc( group ,dim ,kinds);
group=Level( group ,dim , groupNum, leaderThreshold, abandonThreshold );
S1=zeros(1,iteNum);
S2=zeros(1,iteNum-1);
S1(1,1)= H( group ,groupNum,dim );

i=1;
nnn=1;
tic;
while(i<=iteNum)
    if flag
     for k=1:groupNum
        if group(k,dim*2+2)==1
             j=1;
             TempPos=zeros(8,dim*2);
             while (j<=8)
                 TempPos(j,1:dim)=group(k,1:dim)+(ones(1,dim).*(sin(2*pi*j/8)*(exp(((-50)*nnn)/iteNum)))).*rand(1,dim);
           %     TempPos(j,dim+1:dim*2)=w*group(k,dim+1:2*dim)+c*rand()*(group(1,1:dim)-TempPos(j,1:dim));
            %    TempPos(j,dim+1:dim*2)=w*group(k,dim+1:2*dim)+ones(1,dim).*(sin(2*pi*j/4)*(exp(((-50)*i)/iteNum)));
                 for h=1:dim*2
                     if TempPos(j,h)>maxL
                          TempPos(j,h)=maxL;
                     end
                     if TempPos(j,h)<=minL
                         TempPos(j,h)=minL+1e-10;
                     end
                 end
                 j=j+1;
              end
             TempV=AdaptFunc( TempPos ,dim ,kinds);
             [Temp,b]=max(TempV(:,dim*2+1));
             if Temp > group(k,dim*2+1)
                 group(k,1:dim*2)=TempPos(b,1:dim*2);
                 group(k,:) = AdaptFunc( group(k,:) ,dim ,kinds);
             end
             
             if group(k,dim*2+1)>group(1,dim*2+1)
                temp=group(1,1:dim*2+1);
                group(1,1:dim*2+1)=group(k,1:dim*2+1);
                group(k,1:dim*2+1)=temp;
                
             end                
        end
     end
     nnn=nnn+1;
    end
    group=Follow(group, groupNum,dim,w,c,maxL ,minL ,kinds);
    group  =Mutation( group,dim,pm ,maxL,minL ,groupNum,kinds);

    group = AdaptFunc( group ,dim ,kinds);

    group=Level( group ,dim , groupNum, leaderThreshold, abandonThreshold );
    
%     if group(1,dim*2+1)>99.999
%         break;
%     end

    for k=1:groupNum
        if group(k,dim*2+2)==3
            %group(k,dim+1:dim*2)=rand(1,dim)*(maxL*0.1-minL*0.1)+minL*0.1;
            group(k,1:dim)=group(1,1:dim)+ones(1,dim).*(exp(((-20)*2*i)/iteNum)).*rand(1,dim);
            %group(k,1:dim)=rand(1,dim)*(maxL-minL)+minL;
        end
    end
    group(:,dim*2+4)= group(:,dim*2+4)+1;

    group = AdaptFunc( group ,dim ,kinds);


    group=Level( group ,dim , groupNum, leaderThreshold, abandonThreshold );
    

     yy(i)=1/group(1,dim*2+1)-0.01;
    i=i+1;
    S1(1,i)= H( group ,groupNum,dim );
    S2(1,i-1)=abs(S1(1,i)-S1(1,i-1));
    if flag1
           if (S1(1,i)<3.8872&&S2(1,i-1)<0.1609)               
%           w=0.01; 
            maxL=max(max(group(:,1:dim)));
            minL=min(min(group(:,1:dim)));
           flag=1;
           flag1=0;
           SSSS=i;
          end
    end
%     
%     if (S1(1,i)<3.6&&S2(1,i-1)<0.03)
%         SSSS=i
%         break;      
%     end

end
toc;
%plot(yy);

1/group(1,dim*2+1)-0.01


end
end

