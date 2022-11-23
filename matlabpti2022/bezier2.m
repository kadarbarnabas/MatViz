clear
px = [1 6 10 8 14 18];
py = [2 5 2 -1 5 0];

plot(px, py, '*--')

axis([-5 25 -4 8])
axis equal
hold on

syms t

cx(t) = 0*t;
cy(t) = 0*t;

n = 5;

for i = 0:n
    b(t) = nchoosek(n, i) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i + 1) * b(t);

    cy(t) = cy(t) + py(i +1) * b(t);
end

fplot(cx, cy, [0 1])

t0 = 0;
P = [cx(t0), cy(t0)];
plot(P(1), P(2), 'r.', 'MarkerSize', 10)

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

a = [cxd(t0), cyd(t0)]

quiver(P(1), P(2), a(1), a(2))

hold on

t0 = 1;
P = [cx(t0), cy(t0)];
plot(P(1), P(2), 'r.', 'MarkerSize', 10)

cxd(t) = diff(cx, t);
cyd(t) = diff(cy, t);

a = [cxd(t0), cyd(t0)]

quiver(P(1), P(2), a(1), a(2))