function robot = get_robot()

robot.m = 1;
robot.ro = [0.1,0.1,0.1];
robot.k = [500,500,500];
robot.b = eye(2);

robot.r1 = [sqrt(3)/2; 1/2];
robot.r2 = [-sqrt(3)/2; 1/2];
robot.r3 = [0; -1];
       
robot.initial_state = [0.1,0.1,0.0,0.0]';

end