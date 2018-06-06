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
data('vancouver', 4, 13.9, 6.8).
data('saskatoon', 504, 8.6, -3.5).
data('calgary', 1084, 10.8, -1.9).



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

ocean_exit(X) :-
  ocean(X),
  beach(Y, X),
  format('The province of ~w has access to the ~w ocean', [Y, X]).

province_capitals(X) :-
    province(X),
    capital(X, Y),
    format('The capital of ~w is ~w', [X, Y]).

capital_is_largest_city(X) :-
    province(X),
    capital(X, Y),
    largest_city(X, Y).

which_ocean(X) :-
    province(X),
    ocean(Y),
    format('~w has a beatiful view from ~w ocean',[X,Y]).

surrounded_by_ocean :-
    ocean(Y),
    format('Canada is surrounded by ~w ocean', Y).

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

% -------------------------------
height(X) :-
	data(X,Y,_,_),
	format('The height of ~w is ~d', [X,Y]).

weather(X) :-
	data(X,_,Y,Z),
	K is ((Y + Z)/2),
	format('The average temperature of ~w is ~f °C',[X,K]).
	
highest() :-
	data(MaxC, MaxH, _,_),
	\+ (data(C, H, _,_), C \= MaxC, MaxH < H),
	format('The highest city is ~w'[MaxC]).
	
highestCaptal() :-
	data(MaxC, MaxH, _,_),
	\+ (data(C, H, _,_), C \= MaxC , capital(_,C), MaxH < H),
	format('The highest city is ~w'[MaxC]).
	
compareTemp(X,Y) :-
	data(X,_,K,Z),
	K is ((K + Z)/2),
	data(X,_,W,Z),
	W is max(((W + Z)/2), K),
	data(C,W,_,_),
	format('~w is warmer'[C]).
	
greaterThanN(N) :-
	format('The cities with temperature higher than ~d are: \n'[N]),
	\+ (data(C,_, Min,Max), (Max+Min)/2 > N, write(C),nl).
	

allCap_BigC() :-
	format('the provinces that it\'s capital is the biggest city are \n'),
	\+ (capital(X,Y), province(X),largest_city(X,Y),write(X),nl ).
	
group_Ocean(O) :-
	format('The provinces with access to ~w ocean are:'),
	\+ (ocean_exit(X,O), write(X)).

% ---------------------------------
X:' is the captal of ':Y:'?' = capital(Y,X).
'What is ':X:'?'= whatis(X).
'What is the captal of ':X:'?' = province_capitals(X).
'Which is the highest city?' = highest().
'Which is the highest capital?' = highestCaptal().
'Which provinces have capitals that are also your biggest city?' = allCap_BigC().
'Which of the ':X:', ':Y:' is the warmer?'= compareTemp(X,Y).
'Which city has an annual average greater than ':N:' degrees?'= greaterThanN(N).
'What is the average temperature of ':X:'?'=weather(X).
'Which provinces has access to ':X:' ocean?'= group_Ocean(X).
