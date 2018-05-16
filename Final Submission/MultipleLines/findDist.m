function [ dist ] = findDist( X, u, v, P, Q )
    
    if (u>0 && u<1)
        dist = norm(v);
    elseif (u<=0)
        dist = norm(X-P);
    elseif (u>=1)
        dist = norm(X-Q);
    end
    
end

