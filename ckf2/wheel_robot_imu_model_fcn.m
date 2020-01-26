function X = wheel_robot_imu_model_fcn(X0, a_mes, w_mes, g, dt)

% X = [r v qv]
r0 = X0(1:3);
v0 = X0(4:6);
qv0 = X0(7:9);
q0 = qv2q(qv0);

a0 = quatRotate(q0,a_mes) - g;
w0 = w_mes;


%% integrate
Y0 = [r0; v0; q0];

% % Euler
% Y_dot = imu_meas_body_dyn(Y0, a0, w0);
% Y = Y0 + Y_dot * dt;

% RK4
Y_dot_1 = imu_meas_body_dyn(Y0, a0, w0);
Y_dot_2 = imu_meas_body_dyn(Y0 + 0.5 * Y_dot_1 * dt, a0, w0);
Y_dot_3 = imu_meas_body_dyn(Y0 + 0.5 * Y_dot_2 * dt, a0, w0);
Y_dot_4 = imu_meas_body_dyn(Y0 + 1.0 * Y_dot_3 * dt, a0, w0);
Y = Y0 + (1/6)*(Y_dot_1 + 2*Y_dot_2 + 2*Y_dot_3 + Y_dot_4)*dt;

%% X
r = Y(1:3);
v = Y(4:6);
q = Y(7:10);

q_n = norm(q);
q = q / q_n;
qv = q2qv(q);

X = [r; v; qv]; 
