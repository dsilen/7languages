likes(wallace, cheese).
likes(grommit, cheese).
likes(grommit, kaese).
likes(wendolene, sheep).

friend(X, Y) :- likes(X, Z), likes(Y, Z).

%
% Day 1 excercises
%

% böcker med författare som tabell/ facts.
booknauthor('Red Rising','Pierce Brown').
booknauthor('Golden Son','Pierce Brown').
booknauthor('Morning Star','Pierce Brown').
booknauthor('Neuromancer','William Gibson').
booknauthor('The code book','Simon Singh').
booknauthor('Enders Game','Orson Scott Card').
booknauthor('Wild Swans','Jung Chang').
booknauthor('All quiet on the western front','Erich Maria Remarque').
booknauthor('Atlas shrugged','Ayn Rand').
booknauthor('Inside the third reich','Albert Speer').
booknauthor('Treblinka','Jean-Francois Steiner').

% Query A för alla böcker av nån författare
% booknauthor(X,'Pierce Brown').


% MusikerMedInstrument
musicianPlaysInstrument('Bach','Organ').
musicianPlaysInstrument('Bach','Conductor').
musicianPlaysInstrument('Chopin','Piano').
musicianPlaysInstrument('Beethoven','Conductor').
musicianPlaysInstrument('Hillary Hahn','Violin').
musicianPlaysInstrument('Daniel Hope','Violin').
musicianPlaysInstrument('Martin Fröst','Clarinet').
musicianPlaysInstrument('Anne Sophie Mutter','Violin').
musicianPlaysInstrument('Bill Leeb','Synthesizer').
musicianPlaysInstrument('Keith Emerson','Synthesizer').

% Musiker genre
musicianGenre('Bach','Classical').
musicianGenre('Chopin','Classical').
musicianGenre('Beethoven','Classical').
musicianGenre('Hillary Hahn','Classical').
musicianGenre('Daniel Hope','Classical').
musicianGenre('Martin Fröst','Classical').
musicianGenre('Anne Sophie Mutter','Classical').
musicianGenre('Bill Leeb','Classical').
musicianGenre('Keith Emerson','Classical').

% Query musiker som spelar synth
% musicianPlaysInstrument(X,'Synthesizer').
% alla instrument

