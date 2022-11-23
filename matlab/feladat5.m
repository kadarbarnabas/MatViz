clear

px = [0 0];
py = [0 1];
pz = [0 1];

rx = [1 1];
ry = [0 1];
rz = [1 0];

syms u v

pxc(u) = (1 - u)*px(1) + u*px(2);
pyc(u) = (1 - u)*py(1) + u*py(2);
pzc(u) = (1 - u)*pz(1) + u*pz(2);
fsurf(pxc, pyc, pzc, [0 1], 'b', "LineWidth", 10)
hold on

rxc(u) = (1 - u)*rx(1) + u*rx(2);
ryc(u) = (1 - u)*ry(1) + u*ry(2);
rzc(u) = (1 - u)*rz(1) + u*rz(2);
fsurf(rxc, ryc, rzc, [0 1], 'r', "LineWidth", 10)
hold on

sx(u, v) = (1 - v)*pxc(u) + v*rxc(u);
sy(u, v) = (1 - v)*pyc(u) + v*ryc(u);
sz(u, v) = (1 - v)*pzc(u) + v*rzc(u);

fsurf(sx, sy, sz, [0 1 0 1], 'g')
axis equal
