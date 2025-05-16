
unit eina_str;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_str.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_str.h
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
Pbyte  = ^byte;
Pchar  = ^char;
Pdword  = ^dword;
Psize_t  = ^size_t;
Ptm  = ^tm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EINA_STR_H}
{$define _EINA_STR_H}
{$include <stddef.h>}
{$include <string.h>}
{$include <time.h>}
{$include "eina_types.h"}
{*
 * @page tutorial_eina_string Eina String example
 * @dontinclude eina_str_01.c
 *
 * Whenever using eina we need to include it:
 * @skipline #include
 * @line #include
 *
 * In our main function we declare (and initialize) some variables and initialize
 * eina:
 * @until eina_init
 *
 * It's frequently necessary to split a string into its constituent parts,
 * eina_str_split() make's it easy to do so:
 * @until printf
 *
 * Another common need is to make a string uppercase or lowercase, so let's
 * create a string and make it uppercase and then make it lowercase again:
 * @until printf
 * @until printf
 *
 * Next we use eina to check if our @p names string starts or ends with some
 * values:
 * @until Has
 *
 * When strings will be used in a terminal (or a number of other places) it
 * necessary to escape certain characters that appear in them:
 * @until printf
 *
 * Much as we previously split a string we will now join two strings:
 * @until printf
 *
 * With strlcpy() we can copy what portion of the @p prologue fits in @p str and
 * be sure that it's still NULL terminated:
 * @until printf
 *
 * Since we are done with @p prologue and @p str we should free them:
 * @until free(str
 *
 * Finally we see strlcat in action:
 * @until printf("
 *
 * And then shut eina down and exit:
 * @until 
 * @example eina_str_01.c
  }
{*
 * @addtogroup Eina_String_Group String
 *
 * @brief Provides useful functions for C string manipulation.
 *
 * This group of functions allow you to more easily manipulate strings, they
 * provide functionality not available through string.h.
 *
 * @warning Since these functions modify the strings they can't be used with
 * shared strings(eina_stringshare).
 *
 * See an example @ref tutorial_eina_string "here".
  }
{*
 * @addtogroup Eina_Tools_Group Tools
 *
 * For more information refer to the @ref tutorial_eina_string "string example".
 *
 * @
  }
{*
 * @defgroup Eina_String_Group String
 *
 * @
  }
{ strlcpy implementation for libc's lacking it  }
{*
 * @brief Copies a c-string to another.
 *
 * @param[out] dst The destination string.
 * @param[in] src The source string.
 * @param[in] siz The size of the destination string.
 * @return The length of the source string.
 *
 * This function copies up to @p siz - 1 characters from the
 * NULL-terminated string @p src to @p dst, NULL-terminating the result
 * (unless @p siz is equal to 0). The returned value is the length of
 * @p src. If the returned value is greater than @p siz, truncation
 * occurred.
 *
 * @note The main difference between eina_strlcpy and strncpy is that this
 * ensures @p dst is NULL-terminated even if no @c NULL byte is found in the first
 * @p siz bytes of src.
  }
(* Const before type ignored *)

function eina_strlcpy(dst:Pchar; src:Pchar; siz:Tsize_t):Tsize_t;cdecl;external;
{*
 * @brief Appends a c-string.
 *
 * @param[out] dst The destination string.
 * @param[in] src The source string.
 * @param[in] siz The size of the destination string.
 * @return The length of the source string plus MIN(siz, strlen(initial dst))
 *
 * This function appends @p src to @p dst of size @p siz (unlike
 * strncat, @p siz is the full size of @p dst, not space left).  At
 * most @p siz - 1 characters will be copied.  Always NULL-terminates
 * (unless @p siz <= strlen(dst)). This function returns strlen(src) +
 * MIN(siz, strlen(initial dst)). If the returned value is greater or
 * equal than @p siz, truncation occurred.
  }
(* Const before type ignored *)
function eina_strlcat(dst:Pchar; src:Pchar; siz:Tsize_t):Tsize_t;cdecl;external;
{*
 * @brief Checks if the given string has the given prefix.
 *
 * @param[in] str The string to work with.
 * @param[in] prefix The prefix to check for.
 * @return #EINA_TRUE if the string has the given prefix, #EINA_FALSE otherwise.
 *
 * This function returns #EINA_TRUE if @p str has the prefix
 * @p prefix, #EINA_FALSE otherwise. If the length of @p prefix is
 * greater than @p str, #EINA_FALSE is returned.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_has_prefix(str:Pchar; prefix:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given string has the given suffix.
 *
 * @param[in] str The string to work with.
 * @param[in] suffix The suffix to check for.
 * @return #EINA_TRUE if the string has the given suffix, #EINA_FALSE otherwise.
 *
 * This function returns #EINA_TRUE if @p str has the suffix
 * @p suffix, #EINA_FALSE otherwise. If the length of @p suffix is
 * greater than @p str, #EINA_FALSE is returned.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_has_suffix(str:Pchar; suffix:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Checks if the given string has the given extension.
 *
 * @param[in] str The string to work with.
 * @param[in] ext The  extension to check for.
 * @return #EINA_TRUE if the string has the given extension, #EINA_FALSE otherwise.
 *
 * This function does the same as eina_str_has_suffix(), except it's case
 * insensitive.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_has_extension(str:Pchar; ext:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Splits a string using a delimiter.
 *
 * @param[in] string The string to split.
 * @param[in] delimiter The string which specifies the places at which to split the string.
 * @param[in] max_tokens The maximum number of strings to split string into, or a number less
 *                   than 1 to split as many times as possible. This parameter
 *                   IGNORES the added @c NULL terminator.
 * @return A newly-allocated NULL-terminated array of strings or @c NULL if it
 * fails to allocate the array.
 *
 * This function splits @p string into a maximum of @p max_tokens pieces,
 * using the given delimiter @p delimiter. @p delimiter is not included in any
 * of the resulting strings, unless @p max_tokens is reached. If
 * @p max_tokens is less than @c 1, the string is split as many times as possible. If
 * @p max_tokens is reached, the last string in the returned string
 * array contains the remainder of string. The returned value is a
 * newly allocated NULL-terminated array of strings or @c NULL if it fails to
 * allocate the array. To free it, free the first element of the array and the
 * array itself.
 *
 * @note If you need the number of elements in the returned array see
 * eina_str_split_full().
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_split(_string:Pchar; delimiter:Pchar; max_tokens:longint):^Pchar;cdecl;external;
{*
 * @brief Splits a string using a delimiter and returns number of elements.
 *
 * @param[in] string The string to split.
 * @param[in] delimiter The string which specifies the places at which to split the string.
 * @param[in] max_tokens The maximum number of strings to split string into, or a number less
 *                   than 1 to split as many times as possible. This parameter
 *                   IGNORES the added @c NULL terminator.
 * @param[out] elements Where to return the number of elements in returned
 *        array. This array is guaranteed to be no greater than @p max_tokens, and
 *        it will NOT count the @c NULL terminator element.
 * @return A newly-allocated NULL-terminated array of strings or @c NULL if it
 * fails to allocate the array.
 *
 * This function splits @p string into a maximum of @p max_tokens pieces,
 * using the given delimiter @p delimiter. @p delimiter is not included in any
 * of the resulting strings, unless @p max_tokens is reached. If
 * @p max_tokens is less than @c 1, the string is split as many times as possible. If
 * @p max_tokens is reached, the last string in the returned string
 * array contains the remainder of string. The returned value is a
 * newly allocated NULL-terminated array of strings or @c NULL if it fails to
 * allocate the array. To free it, free the first element of the array and the
 * array itself.
 *
 * @note The actual size of the returned array, when @p elements returns greater than zero,
 *       will always be @p elements + 1. This is due to the @c NULL terminator element that
 *       is added to the array for safety. If it returns @c 6, the number of split strings returned
 *       will be 6, but the size of the array (including the @c NULL element) will actually be 7.
 *
 * @see eina_str_split()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_split_full(_string:Pchar; delimiter:Pchar; max_tokens:longint; elements:Pdword):^Pchar;cdecl;external;
{*
 * @brief Joins two strings of known length.
 *
 * @param[out] dst The buffer to store the result.
 * @param[in] size Size (in byte) of the buffer.
 * @param[in] sep The separator character to use.
 * @param[in] a First string to use, before @p sep.
 * @param[in] a_len Length of @p a.
 * @param[in] b Second string to use, after @p sep.
 * @param[in] b_len Length of @p b.
 * @return The number of characters printed.
 *
 * This function joins the strings @p a and @p b (in that order) and
 * separate them with @p sep. The result is stored in the buffer
 * @p dst and at most @p size - 1 characters will be written and the
 * string is NULL-terminated. @p a_len is the length of @p a (not
 * including '\\0') and @p b_len is the length of @p b (not including
 * '\\0'). This function returns the number of characters printed (not
 * including the trailing '\\0' used to end output to strings). Just
 * like snprintf(), it will not write more than @p size bytes, thus a
 * returned value of @p size or more means that the output was
 * truncated.
 *
 * @see eina_str_join()
 * @see eina_str_join_static()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_join_len(dst:Pchar; size:Tsize_t; sep:char; a:Pchar; a_len:Tsize_t; 
           b:Pchar; b_len:Tsize_t):Tsize_t;cdecl;external;
{*
 * @brief Uses Iconv to convert a text string from one encoding to another.
 *
 * @param[in] enc_from Encoding to convert from.
 * @param[in] enc_to Encoding to convert to.
 * @param[in] text The text to convert.
 * @return The converted text.
 *
 * This function converts @p text, encoded in @p enc_from. On success,
 * the converted text is returned and is encoded in @p enc_to. On
 * failure, @c NULL is returned. Iconv is used to convert @p text. If
 * Iconv is not available, @c NULL is returned. When not used anymore,
 * the returned value must be freed.
 *
 * @warning This function is guaranteed to break when '\0' characters are in @p text.
 * DO NOT USE THIS FUNCTION IF YOUR TEXT CONTAINS NON-TERMINATING '\0' CHARACTERS.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_convert(enc_from:Pchar; enc_to:Pchar; text:Pchar):Pchar;cdecl;external;
{*
 * @brief Uses Iconv to convert a text string from one encoding to another.
 *
 * @param[in] enc_from Encoding to convert from.
 * @param[in] enc_to Encoding to convert to.
 * @param[in] text The text to convert.
 * @param[in] len The size in bytes of the text to convert.
 * @param[in] retlen The size in bytes of the converted text.
 * @return The converted text.
 *
 * This function converts @p text, encoded in @p enc_from. On success,
 * the converted text is returned and is encoded in @p enc_to. On
 * failure, @c NULL is returned. Iconv is used to convert @p text. If
 * Iconv is not available, @c NULL is returned. When not used anymore,
 * the returned value must be freed.
 *
 * @since 1.8
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function eina_str_convert_len(enc_from:Pchar; enc_to:Pchar; text:Pchar; len:Tsize_t; retlen:Psize_t):Pchar;cdecl;external;
{*
 * @brief Escapes slashes, spaces and apostrophes in strings.
 *
 * @param[in] str The string to escape.
 * @return The escaped string.
 *
 * Escaping is done by adding a slash "\" before any occurrence of slashes "\"
 * include "\n" and "\t", spaces " ", apostrophes "'" or quotes """. This
 * function returns a newly allocated escaped string on success, @c NULL on
 * failure. When not used anymore, the
 * returned value must be freed.
  }
(* Const before type ignored *)
function eina_str_escape(str:Pchar):Pchar;cdecl;external;
{*
 * @brief Lowercases all the characters in range [A-Z] in the given string.
 *
 * @param[in,out] str The string to lowercase.
 *
 * This function modifies the original string, changing all characters
 * in [A-Z] to lowercase. If @p str is @c NULL or is an empty string,
 * this function does nothing.
  }
procedure eina_str_tolower(str:PPchar);cdecl;external;
{*
 * @brief Uppercases all the characters in range [a-z] in the given string.
 *
 * @param[in,out] str The string to uppercase.
 *
 * This function modifies the original string, changing all characters
 * in [a-z] to uppercase. If @p str is @c NULL or is an empty string,
 * this function does nothing.
  }
procedure eina_str_toupper(str:PPchar);cdecl;external;
{*
 * @def eina_str_join_static(dst, sep, a, b)
 * @brief Joins two static strings and store the result in a static buffer.
 *
 * @param[out] dst The buffer to store the result.
 * @param[in] sep The separator character to use.
 * @param[in] a First string to use, before @p sep.
 * @param[in] b Second string to use, after @p sep.
 * @return The number of characters printed.
 *
 * This function is similar to eina_str_join_len(), but will assume
 * string sizes are know using sizeof(X).
 *
 * @see eina_str_join()
 * @see eina_str_join_static()
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_str_join_static(dst,sep,a,b : longint) : longint;

{*
 * @brief Memory duplication function with optional termination for strings
 * @param[in] mem The memory to copy
 * @param[in] size The size of @p mem
 * @param[in] terminate If true, the returned memory will be nul terminated with '\0'
 * @return The copied memory, must be freed
 * @since 1.13
  }
function eina_memdup(mem:Pbyte; size:Tsize_t; terminate:TEina_Bool):Pbyte;cdecl;external;
{*
 * @brief Creates and update the buffer based on strftime output.
 *
 * @param[in] tm Pointer to a tm structure needed by strftime.
 * @param[in] format String containing format specifiers needed by strftime.
 * @return Updated buffer based on strftime output
 *
 * This will create a buffer of exact required size based on strftime output
 * once use is complete the buffer has to be freed using free.
 *
 * Example usage:
 * @code
 * time_t curr_time;
 * struct tm *info;
 * char *buf;
 * curr_time = time(NULL);
 * info = localtime(&curr_time);
 * buf = eina_strftime("%I:%M%p", info);
 * //after use
 * free(buf);
 * @endcode
 *
 * @since 1.17.0
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strftime(format:Pchar; tm:Ptm):Pchar;cdecl;external;
{$include "eina_inline_str.x"}
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_STR_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_str_join_static(dst,sep,a,b : longint) : longint;
var
   if_local1, if_local2 : longint;
(* result types are not known *)
begin
  eina_str_join_static:=eina_str_join_len(dst,sizeof(dst),sep,a,if_local1,b,if_local2);
end;


end.
