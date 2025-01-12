function [dig_sqn] = digital_sqn_gen(n, type_of_sqn, alpha, A, M, N)
% 1 impulse
% 2 unit step
% 3 exponential decay
% 4 discrete cos
% 5 sin
% 6 sinc
% 7 Gate

dig_sqn = zeros(size(n)); % Initialize the output signal

if type_of_sqn == 1
    for ii = 1:length(n)
        if n(ii) == 0
            dig_sqn(ii) = 1;
        else
            dig_sqn(ii) = 0;
        end
    end

elseif type_of_sqn == 2
    for ii = 1:length(n)
        if n(ii) >= 0
            dig_sqn(ii) = 1;
        else
            dig_sqn(ii) = 0;
        end
    end

elseif type_of_sqn == 3
    for ii = 1:length(n)
        if n(ii) >= 0
            dig_sqn(ii) = alpha^n(ii);
        else
            dig_sqn(ii) = 0;
        end
    end

elseif type_of_sqn == 4
    for ii = 1:length(n)
            dig_sqn(ii) = A * cos(2 * pi * (M / N) * n(ii));
    end
    
elseif type_of_sqn == 5
    for ii = 1:length(n)
            dig_sqn(ii) = A * sin(2 * pi * (M / N) * n(ii));
    end
    
elseif type_of_sqn == 6
    for ii = 1:length(n)
            dig_sqn(ii) = sin(pi*n(ii))./(pi*n(ii));
    end
    
elseif type_of_sqn == 7
    for ii = 1:length(n) 
        if(n(ii) <-N/2) 
            dig_sqn(ii) = 0;
        elseif (n(ii) >= -N/2 && n(ii) <= N/2) 
            dig_sqn(ii) = A;
        else
            dig_sqn(ii) = 0;
        end
    end
     
end
