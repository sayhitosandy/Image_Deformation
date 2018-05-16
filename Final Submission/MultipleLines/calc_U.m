function [ u ] = calc_U ( X, P, Q )
    
    res = dot((X-P),(Q-P));
    res = res/norm(Q-P);
    u = res/norm(Q-P);

end

