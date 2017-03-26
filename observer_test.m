NG = [13.2];
DG = [1 40 39150 0];
G = tf(NG,DG);
[A,B,C,D] = tf2ss(NG,DG);
C = eye(3);
D = [0;0;0];
z = 0.707;
Ts = 0.1;
wn = 4/(z*Ts);
r = roots([1,2*z*wn, wn^2]);
poles =  10*[r' 10*real(r(1))];
K = place(A,B,poles);
A_star = [A zeros(3,1); -[0,0,1] 0];
B_star = [B;0];
KKi= place(A_star, B_star, [-100 poles])
Kpos = 6980;






