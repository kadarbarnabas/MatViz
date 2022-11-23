clear
syms x y

z(x, y) = sin(x) + cos(y)/x;
fsurf(z(x, y), [0.1, 5, -6, 6])
