%----------------------EE3321 LAB4 OFFLAB CODE----------------------------
%PART1:Displaying Images
A = ReadMyImage('Part5.bmp');
DisplayMyImage(A);

%%
%PART3:2D FIR Filter
x = [1 0 2;
    -1 3 1;
    -2 4 0];

h = [1 -1;
     0  2];

y = DSLSI2D(x,h);
disp(y);

%%
%PART4:Image Denoising
x = ReadMyImage('Part4.bmp');
ID = 22003836;
D_8 = mod(ID,8);

B1 = 0.8;
B2 = 0.5;
B3 = 0.2;

M_h = 25 + D_8;
N_h = 25 + D_8;

h1 = impulseResponse(M_h,N_h,B1);
y1 = DSLSI2D(x,h1);

h2 = impulseResponse(M_h,N_h,B2);
y2 = DSLSI2D(x,h2);

h3 = impulseResponse(M_h,N_h,B3);
y3 = DSLSI2D(x,h3);

%%
DisplayMyImage(x);
title ('$Original\,\,Picture\,\,X$','Interpreter','latex','FontSize',14);

%%
DisplayMyImage(y1);
title ('$The\,\,Picture\,\,With\,\,B\,=\,0.8$',...
       'Interpreter','latex','FontSize',14);

%%
DisplayMyImage(y2);
title ('$The\,\,Picture\,\,With\,\,B\,=\,0.5$',...
       'Interpreter','latex','FontSize',14);

%%
DisplayMyImage(y3);
title ('$The\,\,Picture\,\,With\,\,B\,=\,0.2$',...
       'Interpreter','latex','FontSize',14);

%%
%PART 5:Edge Detection
x = ReadMyImage('Part5.bmp');
DisplayMyImage(x);
title('$Original\,\,Image$','Interpreter','latex','FontSize',14);

%%
h1 = [0.5 -0.5;
     0     0];
y1 = DSLSI2D(x,h1);
DisplayMyImage(y1);
title('$Vertical\,\,Edge\,\,Detection$','Interpreter','latex','Fontsize',14);

s1 = y1.*y1;
DisplayMyImage(s1);
title('$Image\,\,S_1$','Interpreter','latex','Fontsize',14);

%%
h2  = [0.5 0;
      -0.5 0];
y2 = DSLSI2D(x,h2);
DisplayMyImage(y2);
title('$Horizontal\,\,Edge\,\,Detection$','Interpreter','latex','Fontsize',14);
%{
s2 = y2.*y2;
DisplayMyImage(s2);
title('$Image\,\,S_2$','Interpreter','latex','Fontsize',14);
%}
%%
h3 = 0.25*h1 + 0.25*h2;
y3 = DSLSI2D(x,h3);
DisplayMyImage(y3);
title('$Vertical\,\,and\,\,Horizontal\,\,Edge\,\,Detection$',...
    'Interpreter','latex','Fontsize',14);
%{
s3 = y3.*y3;
DisplayMyImage(y3);
title('$The\,\,Image\,\,S_3$','Interpreter','latex','Fontsize',14);
%}
 