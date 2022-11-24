clear

px = [10 20 40 50 20];
py = [20 40 40 20 10];

plot(px, py, 'r*')
axis([0 60 10 50])
axis equal
hold on

t0 = 0;
t1 = 1;
t2 = 2;
t3 = 3;
t4 = 4;

%x
syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t^1 + a0;
cxd(t) = diff(cx, t);

eq = [cx(t0) == px(1), cx(t1) == px(2), cx(t2) == px(3), ...
    cx(t3) == px(4), cx(t4) == px(5)];

m = solve(eq, [a3 a2 a1 a0] );
x(t) = subs(cx, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0]);

%y
syms b3 b2 b1 b0 
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t^1 + b0;
cyd(t) = diff(cy, t);

eq = [cy(t0) == py(1), cy(t1) == py(2), cy(t2) == py(3), ...
    cy(t3) == py(4), cy(t4) == py(5)];

m = solve(eq, [b3 b2 b1 b0] );
y(t) = subs(cy, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0]);

fplot(x, y, [t0 t4])