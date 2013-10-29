function solve_linear_coupled(obj)
% Solve coupled Stokes system of equations.
%
% $Id: solve_linear_coupled.m 60 2010-09-28 16:11:19Z ymishin $

global verbose;
spval = 0;
if (verbose.level > 2), spval = 1; end;
if (verbose.level > 3), spval = 2; end;
t = tic;

% all required data
bc    = obj.bc;
CV    = obj.CV;
CP    = obj.CP;
Q     = obj.Q;
C     = obj.C;
A     = obj.A;
obj.A = []; % clear
RHSv  = obj.RHS;

% ensure that A and C are symmetric
A = tril(A,0) + tril(A,-1)';
C = tril(C,0) + tril(C,-1)';

% equations corresponding to hanging nodes
hanging_veq = find(~spdiags(CV,0))';
hanging_peq = find(~spdiags(CP,0))';

% total numbers of velocity and pressure equations
[num_veq, num_peq] = size(Q);

% velocity and pressure vectors
v = zeros(num_veq, 1);
p = zeros(num_peq, 1);

% free velocity equations
free_veq = (1:num_veq);
free_veq(union(bc.eq,hanging_veq)) = [];
num_free_veq = length(free_veq);

% free pressure equations
free_peq = (1:num_peq);
free_peq(hanging_peq) = [];

% impose BC
v(bc.eq) = bc.val;
RHSv = RHSv - A(:,bc.eq) * bc.val;
RHSp = - Q(bc.eq,:)' * bc.val;

% construct coupled system
A = [A(free_veq,free_veq)   Q(free_veq,free_peq); ...
     Q(free_veq,free_peq)' -C(free_peq,free_peq)];

% solve it (MA57 is expected)
spparms('spumoni', spval);
x = A \ [RHSv(free_veq); RHSp(free_peq)];
spparms('spumoni', 0);

% extract velocity and pressure
v(free_veq) = x(1:num_free_veq);
p(free_peq) = x(num_free_veq+1:end);

% restore hanging nodes DOFs
v = CV * v;
p = CP * p;

% store solution
obj.velocity = v(1:2:end-1);
obj.velocity(:,2) = v(2:2:end);
obj.pressure = p;

t = toc(t);
verbose.disp(['Stokes solver ... ', num2str(t)], 2);

end
