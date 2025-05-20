
unit eina_unicode;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_unicode.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_unicode.h
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
Pchar  = ^char;
PEina_Unicode  = ^Eina_Unicode;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EINA_UNICODE_H}
{$define EINA_UNICODE_H}
{$include <stdlib.h>}
{$include "eina_config.h"}
{$include "eina_types.h"}
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @addtogroup Eina_Unicode_String Unicode String
 *
 * @brief These functions provide basic unicode string handling
 *
 * Eina_Unicode is a type that holds unicode codepoints.
 *
 * @
  }
{*
 * @typedef Eina_Unicode
 * A type that holds Unicode codepoints.
  }
{$if EINA_SIZEOF_WCHAR_T >= 4}
{$include <wchar.h>}
type
  PEina_Unicode = ^TEina_Unicode;
  TEina_Unicode = Twchar_t;
{$else}
{$include <inttypes.h>}
type
  PEina_Unicode = ^TEina_Unicode;
  TEina_Unicode = Tuint32_t;
{$endif}
{*
 * @brief Same as the standard strlen just with Eina_Unicode instead of char.
  }
(* Const before type ignored *)
  var
    EINA_UNICODE_EMPTY_STRING : PEina_Unicode;cvar;external;
(* Const before type ignored *)

function eina_unicode_strlen(ustr:PEina_Unicode):Tsize_t;cdecl;external;
{*
 * @brief Returns the length of a Eina_Unicode string, up to a limit.
 *
 * This function returns the number of characters in string, up to a maximum
 * of n.  If the terminating character is not found in the string, it returns
 * n.
 *
 * @param[in] ustr String to search
 * @param[in] n Max length to search
 * @return Number of characters or n.
  }
(* Const before type ignored *)
function eina_unicode_strnlen(ustr:PEina_Unicode; n:longint):Tsize_t;cdecl;external;
{*
 * @brief Same as the standard strdup just with Eina_Unicode instead of char.
 *
 * @param[in] text The text to duplicate.
 * @return The duplicated string.
  }
(* Const before type ignored *)
function eina_unicode_strdup(text:PEina_Unicode):PEina_Unicode;cdecl;external;
{*
 * @brief Same as strdup but cuts on the given size. Assumes n < len
 *
 * @param[in] text The text to duplicate.
 * @param[in] n The maximum size of the text to duplicate.
 * @return The duplicated string.
 *
 * This function duplicates @p text. The resulting string is cut on @p
 * n. @p n is assumed to be lesser  (<) than the length of @p
 * text. When not needed anymore, the returned string must be freed.
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eina_unicode_strndup(text:PEina_Unicode; n:Tsize_t):PEina_Unicode;cdecl;external;
{*
 * @brief Same as the standard strcmp just with Eina_Unicode instead of char.
 *
 * @param[in] a The text to be compared.
 * @param[in] b The text to be compared.
 * @return An integer value indicating the ordinal relation of @p a to @p b.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_unicode_strcmp(a:PEina_Unicode; b:PEina_Unicode):longint;cdecl;external;
{*
 * @brief Same as the standard strcpy just with Eina_Unicode instead of char.
 *
 * @param[out] dest The text which @p source is to be copied.
 * @param[in] source The text to copy from.
 * @return @p dest is returned.
  }
(* Const before type ignored *)
function eina_unicode_strcpy(dest:PEina_Unicode; source:PEina_Unicode):PEina_Unicode;cdecl;external;
{*
 * @brief Same as the standard strstr just with Eina_Unicode instead of char.
 *
 * @param[in] haystack The text to be searched.
 * @param[in] needle The text to search for
 * @return The substring of @p haystack which starts with @p needle
 *         when @p needle is founded in @p haystack, or NULL is returned.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_unicode_strstr(haystack:PEina_Unicode; needle:PEina_Unicode):PEina_Unicode;cdecl;external;
{*
 * @brief Same as the standard strncpy just with Eina_Unicode instead of char.
 *
 * @param[out] dest The text which @p source is to be copied.
 * @param[in] source The text to copy from.
 * @param[in] n Maximum number of characters to be copied from @p source.
 * @return @p dest is returned.
  }
(* Const before type ignored *)
function eina_unicode_strncpy(dest:PEina_Unicode; source:PEina_Unicode; n:Tsize_t):PEina_Unicode;cdecl;external;
{*
 * @see eina_str_escape()
 *
 * @param[in] str The string to escape.
 * @return The escaped string.
  }
(* Const before type ignored *)
function eina_unicode_escape(str:PEina_Unicode):PEina_Unicode;cdecl;external;
{ UTF-8 Handling  }
{*
 * Reads UTF8 bytes from @p buf, starting at @p iindex and returns
 * the decoded code point at @p iindex offset, and advances @p iindex
 * to the next code point after this. @p iindex is always advanced,
 * unless if the advancement is after the @c NULL.
 *
 * On error: return a codepoint between DC80 to DCFF where the low 8 bits
 *   are the byte's value.
 *
 * @param[in] buf the string
 * @param[in,out] iindex the index to look at and return by.
 * @return the codepoint found, 0 if @p buf or @p iindex are NULL
 *
 * @since 1.8.0
  }
{*
 * @deprecated use eina_unicode_utf8_next_get
 * Reads UTF8 bytes from @p buf, starting at @p iindex and returns
 * the decoded code point at @p iindex offset, and advances @p iindex
 * to the next code point after this. @p iindex is always advanced,
 * unless if the advancement is after the @c NULL.
 *
 * On error: return a codepoint between DC80 to DCFF where the low 8 bits
 *   are the byte's value.
 *
 * @param[in] buf the string
 * @param[in,out] iindex the index to look at and return by.
 * @return the codepoint found, 0 if @p buf or @p iindex are NULL
 *
 * @since 1.1.0
  }
{ EINA_DEPRECATED xxxxxxxxxxxxxxxxxxxxx }
(* Const before type ignored *)
function eina_unicode_utf8_get_next(buf:Pchar; iindex:Plongint):TEina_Unicode;cdecl;external;
{*
 * Reads UTF8 bytes from @p buf, starting at @p iindex and returns
 * the decoded code point at @p iindex offset, and moves  @p iindex
 * to the previous code point. @p iindex is always moved, as long
 * as it's not past the start of the string.
 *
 * On error: return a codepoint between DC80 to DCFF where the low 8 bits
 *   are the byte's value.
 *
 * @param[in] buf the string
 * @param[in,out] iindex the index to look at and return by.
 * @return the codepoint found.
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eina_unicode_utf8_get_prev(buf:Pchar; iindex:Plongint):TEina_Unicode;cdecl;external;
{*
 * Returns the number of unicode characters in the string. That is,
 * the number of Eina_Unicodes it'll take to store this string in
 * an Eina_Unicode string.
 *
 * @param[in] buf the string
 * @return the number of unicode characters (not bytes) in the string
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eina_unicode_utf8_get_len(buf:Pchar):longint;cdecl;external;
{*
 * Converts a utf-8 string to a newly allocated Eina_Unicode string.
 *
 * @param[in] utf the string in utf-8
 * @param[out] _len the length of the returned Eina_Unicode string.
 * @return the newly allocated Eina_Unicode string.
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eina_unicode_utf8_to_unicode(utf:Pchar; _len:Plongint):PEina_Unicode;cdecl;external;
{*
 * Converts an Eina_Unicode string to a newly allocated utf-8 substring at given length.
 *
 * @param[in] uni the Eina_Unicode string
 * @param[in] ulen the length in the unicode string to convert.
 * @param[out] _len the length byte length of the return utf8 substring.
 * @return the newly allocated utf-8 substring.
 *
 * @since 1.17
  }
(* Const before type ignored *)
function eina_unicode_unicode_to_utf8_range(uni:PEina_Unicode; ulen:longint; _len:Plongint):Pchar;cdecl;external;
{*
 * Converts an Eina_Unicode string to a newly allocated utf-8 string.
 *
 * @param[in] uni the Eina_Unicode string
 * @param[out] _len the length byte length of the return utf8 string.
 * @return the newly allocated utf-8 string.
 *
 * @since 1.1.0
  }
(* Const before type ignored *)
function eina_unicode_unicode_to_utf8(uni:PEina_Unicode; _len:Plongint):Pchar;cdecl;external;
{$include "eina_inline_unicode.x"}
{*
 * @
  }
{*
 * @
  }
{$endif}

implementation


end.
