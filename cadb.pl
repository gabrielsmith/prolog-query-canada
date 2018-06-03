country(canada).

located(canada, 'north america').

province(ontario).
province(quebec).
province('nova scotia').
province('new brunswick').
province(manitoba).
province('british columbia').
province('prince edward island').
province(saskatchewan).
province(alberta).
province('newfoundland and labrador').

capital(canada, ottawa).
capital(ontario, toronto).
capital(quebec, 'quebec city').
capital('nova scotia', halifax).
capital('new brunswick', fredericton).
capital(manitoba, winnipeg).
capital('british columbia', victoria).
capital('prince edward island', charlottetown).
capital(saskatchewan, regina).
capital(alberta, edmonton).
capital('newfoundland and labrador', 'st. john\'s').

largest_city(canada, toronto).
largest_city(ontario, toronto).
largest_city(quebec, montreal).
largest_city('nova scotia', halifax).
largest_city('new brunswick', moncton).
largest_city(manitoba, winnipeg).
largest_city('british columbia', vancouver).
largest_city('prince edward island', charlottetown).
largest_city(saskatchewan, saskatoon).
largest_city(alberta, calgary).
largest_city('newfoundland and labrador', 'st. john\'s').

province_capitals :-
    province(X),
    capital(X, Y),
    format('The capital of ~w is ~w', [X, Y]).

capital_is_largest_city(X) :-
    province(X),
    capital(X, Y),
    largest_city(X, Y).


% ---------------------------

whatis(X) :-
    country(X),
    format('~w is a country', [X]).

whatis(X) :-
    province(X),
    format('~w is a province of canada', [X]).

whatis(X) :-
    capital(Y, X),
    format('~w is the capital of ~w', [X, Y]).

whatis(X) :-
    largest_city(Y, X),
    format('~w is the largest city in ~w', [X, Y]).

% ---------------------------