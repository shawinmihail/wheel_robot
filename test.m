% clc
clear

q1 = [-100 7 46 10]';
q2 = [100 5 7 9]';
r = [1 2 3]';

q1 = q1 / norm(q1)
q2 = q2 / norm(q2);
r1 = quatRotate(q1, r)

if q1(1) < 0
    q1v = q1(2:4);
    q1v_n = norm(q1v);
    sin_half_alpha = q1v_n;
    pin = q1v / q1v_n;
    alpha = 2 * asin(sin_half_alpha);
    alpha_new = -2*pi + alpha;
    q1 = [cos(alpha_new / 2); -pin * sin(alpha_new / 2)];
end
r2 = quatRotate(q1, r)
q1

q12 = quatMultiply(q1, q2);