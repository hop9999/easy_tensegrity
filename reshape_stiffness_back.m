function M = reshape_stiffness_back(v)
M = [v(1, 1), v(3, 1); 
     v(2, 1), v(4, 1)];
end