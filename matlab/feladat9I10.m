clear
px = [-2 6];
py = [-2 -2];

plot(px, py, 'r*')
axis([-4 16 -6 4])
axis equal
hold on

vx = [6 4];
vy = [-4 4];

t0 = 0;
t1 = 1;


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

%erintovektor
xd(t) = diff(x, t);
yd(t) = diff(y, t);

quiver(x(t0), y(t0), xd(t0), yd(t0))
quiver(x(t1), y(t1), xd(t1), yd(t1))
hold on

%10.feladat
px = [6 14];
py = [-2 -4];

plot(px, py, 'b*')

vx = [4 3];
vy = [4 0];

t0 = 0;
t1 = 2;

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
hold on

%erintovektor
xd(t) = diff(x, t);
yd(t) = diff(y, t);

quiver(x(t1), y(t1), xd(t1), yd(t1))

%Megjegyzés: Nem muszály így külön ahogy én csináltam csak az átláthatóság
%kedvéért