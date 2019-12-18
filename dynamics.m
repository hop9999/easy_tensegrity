function dx = dynamics(~,x,robot)

    r = [x(1)
         x(2)];
    dr = [x(3) 
          x(4)];
      
    b = robot.b;
    m = robot.m;
    l = robot.l;
    k = robot.k;
    
    r1 = robot.r1;
    r2 = robot.r2;
    r3 = robot.r3;
    
    f1 = k(1)*(norm(r1 - r) - l(1))*(r1 - r)/norm(r1 - r);
    f2 = k(2)*(norm(r2 - r) - l(2))*(r2 - r)/norm(r2 - r);
    f3 = k(3)*(norm(r3 - r) - l(3))*(r3 - r)/norm(r3 - r);

    dx = [dr
          (f1 + f2 + f3 - b*dr)/m];

end

