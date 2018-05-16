function [ v ] = calc_v( X, P, Q )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    R = [0,-1;1,0];
    vecc = Q-P;
    rotated_vecc = R*vecc;
    v = dot((X-P),rotated_vecc);
    v = v/norm(Q-P);
end

