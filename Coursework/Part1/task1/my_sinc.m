function y = my_sinc(x)
    y=ones(size(x));
    for i = 1: size(x,1)
        for j =1 : size(x,2)
            if(x(i,j)==0)
                y(i,j) = 1;
            else
                y(i,j) = sin(x(i,j))./x(i,j);
            end
        end
    end
end