clear
px = [0 2 4 6];
py = [1 6 6 2];

plot(px, py, 'r*--')

axis([-5 25 -4 8])
axis equal
hold on

syms t

cx(t) = 0*t;
cy(t) = 0*t;

n = 3;

for i = 0:n
    b(t) = nchoosek(n, i) * t^i * (1-t)^(n-i);
    cx(t) = cx(t) + px(i + 1) * b(t);

    cy(t) = cy(t) + py(i +1) * b(t);
end

fplot(cx, cy, [0 1], 'r')
%erinto vektor
%vegpont vektor
% t0 = 1;
% P = [cx(t0), cy(t0)];
% plot(P(1), P(2), 'r.', 'MarkerSize', 10)
% 
% cxd(t) = diff(cx, t);
% cyd(t) = diff(cy, t);
% 
% a = [cxd(t0), cyd(t0)]
% 
% quiver(P(1), P(2), a(1), a(2), 'r')

%bezier2
m = 4;

rx1 = px(4) + n/m*(px(4) - px(3));
ry1 = py(4) + n/m*(py(4) - py(3));

rx = [px(4) rx1 15 18 17];
ry = [py(4) ry1 -4 3 6];

plot(rx, ry, 'g*--')

syms t

cx(t) = 0*t;
cy(t) = 0*t;

for i = 0:m
    b(t) = nchoosek(m, i) * t^i * (1-t)^(m-i);
    cx(t) = cx(t) + rx(i + 1) * b(t);

    cy(t) = cy(t) + ry(i +1) * b(t);
end

fplot(cx, cy, [0 1], 'g')