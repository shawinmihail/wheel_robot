function [Z] = ckf_state2mes(X, ctrl, g)

% X = [r v eul(ZYX)]
% Z = [r v a w eul_from_w]

v = ctrl(1);
u = ctrl(2);
R = eul2rotm(X(7:9)');

r_mes = X(1:3);
v_mes = X(4:6);

a_mes = R'*g; %% body to inertial CHECK IT

w_mes = [0;0;v*u];

Z = [r_mes; v_mes; a_mes; w_mes];
end

