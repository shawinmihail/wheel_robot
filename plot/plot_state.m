close all
clc
%%
lw = 2;
fs = 22;
save = 1;
path = 'res1/';


t = out.state.Time;
x = out.state.Data(:,1);
y = out.state.Data(:,2);
theta = out.state.Data(:,3);

v = out.ctrl.Data(:,1);
u = out.ctrl.Data(:,2);

%%
figure
hold on;
plot(x, y, 'LineWidth', lw, 'Color', 'r');
title('“раектори€', 'FontSize', fs);

set(gca,'FontSize',fs)
xlabel('X, м')
ylabel('Y, м')

if save
saveas(gcf, [path  'traj.png'])
saveas(gcf, [path  'traj.fig'])
end

%%
figure
hold on;
plot(t, theta, 'LineWidth', lw, 'Color', 'r');
title('\theta', 'FontSize', fs);

set(gca,'FontSize',fs)
ylabel('угол, рад')
xlabel('t, сек')

if save
saveas(gcf, [path  'theta.png'])
saveas(gcf, [path  'theta.fig'])
end

%%
figure
hold on;
plot(t, v, 'LineWidth', lw, 'Color', 'r');
title('v', 'FontSize', fs);

set(gca,'FontSize',fs)
ylabel('скорость, м/с')
xlabel('t, сек')

if save
saveas(gcf, [path  'v.png'])
saveas(gcf, [path  'v.fig'])
end