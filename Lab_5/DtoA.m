%Function generates recovered signal
function [x_r,t_r] = DtoA(type,Ts,dur,Xn)
    
    p = generateAyberk(type,Ts,dur);
    N  = length(Xn);
    len_p = length(p);
    low_b = floor(len_p/2);

    %t = linspace(-dur,dur,length(p));
    %plot(t,p,"k",LineWidth=1.3);

    x_r = zeros(1,1000*(N-1)+len_p);

    for i=1:N
        %disp(i)
        x_r(1,1+(i-1)*1000:len_p+(i-1)*1000) ...
      = x_r(1,1+(i-1)*1000:len_p+(i-1)*1000) ...
      + Xn(1,i).*p;

    end

    x_r = x_r(1,low_b+1:low_b+1000*(N-1));
    t_r = linspace(-dur,dur,length(x_r));

end
