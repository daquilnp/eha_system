%% EHA system with Kalman Filter
A = [ 1 0.001 0; 0 1 0.001; -557.02 -28.616 0.9418];
B = [0 0 557.02]';
H = [1 0 0];
C = H;
D = 0;


w_max = [0.01 1 10]';
V_max = 0.1;
x0 = [0 0 0]'; %intial x
u = 0;





