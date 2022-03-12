:- [facts].
:- [menus].
:- dynamic game/9,genre/1,category/1,publisher/1,developer/1.

start:- main_menu.

preferences:- 
    menu_category, 
    menu_genre,
    menu_developer,
    menu_publisher,
    show_recommendation.

by_developer:-
    menu_developer,
    show_dev_recomendations.

by_genre:-
    menu_genre,
    list_genre_games.

show_recommendation:-
    findall(X, find_games(X), RecommendationList),
    nth0(0, RecommendationList, Id),
    game_details(Id).

show_dev_recomendations:-
    findall(X, find_games_by_developer(X), RecommendationList),
    write("Aqui estão os jogos deste desenvolvedor:"), nl, nl,
    sort(RecommendationList, SortedList),
    print_list(SortedList),
    nl, write("Pressione ENTER para retornar ao menu..."), nl,
    get_char(_).

list_genre_games:-
    findall(X, find_games_by_genre(X), RecommendationList),
    write("Aqui estão os jogos deste genero:"), nl, nl,
    sort(RecommendationList, SortedList),
    print_list(SortedList),
    nl, write("Pressione ENTER para retornar ao menu..."), nl,
    get_char(_).

list_all_games:-
    save_preference(user_developer,_, 0),
    findall(X, find_games_by_developer(X), RecommendationList),
    write("Aqui estão todos os jogos da Steam: "), nl, nl,
    sort(RecommendationList, SortedList),
    print_list(SortedList),
    nl, write("Pressione ENTER para retornar ao menu..."), nl,
    get_char(_).

 /* game(steam_id, 
            name, 
            developers, 
            publishers, 
            required_age, 
            categories, 
            genres, 
            positive_ratings, 
            average_playtime,
            description)
*/

find_games(Id):- game(Id, _, Dev,Pub, _, Cat, Gen, _, _, _), 
    nb_getval(user_category, Selected_category),
    nb_getval(user_genre, Selected_genre),
    nb_getval(user_publisher, Selected_publisher),
    nb_getval(user_developer, Selected_developer),
    member(Selected_category, Cat), 
    member(Selected_genre, Gen),
    member(Selected_publisher, Pub),
    member(Selected_developer, Dev).

find_games_by_developer(Id):- game(Id, _, Dev,_, _, _, _, _, _, _), 
    nb_getval(user_developer, Selected_developer),
    member(Selected_developer, Dev).

find_games_by_genre(Id):- game(Id, _, _,_, _, _, Gen, _, _, _), 
    nb_getval(user_genre, Selected_genre),
    member(Selected_genre, Gen).
