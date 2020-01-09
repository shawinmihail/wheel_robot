function state_dot = model(state, ctrl)

% state = [x; y; theta]
% ctrl = [u; v]

x = state(1);
y = state(2);
theta = state(3);

u = ctrl(1);
v = ctrl(2);

x_dot = v*cos(theta);
y_dot = v*sin(theta);
theta_dot = v*u;

state_dot = [x_dot; y_dot; theta_dot];

end

