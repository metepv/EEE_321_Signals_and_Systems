%---------------------EEE321 LAB6 OFFLAB CODE------------------------------
%PART2:mpulse Response Analysis of DTLTI Systems
D = 22003836;
D_4 = mod(D,5);
M = 6 + D_4;

k = 0:1:M-1;
n = 0:1:10;

x = zeros(1,11);
a = zeros(1,10); 
b = exp(-k/2);

for i=1:11
    if i == 1
        x(1,i) = 1;
    else
        x(1,i) = 0;
    end
end

h = DTLTI(a,b,x,11);

clf;
stem(n,h,LineWidth=2);
grid on;
title('$Impulse\,\,Response$','Interpreter','latex','FontSize',14)
ylabel('$h[n]$','Interpreter','latex','FontSize',14);
xlabel('$n$','Interpreter','latex','FontSize',14);
xlim([0,10]);

ax = gca;
ax.YLabel.Rotation = 360;

%%
subplot(1,2,1);
stem(k,b,LineWidth=2);
grid on;
title('$Coefficient\,\,Array$'...
    ,'Interpreter','latex','FontSize',14);
ylabel('$b[k]$','Interpreter','latex','FontSize',14);
xlabel('$k$','Interpreter','latex','FontSize',14);
xlim([0,10]);

ax = gca;
ax.YLabel.Rotation = 360;

h = DTLTI(a,b,x,11);

subplot(1,2,2);
stem(n,h,LineWidth=2);
grid on;
title('$Impulse\,\,Response$'...
    ,'Interpreter','latex','FontSize',14);
ylabel('$h[n]$','Interpreter','latex','FontSize',14);
xlabel('$n$','Interpreter','latex','FontSize',14);

ax = gca;
ax.YLabel.Rotation = 360;

%%
%-------DTFT of system's response------------------------------------------
clf;
j = sqrt(-1);
w = -pi:0.01:pi;
H = abs(1./(1-exp(-1)*exp(-j*w)));
db = 20*log(H);

plot(w,db,"k");
grid on
title ('$20log(|H(e^{j\omega})|)$','Interpreter','latex','FontSize',14);
ylabel('$|H(e^{j\omega})|$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
tick_positions = -pi:pi:pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%%
%-----Sweep Signal---------------------------------------------------------
L1 = 256;
L2 = 512;
L3 = 1024;

n = linspace(0,2*pi,L1);
M = 6 + D_4;
k = 0:1:M-1;
a = zeros(1,10);
b = exp(-k/2);

x1 = exp(j*(pi/L1)*(n.^2));
y1 = DTLTI(a,b,x1,length(n));
y1_mag = abs(y1);
y1_pha = angle(y1);

x2 = exp(j*(pi/L2)*(n.^2));
y2 = DTLTI(a,b,x2,length(n));
y2_mag = abs(y2);
y2_pha = angle(y2);

x3 = exp(j*(pi/L3)*(n.^2));
y3 = DTLTI(a,b,x3,length(n));
y3_mag = abs(y3);
y3_pha = angle(y3);

%%
%Plots
clf;
%1-------------------------------------------------------------------------
subplot(3,3,1);
plot(n,x1,"k",LineWidth=1.5);
grid on
title ('$Input\,\,Sweep\,\,Function\,\,L = 256$',...
    'Interpreter','latex','FontSize',14);
ylabel('$x_1[n]$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,4);
plot(n, y1_mag, 'k', 'LineWidth', 1.5);
grid on;
title('$Magnitude\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 256$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$|y_1[n]|$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,7);
plot(n, y1_pha, 'k', 'LineWidth', 1.5);
grid on;
title('$Phase\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 256$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$\theta(y_1[n])$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%2-------------------------------------------------------------------------
subplot(3,3,2);
plot(n,x2,"k",LineWidth=1.5);
grid on
title ('$Input\,\,Sweep\,\,Function\,\,L = 512$',...
    'Interpreter','latex','FontSize',14);
ylabel('$x_2[n]$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,5);
plot(n, y2_mag, 'k', 'LineWidth', 1.5);
grid on;
title('$Magnitude\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 512$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$|y_2[n]|$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,8);
plot(n, y2_pha, 'k', 'LineWidth', 1.5);
grid on;
title('$Phase\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 512$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$\theta(y_2[n])$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%3-------------------------------------------------------------------------
subplot(3,3,3);
plot(n,x3,"k",LineWidth=1.5);
grid on
title ('$Input\,\,Sweep\,\,Function\,\,L = 1024$',...
    'Interpreter','latex','FontSize',14);
ylabel('$x_3[n]$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,6);
plot(n, y3_mag, 'k', 'LineWidth', 1.5);
grid on;
title('$Magnitude\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 1024$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$|y_3[n]|$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi;  
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

subplot(3,3,9);
plot(n, y3_pha, 'k', 'LineWidth', 1.5);
grid on;
title('$Phase\,\,of\,\,Output\,\,Sweep\,\,Function\,\,L = 1024$', ...
    'Interpreter', 'latex', 'FontSize', 14);
ylabel('$\theta(y_3[n])$', 'Interpreter', 'latex', 'FontSize', 14);
xlabel('$\omega$', 'Interpreter', 'latex', 'FontSize', 14);
ylim([-2 4]);
xlim([-2 10]);
tick_positions = -pi:pi:3*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%%
%PART3

z1 = 0.485000000000000 + 0.874000000000000i;
p1 = 0.252000000000000 + 0.961000000000000i;
p2 = 0.442000000000000 + 0.884000000000000i;

w = 0:0.01:2*pi;
H = (exp(-j*w)-z1*exp(-j*2*w))./((1-p1*exp(-j*w)).*(1-p2*exp(-j*w)));

plot(w,abs(H),"k",LineWidth=2);
grid on;
title('$Frequency\,\,Response\,\,of\,\,The\,\,System:\,\,H(e^{j\omega})$',...
      'Interpreter','latex','FontSize',14);
ylabel('$H(e^{j\omega})$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
tick_positions = 0:pi:2*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%%
n = linspace(0,2*pi,L1);
x = exp(j*(pi/L1)*(n.^2));
a = [p1+p2 -p1*p2];
b = [0 1 -z1];

y = DTLTI(a,b,x,length(n));
y_mag = abs(y);
y_pha = angle(y);

%%
clf;
plot(n,y_mag,"k");
grid on;
title('$Magnitude\,\,of\,\,Chirp\,\,Output\,\,of\,\,Designed\,\,Filter$',...
      'Interpreter','latex','FontSize',14);
ylabel('$|y[n]|$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
tick_positions = 0:pi:2*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

%%
clf;
plot(n,y_pha,"k");
grid on;
title('$Phase\,\,of\,\,Chirp\,\,Output\,\,of\,\,Designed\,\,Filter$',...
      'Interpreter','latex','FontSize',14);
ylabel('$\theta(y[n])$','Interpreter','latex','FontSize',14);
xlabel('$\omega$','Interpreter','latex','FontSize',14);
tick_positions = 0:pi:2*pi; 
tick_labels = arrayfun(@(x) ...
    sprintf('%.0f\\pi', x/pi), tick_positions, 'UniformOutput', false);
ax = gca;
ax.XTick = tick_positions;
ax.XTickLabel = tick_labels;
ax.YLabel.Rotation = 360;

