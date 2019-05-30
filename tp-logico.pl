:- encoding(utf8).

%padre(Padres, Hijo).

:- begin_tests(padres).

test(esPadreDe, nondet) :-
	padres(héctor, Hijo), Hijo == sebastián.
test(esPadreDe, nondet) :-
	padres(héctor, Hijo), Hijo == ignacio.
test(esPadreDe, nondet) :-
	padres(héctor, Hijo), Hijo == camila.
test(esHijoDe, nondet) :-
	padres(Madre, sebastián), Madre == marita.
test(esHijoDe, nondet) :-
	padres(Madre, ignacio), Madre == marita.
test(esHijoDe, nondet) :-
	padres(Madre, camila), Madre == marita.
:- end_tests(padres).

:- begin_tests(hijos).
test(esHijoDe, nondet) :-
	padres(Padre, camila), Padre == héctor.
test(esHijoDe, nondet) :-
	padres(Padre, sol), Padre == ignacio.
test(esHijoDe, nondet) :-
	padres(Padre, agustín), Padre == ignacio.
test(esHijoDe, nondet) :-
	padres(Padre, lucía), Padre == ignacio.
test(esHijoDe, nondet) :-
	padres(Padre, román), Padre == sebastián.
:- end_tests(hijos).

:- begin_tests(hermanos).
test(sonHermanos, nondet) :-
	hermanos(camila,sebastián).
test(sonHermanos, nondet) :-
	hermanos(ignacio,sebastián).
test(sonHermanos, nondet) :-
	hermanos(camila,ignacio).
test(sonHermanos, nondet) :-
	hermanos(sol,agustín).
test(sonHermanos, nondet) :-
	hermanos(agustín,lucía).
test(sonHermanos, nondet) :-
	hermanos(lucía,sol).
test(sonHermanos, nondet) :-
	not(hermanos(román,_)).
:- end_tests(hermanos).

:- begin_tests(abuelos).
test(esAbuelo, nondet) :-
	abuelo(héctor,Nieta), Nieta == sol.
test(esAbuelo, nondet) :-
	abuelo(héctor,Nieto), Nieto == agustín.
test(esAbuelo, nondet) :-	
	abuelo(héctor,Nieto), Nieto == román.
test(esAbuelo, nondet) :-	
	abuelo(héctor,Nieta), Nieta == lucía.
test(esAbuelo, nondet) :-
	abuelo(marita,Nieta), Nieta == sol.
test(esAbuelo, nondet) :-
	abuelo(marita,Nieto), Nieto == agustín.
test(esAbuelo, nondet) :-	
	abuelo(Abuela,román), Abuela == marita.
test(esAbuelo, nondet) :-	
	abuelo(Abuela,lucía), Abuela == marita.
test(esAbuelo, nondet) :-
	not(abuelo(ignacio,_)).
test(esAbuelo, nondet) :-
	not(abuelo(sebastián,_)).
test(esAbuelo, nondet) :-
	not(abuelo(camila,_)).
:- end_tests(abuelos).

:- begin_tests(tios).
test(esTia, nondet) :-
	sobrinos(_,camila).
test(esTio, nondet) :-
	sobrinos(_,ignacio).
test(esTio, nondet) :-
	sobrinos(_,sebastián).
test(esTio, nondet) :-
	not(sobrinos(_,agustín)).
:- end_tests(tios).


:- begin_tests(primos).
test(sonPrimos, nondet) :-
	primos(román,Prima), Prima == sol.
test(sonPrimos, nondet) :-
	primos(román,Prima), Prima == lucía.
test(sonPrimos, nondet) :-
	primos(román,Primo), Primo == agustín.
test(sonPrimos, nondet) :-
	not(primos(román,camila)).
test(sonPrimos, nondet) :-
	not(primos(_,camila)).
:- end_tests(primos).




padres(marita, sebastián).
padres(marita, ignacio).
padres(marita, camila).
padres(héctor, sebastián).
padres(héctor, ignacio).
padres(héctor, camila).
padres(sebastián, román).
padres(ignacio, sol).
padres(ignacio, agustín).
padres(ignacio, lucía).


hermanos(Hermano1,Hermano2):-
  padres(Padre, Hermano1),
  padres(Padre, Hermano2),
  Hermano1 \= Hermano2.

abuelo(Abuelo, Nieto):-
  padres(Abuelo, Padre),
  padres(Padre, Nieto).

sobrinos(Sobrino,Tía):-
	padres(Hermano,Sobrino),
	hermanos(Hermano,Tía).

primos(Primo1,Primo2):-
	padres(Padre1,Primo1),
	padres(Padre2,Primo2),
	hermanos(Padre2,Padre1).

