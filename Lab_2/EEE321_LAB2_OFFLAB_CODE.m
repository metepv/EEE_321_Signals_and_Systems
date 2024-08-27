%------------------------EEE 321 LAB2 OFFLAB-------------------------------
%PART 1: Fourier Series Expansion
T = 4;  %period of the signal.
t = linspace(0,3*T,100);
triangle_wave = sawtooth(2*pi*t/T,0.5);

%plotting
plot(t,triangle_wave);
grid on; 
ylabel ('$x(t)$','Interpreter','latex','FontSize',13);
xlabel ('$t$','Interpreter','latex','FontSize',13);
title 'The Plot of Signal x(t)'
ax = gca;
ax.YLabel.Rotation = 360;

%%
%The Iterative program to find the number N.
I = 1/3;

sum = 0; %initial sum.
k = 1; %starting index
per = sum/I;
lim = 0.9995;

while per < lim
    sum = sum + 2*(((1-(-1)^k)^4)/((k*pi)^4));
    per = sum/I;
    if per >= lim
        break
    end
    k = k + 1;
end
disp(sum)
disp(per)
disp(k)

%%
%The Stem plot of the Fourier Coefficients

k = -7:1:7;
a_k = -(((1-(-1).^k).^2)./((k*pi).^2));
stem(k,a_k,"k");
grid on;
title ('$a_k:Fourier \, Series \, Coefficients$',...
    'Interpreter','latex','FontSize',13);
ylabel('$a_k$','Interpreter','Latex','FontSize',13);
xlabel('$k$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;


%%
%PART 2:Sum of Complex Exponentials

ID = 22003836;
D_15 = mod(ID,15);
N = D_15+30;
T = 4;
fmax = 2*pi*N/T;
f_sampling = 2*fmax; %Nyquist sampling theorem
samp_int = 1/f_sampling;

k_pos = 1:1:N;
k_neg = -(N):1:-1;
A_pos = sin((pi*k_pos)/4)./(pi*k_pos);
A_zero= 1/4;
A_neg = sin((pi*k_neg)/4)./(pi*k_neg);
A = [A_neg A_zero];
A= [A A_pos];   %final condition of coefficient array.

t = -3:samp_int:3;
the_signal = FourierSum(T,N,A,t);

plot(t,the_signal,"k");
grid on;
title ('$x_a(t):Synthesized \, Signal$',...
    'Interpreter','latex','FontSize',13);
ylabel('$x_a(t)$','Interpreter','Latex','FontSize',13);
xlabel('$t$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;


%%
%PART 3: Fourier Series Approximation

Ns = [7,5,3,3];
T = 4;

[x1,t1,samp_int1] = signalGenerator(Ns(1,1),T);
[x2,t2,samp_int2] = signalGenerator(Ns(1,2),T);
[x3,t3,samp_int3] = signalGenerator(Ns(1,3),T);
[x4,t4,samp_int4] = signalGenerator(Ns(1,4),T);

subplot(2,2,1);
plot(t1,x1,"k");
grid on;
title ('$x_{a1}(t):Synthesized \, Signal \, N = 7$',...
    'Interpreter','latex','FontSize',13);
ylabel('$x_{a1}(t)$','Interpreter','Latex','FontSize',13);
xlabel('$t$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(2,2,2);
plot(t2,x2,"k");
grid on;
title ('$x_{a2}(t):Synthesized \, Signal \, N = 5$',...
    'Interpreter','latex','FontSize',13);
ylabel('$x_{a2}(t)$','Interpreter','Latex','FontSize',13);
xlabel('$t$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(2,2,3);
plot(t3,x3,"k");
grid on;
title ('$x_{a3}(t):Synthesized \, Signal \, N = 3$',...
    'Interpreter','latex','FontSize',13);
ylabel('$x_{a3}(t)$','Interpreter','Latex','FontSize',13);
xlabel('$t$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(2,2,4);
plot(t4,x4,"k");
grid on;
title ('$x_{a4}(t):Synthesized \, Signal \, N = 3$',...
    'Interpreter','latex','FontSize',13);
ylabel('$x_{a4}(t)$','Interpreter','Latex','FontSize',13);
xlabel('$t$','Interpreter','Latex','FontSize',13);
ax = gca;
ax.YLabel.Rotation = 360;











