% Define um predicado switch case para validar opções do input
switch(_, [], ReturnTo) :- write('Opção inválida'),nl, call(ReturnTo).
switch(X, [Val:Goal|Cases], ReturnTo) :-
    ( X==Val ->
        call(Goal),
        call(ReturnTo);
        switch(X, Cases, ReturnTo)
    ).

% Limpa a tela
clear :- write('\e[H\e[2J').

% Finaliza o programa
exit:- write(':) Bye'),nl, halt(0).


% Salva as escolhas dos usuários em variáveis globais, para ser acessadas por outras regras

save_preference(Local,List,Index):-
    T is Index-1,
    nth0(T, List, Selected_preference),
    nb_setval(Local, Selected_preference).

% Apresenta a lista de opções que o usuário pode escolher

display([]).
display([H|T],A):-  
    M is A+1,
    write(M),
    write('- '),
    write(H),
    nl,
    display(T,M).

% Verifica se a escolha do usuário está dentro dos limites das listas

checkinput(A,L):-
    length(L,Len),
    ( A>Len ->(write('Digite um numero valido: '),read(D),checkinput(D,L) ) ; (nb_setval(checkresult,A),nl) ).