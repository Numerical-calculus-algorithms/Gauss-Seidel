function[x, nit, res] =  Gauss_seidel(A, b, tol, maxIter, x0)
n = size(A, 1);
L = eye(n); % Initialization of L as a special lower triangular matrix
U = triu(A); % Initialization of U as a upper triangular matrix

for nit=1:maxIter

    x = L\(b-U*x0); % Iteration formula
    err = norm(x-x0, "inf")/norm(x0, "inf"); % Relative error calculation

    if err < tol

        res = norm(A*x-b, "inf");
        return
    end
    x0 = x;

end

res = norm(A*x-b, "inf");