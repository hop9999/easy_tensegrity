function P = potens_energy_numerical(r,robot)

    ro = robot.ro;
    k = robot.k;
    
    r1 = robot.r1;
    r2 = robot.r2;
    r3 = robot.r3;
    
    P1 =  k(1)*(norm(r1 - r) - ro(1));
    P2 =  k(2)*(norm(r2 - r) - ro(2));
    P3 =  k(3)*(norm(r3 - r) - ro(3));
    P = P1 + P2 + P3;
end