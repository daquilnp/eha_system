NG = 13.2;
DG = [1 40 39150 0];
G = tf(NG,DG);
[A,B,C,~] = tf2ss(NG,DG);
D = [0;0;0];
z = 0.707;
Ts = 0.1;
wn = 4/(z*Ts);
r = roots([1,2*z*wn, wn^2]);
poles =  [r' -40];
K = place(A,B,poles);
X_O=[0.001;0;0];
L = place(A', C', 10*poles)
L = L';
sys=ss(A,B,C,0);
Nbar= rscale(sys,K);
open('observer_test_sim.slx');

