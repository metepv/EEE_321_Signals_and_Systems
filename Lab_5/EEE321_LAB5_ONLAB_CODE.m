%-----------------------EEE321 LAB5 ONLAB CODE-----------------------------
Ts = 1/120;
samp_int = Ts/1000;
t = 0:samp_int:2;
t_n = 0:Ts:2;
x = 0.2*cos(2*pi*40*t)+0.8*cos(2*pi*8*t+0.5);
clf;
plot(t,x,"k");

N = length(t_n);
X = zeros(1,N);
for i = 1:N-1
    X(1,i) = 0.2*cos(2*pi*40*(i*Ts))+0.8*cos(2*pi*8*(i*Ts)+0.5);
end

a = 2;

%%
[XaZ,XaL,XaI] = SampleA2(X,Ts,a);
t_new = linspace(0,2,length(XaZ));

clf;
subplot(3,1,1);
plot(t_new,XaZ,"k");
title('$XaZ[n]\,\,a=2$','Interpreter','latex','FontSize',14);

subplot(3,1,2);
plot(t_new,XaL,"k");
title('$XaL[n]\,\,a=2$','Interpreter','latex','FontSize',14);

subplot(3,1,3);
plot(t_new,XaI,"k");
title('$XaI[n]\,\,a=2$','Interpreter','latex','FontSize',14);

%%
[x_r_zii,t_zii] = DtoA(0,a*Ts,2,XaZ);
[x_r_lii,t_lii] = DtoA(1,a*Ts,2,XaL);
[x_r_iii,t_iii] = DtoA(2,a*Ts,2,XaL);

clf;
subplot(3,1,1);
plot(t_zii,x_r_zii,"k");
title('$x_R(t)\,\,Reconstructed\,\,From\,\,XaZ\,\,a = 2$',...
    'Interpreter','latex','FontSize',14);

subplot(3,1,2);
plot(t_zii,x_r_lii,"k");
title('$x_R(t)\,\,Reconstructed\,\,From\,\,XaL\,\,a = 2$',...
    'Interpreter','latex','FontSize',14);

subplot(3,1,3);
plot(t_zii,x_r_iii,"k");
title('$x_R(t)\,\,Reconstructed\,\,From\,\,XaI\,\, a = 2$',...
    'Interpreter','latex','FontSize',14);

