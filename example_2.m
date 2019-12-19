clc;
clear;
close all;

robot = get_robot();
k = 500;
ro = 0.0;
alpha = 0.00001;

r1 = [sqrt(3)/2; 1/2];
r2 = [-sqrt(3)/2; 1/2];
r3 = [0; -1];

rx = [alpha;0];
ry = [0;alpha];

fx1 = get_exact_force(rx, r1, k, ro);
fx2 = get_exact_force(rx, r2, k, ro);
fx3 = get_exact_force(rx, r3, k, ro);

fx = fx1 + fx2 + fx3

fy1 = get_exact_force(ry, r1, k, ro);
fy2 = get_exact_force(ry, r2, k, ro);
fy3 = get_exact_force(ry, r3, k, ro);

fy = fy1 + fy2 + fy3

K = -fx*pinv(rx) - fy*pinv(ry)