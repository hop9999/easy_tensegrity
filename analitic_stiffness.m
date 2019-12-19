

robot = get_robot();

r  = sym('r', [2, 1]); assume(r, 'real');
ro = sym('ro',[3, 1]); assume(ro, 'real');
k  = robot.k;


% Stiffness = k(1)/(norm(r)^3) * ...
% ( norm(r) * (r*r') + (norm(r) - ro(1)) * (norm(r)^2 *eye(2) - r*r'));

S1 = getStiffness(r, k(1), ro(1));
S2 = getStiffness(r, k(2), ro(2));
S3 = getStiffness(r, k(3), ro(3));

S = S1 + S2 + S3;
S = simplify(S);

vS = reshape_stiffness(S);

tensor_K_r  = jacobian(vS, r);
tensor_K_ro = jacobian(vS, ro);

tensor_K_r  = simplify(tensor_K_r);
tensor_K_ro = simplify(tensor_K_ro);

vS_0 = vS - tensor_K_r*r - tensor_K_ro*ro;
vS_0 = simplify(vS_0);


matlabFunction(S,           'File', 'g_S',            'Vars', {r, ro});
matlabFunction(tensor_K_r,  'File', 'g_tensor_K_r',   'Vars', {r, ro});
matlabFunction(tensor_K_ro, 'File', 'g_tensor_K_ro',  'Vars', {r, ro});
matlabFunction(vS_0,        'File', 'g_vS_0',         'Vars', {r, ro});

function S = getStiffness(r, k, ro)
S = -k/(norm(r)^3) * ...
( norm(r) * (r*r') + (norm(r) - ro) * (norm(r)^2 *eye(2) - r*r'));
S = simplify(S);
end

function v = reshape_stiffness(M)
v = [M(1, 1); M(2, 1); M(1, 2); M(2, 2)];
end


