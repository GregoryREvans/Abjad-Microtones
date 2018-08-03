%% This file is part of Ekmelily - Notation of 72-EDO microtonal music with LilyPond.
%% Copyright (C) 2013-2018  Thomas Richter
%%
%% This program is free software: you can redistribute it and/or modify
%% it under the terms of the GNU General Public License as published by
%% the Free Software Foundation, either version 3 of the License, or
%% (at your option) any later version.
%%
%% This program is distributed in the hope that it will be useful,
%% but WITHOUT ANY WARRANTY; without even the implied warranty of
%% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%% GNU General Public License at <http://www.gnu.org/licenses/>
%% for more details.
%%
%%
%% File: ekmel.ily  -  Main include file
%% Version: 1.12
%% Author: Thomas Richter <thomas-richter AT aon.at>
%%

\version "2.19.22"


% Alterations of 1/12 tone degrees (semitone and quarter-tone already defined)
#(define EQUIV-DIST 1/256)
#(define-public FIVE-Q-FLAT -5/4)
#(define-public SEVEN-SIXTH-FLAT -7/6)
#(define-public THIRTEEN-TWELFTH-FLAT -13/12)
#(define-public ELEVEN-TWELFTH-FLAT -11/12)
#(define-public FIVE-SIXTH-FLAT -5/6)
#(define-public THREE-Q-FLAT-EQUIV (+ THREE-Q-FLAT EQUIV-DIST))
#(define-public TWO-THIRD-FLAT -2/3)
#(define-public SEVEN-TWELFTH-FLAT -7/12)
#(define-public FIVE-TWELFTH-FLAT -5/12)
#(define-public THIRD-FLAT -1/3)
#(define-public SEMI-FLAT-EQUIV (+ SEMI-FLAT EQUIV-DIST))
#(define-public SIXTH-FLAT -1/6)
#(define-public TWELFTH-FLAT -1/12)
#(define-public TWELFTH-SHARP 1/12)
#(define-public SIXTH-SHARP 1/6)
#(define-public SEMI-SHARP-EQUIV (+ SEMI-SHARP EQUIV-DIST))
#(define-public THIRD-SHARP 1/3)
#(define-public FIVE-TWELFTH-SHARP 5/12)
#(define-public SEVEN-TWELFTH-SHARP 7/12)
#(define-public TWO-THIRD-SHARP 2/3)
#(define-public THREE-Q-SHARP-EQUIV (+ THREE-Q-SHARP EQUIV-DIST))
#(define-public FIVE-SIXTH-SHARP 5/6)
#(define-public ELEVEN-TWELFTH-SHARP 11/12)
#(define-public THIRTEEN-TWELFTH-SHARP 13/12)
#(define-public SEVEN-SIXTH-SHARP 7/6)
#(define-public FIVE-Q-SHARP 5/4)

#(define-public FIVE-E-SHARP 5/8)
#(define-public THREE-E-SHARP 3/8)
#(define-public E-SHARP 1/8)
#(define-public E-FLAT -1/8)
#(define-public THREE-E-FLAT -3/8)
#(define-public FIVE-E-FLAT -5/8)

% Language specific pitch names
% Searches the pitch names alist for `cff` to detect if "english" has
% been selected.
$(let* ((l (map (lambda (n) (cons n (format #f "ekmel-~a.ily" n))) '(de en)))
        (f (filter (lambda (e) (ly:find-file (cdr e))) l)))
   (if (null? f)
     (ly:error (_ "Could not find a file with Ekmelily pitch names."))
     (ly:parser-include-string
       (format #f "\\include \"~a\""
         (cond
           ((= 1 (length f)) (cdar f))
           ((and  (assq 'cff pitchnames) (assq 'en f)) (assq-ref f 'en))
           (else (cdar f)))))))

% Accidentals (Unicode code points) mapped onto alterations
% for different notation styles
% Format:
%   (style-symbol style-flags . (alteration codepoint ...) ...)
%
% style-flags: Bitflag for each distinct accidental.
#(define ekmelic-alterations `(
(arrow #x01010F . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE27B)
  (,SEMI-SHARP #xE27A)
  (,SEMI-FLAT-EQUIV #xE27A #xE260)
  (,SEMI-SHARP-EQUIV #xE27B #xE262)
  (,THREE-Q-FLAT #xE27B #xE260)
  (,THREE-Q-SHARP #xE27A #xE262)
  (,SIXTH-FLAT #xE2A1)
  (,SIXTH-SHARP #xE2A4)
  (,THIRD-FLAT #xE2A4 #xE260)
  (,THIRD-SHARP #xE2A1 #xE262)
  (,TWO-THIRD-FLAT #xE2A1 #xE260)
  (,TWO-THIRD-SHARP #xE2A4 #xE262)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE27A #xE264)
  (,THREE-Q-SHARP-EQUIV #xE27B #xE263)
  (,FIVE-Q-FLAT #xE27B #xE264)
  (,FIVE-Q-SHARP #xE27A #xE263)
  (,FIVE-SIXTH-FLAT #xE2A4 #xE264)
  (,FIVE-SIXTH-SHARP #xE2A1 #xE263)
  (,SEVEN-SIXTH-FLAT #xE2A1 #xE264)
  (,SEVEN-SIXTH-SHARP #xE2A4 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(rhm #x01010F . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xF602)
  (,SEMI-SHARP #xF605)
  (,SEMI-FLAT-EQUIV #xF605 #xE260)
  (,SEMI-SHARP-EQUIV #xF602 #xE262)
  (,THREE-Q-FLAT #xF602 #xE260)
  (,THREE-Q-SHARP #xF605 #xE262)
  (,SIXTH-FLAT #xF601)
  (,SIXTH-SHARP #xF604)
  (,THIRD-FLAT #xF604 #xE260)
  (,THIRD-SHARP #xF601 #xE262)
  (,TWO-THIRD-FLAT #xF601 #xE260)
  (,TWO-THIRD-SHARP #xF604 #xE262)
  (,TWELFTH-FLAT #xF600)
  (,TWELFTH-SHARP #xF603)
  (,FIVE-TWELFTH-FLAT #xF603 #xE260)
  (,FIVE-TWELFTH-SHARP #xF600 #xE262)
  (,SEVEN-TWELFTH-FLAT #xF600 #xE260)
  (,SEVEN-TWELFTH-SHARP #xF603 #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xF605 #xE264)
  (,THREE-Q-SHARP-EQUIV #xF602 #xE263)
  (,FIVE-Q-FLAT #xF602 #xE264)
  (,FIVE-Q-SHARP #xF605 #xE263)
  (,FIVE-SIXTH-FLAT #xF604 #xE264)
  (,FIVE-SIXTH-SHARP #xF601 #xE263)
  (,SEVEN-SIXTH-FLAT #xF601 #xE264)
  (,SEVEN-SIXTH-SHARP #xF604 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xF603 #xE264)
  (,ELEVEN-TWELFTH-SHARP #xF600 #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xF600 #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xF603 #xE263)))
(sims #x01010F . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE2A2)
  (,SEMI-SHARP #xE2A5)
  (,SEMI-FLAT-EQUIV #xE2A5 #xE260)
  (,SEMI-SHARP-EQUIV #xE2A2 #xE262)
  (,THREE-Q-FLAT #xE2A2 #xE260)
  (,THREE-Q-SHARP #xE2A5 #xE262)
  (,SIXTH-FLAT #xE2A1)
  (,SIXTH-SHARP #xE2A4)
  (,THIRD-FLAT #xE2A4 #xE260)
  (,THIRD-SHARP #xE2A1 #xE262)
  (,TWO-THIRD-FLAT #xE2A1 #xE260)
  (,TWO-THIRD-SHARP #xE2A4 #xE262)
  (,TWELFTH-FLAT #xE2A0)
  (,TWELFTH-SHARP #xE2A3)
  (,FIVE-TWELFTH-FLAT #xE2A3 #xE260)
  (,FIVE-TWELFTH-SHARP #xE2A0 #xE262)
  (,SEVEN-TWELFTH-FLAT #xE2A0 #xE260)
  (,SEVEN-TWELFTH-SHARP #xE2A3 #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE2A5 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE2A2 #xE263)
  (,FIVE-Q-FLAT #xE2A2 #xE264)
  (,FIVE-Q-SHARP #xE2A5 #xE263)
  (,FIVE-SIXTH-FLAT #xE2A4 #xE264)
  (,FIVE-SIXTH-SHARP #xE2A1 #xE263)
  (,SEVEN-SIXTH-FLAT #xE2A1 #xE264)
  (,SEVEN-SIXTH-SHARP #xE2A4 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE2A3 #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE2A0 #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE2A0 #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE2A3 #xE263)))
(sag #x01CFCF . (
  (,NATURAL #xE261)
  (,FLAT #xE319)
  (,SHARP #xE318)
  (,SEMI-FLAT #xE30B)
  (,SEMI-SHARP #xE30A)
  (,SEMI-FLAT-EQUIV #xE30B)
  (,SEMI-SHARP-EQUIV #xE30A)
  (,THREE-Q-FLAT #xE327)
  (,THREE-Q-SHARP #xE326)
  (,SIXTH-FLAT #xE305)
  (,SIXTH-SHARP #xE304)
  (,THIRD-FLAT #xE313)
  (,THIRD-SHARP #xE312)
  (,TWO-THIRD-FLAT #xE321)
  (,TWO-THIRD-SHARP #xE320)
  (,TWELFTH-FLAT #xE303)
  (,TWELFTH-SHARP #xE302)
  (,FIVE-TWELFTH-FLAT #xE315)
  (,FIVE-TWELFTH-SHARP #xE314)
  (,SEVEN-TWELFTH-FLAT #xE31F)
  (,SEVEN-TWELFTH-SHARP #xE31E)
  (,DOUBLE-FLAT #xE335)
  (,DOUBLE-SHARP #xE334)
  (,THREE-Q-FLAT-EQUIV #xE327)
  (,THREE-Q-SHARP-EQUIV #xE326)
  (,FIVE-Q-FLAT #xE30B #xE335)
  (,FIVE-Q-SHARP #xE30A #xE334)
  (,FIVE-SIXTH-FLAT #xE32F)
  (,FIVE-SIXTH-SHARP #xE32E)
  (,SEVEN-SIXTH-FLAT #xE305 #xE335)
  (,SEVEN-SIXTH-SHARP #xE304 #xE334)
  (,ELEVEN-TWELFTH-FLAT #xE331)
  (,ELEVEN-TWELFTH-SHARP #xE330)
  (,THIRTEEN-TWELFTH-FLAT #xE303 #xE335)
  (,THIRTEEN-TWELFTH-SHARP #xE302 #xE334)))
(msag #x01010F . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE30B)
  (,SEMI-SHARP #xE30A)
  (,SEMI-FLAT-EQUIV #xE30A #xE260)
  (,SEMI-SHARP-EQUIV #xE30B #xE262)
  (,THREE-Q-FLAT #xE30B #xE260)
  (,THREE-Q-SHARP #xE30A #xE262)
  (,SIXTH-FLAT #xE305)
  (,SIXTH-SHARP #xE304)
  (,THIRD-FLAT #xE304 #xE260)
  (,THIRD-SHARP #xE305 #xE262)
  (,TWO-THIRD-FLAT #xE305 #xE260)
  (,TWO-THIRD-SHARP #xE304 #xE262)
  (,TWELFTH-FLAT #xE303)
  (,TWELFTH-SHARP #xE302)
  (,FIVE-TWELFTH-FLAT #xE302 #xE260)
  (,FIVE-TWELFTH-SHARP #xE303 #xE262)
  (,SEVEN-TWELFTH-FLAT #xE303 #xE260)
  (,SEVEN-TWELFTH-SHARP #xE302 #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE47D)
  (,THREE-Q-FLAT-EQUIV #xE30A #xE264)
  (,THREE-Q-SHARP-EQUIV #xE30B #xE47D)
  (,FIVE-Q-FLAT #xE30B #xE264)
  (,FIVE-Q-SHARP #xE30A #xE47D)
  (,FIVE-SIXTH-FLAT #xE304 #xE264)
  (,FIVE-SIXTH-SHARP #xE305 #xE47D)
  (,SEVEN-SIXTH-FLAT #xE305 #xE264)
  (,SEVEN-SIXTH-SHARP #xE304 #xE47D)
  (,ELEVEN-TWELFTH-FLAT #xE302 #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE303 #xE47D)
  (,THIRTEEN-TWELFTH-FLAT #xE303 #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE302 #xE47D)))
(wys #x01CFCF . (
  (,NATURAL #xE261)
  (,FLAT #xE430)
  (,SHARP #xE425)
  (,SEMI-FLAT #xE42D)
  (,SEMI-SHARP #xE422)
  (,SEMI-FLAT-EQUIV #xE42D)
  (,SEMI-SHARP-EQUIV #xE422)
  (,THREE-Q-FLAT #xE433)
  (,THREE-Q-SHARP #xE428)
  (,SIXTH-FLAT #xE42C)
  (,SIXTH-SHARP #xE421)
  (,THIRD-FLAT #xE42E)
  (,THIRD-SHARP #xE423)
  (,TWO-THIRD-FLAT #xE432)
  (,TWO-THIRD-SHARP #xE427)
  (,TWELFTH-FLAT #xE42B)
  (,TWELFTH-SHARP #xE420)
  (,FIVE-TWELFTH-FLAT #xE42F)
  (,FIVE-TWELFTH-SHARP #xE424)
  (,SEVEN-TWELFTH-FLAT #xE431)
  (,SEVEN-TWELFTH-SHARP #xE426)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE433)
  (,THREE-Q-SHARP-EQUIV #xE428)
  (,FIVE-Q-FLAT #xE42D #xE264)
  (,FIVE-Q-SHARP #xE422 #xE263)
  (,FIVE-SIXTH-FLAT #xE434)
  (,FIVE-SIXTH-SHARP #xE429)
  (,SEVEN-SIXTH-FLAT #xE42C #xE264)
  (,SEVEN-SIXTH-SHARP #xE421 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE435)
  (,ELEVEN-TWELFTH-SHARP #xE42A)
  (,THIRTEEN-TWELFTH-FLAT #xE42B #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE420 #xE263)))
(go #x091919 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE273)
  (,SEMI-SHARP #xE272)
  (,SEMI-FLAT-EQUIV #xE270)
  (,SEMI-SHARP-EQUIV #xE275)
  (,THREE-Q-FLAT #xE271)
  (,THREE-Q-SHARP #xE274)
  (,SIXTH-FLAT #xE47B #xE273)
  (,SIXTH-SHARP #xE47C #xE272)
  (,THIRD-FLAT #xE47C #xE270)
  (,THIRD-SHARP #xE47B #xE275)
  (,TWO-THIRD-FLAT #xE47B #xE271)
  (,TWO-THIRD-SHARP #xE47C #xE274)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE278)
  (,THREE-Q-SHARP-EQUIV #xE277)
  (,FIVE-Q-FLAT #xE279)
  (,FIVE-Q-SHARP #xE276)
  (,FIVE-SIXTH-FLAT #xE47C #xE278)
  (,FIVE-SIXTH-SHARP #xE47B #xE277)
  (,SEVEN-SIXTH-FLAT #xE47B #xE279)
  (,SEVEN-SIXTH-SHARP #xE47C #xE276)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(gos #x054545 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE27B)
  (,SEMI-SHARP #xE27A)
  (,SEMI-FLAT-EQUIV #xE27A #xE260)
  (,SEMI-SHARP-EQUIV #xE27B #xE262)
  (,THREE-Q-FLAT #xE27B #xE260)
  (,THREE-Q-SHARP #xE27A #xE262)
  (,SIXTH-FLAT #xE273)
  (,SIXTH-SHARP #xE272)
  (,THIRD-FLAT #xE270)
  (,THIRD-SHARP #xE275)
  (,TWO-THIRD-FLAT #xE271)
  (,TWO-THIRD-SHARP #xE274)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE27A #xE264)
  (,THREE-Q-SHARP-EQUIV #xE27B #xE263)
  (,FIVE-Q-FLAT #xE27B #xE264)
  (,FIVE-Q-SHARP #xE27A #xE263)
  (,FIVE-SIXTH-FLAT #xE278)
  (,FIVE-SIXTH-SHARP #xE277)
  (,SEVEN-SIXTH-FLAT #xE279)
  (,SEVEN-SIXTH-SHARP #xE276)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(gost #x054D4D . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE284)
  (,SEMI-SHARP #xE282)
  (,SEMI-FLAT-EQUIV #xE282 #xE260)
  (,SEMI-SHARP-EQUIV #xE284 #xE262)
  (,THREE-Q-FLAT #xE285)
  (,THREE-Q-SHARP #xE283)
  (,SIXTH-FLAT #xE273)
  (,SIXTH-SHARP #xE272)
  (,THIRD-FLAT #xE270)
  (,THIRD-SHARP #xE275)
  (,TWO-THIRD-FLAT #xE271)
  (,TWO-THIRD-SHARP #xE274)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE282 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE284 #xE263)
  (,FIVE-Q-FLAT #xE284 #xE264)
  (,FIVE-Q-SHARP #xE282 #xE263)
  (,FIVE-SIXTH-FLAT #xE278)
  (,FIVE-SIXTH-SHARP #xE277)
  (,SEVEN-SIXTH-FLAT #xE279)
  (,SEVEN-SIXTH-SHARP #xE276)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(stz #x010909 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE284)
  (,SEMI-SHARP #xE282)
  (,SEMI-FLAT-EQUIV #xE282 #xE260)
  (,SEMI-SHARP-EQUIV #xE284 #xE262)
  (,THREE-Q-FLAT #xE285)
  (,THREE-Q-SHARP #xE283)
  (,SIXTH-FLAT #xE47B #xE284)
  (,SIXTH-SHARP #xE47C #xE282)
  (,THIRD-FLAT #xE47C #xE284)
  (,THIRD-SHARP #xE47B #xE282)
  (,TWO-THIRD-FLAT #xE47B #xE285)
  (,TWO-THIRD-SHARP #xE47C #xE283)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE282 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE284 #xE263)
  (,FIVE-Q-FLAT #xE284 #xE264)
  (,FIVE-Q-SHARP #xE282 #xE263)
  (,FIVE-SIXTH-FLAT #xE47C #xE285)
  (,FIVE-SIXTH-SHARP #xE47B #xE283)
  (,SEVEN-SIXTH-FLAT #xE47B #xE284 #xE264)
  (,SEVEN-SIXTH-SHARP #xE47C #xE282 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(stc #x010909 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE284)
  (,SEMI-SHARP #xE282)
  (,SEMI-FLAT-EQUIV #xE282 #xE260)
  (,SEMI-SHARP-EQUIV #xE284 #xE262)
  (,THREE-Q-FLAT #xE489)
  (,THREE-Q-SHARP #xE283)
  (,SIXTH-FLAT #xE47B #xE284)
  (,SIXTH-SHARP #xE47C #xE282)
  (,THIRD-FLAT #xE47C #xE284)
  (,THIRD-SHARP #xE47B #xE282)
  (,TWO-THIRD-FLAT #xE47B #xE489)
  (,TWO-THIRD-SHARP #xE47C #xE283)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE282 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE284 #xE263)
  (,FIVE-Q-FLAT #xE284 #xE264)
  (,FIVE-Q-SHARP #xE282 #xE263)
  (,FIVE-SIXTH-FLAT #xE47C #xE489)
  (,FIVE-SIXTH-SHARP #xE47B #xE283)
  (,SEVEN-SIXTH-FLAT #xE47B #xE284 #xE264)
  (,SEVEN-SIXTH-SHARP #xE47C #xE282 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(stvt #x010909 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE488)
  (,SEMI-SHARP #xE282)
  (,SEMI-FLAT-EQUIV #xE282 #xE260)
  (,SEMI-SHARP-EQUIV #xE488 #xE262)
  (,THREE-Q-FLAT #xE487)
  (,THREE-Q-SHARP #xE283)
  (,SIXTH-FLAT #xE47B #xE488)
  (,SIXTH-SHARP #xE47C #xE282)
  (,THIRD-FLAT #xE47C #xE488)
  (,THIRD-SHARP #xE47B #xE282)
  (,TWO-THIRD-FLAT #xE47B #xE487)
  (,TWO-THIRD-SHARP #xE47C #xE283)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE282 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE488 #xE263)
  (,FIVE-Q-FLAT #xE488 #xE264)
  (,FIVE-Q-SHARP #xE282 #xE263)
  (,FIVE-SIXTH-FLAT #xE47C #xE487)
  (,FIVE-SIXTH-SHARP #xE47B #xE283)
  (,SEVEN-SIXTH-FLAT #xE47B #xE488 #xE264)
  (,SEVEN-SIXTH-SHARP #xE47C #xE282 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(bos #x010103 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE47A #xE47A #xE47A)
  (,SEMI-SHARP #xE479 #xE479 #xE479)
  (,SEMI-FLAT-EQUIV #xE479 #xE479 #xE479 #xE260)
  (,SEMI-SHARP-EQUIV #xE47A #xE47A #xE47A #xE262)
  (,THREE-Q-FLAT #xE47A #xE47A #xE47A #xE260)
  (,THREE-Q-SHARP #xE479 #xE479 #xE479 #xE262)
  (,SIXTH-FLAT #xE47A #xE47A)
  (,SIXTH-SHARP #xE479 #xE479)
  (,THIRD-FLAT #xE479 #xE479 #xE260)
  (,THIRD-SHARP #xE47A #xE47A #xE262)
  (,TWO-THIRD-FLAT #xE47A #xE47A #xE260)
  (,TWO-THIRD-SHARP #xE479 #xE479 #xE262)
  (,TWELFTH-FLAT #xE47A)
  (,TWELFTH-SHARP #xE479)
  (,FIVE-TWELFTH-FLAT #xE479 #xE260)
  (,FIVE-TWELFTH-SHARP #xE47A #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47A #xE260)
  (,SEVEN-TWELFTH-SHARP #xE479 #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE479 #xE479 #xE479 #xE264)
  (,THREE-Q-SHARP-EQUIV #xE47A #xE47A #xE47A #xE263)
  (,FIVE-Q-FLAT #xE47A #xE47A #xE47A #xE264)
  (,FIVE-Q-SHARP #xE479 #xE479 #xE479 #xE263)
  (,FIVE-SIXTH-FLAT #xE479 #xE479 #xE264)
  (,FIVE-SIXTH-SHARP #xE47A #xE47A #xE263)
  (,SEVEN-SIXTH-FLAT #xE47A #xE47A #xE264)
  (,SEVEN-SIXTH-SHARP #xE479 #xE479 #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE479 #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47A #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47A #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE479 #xE263)))
(four #x010109 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE47F)
  (,SEMI-SHARP #xE47E)
  (,SEMI-FLAT-EQUIV #xE47E #xE260)
  (,SEMI-SHARP-EQUIV #xE47F #xE262)
  (,THREE-Q-FLAT #xE47F #xE260)
  (,THREE-Q-SHARP #xE47E #xE262)
  (,SIXTH-FLAT #xE47B #xE47F)
  (,SIXTH-SHARP #xE47C #xE47E)
  (,THIRD-FLAT #xE47C #xE47F)
  (,THIRD-SHARP #xE47B #xE47E)
  (,TWO-THIRD-FLAT #xE47B #xE47F #xE260)
  (,TWO-THIRD-SHARP #xE47C #xE47E #xE262)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE47E #xE264)
  (,THREE-Q-SHARP-EQUIV #xE47F #xE263)
  (,FIVE-Q-FLAT #xE47F #xE264)
  (,FIVE-Q-SHARP #xE47E #xE263)
  (,FIVE-SIXTH-FLAT #xE47C #xE47F #xE260)
  (,FIVE-SIXTH-SHARP #xE47B #xE47E #xE262)
  (,SEVEN-SIXTH-FLAT #xE47B #xE47F #xE264)
  (,SEVEN-SIXTH-SHARP #xE47C #xE47E #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(fern #x010549 . (
  (,NATURAL #xE261)
  (,FLAT #xE260)
  (,SHARP #xE262)
  (,SEMI-FLAT #xE48F)
  (,SEMI-SHARP #xE48E)
  (,SEMI-FLAT-EQUIV #xE48E #xE260)
  (,SEMI-SHARP-EQUIV #xE48F #xE262)
  (,THREE-Q-FLAT #xE48F #xE260)
  (,THREE-Q-SHARP #xE48E #xE262)
  (,SIXTH-FLAT #xE47B #xE48F)
  (,SIXTH-SHARP #xE47C #xE48E)
  (,THIRD-FLAT #xE48B)
  (,THIRD-SHARP #xE48A)
  (,TWO-THIRD-FLAT #xE48D)
  (,TWO-THIRD-SHARP #xE48C)
  (,TWELFTH-FLAT #xE47C)
  (,TWELFTH-SHARP #xE47B)
  (,FIVE-TWELFTH-FLAT #xE47B #xE260)
  (,FIVE-TWELFTH-SHARP #xE47C #xE262)
  (,SEVEN-TWELFTH-FLAT #xE47C #xE260)
  (,SEVEN-TWELFTH-SHARP #xE47B #xE262)
  (,DOUBLE-FLAT #xE264)
  (,DOUBLE-SHARP #xE263)
  (,THREE-Q-FLAT-EQUIV #xE48E #xE264)
  (,THREE-Q-SHARP-EQUIV #xE48F #xE263)
  (,FIVE-Q-FLAT #xE48F #xE264)
  (,FIVE-Q-SHARP #xE48E #xE263)
  (,FIVE-SIXTH-FLAT #xE47C #xE48F #xE260)
  (,FIVE-SIXTH-SHARP #xE47B #xE48E #xE262)
  (,SEVEN-SIXTH-FLAT #xE47B #xE48F #xE264)
  (,SEVEN-SIXTH-SHARP #xE47C #xE48E #xE263)
  (,ELEVEN-TWELFTH-FLAT #xE47B #xE264)
  (,ELEVEN-TWELFTH-SHARP #xE47C #xE263)
  (,THIRTEEN-TWELFTH-FLAT #xE47C #xE264)
  (,THIRTEEN-TWELFTH-SHARP #xE47B #xE263)))
(evans #x010119 . (
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
                            ))

))

#(begin
  (define ekmelic-style #f)
  (define ekmelic-font "Ekmelos")
  (define ekmelic-size 5)
  (define ekmelic-natural (ly:wide-char->utf-8 #xE261))
  (define ekmelic-parleft (ly:wide-char->utf-8 #xE26A))
  (define ekmelic-parright (ly:wide-char->utf-8 #xE26B))
  (define ekmelic-minus (string-append "-" (ly:wide-char->utf-8 #x2009))))

#(define (char-list->string lst)
  (apply string-append
    (map (lambda (e)
      (cond
        ((integer? e) (ly:wide-char->utf-8 e))
        ((char? e) (ly:wide-char->utf-8 (char->integer e)))
        ((string? e) e)
        (else "")))
      lst)))

#(define (ekmelic-acc-string alt rst par)
  (let ((ac (assv-ref (cddr ekmelic-style) alt)))
    (if rst
      (if par (string-append ekmelic-parleft ac ekmelic-parright) ac)
      (string-append ekmelic-natural ac))))

#(define (ekmelic-acc grob)
  (if (if (null? (ly:grob-property grob 'forced)) (if (null? (ly:grob-object grob 'tie)) #t #f) #t)
    (ekmelic-acc-string
      (ly:grob-property grob 'alteration)
      (ly:grob-property grob 'restore-first)
      #f)
    (string)))

% Version for AccidentalCautionary
% need this because (ly:grob-property grob 'parenthesized) is always #t
#(define (ekmelic-acc-cautionary grob)
  (if (if (null? (ly:grob-property grob 'forced)) (if (null? (ly:grob-object grob 'tie)) #t #f) #t)
    (ekmelic-acc-string
      (ly:grob-property grob 'alteration)
      (ly:grob-property grob 'restore-first)
      #t)
    ""))

#(define (ekmelic-width grob)
  (ly:stencil-extent (ly:text-interface::print grob) X))

#(define (ekmelic-height grob)
  (ly:stencil-extent (ly:text-interface::print grob) Y))

ekmelic-height-unpp =
#(ly:make-unpure-pure-container ekmelic-height (lambda (grob start end) (ekmelic-height grob)))

% #(define (ekmelic-alt->string alt)
  % (number->string (if (>= (denominator alt) 256) (- alt EQUIV-DIST) alt)))

#(define (ekmelic-style-flags)
  (cadr ekmelic-style))


% Main settings

ekmelicStyle =
#(define-void-function (name)
  (string?)
  (let ((es (assq (string->symbol name) ekmelic-alterations)))
    (if (pair? es)
      (set! ekmelic-style
        (cons*
          (symbol->string (car es))
          (cadr es)
          (map (lambda (a) (cons (car a) (char-list->string (cdr a)))) (cddr es)))))))

ekmelicUserStyle =
#(define-void-function (name def)
  (string? list?)
  (let ((un (if (string-null? name) (string-append (car ekmelic-style) "-user") name)))
    (for-each (lambda (d)
      (if (list? d)
        (let ((ac (assv-ref (cddr ekmelic-style) (car d)))
              (nac (char-list->string (cdr d))))
          (if (and (string? ac) (not (string-null? nac)))
            (set! ekmelic-style
              (cons*
                un
                (cadr ekmelic-style)
                (map (lambda (a)
                  (cons (car a) (ly:string-substitute ac nac (cdr a))))
                  (cddr ekmelic-style))))))))
      def)))

ekmelicOutputSuffix =
#(define-void-function () ()
  (set! (paper-variable #f 'output-suffix) (car ekmelic-style)))


% Markup commands

#(define-markup-command (ekmelic-style-name layout props) ()
  (interpret-markup layout props
    (car ekmelic-style)))

#(define-markup-command (ekmelic-char layout props alt)
  (rational?)
  #:properties ((font-size 1))
  (interpret-markup layout props
    (markup
      #:override `(font-name . ,ekmelicFont)
      #:override `(font-size . ,(* font-size 1.5))
      #:vcenter (ekmelic-acc-string alt #t #f))))

#(define-markup-command (ekmelic-fraction layout props alt)
  (rational?)
  (let ((a (abs (if (>= (denominator alt) 256) (- alt EQUIV-DIST) alt)))
        (s (if (negative? alt) ekmelic-minus "")))
    (interpret-markup layout props
      (if (= 1 (denominator a))
        (markup #:concat (s (number->string (numerator a))))
        (markup #:concat (s #:fraction
          (number->string (numerator a))
          (number->string (denominator a))))))))


% Initializations
#(begin
  (set! pitchnames ekmelicPitchNames)
  (ly:parser-set-note-names ekmelicPitchNames)
  (set! ekmelic-style (symbol->string (or (ly:get-option 'ekmelic-style) 'arrow)))
  (let ((f (ly:get-option 'ekmelic-font)))
    (if f (set! ekmelic-font (symbol->string f))))
  (if (not (defined? 'ekmelicFont)) (define ekmelicFont ekmelic-font)))

\ekmelicStyle #ekmelic-style


\layout {
  \context {
    \Score

    \override Accidental.stencil = #ly:text-interface::print
    \override Accidental.text = #ekmelic-acc
    \override Accidental.font-name = #ekmelicFont
    \override Accidental.font-size = #ekmelic-size
    \override Accidental.X-extent = #ekmelic-width
    \override Accidental.Y-extent = \ekmelic-height-unpp
    \override Accidental.horizontal-skylines = #'()
    \override Accidental.vertical-skylines = #'()

    \override AccidentalCautionary.stencil = #ly:text-interface::print
    \override AccidentalCautionary.text = #ekmelic-acc-cautionary
    \override AccidentalCautionary.font-name = #ekmelicFont
    \override AccidentalCautionary.font-size = #ekmelic-size
    \override AccidentalCautionary.X-extent = #ekmelic-width
    \override AccidentalCautionary.Y-extent = \ekmelic-height-unpp

    \override TrillPitchAccidental.stencil = #ly:text-interface::print
    \override TrillPitchAccidental.text = #ekmelic-acc
    \override TrillPitchAccidental.font-name = #ekmelicFont
    \override TrillPitchAccidental.font-size = #ekmelic-size
    \override TrillPitchAccidental.X-extent = #ekmelic-width
    \override TrillPitchAccidental.Y-extent = \ekmelic-height-unpp

    \override AmbitusAccidental.stencil = #ly:text-interface::print
    \override AmbitusAccidental.text = #ekmelic-acc
    \override AmbitusAccidental.font-name = #ekmelicFont
    \override AmbitusAccidental.font-size = #ekmelic-size
    \override AmbitusAccidental.X-extent = #ekmelic-width
    \override AmbitusAccidental.Y-extent = \ekmelic-height-unpp
  }
}