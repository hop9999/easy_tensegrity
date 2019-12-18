function [t,x] = simulation_ode(robot) 

optns = odeset('RelTol',1e-12,'AbsTol',1e-12,'NormControl','on');
t_int = [0,100];
[t,x] = ode45( @(t,x)dynamics(t,x,robot),t_int, robot.initial_state, optns);

end