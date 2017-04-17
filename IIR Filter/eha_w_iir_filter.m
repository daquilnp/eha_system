%% EHA system with IIR Filter
A = [ 1 0.001 0; 0 1 0.001; -557.02 -28.616 0.9418];
B = [0 0 557.02]';
H = [1 0 0];
C = H;
D = 0;


w_max = [0.01 1 10]';
V_max = 0.1;
x0 = [0 0 0]'; %intial x
u = 0;

[Nf,Df] = butter(2, 0.025, 'low');
sim('eha_model_w_iir.slx');

x_est_pos = filter(Nf,Df,x_est_iir.Data(:,1));
x_est_vec = filter(Nf,Df,x_est_iir.Data(:,2));
x_est_acc = filter(Nf,Df,x_est_iir.Data(:,3));

x_actual_pos = x_actual.Data(:,1);
x_actual_vec = x_actual.Data(:,2);
x_actual_acc = x_actual.Data(:,3);

plot(x_est_iir.Time,x_est_pos, 'b');
hold on;
plot(x_actual.Time,x_actual_pos, 'r');
hold off
title('IIR Filter vs Actual, Position States');
legend('IIR Filter','Actual')
plot(x_est_iir.Time,x_est_vec, 'b');
hold on;
plot(x_actual.Time,x_actual_vec, 'r');
hold off
title('IIR Filter vs Actual, Velocity States');
legend('IIR Filter','Actual')

plot(x_est_iir.Time,x_est_acc, 'b');
hold on;
plot(x_actual.Time,x_actual_acc, 'r');
hold off
title('IIR Filter vs Actual, Acceleration States');
legend('IIR Filter','Actual')

error_actual_pos = x_actual_pos - x_est_pos;

RMSE_actual_pos = sqrt(mean((error_actual_pos).^2))

error_actual_vec = x_actual_vec - x_est_vec;

RMSE_actual_vec = sqrt(mean((error_actual_vec).^2))

error_actual_acc = x_actual_acc - x_est_acc;

RMSE_actual_acc = sqrt(mean((error_actual_acc).^2))

stdPos = std(error_actual_pos)

stdVec = std(error_actual_vec)

stdAcc = std(error_actual_acc)



