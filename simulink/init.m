close all
clc
clear

%% sim
seed = 200;
rng(seed);
dt = 1e-2;

%% env
g = [0 0 -10];

%% state
initial_state_local = [0;0;0];

%% ctrl
initial_ctrl = [0;0];

%% noise
% gps
gps_pos_local_rsm = 1.66;
gps_vel_local_rsm = 0.05;

% imu
imu_acc_rsm = 0.25;
imu_rot_vel_rsm = 0.05;

%% ckf
% X = [r v eul(ZYX)]
% Z = [r v a w]
X0 = [0 0 0    0 0 0    0 0 0]';
R = diag([gps_pos_local_rsm*[1; 1; 1];    gps_vel_local_rsm*[1; 1; 1];    imu_acc_rsm*[1; 1; 1];    imu_acc_rsm*[1; 1; 1]] .^ 2);
Q = diag([1e-2*[1; 1; 1];    1e-2*[1; 1; 1];    1e-2*[1; 1; 1]]);
P0 = 10*Q;

sqrtR = chol(R,'lower');
sqrtQ = chol(Q,'lower');
sqrtP0 = chol(P0,'lower');

