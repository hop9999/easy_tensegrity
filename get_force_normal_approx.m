function approximator = get_force_normal_approx(r, r1)

n = (r - r1) / norm(r - r1);

    function f = get_force(r, r1, k, ro)
        
        f = -k*((r - r1) - ro*n);
        
    end

approximator = @get_force;
end