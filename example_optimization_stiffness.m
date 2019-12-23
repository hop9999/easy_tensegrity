clear; clc; close all;
%get constant robot parameters
robot = get_robot();
k  = robot.k;

%get linearization point 
% r_init = [robot.initial_state(1); robot.initial_state(2)];
r_init = [0.0000001; 0.0000001];
ro_init = robot.ro;

S0 = g_S(r_init, ro_init);
dS = [1 0 
      0 -1]*5;
S_desired = S0 + dS;
vS_desired = reshape_stiffness(S_desired);

%calculate linearization normals
n1 = (r_init - robot.r1) / norm(r_init - robot.r1);
n2 = (r_init - robot.r2) / norm(r_init - robot.r2);
n3 = (r_init - robot.r3) / norm(r_init - robot.r3);

%stiffness
tensor_K_r  = g_tensor_K_r(r_init, ro_init);
tensor_K_ro = g_tensor_K_ro(r_init, ro_init);
vS_0        = g_vS_0(r_init, ro_init);


cvx_begin
    variable delta_r(2, 1) %point position
    variable delta_ro(3, 1) %spring resl lengths changes
    
    r = delta_r + r_init;
    ro = delta_ro + ro_init;

    %forces
    f1_norm = -k(1)*((r - robot.r1) - ro(1)*n1);
    f2_norm = -k(2)*((r - robot.r2) - ro(2)*n2);
    f3_norm = -k(3)*((r - robot.r3) - ro(3)*n3);
    
    f1_tang = -k(1)*(dot(n1, (r - robot.r1)) - ro(1))*n1;
    f2_tang = -k(2)*(dot(n2, (r - robot.r2)) - ro(2))*n2;
    f3_tang = -k(3)*(dot(n3, (r - robot.r3)) - ro(3))*n3;

    f1 = (f1_norm + f1_tang)/2;
    f2 = (f2_norm + f2_tang)/2;
    f3 = (f3_norm + f3_tang)/2;
    
    %stiffness
    vS = tensor_K_r*r + tensor_K_ro*ro + vS_0;
    
%     minimize( norm(vS - vS_desired) )
    minimize( (vS(1)-vS_desired(1))^2 + (vS(4)-vS_desired(4))^2 )
    subject to
        f1 + f2 + f3 == zeros(2, 1);
    
cvx_end

S = reshape_stiffness_back(vS);
disp(['Init stiffness: ', mat2str(S0)])
disp(['Desired stiffness: ', mat2str(S_desired)])
disp(['Found stiffness: ', mat2str(S)])
disp(['Real stiffness: ', mat2str(g_S(r, ro))])

