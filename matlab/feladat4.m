clear
syms x y

z = x + y;
x = 2*y - 3*z + 4;
y = 4*x + 8*z + 2;

fsurf(z,'r')
hold on
fsurf(x, 'y')
hold on
fsurf(y, 'g')
