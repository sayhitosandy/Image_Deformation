function [ v ] = calc_V( X, P, Q )

    R = [0,-1;1,0];
    vecc = Q-P;
    rotated_vecc = R*vecc;
    v = dot((X-P),rotated_vecc);
    v = v/norm(Q-P);

end

