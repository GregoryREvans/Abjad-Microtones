The Ekmelos Font
================

Latest version: 1.14

Ekmelos is a Unicode typeface for the notation of microtonal music, in
particular in the 72-tone equal-temperament system (72-EDO, Ekmelic System),
as well as in the included sixth-, quarter-, and third-tone systems
(36-,24-,18-EDO).
It is designed above all for use together with [Ekmelily](http://www.ekmelic-music.org/en/extra/ekmelily.htm)
for which it is the default font, and it is generally intended for use
by scoring applications. It is in development.

The latest version 1.14 contains 318 characters. Most of them are
accidental symbols, primarily those representing semi-, third-, quarter-,
sixth-, and twelfth-tone degrees. The standard 12-EDO accidentals (sharp,
flat etc.) correspond to the Feta font in [LilyPond](http://lilypond.org/).
Many others are arrow- or barb-like signs, upward and downward, to be
placed either alone or in combination to the left of a standard 12-EDO
accidental.
Also included are Basic Latin (ASCII) punctuation marks and lowercase letters
for use as alternative accidentals.

The character encoding is compliant with SMuFL version 1.20
(The [Standard Music Font Layout](http://www.smufl.org/) is a specification
for music symbols, developed by the [W3C Music Notation Community Group](https://www.w3.org/community/music-notation/).
It uses the Unicode Private Use Area (PUA) in the Basic Multilingual Plane
(BMP) starting at code point U+E000.)
But it currently does not meet all the SMuFL guidelines for the font metrics.
Note: The Ekmelos/Ekmelily versions prior to 1.0 are not compliant with SMuFL.

The code points supported by Ekmelos are listed in the file "Ekmelos.pdf".

Ekmelos is created with [FontForge](http://fontforge.org/) 2.0.
It is released under the [SIL Open Font License](http://scripts.sil.org/OFL),
Version 1.1.

More information about Ekmelic Music can be found at
[www.ekmelic-music.org](http://www.ekmelic-music.org/).


Contents
--------

Ekmelos.otf -- Ekmelos font (OpenType font)

Ekmelos.pdf -- Tables of all characters in the Ekmelos font

Ekmelos.svg -- Ekmelos font (SVG font)

Ekmelos.woff -- Ekmelos font (Web Open Font Format)

EkmelosMac.otf -- Ekmelos font for MacOS (OpenType font)

metadata/classes.json -- Classes with glyphs in the Ekmelos font (JSON format)

metadata/ekmelily.json -- Glyphs grouped into Ekmelily notation styles (JSON format)

metadata/ekmelos-map.ily -- Scheme alist of glyphs in the Ekmelos font (LilyPond include file)

metadata/glyphdata.json -- Summarized metadata of glyphs in the Ekmelos font (JSON format)

metadata/glyphnames.json -- Glyph names in the Ekmelos font (JSON format)

metadata/metadata.json -- SMuFL-compliant font metadata (JSON format)

CHANGELOG.txt -- Changes in the Ekmelos font

LICENSE.txt -- SIL Open Font License

README.md -- This file


Installation
------------

On Windows, drag the file "Ekmelos.otf" into C:\Windows\Fonts.
On OS X, copy the file "EkmelosMac.otf" into /Library/Fonts.

For use with LilyPond (Ekmelily), the LilyPond font cache must be deleted,
i.e. the folder "~/.lilypond-fonts.cache-2" (on Windows
"%HOMEPATH%\bsol|.lilypond-fonts.cache-2") must be emptied or completely deleted.
So at the next execution of LilyPond this cache will be rebuilt from
scratch inlcuding the new font.
This applies also after each update with a new version of Ekmelos.


Metadata
--------

### metadata.json ###

Provides font-specific metadata of the Ekmelos font compliant with SMuFL.
It includes the keys "fontName", "fontVersion", "engravingDefaults",
"glyphBBoxes", "ligatures", and "optionalGlyphs" (but not
"glyphsWithAnchors", "glyphsWithAlternates", and "sets").


### classes.json ###

Corresponds to the SMuFL file of the same name but with the classes that
include glyphs of the Ekmelos font; in particular, classes with optional
glyph:

*   `accidentalsRHM`: Newly defined class with the accidentals of the
    Richter Herf / Maedel notation.

*   `accidentalsSims`: Extended with the ligatures of Sims accidentals
    for 1/4 and 1/6 tone degrees.


### glyphnames.json ###

Corresponds to the SMuFL file of the same name but with the glyph names
in the Ekmelos font. The value of "description" is either taken from SMuFL,
or for a ligature, a comma-separated concatenation of its components'
descriptions, or for a Basic Latin (ASCII) character, its Unicode
character name (in lowercase).


### glyphdata.json ###

Provides summarized metadata of the glyphs in the Ekmelos font.
This is an extended version of glyphnames.json with the following keys
for each glyph name:

*   "codepoint", "alternateCodepoint", "description" as in glyphnames.json.

*   "code": Codepoint as a numeric value.

*   "block": Name of the block range including the glyph; one of:

    E000    Recommended character   U+E000..U+F3FF
    F400    Optional glyph          U+F400..U+F8FF
    0000    Basic latin (ASCII)     U+0020..U+007F
    2600    Miscellaneous symbols   U+2600..U+26FF
    1D100   Musical symbols         U+1D100..U+1D1FF

*   "classes": List of classes including this glyph.

*   "ligature": List of glyph names of the components (only for ligatures).

*   "ekmelily": Structure with all predefined notation styles that use
    the glyph as an accidental (or empty for unused glyphs).
    ACC is the index of the accidental type (an integer in the range 0..34,
    used in the [Ekmelic Music Tables](http://www.ekmelic-music.org/software/tables.zip).)

    "ekmelily": {
      "STYLENAME": ACC,
      ...
    }


### ekmelily.json ###

Groups the glyphs in the Ekmelos font together into Ekmelily's predefined
notation styles:

    "STYLENAME": {
      "GLYPHNAME": "ALTERATION",
      ...
    }

STYLENAME is a predefined notation style, e.g. `rhm`.
ALTERATION is the tone fraction (inflection) in the range -5/4 .. +5/4
that the glyph (accidental) represents in the notation style STYLENAME.
The same GLYPHNAME can appear in multiple notation styles, in each
representing another alteration.


### ekmelos-map.ily ###

Provides a Scheme alist with code points mapped onto the glyph names in
the Ekmelos font:

    #(define ekmelos-map '(
      ("GLYPHNAME" . CODEPOINT)
      ...
    ))


Contact
-------

Author and font designer: Thomas Richter (<thomas-richter@aon.at>)
