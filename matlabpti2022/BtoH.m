%bezier
clear
px = [0 2 4 6 5];
py = [1 -2 -2 2 4];

plot(px, py, '*--')

axis([-5 25 -4 8])
axis equal
hold on

syms t

cx(t) = 0*t;
cy(t) = 0*t;

n = 4;

for i = 0:n
    b(t) = nchoosek(n, i) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i + 1) * b(t);

    cy(t) = cy(t) + py(i +1) * b(t);
end

fplot(cx, cy, [0 1])
%erinto vektor
%kezdopont
t0 = 0;
P = [cx(t0), cy(t0)];
plot(P(1), P(2), 'r.', 'MarkerSize', 10)

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

a = [cxd(t0), cyd(t0)]

quiver(P(1), P(2), a(1), a(2))

%vegpont
t0 = 1;
P = [cx(t0), cy(t0)];
plot(P(1), P(2), 'r.', 'MarkerSize', 10)

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

a = [cxd(t0), cyd(t0)]

quiver(P(1), P(2), a(1), a(2))

hold on

%hermit

rx = [5 10];
ry = [4 6];

vx = [a(1), 2];
vy = [a(2), -4];

plot (rx, ry, 'r*')

t0 = 0;
t1 = 2;

%x
syms a3 a2 a1 a0 t
cx(t) = a3 * t^3 + a2 * t^2 + a1 * t^1 + a0;
cxd(t) = diff(cx, t);
eq = [cx(t0) == rx(1), cx(t1) == rx(2), ...
      cxd(t0) == vx(1), cxd(t1) == vx(2)];

m = solve( eq, [a3 a2 a1 a0 ]);
x(t) = subs(cx, [a3 a2 a1 a0], [m.a3 m.a2 m.a1 m.a0])

%y
syms b3 b2 b1 b0 
cy(t) = b3 * t^3 + b2 * t^2 + b1 * t^1 + b0;
cyd(t) = diff(cy, t);
eq = [cy(t0) == ry(1), cy(t1) == ry(2), ...
      cyd(t0) == vy(1), cyd(t1) == vy(2)];

m = solve( eq, [b3 b2 b1 b0 ]);
y(t) = subs(cy, [b3 b2 b1 b0], [m.b3 m.b2 m.b1 m.b0])

fplot(x, y, [t0 t1])