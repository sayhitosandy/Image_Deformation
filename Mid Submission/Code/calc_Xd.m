function [ Xd ] = calc_Xd( u, v, Pd, Qd )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    res = u*(Qd-Pd);
    R = [0,-1;1,0];
    res2 = R*(Qd-Pd);
    res2 = v*res2;
    res2 = res2/norm(Qd-Pd);
    Xd = Pd + res + res2;
end

