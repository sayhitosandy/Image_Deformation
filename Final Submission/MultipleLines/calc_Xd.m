function [ Xd ] = calc_Xd( u, v, Pd, Qd)

    res = u*(Qd-Pd);
    R = [0,-1;1,0];
    res2 = R*(Qd-Pd);
    res2 = v*res2;
    res2 = res2/norm(Qd - Pd);
    Xd = Pd + res + res2;

end

