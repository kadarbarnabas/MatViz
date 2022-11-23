clear
syms u v

x(u, v) = u - u^3/3 + u*v^2;
y(u, v) = v - v^3/3 + v*u^2;
z(u, v) = u^2 - v^2;

fsurf(x, y, z, [-25 25 -25 25])

hold on

fplot3(x(10, 15), y(10, 15), z(10, 15), 'r*')
