clear; clc; close all;
%get constant robot parameters
robot = get_robot();
k  = robot.k;

r  = sym('r', [2, 1]); assume(r, 'real');
ro = sym('ro',[3, 1]); assume(ro, 'real');


%get linearization point 
r_init = [robot.initial_state(1); robot.initial_state(2)];
% r_init = [0.5; 0.7];
ro_init = robot.ro;

tensor_K_r  = g_tensor_K_r(r_init, ro_init);
tensor_K_ro = g_tensor_K_ro(r_init, ro_init);
vS_0        = g_vS_0(r_init, ro_init);

vS = tensor_K_r*r + tensor_K_ro*ro + vS_0;