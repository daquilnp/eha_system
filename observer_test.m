% NG = 13.2;
% DG = [1 40 39150 10];
% G = tf(NG,DG);
% [A,B,~,~] = tf2ss(NG,DG);
% C = [1,0,0];
% D = [0;0;0];
% z = 0.707;
% Ts = 0.1;
% wn = 4/(z*Ts);
% r = roots([1,2*z*wn, wn^2]);
% poles =  [r' -40];
% K = place(A,B,poles);
% % A_star = [A zeros(3,1); -[0,0,1] 0];
% % B_star = [B;0];
% X_O=[0.001;0;0];
% L = place(A', C', 5*poles)
% L = L';
% Kpos = 6980;
% u = eye(3);
A = [0 1 0; 0 0 1; 2 0 -1];
B = [1; 2; 0];
C = [1 0 0];

e = [-2 -3 -4];

K = place(A,B,e);

X_O = [1;-2;5];

eb = [-7, -8, -10];

L = place(A',C',eb);
L = L';
X_OB = [-10; 3; -6];
sys=ss(A,B,C,0);
Nbar= rscale(sys,K);
