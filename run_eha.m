NG = 13.2;
DG = [1 40 39150 0];
G = tf(NG,DG);
[A,B,C,D] = tf2ss(NG,DG);
z = 0.707;
Ts = 0.1;
wn = 4/(z*Ts);
r = roots([1,2*z*wn, wn^2]);
poles =  [r' -150];
K = place(A,B,poles);
L = place(A', C', 10*poles);
L = L';
sys=ss(A,B,C,D);
Nbar= rscale(sys,K);
open('eha_model.slx');

