clc
clear all
close all

robot.m = 1;
robot.l = [0.5,0.5,0.5];
robot.k = [0.5,0.9,0.1];

robot.x1 = [-1
            1];
robot.x2 = [1
            1];
robot.x3 = [0
            -1];

q_0 = [0.1,0.1,0.0,0.0]';
optns = odeset('RelTol',1e-12,'AbsTol',1e-12,'NormControl','on');
t_int = [0,100];
[t,x] = ode45( @(t,x)ode_tens(t,x,robot),t_int,q_0,optns);

fig = figure;
fig.Name = "top";
hold on
xlabel("x, m");
ylabel("y, m");
plot(x(:,1),x(:,2))

fig = figure;
fig.Name = "top";
hold on
xlabel("time, s");
ylabel("x, m");
plot(t,x(:,1))
plot(t,x(:,2))

