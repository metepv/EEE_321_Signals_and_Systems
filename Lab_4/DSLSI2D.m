%2D convolution function
function [y] = DSLSI2D(x,h)
    
    x_row = size(x,1); %M_x
    x_col = size(x,2); %N_x
    
    h_row = size(h,1); %M_h
    h_col = size(h,2); %N_h

    y_row = (x_row + h_row)-1;
    y_col = (x_col + h_col)-1;

    h_rot = rot90(h,2);

    y = zeros(y_row,y_col);

    %the matrices on which the loop iterates.
    temp_mat1 = zeros((x_row + 2*h_row),(x_col + 2*h_col));
    temp_mat1((h_row+1):(x_row+h_row),(h_col+1):(x_col + h_col)) = x;

    for l = 0:(x_col + 2*h_col)-h_col %column iteration
        for k  = 0:(x_row + 2*h_row)-h_row %row iteration
            
            temp_mat2 = zeros((x_row + 2*h_row),(x_col + 2*h_col));
            temp_mat2(1+k:h_row+k,1+l:h_col+l) = h_rot;
            mul_mat = (temp_mat2.*temp_mat1);
            total  = sum(sum(mul_mat));
            
            %if (k + 1 < x_row + 2*h_row - 1) && ...
               (l + 1 < x_row + 2*h_row - 1)
                y(k+1,l+1) = total;
            %end

        end
    end

    %y = y(2:end,2:end);

end
