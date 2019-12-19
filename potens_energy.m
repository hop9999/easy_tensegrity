robot = get_robot();

r  = sym('r', [2, 1]); assume(r, 'real');
ro = sym('ro',[3, 1]); assume(ro, 'real');
k  = robot.k;

P1 =  k(1)*(norm(robot.r1 - r) - ro(1))^2;
P2 =  k(2)*(norm(robot.r2 - r) - ro(2))^2;
P3 =  k(3)*(norm(robot.r3 - r) - ro(3))^2;
P = P1 + P2 + P3;
P = simplify(P);

f = jacobian(P, r);
f = simplify(f)';

K = jacobian(f, r);
K = simplify(K);