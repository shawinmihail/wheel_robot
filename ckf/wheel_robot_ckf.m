function [X, sqrtP] = wheel_robot_ckf(X, Z, sqrtQ, sqrtR, sqrtP,  dt, ctrl, g)
    model_fcn = @(X)ckf_model(X, ctrl, dt);
    state2mes_fcn = @(X)ckf_state2mes(X, ctrl, g);
    [X, sqrtP] = common_ckf(X, Z, sqrtP, model_fcn, state2mes_fcn, sqrtQ, sqrtR);
end


