%% EHA system with Kalman Filter
A = [ 1 0.001 0; 0 1 0.001; -557.02 -28.616 0.9418];
B = [0 0 557.02]';
H = [1 0 0];
C = H;
D = 0;
zeta = 0.707;
Ts = 0.1;
wn = 4/(zeta*Ts);
r = roots([1,2*zeta*wn, wn^2]);
poles =  [r' -150];
K = place(A,B,poles);
sys=ss(A,B,H,D);
Nbar= rscale(sys,K);


w_max = [0.01 1 10]';
V_max = 0.1;
sample_t = 1e-3;
Q = [ 1 0 0; 0 10 0; 0 0 100];
R = 10;
x0 = [0 0 0]'; %intial x
P0 = 10*Q; %intial P






