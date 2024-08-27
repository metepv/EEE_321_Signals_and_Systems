
function [h] = impulseResponse(M_h,N_h,B)
    
    h = zeros(M_h,N_h);

    for k = 0:M_h-1
        for l = 0:N_h-1
            h(k+1,l+1) = sinc(B*(k-0.5*(M_h-1))).*sinc(B*(l-0.5*(M_h-1)));
        end
    end

end