%6.feladat
clear

px = [-2 4 6 10];
py = [-2 0 -2 2];
plot(px, py, 'r*')

axis([-4 16 -6 4])
axis equal
hold on

t0 = -1;
t1 = 0;
t2 = 2;
t3 = 3;

%x
syms a3 a2 a1 a0
eq = [a3 * t0^3 + a2 * t0^2 + a1 * t0^1 + a0 == px(1), ...
      a3 * t1^3 + a2 * t1^2 + a1 * t1^1 + a0 == px(2), ...
      a3 * t2^3 + a2 * t2^2 + a1 * t2^1 + a0 == px(3), ...
      a3 * t3^3 + a2 * t3^2 + a1 * t3^1 + a0 == px(4)
      ];
m = solve( eq, [a3 a2 a1 a0] );
syms t
x(t) = m.a3 * t^3 + m.a2 * t^2 + m.a1 * t^1 + m.a0;


%y
syms b3 b2 b1 b0
eq = [b3 * t0^3 + b2 * t0^2 + b1 * t0^1 + b0 == py(1), ...
      b3 * t1^3 + b2 * t1^2 + b1 * t1^1 + b0 == py(2), ...
      b3 * t2^3 + b2 * t2^2 + b1 * t2^1 + b0 == py(3), ...
      b3 * t3^3 + b2 * t3^2 + b1 * t3^1 + b0 == py(4)
      ];
m = solve( eq, [b3 b2 b1 b0] );
y(t) = m.b3 * t^3 + m.b2 * t^2 + m.b1 * t^1 + m.b0;

fplot(x, y, [t0 t3])
hold on

%erintovekotr
xd(t) = diff(x, t);
yd(t) = diff(y, t);

%11feladat

px = [10 14];
py = [2 -4];

plot(px, py, 'b*')

t0 = -1;
t1 = 1;

vx = [xd(t0), 3];
vy = [xd(t0), 0];

%x
syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t^1 + a0;
cxd(t) = diff(cx, t);

eq = [cx(t0) == px(1), cx(t1) == px(2), ...
      cxd(t0) == vx(1), cxd(t1) == vx(2)];

m = solve(eq, [a3 a2 a1 a0]);
x(t) = m.a3 * t^3 + m.a2 * t^2 + m.a1 * t^1 + m.a0;


%y
syms b3 b2 b1 b0
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t^1 + b0;
cyd(t) = diff(cy, t);

eq = [cy(t0) == py(1), cy(t1) == py(2), ...
      cyd(t0) == vy(1), cyd(t1) == vy(2)];

m = solve(eq, [b3 b2 b1 b0]);
y(t) = m.b3 * t^3 + m.b2 * t^2 + m.b1 * t^1 + m.b0;

fplot(x, y, [t0 t1])