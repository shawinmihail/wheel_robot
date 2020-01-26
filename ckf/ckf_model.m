function [X_out] = ckf_model(X, ctrl, dt)

% X = [r v eul(ZYX)]
% state = [x; y; theta]
% ctrl = [u; v]

x = X(1);
y = X(2);
vx = X(4);
vy = X(5);
theta = X(7); %% check it

v = ctrl(1);
u = ctrl(2);

x_dot = v*cos(theta);
y_dot = v*sin(theta);
theta_dot = v*u;


X_dot = [x_dot; y_dot; 0;    0; 0; 0;    theta_dot; 0; 0];
% X_out

X_out = X + X_dot*dt;
end

