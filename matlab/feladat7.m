clear

px = [-2 6 10];
py = [-2 -2 2];

plot(px, py, 'r*')
axis([-4 12 -4 4])
axis equal
hold on



vx = [6 0 0];
vy = [-4 0 0];
quiver(px(1), py(1), vx(1), vy(1))
hold on

t0 = 0;
t1 = 1;
t2 = 1.5;

%x
syms a3 a2 a1 a0 t

cx(t) = a3 * t^3 + a2 * t^2 + a1 * t^1 + a0;
cxd(t) = diff(cx, t);

eq = [cx(t0)== px(1), ...
      cxd(t0) == vx(1), ...
      cx(t1)== px(2), ...
      cx(t2) == px(3) ...
      ];
m = solve( eq, [a3 a2 a1 a0] );
syms t
x(t) = m.a3 * t^3 + m.a2 * t^2 + m.a1 * t^1 + m.a0;


%y
syms b3 b2 b1 b0

cy(t) = b3 * t^3 + b2 * t^2 + b1 * t^1 + b0;
cyd(t) = diff(cy, t);

eq = [cy(t0) == py(1), ...
      cyd(t0) == vy(1) ...
      cy(t1) == py(2), ...
      cy(t2) == py(3) ...
      ];
m = solve( eq, [b3 b2 b1 b0] );
y(t) = m.b3 * t^3 + m.b2 * t^2 + m.b1 * t^1 + m.b0;

fplot(x, y, [t0 t2])