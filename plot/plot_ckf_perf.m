close all
%%
lw = 1;
fs = 22;
save = 0;
path = 'res1/';

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

eul = out.eul_est.Data;
roll_est = eul(:,1);
pitch_est = eul(:,2);
yaw_est = eul(:,3);

%% r
% x
figure
hold on;
plot(t, x_mes - x_act, 'LineWidth', lw, 'Color', 'k');
plot(t, x_est - x_act, 'LineWidth', lw, 'Color', 'r');
title('ошибка, x', 'FontSize', fs);

plot_legend(1).str(:) = 'Ошибка измерений';
plot_legend(2).str(:) = 'Ошибка оценки';
lgd = legend(plot_legend(:).str);
lgd.FontSize = fs;

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, м')

if save
saveas(gcf, [path  'x_err.png'])
saveas(gcf, [path  'x_err.fig'])
end

% y
figure
hold on;
plot(t, y_mes - y_act, 'LineWidth', lw, 'Color', 'k');
plot(t, y_est - y_act, 'LineWidth', lw, 'Color', 'r');
title('ошибка, y', 'FontSize', fs);

plot_legend(1).str(:) = 'Ошибка измерений';
plot_legend(2).str(:) = 'Ошибка оценки';
lgd = legend(plot_legend(:).str);
lgd.FontSize = fs;

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, м')

if save
saveas(gcf, [path  'y_err.png'])
saveas(gcf, [path  'y_err.fig'])
end

%% v
% vx
figure
hold on;
plot(t, vx_mes - vx_act, 'LineWidth', lw, 'Color', 'k');
plot(t, vx_est - vx_act, 'LineWidth', lw, 'Color', 'r');
title('ошибка, vx', 'FontSize', fs);

plot_legend(1).str(:) = 'Ошибка измерений';
plot_legend(2).str(:) = 'Ошибка оценки';
lgd = legend(plot_legend(:).str);
lgd.FontSize = fs;

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, м/с')

if save
saveas(gcf, [path  'vx_err.png'])
saveas(gcf, [path  'vx_err.fig'])
end

% vy
figure
hold on;
plot(t, vy_mes - vy_act, 'LineWidth', lw, 'Color', 'k');
plot(t, vy_est - vy_act, 'LineWidth', lw, 'Color', 'r');
title('ошибка, vy', 'FontSize', fs);

plot_legend(1).str(:) = 'Ошибка измерений';
plot_legend(2).str(:) = 'Ошибка оценки';
lgd = legend(plot_legend(:).str);
lgd.FontSize = fs;

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, м/с')

if save
saveas(gcf, [path  'vy_err.png'])
saveas(gcf, [path  'vy_err.fig'])
end

%% eulZYX
figure
hold on;
plot(t, roll_est, 'LineWidth', lw, 'Color', 'r');
title('оценка, крен', 'FontSize', fs);

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, рад')

if save
saveas(gcf, [path  'roll.png'])
saveas(gcf, [path  'roll.fig'])
end

figure
hold on;
plot(t, pitch_est, 'LineWidth', lw, 'Color', 'r');
title('оценка, тангаж', 'FontSize', fs);

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, рад')

if save
saveas(gcf, [path  'pitch.png'])
saveas(gcf, [path  'pitch.fig'])
end

figure
hold on;
plot(t, yaw_est-theta_act, 'LineWidth', lw, 'Color', 'r');
title('ошибка оценки, рысканье', 'FontSize', fs);

set(gca,'FontSize',fs)
xlabel('Время, с')
ylabel('Ошибка, рад')

if save
saveas(gcf, [path  'yaw_err.png'])
saveas(gcf, [path  'yaw_err.fig'])
end

rms_x = rms(x_act-x_est)


