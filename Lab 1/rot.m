function A = rot(phi, t)

    A = [cos(phi), -sin(phi), t(1);
         sin(phi), cos(phi),  t(2);
         0,        0,         1];
end