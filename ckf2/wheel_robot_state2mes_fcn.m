function [Z] = wheel_robot_state2mes_fcn(X)

% X = [r v qv]
% Z = [r v]

Z = X(1:6);
end

