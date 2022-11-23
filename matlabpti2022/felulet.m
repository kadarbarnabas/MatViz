clear
syms x y
f(x, y) = sin(x) + cos(y);
fsurf(f,[-10 10 -20 0],'y')
axis equal
hold on
fimplicit(f, 'r', 'LineWidth', 3)
plot3(3, 4, f(3,4), '*b', 'Markersize', 10)