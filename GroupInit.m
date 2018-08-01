function [ group ] = GroupInit( groupNum,dim,maxL,minL)
%GROUPINIT Summary of this function goes here
%   Detailed explanation goes here
group1=rand(groupNum,dim)*(maxL-minL)+minL;
group2=rand(groupNum,dim)*(maxL*0.1-minL*0.1)+minL*0.1;
group=[group1,group2,ones(groupNum,3)*0,ones(groupNum,1)*1];
end

