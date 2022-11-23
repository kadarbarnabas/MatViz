clear
syms x y

z(x, y) = sqrt(1-x^2-0.5*y^2);
fsurf(z)

axis equal
hold on

plot3(0.5, 0.2, z(0.5, 0.2), 'r*', 'Markersize', 10)