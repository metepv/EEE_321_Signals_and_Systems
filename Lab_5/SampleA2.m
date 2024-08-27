function [XaZ,XaL,XaI]= SampleA2(X,Ts,a)
    
    Ts_new = a*Ts;
    samp_int = Ts/1000;
    N = length(X);
    dur = 2;

    [x_r_z, t_r] = DtoA(0,Ts,dur,X);
    [x_r_l, t_l] = DtoA(1,Ts,dur,X);
    [x_r_i, t_i] = DtoA(2,Ts,dur,X);

    for i=1:N-1
        if i*Ts_new < 2
            XaZ(1,i) = x_r_z(1,i*a*1000);
        end
    end

    for i=1:N-1
        if i*Ts_new < 2
            XaL(1,i) = x_r_l(1,i*a*1000);
        end
    end

    for i=1:N-1
        if i*Ts_new < 2
            XaI(1,i) = x_r_i(1,i*a*1000);
        end
    end
end
