PREDICATES
	factorial(integer, integer).
	factorial_rec(integer, integer, integer).
	
	fib_num(integer, integer).
	fib_num_rec(integer, integer, integer, integer).

CLAUSES	
	factorial_rec(1, Cur, Cur) :- !.
	factorial_rec(X, Cur, Res) :- C = Cur * X,
				      X1 = X - 1,
				      factorial_rec(X1, C, Res).
	factorial(X, Res) :- factorial_rec(X, 1, Res).
	
	fib_num_rec(0, Num, _, Num) :- !.
	fib_num_rec(Count, Num, Prev, Res) :- C = Count - 1,
					      P = Num,
					      N = Prev + Num,
					      fib_num_rec(C, N, P, Res).
	fib_num(Count, Res) :- fib_num_rec(Count, 0, 1, Res).

GOAL
	fib_num(6, Res).