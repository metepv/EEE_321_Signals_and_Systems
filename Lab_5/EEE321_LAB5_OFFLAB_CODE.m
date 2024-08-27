%------------------EEE321 LAB5 OFFLAB CODE---------------------------------
%PART3:Generation of Interpolating Functions in Matlab
ID = 22003836;
dur = mod(ID,10);
Ts = dur/5;
%%
%rectangular interpolation function
p = generateAyberk(0,Ts,dur);
t = linspace(-dur,dur,length(p));

plot(t,p,"k",LineWidth=1.3);
grid on;
ylim([-0.5 1.5]);
title('$p(t) = rect(t)$','Interpreter','latex','FontSize',14);
ylabel('$p(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);

ax = gca;
ax.YLabel.Rotation = 360;

%%
%triangular interpolation function
p = generateAyberk(1,Ts,dur);
t = linspace(-dur,dur,length(p));

plot(t,p,"k",LineWidth=1.3);
grid on;
ylim([-0.5 1.5]);
title('$p(t) = tri(t)$','Interpreter','latex','FontSize',14);
ylabel('$p(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);

ax = gca;
ax.YLabel.Rotation = 360;

%%
%sinc interpolation function
p = generateInterp(2,Ts,dur);
t = linspace(-dur,dur,length(p));

plot(t,p,"k",LineWidth=1.3);
grid on;
ylim([-0.5 1.5]);
title('$p(t) = sinc(t)$','Interpreter','latex','FontSize',14);
ylabel('$p(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);

ax = gca;
ax.YLabel.Rotation = 360;

%%
%PART5: MATLAB Simulation for Interpolation
a = 3;
Ts2 = 1/(10*a);
dur = 6;

t_n = -dur:Ts2:dur;
g_n = zeros(1,length(t_n));

for i=1:length(t_n)

    if t_n(1,i) < 0
        g_n(1,i) = 0;

    elseif t_n(1,i) < 0.5
        g_n(1,i) = 2*t_n(1,i) + 1;
        
    elseif t_n(1,i) < 1
        g_n(1,i) = 2.5 - t_n(1,i);
    
    elseif t_n(1,i) < 2
        g_n(1,i) = 1.5;

    else
        g_n(1,i) = 0;

    end

end
%{
stem(t_n,g_n,"k");
grid on;
title('$Sampled\,\,Signal$','Interpreter','latex','FontSize',14);
ylabel('$g(nT_s)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);
ylim([-1 4]);

ax = gca;
ax.YLabel.Rotation = 360;
%}

g_r = DtoAyberk(1,Ts2,dur,g_n);
t_r = linspace(0,2,length(g_r));
plot(t_r,g_r,"k");

%%
%Part 6:Reconstruction of a Sum of Cosines

ID = 22003836;
D = mod(ID,5);
Ts = 0.005*(D+1);
t = -3:Ts/1000:3;
t_n = -3:Ts:3;
N = length(t_n);
Xn = zeros(1,N);
x_t = 0.5*cos(2*pi*t+pi/5) + ...
      0.3*sin(6*pi*t+2/3) +  ...
      0.4*cos(5*pi*t-0.7*exp(1));
for i=1:N
    Xn(1,i) = 0.5*cos(2*pi*(i*Ts)+pi/5) + ...
              0.3*sin(6*pi*(i*Ts)+2/3) + ...
              0.4*cos(5*pi*(i*Ts)-0.7*exp(1));
end

[x_r_z,t_z] = DtoA(0,Ts,3,Xn);
[x_r_l,t_l] = DtoA(1,Ts,3,Xn);
[x_r_i,t_i] = DtoA(2,Ts,3,Xn);

subplot(4,1,1);
plot(t,x_t);
grid on;
title('$Original\,\,Signal\,\,x(t)$',...
      'Interpreter','latex','FontSize',14);
ylabel('$x_R(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(4,1,2);
plot(t_z,x_r_z);
grid on;
title('$Zero\,\,Hold\,\,Interpolation$',...
      'Interpreter','latex','FontSize',14);
ylabel('$x_R(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(4,1,3);
plot(t_l,x_r_l);
grid on;
title('$Linear\,\,Interpolation$',...
      'Interpreter','latex','FontSize',14);
ylabel('$x_R(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);
ax = gca;
ax.YLabel.Rotation = 360;

subplot(4,1,4);
plot(t_i,x_r_i);
grid on;
title('$Ideal\,\,Interpolation$',...
      'Interpreter','latex','FontSize',14);
ylabel('$x_R(t)$','Interpreter','latex','FontSize',14);
xlabel('$t$','Interpreter','latex','FontSize',14);
ax = gca;
ax.YLabel.Rotation = 360;




