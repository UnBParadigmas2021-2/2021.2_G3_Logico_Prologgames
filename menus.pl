:- [facts].
:- [utils].

game_recomendation :- 
    write('\n==========Menu de Indicação de jogos ======='),nl,
    write('[1] - Recomendação por preferencias'),nl,
    /*write('[2] - Recomendação por signo'),nl,*/
    write('[0] - Voltar ao Menu Inicial'),nl,
    read_string(user, "\n", "\r", _, Option),
        switch(
        Option, 
        [
            "1" : preferences,
            "2" : exit,
            "0" : main_menu
        ],
        game_recomendation
    ).

main_menu:-
    write('=========== Bem vindo ao Steam Seeker ========='),nl,
    write('[1] - Me indique um jogo'),nl,
    /*write('[2] - Adicionar um jogo a base'),nl,*/
    write('[0] - Encerrar programa'),nl,
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : game_recomendation,
            "2" : add_game,
            "0" : exit
        ],
        main_menu
    ).

explore_recommandations(Id, Name) :-
    write('\n==============Jogo Recomendado============='), nl,
    write(Name), nl,
    write('[1] - Selecionar esse jogo'),nl,
    write('[2] - Proximo jogo'),nl,
    read_string(user, "\n", "\r", _, Option),
     switch(
        Option, 
        [
            "1" : game_details(Id),
            "2" : fail
        ],
        explore_recommandations(Id, Name)
    ).

menu_category:-
    write('Selecione a categoria'),nl,
    setof(X,category(X),L),
    (display(L,0);true),
    write('Digite o numero da categoria'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(X, Option),
    checkinput(X,L),
    nb_getval(checkresult,S),
    save_preference(user_category,L, S).

menu_genre:-
    write('Selecione o genero'),nl,
    setof(X,genre(X),L),
    (display(L,0);true),
    write('Digite o numero do genero'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(X, Option),
    checkinput(X,L),
    nb_getval(checkresult,S),
    save_preference(user_genre,L, S).