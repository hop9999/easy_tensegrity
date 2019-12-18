function dxdt = ode_tens(t,q,robot)

    x = [q(1)
         q(2)];
    dx = [q(3) 
          q(4)];
      
    b = eye(2);
    m = robot.m;
    l = robot.l;
    k = robot.k;
    
    x1 = robot.x1;
    x2 = robot.x2;
    x3 = robot.x3;
    
    f1 = k(1)*(norm(x1 - x) - l(1))*(x1 - x)/norm(x1 - x);
    f2 = k(2)*(norm(x2 - x) - l(2))*(x2 - x)/norm(x2 - x);
    f3 = k(3)*(norm(x3 - x) - l(3))*(x3 - x)/norm(x3 - x);

    dxdt = [dx
           (f1 + f2 + f3 - b*dx)/m];

end

