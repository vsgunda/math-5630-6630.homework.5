% Author: Vishnu Gunda / vsg0005@auburn.edu
% Date: 2024-11-08
% Assignment Name: hw05

classdef hw05
    methods (Static)
        function ret = p1(data, powers)
            % Implementation of Richardson Extrapolation
            % Assume the expansion of f(h) = f(0) + c_1 h^{alpha_1} + c_2 h^{alpha_2} + ... + c_n h^{alpha_n} + ...
            %
            % :param: data: a vector of values f(2^(-i) h), i=1,2,...,n
            % :param: powers: a vector of powers (alpha_1, ..., alpha_{n-1})
            %
            % :return: the extrapolated value of f(0) using Richardson Extrapolation
        
            % Number of data points
            m = length(data);
        
            % Initialize the Richardson extrapolation matrix
            R = zeros(m, m);
            
            % Set the first column of R with the data values
            R(:, 1) = data(:);
        
            % Perform Richardson extrapolation
            for j = 2:m
                for i = 1:(m - j + 1)
                    alpha = powers(j - 1);  % Get the corresponding power for the current level
                    factor = 2^alpha;
                    % Update the Richardson table entry with the formula
                    R(i, j) = (factor * R(i + 1, j - 1) - R(i, j - 1)) / (factor - 1);
                end
            end
        
            % The best approximation of f(0) is in the top-right corner of the matrix
            ret = R(1, m);
        end

        function R = p2(beta)
            % Compute the value of the series 
            %   sum_{k=0}^{\infty} ((-1)^k / (2k + 1)^{beta})
            %
            % :param: beta: a real number in (0, 1].
            % :return: R: the value of the series
        
            % Initialize parameters
            m = 15;  % Maximum number of terms to avoid rounding errors
            h = 1;   % Initial step size
        
            % Define the function f(h, beta) as the partial sum of the series up to 1/h terms
            function result = f(h, beta)
                n = floor(1/h);  % Number of terms based on step size
                result = 0;
                for i = 0:n
                    result = result + ((-1)^i) / ((2*i + 1)^beta);
                end
            end
        
            % Generate data vector a_k = f(2^(-k), beta) for k = 1, ..., m
            data = zeros(1, m);
            for k = 1:m
                data(k) = f(2^(-k), beta);
            end
        
            % Generate powers vector for Richardson extrapolation
            powers = beta + (0:m-2);
        
            % Use Richardson extrapolation function `p1` (previously implemented)
            R = hw05.p1(data, powers);
        end

        function coefs = p3(shifts)
            % Compute the coefficients of the finite difference scheme for f'(x)
            % using the formula
            % f'(x) \approx \frac{1}{h} (c_0 f(x_0) + c_1 f(x_1) + ... + c_n f(x_n)) + O(h^n)
            %
            % :param: shifts: a vector of shifts (a_0, a_1, ..., a_n), the nodes are x_i = x + a_i h
            % :return: coefs: a vector of coefficients (c_0, c_1, ..., c_n)
        
            m = length(shifts);
            coefs = zeros(m, 1);
        
            % Compute each coefficient c_k using Lagrange interpolation
            for k = 1:m
                L_prime_k = 0;
                
                % Calculate the derivative of the k-th Lagrange polynomial at x = 0
                for j = 1:m
                    if j ~= k
                        product = 1;
                        
                        for i = 1:m
                            if i ~= k && i ~= j
                                product = product * (0 - shifts(i)) / (shifts(k) - shifts(i));
                            end
                        end
                        
                        L_prime_k = L_prime_k + product / (shifts(k) - shifts(j));
                    end
                end
                
                % Calculate the coefficient c_k
                coefs(k) = L_prime_k;
            end
        end

        function coefs = p4(shifts, l)
            % Compute the coefficients of the finite difference scheme for f^{(l)}(x)
            % using the formula
            % f^{(l)}(x) \approx \frac{1}{h^l} (c_0 f(x_0) + c_1 f(x_1) + ... + c_n f(x_n)) + O(h^{n + 1 - l})
            %
            % :param: shifts: a vector of shifts (a_0, a_1, ..., a_n), the nodes are x_i = x + a_i h
            % :param: l: the order of the derivative
            % :return: coefs: a vector of coefficients (c_0, c_1, ..., c_n)
        
            m = length(shifts);      % Number of shifts
            coefs = zeros(m, 1);     % Initialize the coefficient vector
        
            % Construct the Vandermonde matrix for solving the system
            V = zeros(m, m);
            for i = 1:m
                for j = 1:m
                    V(i, j) = shifts(j)^(i - 1); % Power of the shift
                end
            end
        
            % Define the right-hand side for the l-th derivative
            b = zeros(m, 1);
            b(l + 1) = factorial(l); % Corresponds to the l-th derivative
        
            % Solve the linear system to find the coefficients
            coefs = V \ b;
        end
    end
end
