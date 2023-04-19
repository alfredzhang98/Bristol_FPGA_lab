function output = my_conv(input, coefficients)
    N = length(input);
    M = length(coefficients);
    output = zeros(1, N + M - 1);

    for n = 1:N + M - 1
        for m = 1:M
            if n - m + 1 > 0 && n - m + 1 <= N
                output(n) = output(n) + input(n - m + 1) * coefficients(m);
            end
        end
    end
end
