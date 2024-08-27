%DTLTI function
function [y]=DTLTI(a,b,x,Ny)

    for n=0:Ny-1
        value1 = 0;
        value2 = 0;
        
        for l=1:length(a)-1
            if (n-l) < 0
                y_n_var = 0;
                value1 = value1 + a(1,l+1)*y_n_var;
            elseif (n-l) >= 0
                value1 = value1 + a(1,l+1)*y(1,n-l+1);
            end
        end

        for k=0:length(b)-1
            %disp(k)
            if (n-k) < 0 || (n+1) > numel(x)
                x_n_var = 0;
                value2 = value2 + b(1,k+1)*x_n_var;
            elseif (n-k) >= 0 && (n+1) <= numel(x)
                value2 = value2 + b(1,k+1)*x(1,n-k+1);
            end
                y(1,n+1) = value1 + value2;
        end

    end

end