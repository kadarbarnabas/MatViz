clear
syms u v

r(u, v) = 2 + sin(7*u + 5*v);

x(u, v) = r(u, v) * cos(u) * sin(v);
y(u, v) = r(u, v) * sin(u) * sin(v);
z(u, v) = r(u, v) * cos(v);

fsurf(x, y, z, [0, 2*pi, 0, pi])
axis equal