function dx = dynamics(~,x,robot)

get_force = @get_force_exact;
% get_force = @get_force_normal_approx;

    r = [x(1)
         x(2)];
    dr = [x(3) 
          x(4)];
      
    b = robot.b;
    m = robot.m;
    ro = robot.ro;
    k = robot.k;
    
    r1 = robot.r1;
    r2 = robot.r2;
    r3 = robot.r3;
    
    f1 = get_force(r, r1, k(1), ro(1));
    f2 = get_force(r, r2, k(2), ro(2));
    f3 = get_force(r, r3, k(3), ro(3));

    dx = [dr
          (f1 + f2 + f3 - b*dr)/m];

end

