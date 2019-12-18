function f = get_exact_force(r, r1, k, ro)
    f = k*(norm(r1 - r) - ro)*(r1 - r)/norm(r1 - r);
end