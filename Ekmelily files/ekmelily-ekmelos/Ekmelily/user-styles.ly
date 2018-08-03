%%
%% Examples of user-defined notation styles
%%
%% Some of them have been introduced as predefined notation styles in
%% Ekmelily version 1.2, but removed in version 1.7 since they are just
%% freely invented combinations of individual accidentals.
%%

%%----------------------------------------------------------------------

% Persian notation (24-EDO)
% Persian musical symbols:
% - Koron for quarter-tone flat (actually -3/10 of a whole tone = 60 cents),
% - Sori for quarter-tone sharp (actually 2/10 of a whole tone = 40 cents),
% completed with the symbols of the Arrow notation.
% Ekmelily does not support the actual alterations.
% See http://lilypond.1069038.n5.nabble.com/Re-Persian-musical-koron-and-sori-td43022.html
% by Kees van den Doel.

\ekmelicStyle arrow

\ekmelicUserStyle pers #`(
  (,SEMI-SHARP #xE461)
  (,SEMI-FLAT #xE460))

%-----------------------------------------------------------------------

% Bussotti notation (24-EDO)
% Fractional sharp symbols with single slash after Sylvano Bussotti.

\ekmelicStyle arrow

\ekmelicUserStyle bus #`(
  (,FIVE-Q-FLAT #xE472 #xE260 #xE264)
  (,THREE-Q-FLAT #xE472 #xE264)
  (,SEMI-FLAT #xE472 #xE260)
  (,SEMI-SHARP #xE472)
  (,THREE-Q-SHARP #xE474))

%-----------------------------------------------------------------------

% Wiggle / Stein / Couper notation (24-EDO)
% Quarter-tone sharp symbol with wiggly tail,
% completed with the symbols of the Stein / Couper notation.

\ekmelicStyle stc

\ekmelicUserStyle wstc #`(
  (,SEMI-SHARP #xE475))

%-----------------------------------------------------------------------

% Stein / Penderecki notation (24-EDO)
% Filled quarter-tone flat symbol after Krzysztof Eugeniusz Penderecki,
% completed with the symbols of the Stein / Zimmermann notation.

\ekmelicStyle stz

\ekmelicUserStyle stp #`(
  (,SEMI-FLAT #xE478))

%-----------------------------------------------------------------------

% Stein / Grisey notation (24-EDO)
% Three-quarter-tones flat symbol with double stem after Gérard Grisey,
% completed with the symbols after Richard Stein.

\ekmelicStyle stz

\ekmelicUserStyle stg #`(
  (,THREE-Q-FLAT #xE486))

%-----------------------------------------------------------------------

% Xenakis notation (18-EDO)
% One-third-tone and two-third-tones sharp symbols after Iannis Xenakis,
% completed with the symbols of the Arrow notation for sixth- and twelfth-tones.

\ekmelicStyle fern

\ekmelicUserStyle xen #`(
  (,THIRD-FLAT #xE471 #xE264)
  (,TWO-THIRD-FLAT #xE470 #xE264)
  (,THIRD-SHARP #xE470)
  (,TWO-THIRD-SHARP #xE471))

%-----------------------------------------------------------------------

% Stockhausen notation (24-EDO)
% Fractional sharp symbols (with one and three slashes) and quarter-tone
% flat symbol (with slash) after Karlheinz Stockhausen.

\ekmelicStyle stz

\ekmelicUserStyle stockhausen #`(
  (,THREE-Q-SHARP #xED5A)
  (,THREE-Q-FLAT #xED59 #xE260)
  (,SEMI-FLAT #xED59)
  (,SEMI-SHARP #xED58))

%-----------------------------------------------------------------------

% Sims/Maneri notation with ligatures (72-EDO)
% Uses the optional glyphs U+F606-U+F615 as defined in the Ekmelos font.

\ekmelicStyle sims

\ekmelicUserStyle simslig #`(
  (,SEMI-FLAT-EQUIV #xF609)
  (,SEMI-SHARP-EQUIV #xF60B)
  (,THREE-Q-FLAT #xF607)
  (,THREE-Q-SHARP #xF60D)
  (,THIRD-FLAT #xF608)
  (,THIRD-SHARP #xF60A)
  (,TWO-THIRD-FLAT #xF606)
  (,TWO-THIRD-SHARP #xF60C)
  (,THREE-Q-FLAT-EQUIV #xF611)
  (,THREE-Q-SHARP-EQUIV #xF613)
  (,FIVE-Q-FLAT #xF60F)
  (,FIVE-Q-SHARP #xF615)
  (,FIVE-SIXTH-FLAT #xF610)
  (,SEVEN-SIXTH-FLAT #xF60E)
)


%%----------------------------------------------------------------------
%% Some notation styles using punctuation marks and latin letters
%% i.e. only ASCII (Basic Latin) characters.
%%----------------------------------------------------------------------

% Monzo HEWM notation (72-EDO)

\ekmelicStyle arrow

\ekmelicUserStyle monzo #`(
  (,DOUBLE-SHARP #\x)
  (,DOUBLE-FLAT "bb")
  (,SHARP #\#)
  (,FLAT #\b)
  (,SEMI-SHARP #\^)
  (,SEMI-FLAT #\v)
  (,SIXTH-SHARP #\>)
  (,SIXTH-FLAT #\<)
  (,TWELFTH-SHARP #\+)
  (,TWELFTH-FLAT #\-))

%-----------------------------------------------------------------------

% Sims / Maneri ASCII notation (72-EDO)

\ekmelicStyle arrow

\ekmelicUserStyle simsascii #`(
  (,DOUBLE-SHARP #\x)
  (,DOUBLE-FLAT "bb")
  (,SHARP #\#)
  (,FLAT #\b)
  (,SEMI-SHARP #\[)
  (,SEMI-FLAT #\])
  (,SIXTH-SHARP #\>)
  (,SIXTH-FLAT #\<)
  (,TWELFTH-SHARP #\^)
  (,TWELFTH-FLAT #\v))

%-----------------------------------------------------------------------

% Mixed Sagittal ASCII notation (72-EDO)

\ekmelicStyle arrow

\ekmelicUserStyle msagascii #`(
  (,DOUBLE-SHARP #\x)
  (,DOUBLE-FLAT "bb")
  (,SHARP #\#)
  (,FLAT #\b)
  (,SEMI-SHARP #\^)
  (,SEMI-FLAT #\v)
  (,SIXTH-SHARP #\f)
  (,SIXTH-FLAT #\t)
  (,TWELFTH-SHARP #\/)
  (,TWELFTH-FLAT #\\)
  (,NATURAL #\e))

%-----------------------------------------------------------------------

% Alternative ASCII notation (72-EDO)
% Just a variant of the Monzo HEWM notation without > < and x.

\ekmelicStyle arrow

\ekmelicUserStyle altascii #`(
  (,DOUBLE-SHARP "##")
  (,DOUBLE-FLAT "bb")
  (,SHARP #\#)
  (,FLAT #\b)
  (,SEMI-SHARP #\^)
  (,SEMI-FLAT #\v)
  (,SIXTH-SHARP "++")
  (,SIXTH-FLAT "--")
  (,TWELFTH-SHARP #\+)
  (,TWELFTH-FLAT #\-))

%-----------------------------------------------------------------------

% Alternative ASCII notation

\ekmelicStyle gost

\ekmelicUserStyle evans #`(
                            (,DOUBLE-SHARP #xE263)
                            (,THREE-Q-SHARP #xE283)
                            (,FIVE-E-SHARP #xE274)
                            (,SHARP #xE262)
                            (,THREE-E-SHARP #xE275)
                            (,THIRD-SHARP #xE48A)
                            (,SEMI-SHARP #xE282)
                            (,SIXTH-SHARP #xE48C)
                            (,E-SHARP #xE272)
                            (,NATURAL #xE261)
                            (,E-FLAT #xE273)
                            (,SIXTH-FLAT #xE48D)
                            (,SEMI-FLAT #xE480 )
                            (,THIRD-FLAT #xE48B)
                            (,THREE-E-FLAT #xE270)
                            (,FLAT #xE260)
                            (,FIVE-E-FLAT #xE271)
                            (,THREE-Q-FLAT #xE296)
                            (,DOUBLE-FLAT #xE264)
                            )

