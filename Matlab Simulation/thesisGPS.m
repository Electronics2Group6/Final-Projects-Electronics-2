function [C] = thesisGPS(xi,yi,zi,ri)

% syms X Y Z;

% A = [2*(xi(2)-xi(1))*X , 2*(yi(2)-yi(1))*Y , 2*(zi(2)-zi(1))*Z ; ...
%      2*(xi(3)-xi(1))*X , 2*(yi(3)-yi(1))*Y , 2*(zi(3)-zi(1))*Z ; ...
%      2*(xi(4)-xi(1))*X , 2*(yi(4)-yi(1))*Y , 2*(zi(4)-zi(1))*Z]

A = [2*(xi(2)-xi(1)) , 2*(yi(2)-yi(1)) , 2*(zi(2)-zi(1)); 
     2*(xi(3)-xi(1)) , 2*(yi(3)-yi(1)) , 2*(zi(3)-zi(1));
     2*(xi(4)-xi(1)) , 2*(yi(4)-yi(1)) , 2*(zi(4)-zi(1))];

 
 B = [ri(1)^2 - xi(1)^2 - ri(2)^2 + xi(2)^2;
      ri(1)^2 - xi(1)^2 - ri(3)^2 + xi(3)^2;
      ri(1)^2 - xi(1)^2 - ri(4)^2 + xi(4)^2;];
 
 C = A\B;
% X = linsolve(A,B)