%{
The function here can fail for the coefficient arraysthat 
has even number of elements.

So,if you get an error due to the reason above,
you can try to upgrade the code for that situation.
%}

function[x_a] = FourierSum(T,N,A,t)

    x_a = zeros(1,length(t));   %synthesized signal
    indx = 1;                   %index for arrays.
    for k = -N:N                %summing just over k indices.
        if k <0
            x_a= x_a + A(1,indx)*exp(1i*((2*pi)/T)*k*t);
        elseif k == 0
            a_0 = A(1,(length(A)+1)/2);
            x_a= x_a + a_0*exp(1i*((2*pi)/T)*(-k)*t);
        else
            x_a = x_a + A(1,indx)*exp(1i*((2*pi)/T)*k*t);
        end
        indx = indx + 1;
    end
end


