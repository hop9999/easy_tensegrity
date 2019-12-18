function f = get_force_exact(r, r1, k, ro)
    f = k*(norm(r1 - r) - ro)*(r1 - r)/norm(r1 - r);
end