function [ u ] = calc_u( X, P, Q )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    res = dot((X-P),(Q-P));
    res = res/norm(Q-P);
    u = res/norm(Q-P);
end

