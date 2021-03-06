country(canada).

located(canada, 'north america').

province('ontario').
province('quebec').
province('nova scotia').
province('new brunswick').
province('manitoba').
province('british columbia').
province('prince edward island').
province('saskatchewan').
province('alberta').
province('newfoundland and labrador').

capital('canada', 'ottawa').
capital('ontario', 'toronto').
capital('quebec', 'quebec city').
capital('nova scotia', 'halifax').
capital('new brunswick', 'fredericton').
capital('manitoba', 'winnipeg').
capital('british columbia', 'victoria').
capital('prince edward island', 'charlottetown').
capital('saskatchewan', 'regina').
capital('alberta', 'edmonton').
capital('newfoundland and labrador', 'st. john\'s').

% attributes are (city, height, max temperature, min temperature)
data('ottawa', 114, 11.3, 1.4).
data('toronto', 173, 13.0, 3.3).
data('quebec city', 74, 9.2, -0.8).
data('halifax', 153, 11.3, 1.9).
data('fredericton', 21, 11.4, -0.2).
data('winnipeg', 239, 8.7, -2.7).
data('victoria', 20, 14.4, 5.6).
data('charlottetown', 49, 9.9, 1.3).
data('regina', 578, 9.3, -3.2).
data('edmonton', 671, 9.5, -2.3).
data('st. john\'s', 141, 9.0, 1.0).
data('montreal', 36, 15.5, 2.0).
data('moncton', 71, 10.7, 0.1).
data('saskatoon', 504, 8.6, -3.5).
data('calgary', 1084, 10.8, -1.9).
data('vancouver', 4, 13.9, 6.8).

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

ocean(pacific).
ocean(atlantic).
ocean(none).

beach('ontario','atlantic').
beach('quebec','atlantic').
beach('nova scotia','atlantic').
beach('prince edward island','atlantic').
beach('manitoba','atlantic').
beach('new brunswick','atlantic').
beach('newfoundland and labrador','atlantic').
beach('british columbia','pacific').
beach('alberta','none').
beach('saskatchewan','none').

write_list([]).

write_list([Head|Tail]) :-
  write(Head),
  write(' '), nl,
  write_list(Tail).

province_capitals:-
    province(X),
    capital(X, Y),
    format('The capital of ~w is ~w', [X, Y]).

capital_is_largest_city(X) :-
    province(X),
    capital(X, Y),
    largest_city(X, Y).

ocean_exit :-
    ocean(X),
    beach(Y, X),
    format('The province of ~w has access to the ~w ocean', [Y, X]).

max_height :-
    findall(X, data(_, X, _, _), L),
    max_list(L, V),
    format('The maximum height is ~D', [V]).

capital_max_height :-
    findall(X, (data(Y, X, _, _), capital(_,Y)), L),
    max_list(L, V),
    data(C, V, _,_),
    format('The highest capital in Canada is ~w', [C]).

height(X) :-
	data(X,Y,_,_),
	format('The height of ~w is ~d m', [X,Y]).


weather_7 :-
	data(X,_,Y,Z),
	K is ((Y + Z)/2),
    K > 7,
	format('~w has the average temperature higher than 7 C and is ~2f C', [X,K]).


average_weather([],[],X,Y) :-
    Avg is (X/Y),
    format('The average temperature of Canada is ~2f °C', [Avg]).

average_weather([Head1|Tail1], [Head2|Tail2], X, Y) :-
    Avg is ((Head1 + Head2)/2),
    K is (X + Avg),
    L is (Y + 1),
    average_weather(Tail1,Tail2,K,L).

average_weather :-
    findall(X, data(_,_,X,_), ListMaior),
    findall(Y, data(_,_,_,Y), ListMenor),
    average_weather(ListMaior, ListMenor, 0, 0).

province_highest_capital_ocean :-
    findall(X, (data(Y, X, _, _), capital(_, Y)), L),
    max_list(L, V),
    data(C, V, _, _),
    capital(P, C),
    beach(P, O),
    write_province_highest_capital_ocean(P,C,O).

write_province_highest_capital_ocean(P,C,O) :-
    O \= none,
    format('The ocean that bathes the province of ~w whose capital ~w is the highest in Canada is ~w', [P, C, O]),nl.

write_province_highest_capital_ocean(P,C,'none') :-
    format('The province of ~w whose capital ~w is the highest in Canada is not bathed by any ocean', [P, C]),nl.


highest_temp_coast_province :-
	findall(X, (data(Y, _, X, _), largest_city(A, Y), (beach(A, 'atlantic') ; beach(A, 'pacific'))), L),
	max_list(L, V),
	data(C, _, V, _),
	largest_city(P, C),
	beach(P, O),
	format('The coastal province whose largest city has the highest maximum temperature, is ~w and it is bathed by the ~w ocean.', [P, O]).


lowNonCap :-
	findall(Y, (data(Y, X, _, _), X<50), L),
	findall(X,(capital(_,X)), L2 ),
	subtract(L,L2,O),
	format('The not capitals lower than 50m are '),
	write_list(O).
