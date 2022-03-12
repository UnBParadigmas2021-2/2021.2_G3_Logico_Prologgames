:- [facts].
:- [utils].

game_recomendation :- 
    clear,
    write('\n========== Menu de Indicação de jogos ======='),nl,
    write('[1] - Recomendação por preferencias'),nl,
    write('[2] - Listar por desenvolvedor'),nl,
    /*write('[2] - Recomendação por signo'),nl,*/
    write('[0] - Voltar ao Menu Inicial'),nl,
    read_string(user, "\n", "\r", _, Option),
        switch(
        Option, 
        [
            "1" : preferences,
            "2" : by_developer,
            "3" : exit,
            "0" : main_menu
        ],
        game_recomendation
    ).

game_list :- 
    clear,
    write('\n========== Menu de Listagem de jogos ======='),nl,
    write('[1] - Listar por desenvolvedor'),nl,
    write('[0] - Voltar ao Menu Inicial'),nl,
    read_string(user, "\n", "\r", _, Option),
        switch(
        Option, 
        [
            "1" : by_developer,
            "0" : main_menu
        ],
        game_list
    ).

main_menu:-
    clear,
    write('=========== Bem vindo ao Steam Seeker ========='),nl,
    write('[1] - Me indique um jogo'),nl,
    write('[2] - Liste jogos'),nl,
    /*write('[2] - Adicionar um jogo a base'),nl,*/
    write('[0] - Encerrar programa'),nl,
    read_string(user, "\n", "\r", _, Option),
    switch(
        Option, 
        [
            "1" : game_recomendation,
            "2" : game_list,
            "0" : exit
        ],
        main_menu
    ).

menu_category:-
    clear,
    write('Selecione a categoria'),nl,
    setof(CategoryName, category(CategoryName), CategoryList),
    (display(CategoryList, 0) ; true),
    write('--------------------------------------'),nl,
    write('Digite o numero da categoria'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(ConvertedOption, Option),
    checkinput(ConvertedOption,CategoryList),
    nb_getval(checkresult, SelectedCategory),
    save_preference(user_category, CategoryList, SelectedCategory),
    clear.

menu_genre:-
    clear,
    write('Selecione o genero'),nl,
    setof(GenreName, genre(GenreName), GenreList),
    (display(GenreList, 0) ; true),
    write('--------------------------------------'),nl,
    write('Digite o numero do genero'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(ConvertedOption, Option),
    checkinput(ConvertedOption, GenreList),
    nb_getval(checkresult, SelectedGenre),
    save_preference(user_genre, GenreList, SelectedGenre),
    clear.

menu_publisher:-
    clear,
    write('Selecione o Editora'),nl,
    setof(PublisherName, publisher(PublisherName), PublisherList),
    (display(PublisherList, 0) ; true),
    write('0 - Nao especificar'), nl,
    write('--------------------------------------'),nl,
    write('Digite o numero da editora'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(ConvertedOption, Option),
    checkinput(ConvertedOption, PublisherList),
    nb_getval(checkresult, SelectedPublisher),
    save_preference(user_publisher, PublisherList, SelectedPublisher),
    clear.

menu_developer:-
    clear,
    write('Selecione o desenvolvedor'),nl,
    setof(DeveloperName, developer(DeveloperName), DeveloperList),
    (display(DeveloperList, 0) ; true),
    write('0 - Nao especificar'),nl,
    write('--------------------------------------'),nl,
    write('Digite o numero referente ao desenvolvedor'),nl,
    read_string(user, "\n", "\r", _, Option),
    number_string(ConvertedOption, Option),
    checkinput(ConvertedOption,DeveloperList),
    nb_getval(checkresult, SelectedDeveloper),
    save_preference(user_developer,DeveloperList, SelectedDeveloper),
    clear.

game_details(GameID) :- 
    game(GameID, Name, _, _, _, _, _, _, _, Description), 
    clear,
    write("========== JOGO RECOMENDADO =========="),nl,
    write("Nome:"),nl,
    write(Name),nl,
    write("Descrição:"),nl,
    write(Description), nl,
    nl, write("Pressione ENTER para retornar ao menu..."), nl,
    get_char(_).

show_game_as_list_item(GameID) :- 
    game(GameID, Name, _, _, _, Cat, Gen, _, _, _), 
    format('Nome: ~w', Name), nl,
    format('Genêro (s): ~w', [Gen]), nl,
    format('Categoria (s): ~w', [Cat]), nl, nl, nl.


/*
explore_recommandations(Id, Name) :-
    clear,
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
*/