function approximator = get_force_comb_approx(r, r1)

n = (r - r1) / norm(r - r1);
approximator1 = get_force_normal_approx(r, r1);
approximator2 = get_force_tang_approx(r, r1);

    function f = get_force(r, r1, k, ro)

    f1 = approximator1(r, r1, k, ro);
    f2 = approximator2(r, r1, k, ro);
    
    f = (f1 + f2) / 2;
    end

approximator = @get_force;
end