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

show_recommendation:-
    findall(X, find_games(X), RecommendationList),
    nth0(0, RecommendationList, Id),
    game_details(Id).

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
