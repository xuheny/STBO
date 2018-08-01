function [ group ] = Level( group ,dim , groupNum, leaderThreshold, abandonThreshold)
%LEVEL Summary of this function goes here
%   Detailed explanation goes here
group=sortrows(group,-(dim*2+1));
group(1,dim*2+2)=0;    %首领
group(2:fix(groupNum*leaderThreshold)+1,dim*2+2)=1;
group(fix(groupNum*leaderThreshold)+2:groupNum-fix(groupNum*abandonThreshold),dim*2+2)=2;
group(groupNum-fix(groupNum*abandonThreshold)+1:groupNum,dim*2+2)=3;
% group(:,dim*2+3)=group(:,dim*2+1)/group(1,dim*2+1);
% %根据与首领的值比较分出级别
% [i,j]=size(find(group(:,dim*2+3)>=leaderThreshold));
% leader=max(i-1,fix(groupNum*0.2));
% group(2:leader+1,dim*2+2)=1;
% group(leader+2:groupNum-fix(groupNum*abandonThreshold),dim*2+2)=2;
% group(groupNum-fix(groupNum*abandonThreshold)+1:groupNum,dim*2+2)=3;
end

