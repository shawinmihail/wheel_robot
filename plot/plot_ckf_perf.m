close all
%%
lw = 1;
fs = 22;

% model state
t = out.state.Time;

x_act = out.state.Data(:,1);
y_act = out.state.Data(:,2);
theta_act = out.state.Data(:,3);

vx_act = out.state_dot.Data(:,1);
vy_act = out.state_dot.Data(:,2);
% theta_act = out.state.Data(:,3);

% sensors
x_mes = out.pos_mes.Data(:,1);
y_mes = out.pos_mes.Data(:,2);
vx_mes = out.vel_mes.Data(:,1);
vy_mes = out.vel_mes.Data(:,2);

% est
x_est = out.X.Data(:,1);
y_est = out.X.Data(:,2);
vx_est = out.X.Data(:,4);
vy_est = out.X.Data(:,5);

figure
hold on;
plot(x_mes - x_act, 'LineWidth', lw, 'Color', 'k');
plot(x_est - x_act, 'LineWidth', lw, 'Color', 'r');
title('x', 'FontSize', fs);

figure
hold on;
plot(y_mes - y_act, 'LineWidth', lw, 'Color', 'k');
plot(y_est - y_act, 'LineWidth', lw, 'Color', 'r');
title('y', 'FontSize', fs);

figure
hold on;
plot(vx_mes - vx_act, 'LineWidth', lw, 'Color', 'k');
plot(vx_est - vx_act, 'LineWidth', lw, 'Color', 'r');
title('vx', 'FontSize', fs);

figure
hold on;
plot(vy_mes - vy_act, 'LineWidth', lw, 'Color', 'k');
plot(vy_est - vy_act, 'LineWidth', lw, 'Color', 'r');
title('vy', 'FontSize', fs);


