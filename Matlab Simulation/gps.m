function [X, Y, Z, T]  = gps( x1, xp, y1, yp, z1, zp, p1, pp)
syms X;
syms Y;
syms Z;
syms T; 
% Kalman method
A1 = 2* xp(1) * X + 2 * xp(1) * Y + 2 * xp(2) * Z - 2 * (.047)^2 * x1 * T;
A2 = 2* yp(1) * X + 2 * yp(1) * Y + 2 * yp(2) * Z - 2 * (.047)^2 * y1 * T;
A3 = 2* zp(1) * X + 2 * zp(1) * Y + 2 * zp(2) * Z - 2 * (.047)^2 * z1 * T;
A4 = 2* pp(1) * X + 2 * pp(1) * Y + 2 * pp(2) * Z - 2 * (.047)^2 * p1 * T;

A4 = A4 - A1;
A3 = A3 - A1;
A2 = A2 - A1;

B1 = xp(1)^2 + xp(2)^2 + xp(3)^2 - 6 + (.047)^2 * x1^2;
B2 = xp(1)^2 + xp(2)^2 + xp(3)^2 - 6 + (.047)^2 * x1^2;
B3 = xp(1)^2 + xp(2)^2 + xp(3)^2 - 6 + (.047)^2 * x1^2;
B4 = xp(1)^2 + xp(2)^2 + xp(3)^2 - 6 + (.047)^2 * x1^2;

B4 = B4 - B1;
B3 = B3 - B1;
B2 = B2 - B1;

X = solve([A4 A3 A2],X)