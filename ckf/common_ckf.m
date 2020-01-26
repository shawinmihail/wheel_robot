function [x, sqrtP] = common_ckf(X, Z, sqrtP, model_fcn, state2mes_fcn, sqrtQ, sqrtR)

% Get state dimension
N = numel(X);
% Get measurement dimension
M = numel(Z);

% Evaluate the cubature points
X_cub = getCubaturePoints(sqrtP, X, N);

% Evaluate propagated cubature points
X_cub_star = zeros(N, 2 * N);
for i = 1:(2*N)
    X_cub_star(:,i) = model_fcn(X_cub(:,i));
end

% Estimate predicted state:
x_predicted = 1 / (2*N) * sum(X_cub_star, 2);

% Estimate the square-root factor of the predicted error covariance
hi_star = 1 / (sqrt(2*N)) * (X_cub_star - x_predicted(:,ones(1,(2*N))));
sqrtP_predicted = tria([hi_star, sqrtQ], N);

% Evaluate cubature points
X_cub_new = getCubaturePoints(sqrtP_predicted, x_predicted, N);

% Evaluate propagated cubature points
Z_cub = zeros(numel(Z), 2*N);
for i = 1:(2*N)
    Z_cub(:,i) = state2mes_fcn(X_cub_new(:,i));
end

% Estimate the predicted measurement
z_predicted = 1 / (2*N) * sum(Z_cub, 2);

% Estimate the square-root of the innovation covariance matrix
Z_matrix = 1 / (sqrt(2*N)) * (Z_cub - z_predicted(:,ones(1,(2*N))));
sqrtS = tria([Z_matrix, sqrtR], M);

% Estimate the cross-covariance matrix 
hi_new = 1 / (sqrt(2*N)) * (X_cub_new - x_predicted(:,ones(1,(2*N))));
Pxz = hi_new * Z_matrix';

% Estimate Kalman gain 
K = (Pxz / (sqrtS')) / sqrtS;

% Estimate the updated state
% a = x_predicted
% b = Z - z_predicted
x = x_predicted + 1*K * (Z - z_predicted);
sqrtP = tria([hi_new - K * Z_matrix, K * sqrtR], N);

end

% Get cubature points around state
function [cubX] = getCubaturePoints(sqrtP, stateX, N)

cubX = zeros(N, 2 * N);    
for i = 1:N
    cubX(:,i) = stateX + sqrt(N) * sqrtP(:, i);
end

for i = (N+1):(2*N)
    cubX(:,i) = stateX - sqrt(N) * sqrtP(:, i - N);
end

end


function res = tria(A, N)
% S = tria(A)
% Returns lower triangular matrix S with NxN dimensions
% Let R be upper triangular matrix from QR decomposition of A': A' = Q*R;
% Then S = R'
res = (triu(qr(A',0)));
res = (res(1:N, 1:N))';
end


