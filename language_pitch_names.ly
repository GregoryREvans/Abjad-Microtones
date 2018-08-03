\version "2.19.24"

%%% DEFINITIONS %%%
%%% Greg defined the eighth tones %%%
#(define alterations '(
  (-1 . "ff")
  (-3/4 . "tqf")
  (-5/8 . "fef")
  (-1/2 . "f")
  (-3/8 . "tef")
  (-1/4 . "qf")
  (-1/8 . "ef")
  (0 . "")
  (1/8 . "es")
  (1/4 . "qs")
  (3/8 . "tes")
  (1/2 . "s")
  (5/8 . "fes")
  (3/4 . "tqs")
  (1 . "ss")))

#(define notenames '(
  (0 . "c")
  (1 . "d")
  (2 . "e")
  (3 . "f")
  (4 . "g")
  (5 . "a")
  (6 . "b") ))

#(define (print-language language)
  (display (format "~%    '~A': " (car language))))

#(define (print-pitch pitch-pair)
  (let*
    ; DECLARATIONS
    ((ly-pitch-name (car pitch-pair))
    (ly-pitch-obj (cdr pitch-pair))
    (ly-notename (ly:pitch-notename ly-pitch-obj))
    (ly-alteration (ly:pitch-alteration ly-pitch-obj))
    (abj-pitch-name (ly:assoc-get ly-notename notenames))
    (abj-accidental (ly:assoc-get ly-alteration alterations))
    (pitch-name (format "~A~A" abj-pitch-name abj-accidental)))
    ; BODY
    (display (format "        '~A': NamedPitchClass('~A'),\n"
      ly-pitch-name pitch-name))))

#(define handle-language (lambda (x) (begin
  (print-language x)
  (display " {\n")
  (map print-pitch (cdr x))
  (display "    },\n"))))

%%% MAIN %%%

#(begin
  (display "# -*- coding: utf-8 -*-\n\n")
  (display "from abjad.tools.pitchtools import NamedPitchClass\n\n\n")
  (display (format "lilypond_version = \"~A\"\n\n" (lilypond-version)))
  (display "language_pitch_names = {")
  (map handle-language language-pitch-names)
  (display "\n    }"))
