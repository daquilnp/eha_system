%% EHA system with Kalman Filter

A = [ 1 0.001 0; 0 1 0.001; -557.02 -28616 0.9418];
B = [0 0 557.02];
H = [1 0 0];
w_max = [0.01 1 10];
V_max = 0.1;
sample_t = 1e-3;
Q = [ 1 0 0; 0 10 0; 0 0 100];
R = [0.1 0 0 ; 0 100 0; 0 0 1000];
x = [0 0 0]'; %intial x
P = 10*Q; %intial P
u = 1;
z = H*x;

   %%Begin filter
   x = A*x + B*u;
   P = A * P * A' + Q;


   % Compute Kalman gain factor:
   K = P*H'*inv(H*P*H'+ R);

   % Correction based on observation:
   x = x + K*(z-H*x);
   P = P - K*H*P;
