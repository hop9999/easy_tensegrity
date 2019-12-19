function q = fk_tens(robot)
x0 = (robot.r1 + robot.r2 + robot.r3)/3;
[q,~] = fminunc(@(q)potens_energy_numerical(q,robot),x0);
end