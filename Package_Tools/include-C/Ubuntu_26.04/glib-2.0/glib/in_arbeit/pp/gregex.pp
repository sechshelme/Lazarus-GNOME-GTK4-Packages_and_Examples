
unit gregex;
interface

{
  Automatically converted by H2Pas 1.0.0 from gregex.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gregex.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pgboolean  = ^gboolean;
Pgchar  = ^gchar;
PGError  = ^GError;
Pgint  = ^gint;
PGMatchInfo  = ^GMatchInfo;
PGRegex  = ^GRegex;
PGRegexCompileFlags  = ^GRegexCompileFlags;
PGRegexError  = ^GRegexError;
PGRegexMatchFlags  = ^GRegexMatchFlags;
PGString  = ^GString;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GRegex -- regular expression API wrapper around PCRE.
 *
 * Copyright (C) 1999, 2000 Scott Wimer
 * Copyright (C) 2004, Matthias Clasen <mclasen@redhat.com>
 * Copyright (C) 2005 - 2007, Marco Barisione <marco@barisione.org>
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_REGEX_H__}
{$define __G_REGEX_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gerror.h>}
{$include <glib/gstring.h>}
{*
 * GRegexError:
 * @G_REGEX_ERROR_COMPILE: Compilation of the regular expression failed.
 * @G_REGEX_ERROR_OPTIMIZE: Optimization of the regular expression failed.
 * @G_REGEX_ERROR_REPLACE: Replacement failed due to an ill-formed replacement
 *     string.
 * @G_REGEX_ERROR_MATCH: The match process failed.
 * @G_REGEX_ERROR_INTERNAL: Internal error of the regular expression engine.
 *     Since 2.16
 * @G_REGEX_ERROR_STRAY_BACKSLASH: "\\" at end of pattern. Since 2.16
 * @G_REGEX_ERROR_MISSING_CONTROL_CHAR: "\\c" at end of pattern. Since 2.16
 * @G_REGEX_ERROR_UNRECOGNIZED_ESCAPE: Unrecognized character follows "\\".
 *     Since 2.16
 * @G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER: Numbers out of order in ""
 *     quantifier. Since 2.16
 * @G_REGEX_ERROR_QUANTIFIER_TOO_BIG: Number too big in "" quantifier.
 *     Since 2.16
 * @G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS: Missing terminating "]" for
 *     character class. Since 2.16
 * @G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS: Invalid escape sequence
 *     in character class. Since 2.16
 * @G_REGEX_ERROR_RANGE_OUT_OF_ORDER: Range out of order in character class.
 *     Since 2.16
 * @G_REGEX_ERROR_NOTHING_TO_REPEAT: Nothing to repeat. Since 2.16
 * @G_REGEX_ERROR_UNRECOGNIZED_CHARACTER: Unrecognized character after "(?",
 *     "(?<" or "(?P". Since 2.16
 * @G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS: POSIX named classes are
 *     supported only within a class. Since 2.16
 * @G_REGEX_ERROR_UNMATCHED_PARENTHESIS: Missing terminating ")" or ")"
 *     without opening "(". Since 2.16
 * @G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE: Reference to non-existent
 *     subpattern. Since 2.16
 * @G_REGEX_ERROR_UNTERMINATED_COMMENT: Missing terminating ")" after comment.
 *     Since 2.16
 * @G_REGEX_ERROR_EXPRESSION_TOO_LARGE: Regular expression too large.
 *     Since 2.16
 * @G_REGEX_ERROR_MEMORY_ERROR: Failed to get memory. Since 2.16
 * @G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND: Lookbehind assertion is not
 *     fixed length. Since 2.16
 * @G_REGEX_ERROR_MALFORMED_CONDITION: Malformed number or name after "(?(".
 *     Since 2.16
 * @G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES: Conditional group contains
 *     more than two branches. Since 2.16
 * @G_REGEX_ERROR_ASSERTION_EXPECTED: Assertion expected after "(?(".
 *     Since 2.16
 * @G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME: Unknown POSIX class name.
 *     Since 2.16
 * @G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED: POSIX collating
 *     elements are not supported. Since 2.16
 * @G_REGEX_ERROR_HEX_CODE_TOO_LARGE: Character value in "\\x..." sequence
 *     is too large. Since 2.16
 * @G_REGEX_ERROR_INVALID_CONDITION: Invalid condition "(?(0)". Since 2.16
 * @G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND: \\C not allowed in
 *     lookbehind assertion. Since 2.16
 * @G_REGEX_ERROR_INFINITE_LOOP: Recursive call could loop indefinitely.
 *     Since 2.16
 * @G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR: Missing terminator
 *     in subpattern name. Since 2.16
 * @G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME: Two named subpatterns have
 *     the same name. Since 2.16
 * @G_REGEX_ERROR_MALFORMED_PROPERTY: Malformed "\\P" or "\\p" sequence.
 *     Since 2.16
 * @G_REGEX_ERROR_UNKNOWN_PROPERTY: Unknown property name after "\\P" or
 *     "\\p". Since 2.16
 * @G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG: Subpattern name is too long
 *     (maximum 32 characters). Since 2.16
 * @G_REGEX_ERROR_TOO_MANY_SUBPATTERNS: Too many named subpatterns (maximum
 *     10,000). Since 2.16
 * @G_REGEX_ERROR_INVALID_OCTAL_VALUE: Octal value is greater than "\\377".
 *     Since 2.16
 * @G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE: "DEFINE" group contains more
 *     than one branch. Since 2.16
 * @G_REGEX_ERROR_DEFINE_REPETION: Repeating a "DEFINE" group is not allowed.
 *     This error is never raised. Since: 2.16 Deprecated: 2.34
 * @G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS: Inconsistent newline options.
 *     Since 2.16
 * @G_REGEX_ERROR_MISSING_BACK_REFERENCE: "\\g" is not followed by a braced,
 *      angle-bracketed, or quoted name or number, or by a plain number. Since: 2.16
 * @G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE: relative reference must not be zero. Since: 2.34
 * @G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN: the backtracing
 *     control verb used does not allow an argument. Since: 2.34
 * @G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB: unknown backtracing 
 *     control verb. Since: 2.34
 * @G_REGEX_ERROR_NUMBER_TOO_BIG: number is too big in escape sequence. Since: 2.34
 * @G_REGEX_ERROR_MISSING_SUBPATTERN_NAME: Missing subpattern name. Since: 2.34
 * @G_REGEX_ERROR_MISSING_DIGIT: Missing digit. Since 2.34
 * @G_REGEX_ERROR_INVALID_DATA_CHARACTER: In JavaScript compatibility mode,
 *     "[" is an invalid data character. Since: 2.34
 * @G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME: different names for subpatterns of the 
 *     same number are not allowed. Since: 2.34
 * @G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED: the backtracing control
 *     verb requires an argument. Since: 2.34
 * @G_REGEX_ERROR_INVALID_CONTROL_CHAR: "\\c" must be followed by an ASCII 
 *     character. Since: 2.34
 * @G_REGEX_ERROR_MISSING_NAME: "\\k" is not followed by a braced, angle-bracketed, or 
 *     quoted name. Since: 2.34
 * @G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS: "\\N" is not supported in a class. Since: 2.34
 * @G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES: too many forward references. Since: 2.34
 * @G_REGEX_ERROR_NAME_TOO_LONG: the name is too long in "(*MARK)", "(*PRUNE)", 
 *     "(*SKIP)", or "(*THEN)". Since: 2.34
 * @G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE: the character value in the \\u sequence is
 *     too large. Since: 2.34
 *
 * Error codes returned by regular expressions functions.
 *
 * Since: 2.14
  }
{ These are the error codes from PCRE + 100  }
type
  PGRegexError = ^TGRegexError;
  TGRegexError =  Longint;
  Const
    G_REGEX_ERROR_COMPILE = 0;
    G_REGEX_ERROR_OPTIMIZE = 1;
    G_REGEX_ERROR_REPLACE = 2;
    G_REGEX_ERROR_MATCH = 3;
    G_REGEX_ERROR_INTERNAL = 4;
    G_REGEX_ERROR_STRAY_BACKSLASH = 101;
    G_REGEX_ERROR_MISSING_CONTROL_CHAR = 102;
    G_REGEX_ERROR_UNRECOGNIZED_ESCAPE = 103;
    G_REGEX_ERROR_QUANTIFIERS_OUT_OF_ORDER = 104;
    G_REGEX_ERROR_QUANTIFIER_TOO_BIG = 105;
    G_REGEX_ERROR_UNTERMINATED_CHARACTER_CLASS = 106;
    G_REGEX_ERROR_INVALID_ESCAPE_IN_CHARACTER_CLASS = 107;
    G_REGEX_ERROR_RANGE_OUT_OF_ORDER = 108;
    G_REGEX_ERROR_NOTHING_TO_REPEAT = 109;
    G_REGEX_ERROR_UNRECOGNIZED_CHARACTER = 112;
    G_REGEX_ERROR_POSIX_NAMED_CLASS_OUTSIDE_CLASS = 113;
    G_REGEX_ERROR_UNMATCHED_PARENTHESIS = 114;
    G_REGEX_ERROR_INEXISTENT_SUBPATTERN_REFERENCE = 115;
    G_REGEX_ERROR_UNTERMINATED_COMMENT = 118;
    G_REGEX_ERROR_EXPRESSION_TOO_LARGE = 120;
    G_REGEX_ERROR_MEMORY_ERROR = 121;
    G_REGEX_ERROR_VARIABLE_LENGTH_LOOKBEHIND = 125;
    G_REGEX_ERROR_MALFORMED_CONDITION = 126;
    G_REGEX_ERROR_TOO_MANY_CONDITIONAL_BRANCHES = 127;
    G_REGEX_ERROR_ASSERTION_EXPECTED = 128;
    G_REGEX_ERROR_UNKNOWN_POSIX_CLASS_NAME = 130;
    G_REGEX_ERROR_POSIX_COLLATING_ELEMENTS_NOT_SUPPORTED = 131;
    G_REGEX_ERROR_HEX_CODE_TOO_LARGE = 134;
    G_REGEX_ERROR_INVALID_CONDITION = 135;
    G_REGEX_ERROR_SINGLE_BYTE_MATCH_IN_LOOKBEHIND = 136;
    G_REGEX_ERROR_INFINITE_LOOP = 140;
    G_REGEX_ERROR_MISSING_SUBPATTERN_NAME_TERMINATOR = 142;
    G_REGEX_ERROR_DUPLICATE_SUBPATTERN_NAME = 143;
    G_REGEX_ERROR_MALFORMED_PROPERTY = 146;
    G_REGEX_ERROR_UNKNOWN_PROPERTY = 147;
    G_REGEX_ERROR_SUBPATTERN_NAME_TOO_LONG = 148;
    G_REGEX_ERROR_TOO_MANY_SUBPATTERNS = 149;
    G_REGEX_ERROR_INVALID_OCTAL_VALUE = 151;
    G_REGEX_ERROR_TOO_MANY_BRANCHES_IN_DEFINE = 154;
    G_REGEX_ERROR_DEFINE_REPETION = 155;
    G_REGEX_ERROR_INCONSISTENT_NEWLINE_OPTIONS = 156;
    G_REGEX_ERROR_MISSING_BACK_REFERENCE = 157;
    G_REGEX_ERROR_INVALID_RELATIVE_REFERENCE = 158;
    G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_FORBIDDEN = 159;
    G_REGEX_ERROR_UNKNOWN_BACKTRACKING_CONTROL_VERB = 160;
    G_REGEX_ERROR_NUMBER_TOO_BIG = 161;
    G_REGEX_ERROR_MISSING_SUBPATTERN_NAME = 162;
    G_REGEX_ERROR_MISSING_DIGIT = 163;
    G_REGEX_ERROR_INVALID_DATA_CHARACTER = 164;
    G_REGEX_ERROR_EXTRA_SUBPATTERN_NAME = 165;
    G_REGEX_ERROR_BACKTRACKING_CONTROL_VERB_ARGUMENT_REQUIRED = 166;
    G_REGEX_ERROR_INVALID_CONTROL_CHAR = 168;
    G_REGEX_ERROR_MISSING_NAME = 169;
    G_REGEX_ERROR_NOT_SUPPORTED_IN_CLASS = 171;
    G_REGEX_ERROR_TOO_MANY_FORWARD_REFERENCES = 172;
    G_REGEX_ERROR_NAME_TOO_LONG = 175;
    G_REGEX_ERROR_CHARACTER_VALUE_TOO_LARGE = 176;
;
{*
 * G_REGEX_ERROR:
 *
 * Error domain for regular expressions. Errors in this domain will be
 * from the #GRegexError enumeration. See #GError for information on
 * error domains.
 *
 * Since: 2.14
  }

{ was #define dname def_expr }
function G_REGEX_ERROR : longint; { return type might be wrong }

function g_regex_error_quark:TGQuark;cdecl;external;
{*
 * GRegexCompileFlags:
 * @G_REGEX_DEFAULT: No special options set. Since: 2.74
 * @G_REGEX_CASELESS: Letters in the pattern match both upper- and
 *     lowercase letters. This option can be changed within a pattern
 *     by a "(?i)" option setting.
 * @G_REGEX_MULTILINE: By default, GRegex treats the strings as consisting
 *     of a single line of characters (even if it actually contains
 *     newlines). The "start of line" metacharacter ("^") matches only
 *     at the start of the string, while the "end of line" metacharacter
 *     ("$") matches only at the end of the string, or before a terminating
 *     newline (unless %G_REGEX_DOLLAR_ENDONLY is set). When
 *     %G_REGEX_MULTILINE is set, the "start of line" and "end of line"
 *     constructs match immediately following or immediately before any
 *     newline in the string, respectively, as well as at the very start
 *     and end. This can be changed within a pattern by a "(?m)" option
 *     setting.
 * @G_REGEX_DOTALL: A dot metacharacter (".") in the pattern matches all
 *     characters, including newlines. Without it, newlines are excluded.
 *     This option can be changed within a pattern by a ("?s") option setting.
 * @G_REGEX_EXTENDED: Whitespace data characters in the pattern are
 *     totally ignored except when escaped or inside a character class.
 *     Whitespace does not include the VT character (code 11). In addition,
 *     characters between an unescaped "#" outside a character class and
 *     the next newline character, inclusive, are also ignored. This can
 *     be changed within a pattern by a "(?x)" option setting.
 * @G_REGEX_ANCHORED: The pattern is forced to be "anchored", that is,
 *     it is constrained to match only at the first matching point in the
 *     string that is being searched. This effect can also be achieved by
 *     appropriate constructs in the pattern itself such as the "^"
 *     metacharacter.
 * @G_REGEX_DOLLAR_ENDONLY: A dollar metacharacter ("$") in the pattern
 *     matches only at the end of the string. Without this option, a
 *     dollar also matches immediately before the final character if
 *     it is a newline (but not before any other newlines). This option
 *     is ignored if %G_REGEX_MULTILINE is set.
 * @G_REGEX_UNGREEDY: Inverts the "greediness" of the quantifiers so that
 *     they are not greedy by default, but become greedy if followed by "?".
 *     It can also be set by a "(?U)" option setting within the pattern.
 * @G_REGEX_RAW: Usually strings must be valid UTF-8 strings, using this
 *     flag they are considered as a raw sequence of bytes.
 * @G_REGEX_NO_AUTO_CAPTURE: Disables the use of numbered capturing
 *     parentheses in the pattern. Any opening parenthesis that is not
 *     followed by "?" behaves as if it were followed by "?:" but named
 *     parentheses can still be used for capturing (and they acquire numbers
 *     in the usual way).
 * @G_REGEX_OPTIMIZE: Since 2.74 and the port to pcre2, requests JIT
 *     compilation, which, if the just-in-time compiler is available, further
 *     processes a compiled pattern into machine code that executes much
 *     faster. However, it comes at the cost of extra processing before the
 *     match is performed, so it is most beneficial to use this when the same
 *     compiled pattern is used for matching many times. Before 2.74 this
 *     option used the built-in non-JIT optimizations in pcre1.
 * @G_REGEX_FIRSTLINE: Limits an unanchored pattern to match before (or at) the
 *     first newline. Since: 2.34
 * @G_REGEX_DUPNAMES: Names used to identify capturing subpatterns need not
 *     be unique. This can be helpful for certain types of pattern when it
 *     is known that only one instance of the named subpattern can ever be
 *     matched.
 * @G_REGEX_NEWLINE_CR: Usually any newline character or character sequence is
 *     recognized. If this option is set, the only recognized newline character
 *     is '\r'.
 * @G_REGEX_NEWLINE_LF: Usually any newline character or character sequence is
 *     recognized. If this option is set, the only recognized newline character
 *     is '\n'.
 * @G_REGEX_NEWLINE_CRLF: Usually any newline character or character sequence is
 *     recognized. If this option is set, the only recognized newline character
 *     sequence is '\r\n'.
 * @G_REGEX_NEWLINE_ANYCRLF: Usually any newline character or character sequence
 *     is recognized. If this option is set, the only recognized newline character
 *     sequences are '\r', '\n', and '\r\n'. Since: 2.34
 * @G_REGEX_BSR_ANYCRLF: Usually any newline character or character sequence
 *     is recognised. If this option is set, then "\R" only recognizes the newline
 *    characters '\r', '\n' and '\r\n'. Since: 2.34
 * @G_REGEX_JAVASCRIPT_COMPAT: Changes behaviour so that it is compatible with
 *     JavaScript rather than PCRE. Since GLib 2.74 this is no longer supported,
 *     as libpcre2 does not support it. Since: 2.34 Deprecated: 2.74
 *
 * Flags specifying compile-time options.
 *
 * Since: 2.14
  }
{ Remember to update G_REGEX_COMPILE_MASK in gregex.c after
 * adding a new flag.
  }
{< private > }
type
  PGRegexCompileFlags = ^TGRegexCompileFlags;
  TGRegexCompileFlags =  Longint;
  Const
    G_REGEX_DEFAULT = 0;
    G_REGEX_CASELESS = 1 shl 0;
    G_REGEX_MULTILINE = 1 shl 1;
    G_REGEX_DOTALL = 1 shl 2;
    G_REGEX_EXTENDED = 1 shl 3;
    G_REGEX_ANCHORED = 1 shl 4;
    G_REGEX_DOLLAR_ENDONLY = 1 shl 5;
    G_REGEX_UNGREEDY = 1 shl 9;
    G_REGEX_RAW = 1 shl 11;
    G_REGEX_NO_AUTO_CAPTURE = 1 shl 12;
    G_REGEX_OPTIMIZE = 1 shl 13;
    G_REGEX_FIRSTLINE = 1 shl 18;
    G_REGEX_DUPNAMES = 1 shl 19;
    G_REGEX_NEWLINE_CR = 1 shl 20;
    G_REGEX_NEWLINE_LF = 1 shl 21;
    G_REGEX_NEWLINE_RESERVED1 = 1 shl 22;
    G_REGEX_NEWLINE_CRLF = G_REGEX_NEWLINE_CR or G_REGEX_NEWLINE_LF;
    G_REGEX_NEWLINE_ANYCRLF = G_REGEX_NEWLINE_CR or G_REGEX_NEWLINE_RESERVED1;
    G_REGEX_BSR_ANYCRLF = 1 shl 23;
    G_REGEX_JAVASCRIPT_COMPAT = 1 shl 25;
;
{*
 * GRegexMatchFlags:
 * @G_REGEX_MATCH_DEFAULT: No special options set. Since: 2.74
 * @G_REGEX_MATCH_ANCHORED: The pattern is forced to be "anchored", that is,
 *     it is constrained to match only at the first matching point in the
 *     string that is being searched. This effect can also be achieved by
 *     appropriate constructs in the pattern itself such as the "^"
 *     metacharacter.
 * @G_REGEX_MATCH_NOTBOL: Specifies that first character of the string is
 *     not the beginning of a line, so the circumflex metacharacter should
 *     not match before it. Setting this without %G_REGEX_MULTILINE (at
 *     compile time) causes circumflex never to match. This option affects
 *     only the behaviour of the circumflex metacharacter, it does not
 *     affect "\A".
 * @G_REGEX_MATCH_NOTEOL: Specifies that the end of the subject string is
 *     not the end of a line, so the dollar metacharacter should not match
 *     it nor (except in multiline mode) a newline immediately before it.
 *     Setting this without %G_REGEX_MULTILINE (at compile time) causes
 *     dollar never to match. This option affects only the behaviour of
 *     the dollar metacharacter, it does not affect "\Z" or "\z".
 * @G_REGEX_MATCH_NOTEMPTY: An empty string is not considered to be a valid
 *     match if this option is set. If there are alternatives in the pattern,
 *     they are tried. If all the alternatives match the empty string, the
 *     entire match fails. For example, if the pattern "a?b?" is applied to
 *     a string not beginning with "a" or "b", it matches the empty string
 *     at the start of the string. With this flag set, this match is not
 *     valid, so GRegex searches further into the string for occurrences
 *     of "a" or "b".
 * @G_REGEX_MATCH_PARTIAL: Turns on the partial matching feature, for more
 *     documentation on partial matching see g_match_info_is_partial_match().
 * @G_REGEX_MATCH_NEWLINE_CR: Overrides the newline definition set when
 *     creating a new #GRegex, setting the '\r' character as line terminator.
 * @G_REGEX_MATCH_NEWLINE_LF: Overrides the newline definition set when
 *     creating a new #GRegex, setting the '\n' character as line terminator.
 * @G_REGEX_MATCH_NEWLINE_CRLF: Overrides the newline definition set when
 *     creating a new #GRegex, setting the '\r\n' characters sequence as line terminator.
 * @G_REGEX_MATCH_NEWLINE_ANY: Overrides the newline definition set when
 *     creating a new #GRegex, any Unicode newline sequence
 *     is recognised as a newline. These are '\r', '\n' and '\rn', and the
 *     single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
 *     U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
 *     U+2029 PARAGRAPH SEPARATOR.
 * @G_REGEX_MATCH_NEWLINE_ANYCRLF: Overrides the newline definition set when
 *     creating a new #GRegex; any '\r', '\n', or '\r\n' character sequence
 *     is recognized as a newline. Since: 2.34
 * @G_REGEX_MATCH_BSR_ANYCRLF: Overrides the newline definition for "\R" set when
 *     creating a new #GRegex; only '\r', '\n', or '\r\n' character sequences
 *     are recognized as a newline by "\R". Since: 2.34
 * @G_REGEX_MATCH_BSR_ANY: Overrides the newline definition for "\R" set when
 *     creating a new #GRegex; any Unicode newline character or character sequence
 *     are recognized as a newline by "\R". These are '\r', '\n' and '\rn', and the
 *     single characters U+000B LINE TABULATION, U+000C FORM FEED (FF),
 *     U+0085 NEXT LINE (NEL), U+2028 LINE SEPARATOR and
 *     U+2029 PARAGRAPH SEPARATOR. Since: 2.34
 * @G_REGEX_MATCH_PARTIAL_SOFT: An alias for %G_REGEX_MATCH_PARTIAL. Since: 2.34
 * @G_REGEX_MATCH_PARTIAL_HARD: Turns on the partial matching feature. In contrast to
 *     to %G_REGEX_MATCH_PARTIAL_SOFT, this stops matching as soon as a partial match
 *     is found, without continuing to search for a possible complete match. See
 *     g_match_info_is_partial_match() for more information. Since: 2.34
 * @G_REGEX_MATCH_NOTEMPTY_ATSTART: Like %G_REGEX_MATCH_NOTEMPTY, but only applied to
 *     the start of the matched string. For anchored
 *     patterns this can only happen for pattern containing "\K". Since: 2.34
 *
 * Flags specifying match-time options.
 *
 * Since: 2.14
  }
{ Remember to update G_REGEX_MATCH_MASK in gregex.c after
 * adding a new flag.  }
type
  PGRegexMatchFlags = ^TGRegexMatchFlags;
  TGRegexMatchFlags =  Longint;
  Const
    G_REGEX_MATCH_DEFAULT = 0;
    G_REGEX_MATCH_ANCHORED = 1 shl 4;
    G_REGEX_MATCH_NOTBOL = 1 shl 7;
    G_REGEX_MATCH_NOTEOL = 1 shl 8;
    G_REGEX_MATCH_NOTEMPTY = 1 shl 10;
    G_REGEX_MATCH_PARTIAL = 1 shl 15;
    G_REGEX_MATCH_NEWLINE_CR = 1 shl 20;
    G_REGEX_MATCH_NEWLINE_LF = 1 shl 21;
    G_REGEX_MATCH_NEWLINE_CRLF = G_REGEX_MATCH_NEWLINE_CR or G_REGEX_MATCH_NEWLINE_LF;
    G_REGEX_MATCH_NEWLINE_ANY = 1 shl 22;
    G_REGEX_MATCH_NEWLINE_ANYCRLF = G_REGEX_MATCH_NEWLINE_CR or G_REGEX_MATCH_NEWLINE_ANY;
    G_REGEX_MATCH_BSR_ANYCRLF = 1 shl 23;
    G_REGEX_MATCH_BSR_ANY = 1 shl 24;
    G_REGEX_MATCH_PARTIAL_SOFT = G_REGEX_MATCH_PARTIAL;
    G_REGEX_MATCH_PARTIAL_HARD = 1 shl 27;
    G_REGEX_MATCH_NOTEMPTY_ATSTART = 1 shl 28;
;
type
{*
 * GMatchInfo:
 *
 * A GMatchInfo is an opaque struct used to return information about
 * matches.
  }
{*
 * GRegexEvalCallback:
 * @match_info: the #GMatchInfo generated by the match.
 *     Use g_match_info_get_regex() and g_match_info_get_string() if you
 *     need the #GRegex or the matched string.
 * @result: a #GString containing the new string
 * @user_data: user data passed to g_regex_replace_eval()
 *
 * Specifies the type of the function passed to g_regex_replace_eval().
 * It is called for each occurrence of the pattern in the string passed
 * to g_regex_replace_eval(), and it should append the replacement to
 * @result.
 *
 * Returns: %FALSE to continue the replacement process, %TRUE to stop it
 *
 * Since: 2.14
  }
(* Const before type ignored *)

  TGRegexEvalCallback = function (match_info:PGMatchInfo; result:PGString; user_data:Tgpointer):Tgboolean;cdecl;
(* Const before type ignored *)

function g_regex_new(pattern:Pgchar; compile_options:TGRegexCompileFlags; match_options:TGRegexMatchFlags; error:PPGError):PGRegex;cdecl;external;
function g_regex_ref(regex:PGRegex):PGRegex;cdecl;external;
procedure g_regex_unref(regex:PGRegex);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_get_pattern(regex:PGRegex):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_regex_get_max_backref(regex:PGRegex):Tgint;cdecl;external;
(* Const before type ignored *)
function g_regex_get_capture_count(regex:PGRegex):Tgint;cdecl;external;
(* Const before type ignored *)
function g_regex_get_has_cr_or_lf(regex:PGRegex):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_regex_get_max_lookbehind(regex:PGRegex):Tgint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_get_string_number(regex:PGRegex; name:Pgchar):Tgint;cdecl;external;
(* Const before type ignored *)
function g_regex_escape_string(_string:Pgchar; length:Tgint):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_regex_escape_nul(_string:Pgchar; length:Tgint):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_regex_get_compile_flags(regex:PGRegex):TGRegexCompileFlags;cdecl;external;
(* Const before type ignored *)
function g_regex_get_match_flags(regex:PGRegex):TGRegexMatchFlags;cdecl;external;
{ Matching.  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_match_simple(pattern:Pgchar; _string:Pgchar; compile_options:TGRegexCompileFlags; match_options:TGRegexMatchFlags):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_match(regex:PGRegex; _string:Pgchar; match_options:TGRegexMatchFlags; match_info:PPGMatchInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_match_full(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; match_options:TGRegexMatchFlags; 
           match_info:PPGMatchInfo; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_match_all(regex:PGRegex; _string:Pgchar; match_options:TGRegexMatchFlags; match_info:PPGMatchInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_match_all_full(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; match_options:TGRegexMatchFlags; 
           match_info:PPGMatchInfo; error:PPGError):Tgboolean;cdecl;external;
{ String splitting.  }
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_split_simple(pattern:Pgchar; _string:Pgchar; compile_options:TGRegexCompileFlags; match_options:TGRegexMatchFlags):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_split(regex:PGRegex; _string:Pgchar; match_options:TGRegexMatchFlags):^Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_split_full(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; match_options:TGRegexMatchFlags; 
           max_tokens:Tgint; error:PPGError):^Pgchar;cdecl;external;
{ String replacement.  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_replace(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; replacement:Pgchar; 
           match_options:TGRegexMatchFlags; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_replace_literal(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; replacement:Pgchar; 
           match_options:TGRegexMatchFlags; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_regex_replace_eval(regex:PGRegex; _string:Pgchar; string_len:Tgssize; start_position:Tgint; match_options:TGRegexMatchFlags; 
           eval:TGRegexEvalCallback; user_data:Tgpointer; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_regex_check_replacement(replacement:Pgchar; has_references:Pgboolean; error:PPGError):Tgboolean;cdecl;external;
{ Match info  }
(* Const before type ignored *)
function g_match_info_get_regex(match_info:PGMatchInfo):PGRegex;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_match_info_get_string(match_info:PGMatchInfo):Pgchar;cdecl;external;
function g_match_info_ref(match_info:PGMatchInfo):PGMatchInfo;cdecl;external;
procedure g_match_info_unref(match_info:PGMatchInfo);cdecl;external;
procedure g_match_info_free(match_info:PGMatchInfo);cdecl;external;
function g_match_info_next(match_info:PGMatchInfo; error:PPGError):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_match_info_matches(match_info:PGMatchInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_match_info_get_match_count(match_info:PGMatchInfo):Tgint;cdecl;external;
(* Const before type ignored *)
function g_match_info_is_partial_match(match_info:PGMatchInfo):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_match_info_expand_references(match_info:PGMatchInfo; string_to_expand:Pgchar; error:PPGError):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_match_info_fetch(match_info:PGMatchInfo; match_num:Tgint):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_match_info_fetch_pos(match_info:PGMatchInfo; match_num:Tgint; start_pos:Pgint; end_pos:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_match_info_fetch_named(match_info:PGMatchInfo; name:Pgchar):Pgchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_match_info_fetch_named_pos(match_info:PGMatchInfo; name:Pgchar; start_pos:Pgint; end_pos:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_match_info_fetch_all(match_info:PGMatchInfo):^Pgchar;cdecl;external;
{$endif}
{  __G_REGEX_H__  }

implementation

{ was #define dname def_expr }
function G_REGEX_ERROR : longint; { return type might be wrong }
  begin
    G_REGEX_ERROR:=g_regex_error_quark;
  end;


end.
