Ekmelily
========

Version: 1.12 (requires LilyPond version 2.19.22 or higher)


This is an extension for LilyPond (<http://lilypond.org/>) that supports
the notation of microtonal music in the 72-tone equal-temperament system
(72-EDO, Ekmelic System), as well as in the included sixth-, quarter-,
and third-tone systems (36-,24-,18-EDO).

It defines note names for all twelfth-tone degrees and supports variable
notations in terms of predefined and user-defined "Notation Styles".
Each style uses a specific set of accidental symbols for the alterations
up to the five-quarter-tone.

More information about the Ekmelily project and Ekmelic Music can be found at
[www.ekmelic-music.org](http://www.ekmelic-music.org/).


Contents
--------

ekmel.ily -- Main include file

ekmel-de.ily -- Language file for German note names

ekmel-en.ily -- Language file for English note names

user-styles.ly -- Examples of user-defined notation styles

CHANGELOG.txt -- Changes in the Ekmelily project

LICENSE.txt -- GNU General Public License Version 3

README.md -- This file


Installation
------------

*   Copy the file "ekmel.ily" into an appropriate folder, e.g.
    "LILYPOND/usr/share/lilypond/current/ly", with LILYPOND meaning the
    installation folder of LilyPond.

*   Copy one or both of the language files into the same folder as above:
    "ekmel-en.ily" for English note names,
    "ekmel-de.ily" for German note names;
    see "Note names" below.

*   Install the Ekmelos font if it shall be used for the accidental
    symbols in Ekmelily; see "Fonts" below.


Usage
-----

Add the following line near the top of your LilyPond input file:

    \include "ekmel.ily"

and then optionally one of the \ekmelic*Style commands (or even both)
for a predefined or user-defined notation style.


### Predefined Notation Style ###

    \ekmelicStyle STYLENAME

This sets the predefined notation style STYLENAME. The default setting
is `arrow` or the style specified with the command line option

    -dekmelic-style=STYLENAME

Note: LilyPond produces a warning "no such internal option", which can
be ignored. Warnings can be suppressed with the command line option
`--loglevel=ERROR` or `--loglevel=NONE`.

The following styles are predefined:

    arrow   Arrow notation
    rhm     Richter Herf / Maedel notation
    sims    Sims notation
    sag     Sagittal notation
    msag    Mixed Sagittal notation
    wys     Wyschnegradsky notation
    go      Gould notation for quarter-tones (24-EDO)
    gos     Gould notation for sixth-tones (36-EDO)
    gost    Gould + Stein / Zimmermann notation (36 + 24-EDO)
    stz     Stein / Zimmermann notation (24-EDO)
    stc     Stein / Couper notation (24-EDO)
    stvt    Stein / Van Blankenburg / Tartini notation (24-EDO)
    bos     Bosanquet commatic notation
    four    Digit 4 notation (24-EDO)
    fern    Ferneyhough notation (18-EDO)


### User-defined Notation Style ###

    \ekmelicUserStyle MYNAME #'((ALTERATION CHARACTER ...) ...)

This creates a user-defined notation style derived from the current style,
with the name MYNAME. For each specified ALTERATION, a new accidental
symbol consisting of one or more CHARACTERs is defined. For all other
alterations where the previous accidental symbol of ALTERATION is found
in combination with further symbols, this is also replaced by the new
accidental symbol.

ALTERATION must be a rational number or one of the predefined Scheme symbols.
CHARACTER must be either a Unicode code point as an integer number,
a character literal, or a string. Note: The code points supported by the
Ekmelos font are listed in "Ekmelos.pdf".
If MYNAME is an empty string (""), the name of the current style extended
with the suffix `-user` is taken.


Example
-------

The following example sets the predefined Stein / Couper notation (`stc`),
and then modifies this into a user-defined notation with new accidental symbols
for the quarter-tone degrees: sharp symbol with wiggly tail (code point U+E475)
and filled reversed flat symbol (code point U+E480).

    \ekmelicStyle stc
    \ekmelicUserStyle MyName #'(
      (1/4 #xE475)
      (-1/4 #xE480))

or by making use of the corresponding Scheme symbols:

    \ekmelicStyle stc
    \ekmelicUserStyle MyName #`(
      (,SEMI-SHARP #xE475)
      (,SEMI-FLAT #xE480))


Additional Commands
-------------------

    \ekmelicOutputSuffix

Set the name of the current notation style as the output filename suffix
for the current \book section.

    \ekmelic-style-name

Draw the name of the current notation style as markup.

    \ekmelic-char #ALTERATION

Draw an accidental symbol according to the current notation style as markup.
ALTERATION must be a rational number or one of the predefined Scheme symbols.

    \ekmelic-fraction #ALTERATION

Draw ALTERATION as a fraction (arranged vertically, not just a string n/d),
or as an integer if its denominator is 1, with a separate minus sign for
a negative value.
ALTERATION must be a rational number or one of the predefined Scheme symbols.


Note names
----------

Ekmelily defines note names (pitch names) for all twelfth-tone degrees
based on the German and English names for semi- and quarter-tones that
are already given in LilyPond.
The used language version depends on which language file exists or, if
both exist, which language is selected in LilyPond: With `\language english`
the English, else the German note names are used.

### English Note names ###

Language file "ekmel-en.ily": Each name consists of one of the letters
c d e f g a b  with a suffix for the alteration; e.g.
c cts cxs cqs csaqf crs cfts cs csts ctrs ctqs cssaqf cfxs cets css ...

### German Note names ###

Language file "ekmel-de.ily": Each name consists of one of the letters
c d e f g a h  with a suffix for the alteration; e.g. c cir cil cih ciseh
cisel ciser cis cisir cisil cisih cisiseh cisisel cisiser cisis ...
Note: These note names correspond with those of previous versions of
Ekmelily (1.8 or older) without language files.

Note: The German h means the English b, and the German b (or hes) means bflat (bf).

### Enharmonically equivalent Note names ###

The one-quarter-tone and three-quarter-tones degrees have two distinct,
enharmonically equivalent accidentals in some notation styles like
`arrow`, `rhm`, and `sims`. Therefore, Ekmelily defines two note names
each, e.g. `cqs` and `csaqf` (English) or `cih` and `ciseh` (German).
However, LilyPond does not support different accidentals for the same
alteration. As a provisional solution, the combined note names (e.g.
`csaqf` or `ciseh`) have slightly differing alterations and are therefore
not suitable for transposition and MIDI output.


Fonts
-----

By default, Ekmelily uses the Ekmelos font for the accidental symbols.
Another font can be selected, either in the LilyPond input file *BEFORE*
including "ekmel.ily" with the variable

    ekmelicFont = FONTNAME

or with the command line option

    -dekmelic-font=FONTNAME

Note: LilyPond produces a warning "no such internal option", which can be ignored.

When using a predefined notation style, the font should be compliant
with SMuFL; e.g. Bravura.


Acknowledgments
---------------

The code is inspired by Graham Breed's "microlily" (<https://bitbucket.org/x31eq/microlily>),
and by Torsten Anders' "HE-Lily" (<http://www.torsten-anders.de>).


Contact
-------

Author: Thomas Richter (<thomas-richter@aon.at>)
