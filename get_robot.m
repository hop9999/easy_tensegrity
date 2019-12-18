function robot = get_robot()

robot.m = 1;
robot.ro = [0.5,0.5,0.5];
robot.k = [0.5,0.9,0.1];
robot.b = eye(2);

robot.r1 = [-1; 1];
robot.r2 = [1;  1];
robot.r3 = [0; -1];
       
robot.initial_state = [0.1,0.1,0.0,0.0]';

end