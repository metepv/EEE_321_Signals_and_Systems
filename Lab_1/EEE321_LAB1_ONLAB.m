%--------------------------EEE 321 ON-LAB CODE-----------------------------
%ID = 22003836, ABC = 836;
abc = 836;
w1 = pi*abc;
w2 = 4*w1;

T = 2.39*10^(-3);
samp_int = T/100;
fs = 41800;

t = 0:samp_int:1;
x_m = cos(5*w1*t) + cos(3*w1*t);

t2 = 0:samp_int:5*T;
x_m2 = cos(5*w1*t2) + cos(3*w1*t2);

soundsc(x_m,fs);

subplot(2,1,1);
plot(t,x_m,"k");
ylabel ('$x_m(t)$','Interpreter','latex',FontSize=14);
xlabel ('$t$','Interpreter','latex',FontSize=14);
title('$x_m(t) = \cos(\frac{2\pi}{836 \pi}  t)$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ax = gca;
ax.YLabel.Rotation = 360;


subplot(2,1,2);
plot(t2,x_m2,"k");
ylabel ('$x_m(t)$','Interpreter','latex',FontSize=14);
xlabel ('$t$','Interpreter','latex',FontSize=14);
title('$x_m(t) = \cos(\frac{2\pi}{836 \pi}  t)$', ...
    'Interpreter', 'latex', 'FontSize', 14);
grid
ax = gca;
ax.YLabel.Rotation = 360;
