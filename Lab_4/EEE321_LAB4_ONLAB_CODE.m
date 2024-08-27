%-----------------EEE321 LAB4 ONLAB CODE-----------------------------------
x = ReadMyImage('Part6x.bmp'); %soccer team image.
DisplayMyImage(x);

%%
h = ReadMyImage('Part6h.bmp'); %impulse response.
DisplayMyImage(h);

%%
y = DSLSI2D(x,h);
DisplayMyImage(abs(y));
title('$Output\,\,Of\,\,The\,\,System$',...
       'Interpreter','latex','FontSize',14);

%%
y1 = abs(y).^4;
DisplayMyImage(y1);
title('$Fourth\,\,Power\,\,Of\,\,The\,\,Output$',...
       'Interpreter','latex','FontSize',14);
%%
y2 = abs(y).^6;
DisplayMyImage(y2);
title('$Sixth\,\,Power\,\,Of\,\,The\,\,Output$',...
       'Interpreter','latex','FontSize',14);