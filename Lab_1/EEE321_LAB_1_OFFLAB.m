%--------------------------EEE321 LAB1 OFFLAB------------------------------
%Part 1--------------------------------------------------------------------
%1)
n = 0:1:89;
xd1 = 3*cos((2*pi/15)*n+2*pi/3); %x_d1[n]
stem(n,xd1);
ylabel ('$x_d[n]$','Interpreter','latex',FontSize=14);
xlabel ('$n$','Interpreter','latex',FontSize=14);
title(['$x_d[n] = 3 \cos\left(\frac{\pi}{15} n +'
' \frac{2\pi}{3}\right)$'], 'Interpreter', 'latex', 'FontSize', 14);

ax = gca;
ax.YLabel.Rotation = 360;
%%
%2)
n = 0:1:179;
xd2 = 6*cos((pi/15)*n+pi/3); %x_d2[n]
stem(n,xd2);

ylabel ('$x_d[n]$','Interpreter','latex',FontSize=14);
xlabel ('$n$','Interpreter','latex',FontSize=14);
title(['$x_d[n] = 6 \cos\left(\frac{\pi}{15} n +' ...
    ' \frac{\pi}{3}\right)$'], 'Interpreter', 'latex', 'FontSize', 14);

ax = gca;
ax.YLabel.Rotation = 360;
%%
%2-d comparison

n1 = 0:1:89;
xd1 = 3*cos((2*pi/15)*n1+2*pi/3); %x_d1[n]

n2 = 0:1:179;
xd2 = 6*cos((pi/15)*n2+pi/3); %x_d2[n]
clf;
hold on
stem(n1,xd1);
stem(n2,xd2);

ylabel ('$x_{d1,2}[n]$','Interpreter','latex',FontSize=14);
xlabel ('$n$','Interpreter','latex',FontSize=14);
title 'Comparison Between x_{d1}[n] and x_{d2}[n]'


ax = gca;
ax.YLabel.Rotation = 360;
legend('x_{d1}[n]', 'x_{d2}[n]', 'Location', 'best');

%%
%3-b
clf;
b = 2.39*10^(-2);
n1 = 0:1:89;
xb1 = 3*exp(-b*n1).*cos((2*pi/15)*n1+2*pi/3);
stem(n1,xb1);

ylabel ('$x_b[n]$','Interpreter','latex',FontSize=14);
xlabel ('$n$','Interpreter','latex',FontSize=14);
title(['$x_d[n] = 3\exp(-bn) \cos\left(\frac{2\pi}{15} n +' ...
    ' \frac{2\pi}{3}\right)$'], 'Interpreter', 'latex', 'FontSize', 14);
grid on;

ax = gca;
ax.YLabel.Rotation = 360;
%%
%Part 2--------------------------------------------------------------------
samp_int = 0.143*10^(-6);
w = 2*pi*698.46;
A = 2;
phi = 0;
fs = 69930;

t = 0:samp_int:20;
xc1 = A*cos(w*t+phi);
soundsc(xc1,fs);





