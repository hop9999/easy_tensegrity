clc;
clear;
close all;

robot = get_robot();
[t,x] = simulation_ode(robot);

% fig = figure;
% fig.Name = "top";
% hold on
% xlabel("x, m");
% ylabel("y, m");
% plot(x(:,1),x(:,2))
% 
% fig = figure;
% fig.Name = "top";
% hold on
% xlabel("time, s");
% ylabel("x, m");
% plot(t,x(:,1))
% plot(t,x(:,2))

print_force_tape(x, t, robot)