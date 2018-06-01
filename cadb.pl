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

province_capitals :-
    province(X),
    capital(X, Y),
    format('The capital of ~w is ~w', [X, Y]).

