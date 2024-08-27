function p = generateInterp(type,Ts,dur)

t = -dur/2:Ts/1000:dur/2;

    if type == 0
        p = zeros(1,length(t));
        i2 = 1;

        for i=-dur/2:Ts/1000:dur/2

            if (i >= -Ts/2) && (i <= Ts/2)
                p(1,i2) = 1;
            else
                p(1,i2) = 0;
            end

            i2 = i2 + 1;

        end

    elseif type == 1

        p = zeros(1,length(t));
        i2 = 1;

        for i=-dur/2:Ts/1000:dur/2

            if (i >= -Ts/2) && (i < 0)
                p(1,i2) = 1+(2*i)/Ts;
            elseif (i >= 0) && (i < Ts/2)
                p(1,i2) = 1-(2*i)/Ts;
            else
                p(1,i2) = 0;
            end

            i2 = i2 + 1;

        end

    elseif type == 2

        p = zeros(1,length(t));
        i2 = 1;

        for i=-dur/2:Ts/1000:dur/2
            if i == 0
                p(1,i2) = 1;
            else
                p(1,i2) = Ts*(sin((pi*i)/Ts)/(pi*i));
            end

            i2 = i2 + 1;
            
        end
    end

end