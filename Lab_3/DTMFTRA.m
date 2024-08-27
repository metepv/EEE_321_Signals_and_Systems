
function [x_t_main] = DTMFTRA(input_num,samp_int)  %(Number, deltat)

%Lookup table for DTMFTRA
data = {'0',1336,941; 
        '1',1209,697;
        '2',1336,697; 
        '3',1477,697;
        '4',1209,770;
        '5',1336,770;
        '6',1477,770;
        '7',1209,852;
        '8',1336,852; 
        '9',1477,852;
        '*',1209,941;
        '#',1477,941;
        'A',1633,697;
        'B',1633,770;
        'C',1633,852;
        'D',1633,941};

N = length(input_num);
x_t_main = [];         %Empty Signal

    for i = 1:N

        for element = 1:length(data)
            if data{element,1} == input_num(i)
                f1 = data{element,2};
                f2 = data{element,3};
                %t_i = linspace(0.25*(i-1),0.25*i,0.25/samp_int);
                t_i = 0.25*(i-1):samp_int:(0.25*i)-samp_int;
                x_i = cos(2*pi*f1*t_i) + cos(2*pi*f2*t_i);
                x_t_main = [x_t_main x_i];
            end
        end

    end 

end
