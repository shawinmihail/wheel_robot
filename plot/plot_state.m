close all
%%
lw = 2;
fs = 22;


t = out.state.Time;
x = out.state.Data(:,1);
y = out.state.Data(:,2);
theta = out.state.Data(:,3);

figure
hold on;
plot(x, y, 'LineWidth', lw, 'Color', 'r');
% plot(y, 'LineWidth', lw, 'Color', 'b');
title('Траектория', 'FontSize', fs);
% plot_legend(1).str(:) = 'Измерения';
% plot_legend(2).str(:) = 'Оценка';
% lgd = legend(plot_legend(:).str);
% lgd.FontSize = fs;
% set(gca,'FontSize',fs)
% xlabel('Время, сек')
% ylabel('м')
% % xlim([0 220])

figure
hold on;
plot(t, theta, 'LineWidth', lw, 'Color', 'r');
title('Руль', 'FontSize', fs);