
unit eina_strbuf;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_strbuf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_strbuf.h
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
PEina_Strbuf  = ^Eina_Strbuf;
Ptm  = ^tm;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EINA_STRBUF_H}
{$define EINA_STRBUF_H}
{$include <stddef.h>}
{$include <stdarg.h>}
{$include "eina_types.h"}
{$include "eina_slice.h"}
{*
 * @page tutorial_strbuf Eina_Strbuf example
 * @dontinclude eina_strbuf_01.c
 *
 * First thing always is including Eina:
 * @skipline #include
 * @until #include
 *
 * Next we initialize eina and create a string buffer to play with:
 * @until strbuf_new
 *
 * Here you can see two different ways of creating a buffer with the same
 * contents. We could create them in simpler ways, but this gives us an
 * opportunity to demonstrate several functions in action:
 * @until strbuf_reset
 * @until strbuf_reset
 *
 * Next we use the printf family of functions to create a formatted string,
 * add, remove and replace some content:
 * @until strbuf_string_get
 * @until strbuf_string_get
 * @until strbuf_string_get
 *
 * Once done we free our string buffer, shut down Eina and end the application:
 * @until 
 *
 * @example eina_strbuf_01.c
  }
{*
 * @addtogroup Eina_String_Buffer_Group String Buffer
 *
 * @brief These functions provide string buffer management.
 *
 * The String Buffer data type is designed to be a mutable string,
 * allowing the appending, prepending or insertion of a string to a
 * buffer.
 *
 * For more information see @ref tutorial_strbuf "this example".
  }
{*
 * @addtogroup Eina_Data_Types_Group Data Types
 *
 * @
  }
{*
 * @defgroup Eina_String_Buffer_Group String Buffer
 *
 * @
  }
{*
 * @typedef Eina_Strbuf
 * Type for a string buffer.
  }
type
{*
 * @brief Creates a new string buffer.
 *
 * @return Newly allocated string buffer instance, or @c NULL on error.
 *
 * This function creates a new string buffer. To free the resources, use
 * eina_strbuf_free().
 *
 * @see eina_strbuf_free()
 * @see eina_strbuf_append()
 * @see eina_strbuf_string_get()
  }

function eina_strbuf_new:PEina_Strbuf;cdecl;external;
{*
 * @brief Creates a new string buffer using the passed string.
 *
 * @param[in] str The string to manage.
 * @return Newly allocated string buffer instance, or @c NULL on error.
 *
 * This function creates a new string buffer.  The passed string is used
 * directly as the buffer, it's effectively the inverse of
 * eina_strbuf_string_steal().
 * The passed string must be malloc'd, and its ownership will transfer to Eina_Strbuf(do not free it with free()).
 * To free the resources, use eina_strbuf_free().
 *
 * @see eina_strbuf_free()
 * @see eina_strbuf_append()
 * @see eina_strbuf_string_get()
 *
 * @since 1.1.0
  }
function eina_strbuf_manage_new(str:Pchar):PEina_Strbuf;cdecl;external;
{*
 * @brief Creates a new string buffer using the passed string.
 *
 * @param[in] str The string to manage.
 * @param[in] length The length of the string.
 * @return Newly allocated string buffer instance, or @c NULL on error.
 *
 * This function creates a new string buffer. The passed string is used
 * directly as the buffer, it's effectively the inverse of
 * eina_strbuf_string_steal(). The passed string must be malloc'd.  To
 * free the resources, use eina_strbuf_free().
 *
 * @see eina_strbuf_manage_new()
 *
 * @since 1.2.0
  }
function eina_strbuf_manage_new_length(str:Pchar; length:Tsize_t):PEina_Strbuf;cdecl;external;
{*
 * @brief Creates a new string buffer using the passed string.
 *
 * @param[in] str The string to manage.
 * @param[in] length The length of the string.
 * @return Newly allocated string buffer instance, or @c NULL on error.
 *
 * This function creates a new string buffer. The passed string is used
 * directly as the buffer, it's effectively the inverse of
 * eina_strbuf_string_steal(). The passed string is expected to be static
 * or otherwise on the stack rather than the malloc'd string required by
 * eina_strbuf_manage_new_length().  To free the resources, use
 * eina_strbuf_free().
 *
 * @see eina_strbuf_manage_new()
 * @see eina_strbuf_manage_new_length()
 *
 * @since 1.9.0
  }
(* Const before type ignored *)
function eina_strbuf_manage_read_only_new_length(str:Pchar; length:Tsize_t):PEina_Strbuf;cdecl;external;
{*
 * @brief Frees a string buffer.
 *
 * @param[in,out] buf The string buffer to free.
 *
 * This function frees the memory of @p buf. @p buf must have been
 * created by eina_strbuf_new().
  }
procedure eina_strbuf_free(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Resets a string buffer.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function resets @p buf: the buffer len is set to 0, and the
 * string data is set to '\\0'. No memory is freed.
  }
procedure eina_strbuf_reset(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Appends a string to a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to append.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure such as if
 * @p str could not be appended.
 *
 * This function appends @p str to @p buf. It computes the length of
 * @p str, so is slightly slower than eina_strbuf_append_length(). If
 * the length is known beforehand, consider using that variant.
 *
 * @see eina_strbuf_append()
 * @see eina_strbuf_append_length()
  }
(* Const before type ignored *)
function eina_strbuf_append(buf:PEina_Strbuf; str:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Appends an escaped string to a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to append.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be appended.
 *
 * This function escapes and then appends the string @p str to @p buf.
  }
(* Const before type ignored *)
function eina_strbuf_append_escaped(buf:PEina_Strbuf; str:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Appends a string to a buffer, reallocating as necessary,
 * limited by the given length.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to append.
 * @param[in] maxlen The maximum number of characters to append.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be appended.
 *
 * This function appends at most @p maxlen characters of @p str to
 * @p buf. It can't append more than the length of @p str. It
 * computes the length of @p str, so it is slightly slower than
 * eina_strbuf_append_length(). If the length is known beforehand,
 * consider using that variant (@p maxlen should then be checked so
 * that it is greater than the size of @p str).
 *
 * @see eina_strbuf_append()
 * @see eina_strbuf_append_length()
  }
(* Const before type ignored *)
function eina_strbuf_append_n(buf:PEina_Strbuf; str:Pchar; maxlen:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Appends a string of exact length to a buffer, reallocating as
 * necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to append.
 * @param[in] length The exact length to use.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be appended.
 *
 * This function appends @p str to @p buf. @p str must be of size at
 * most @p length. It is slightly faster than eina_strbuf_append() as
 * it does not compute the size of @p str. It is useful when dealing
 * with strings of known size, such as eina_stringshare.
 *
 * @see eina_stringshare_length()
 * @see eina_strbuf_append()
 * @see eina_strbuf_append_n()
  }
(* Const before type ignored *)
function eina_strbuf_append_length(buf:PEina_Strbuf; str:Pchar; length:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Append a slice to a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] slice The slice to append.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p slice could not be appended.
 *
 * This function appends @p slice to @p buf.
 *
 * @since 1.19.0
  }
(* Const before type ignored *)
function eina_strbuf_append_slice(buf:PEina_Strbuf; slice:TEina_Slice):TEina_Bool;cdecl;external;
{*
 * @brief Appends an Eina_Strbuf to a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] data The string buffer to append.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p data could not be appended.
 *
 * This function appends @p data to @p buf. @p data must be allocated and
 * different from @c NULL. It is slightly faster than eina_strbuf_append() as
 * it does not compute the size of @p str.
 *
 * @see eina_strbuf_append()
 * @see eina_strbuf_append_n()
 * @see eina_strbuf_append_length()
 *
 * @since 1.9.0
  }
(* Const before type ignored *)
function eina_strbuf_append_buffer(buf:PEina_Strbuf; data:PEina_Strbuf):TEina_Bool;cdecl;external;
{*
 * @brief Appends a character to a string buffer, reallocating as
 * necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] c The character to append.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p c could not be appended.
 *
 * This function appends @p c to @p buf.
  }
function eina_strbuf_append_char(buf:PEina_Strbuf; c:char):TEina_Bool;cdecl;external;
{*
 * @brief Appends data elements to a buffer using printf-style formatting.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt A formatting string.
 * @param[in] ... Variable list of data parameters to be appended.
 * @return #EINA_TRUE on success, #EINA_FALSE if formatted string could
 * not be appended.
 *
 * This function appends the string defined by the format @p fmt to @p
 * buf, reallocating as necessary. @p fmt must be of a valid format for
 * the printf family of functions.
 *
 * @see eina_strbuf_append()
  }
(* Const before type ignored *)
function eina_strbuf_append_printf(buf:PEina_Strbuf; fmt:Pchar; args:array of const):TEina_Bool;cdecl;external;
function eina_strbuf_append_printf(buf:PEina_Strbuf; fmt:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Appends data elements to a string buffer using a va_list.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt A formatting string.
 * @param[in] args The variable arguments.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * @see eina_strbuf_append_printf()
  }
(* Const before type ignored *)
function eina_strbuf_append_vprintf(buf:PEina_Strbuf; fmt:Pchar; args:Tva_list):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a string into a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to insert.
 * @param[in] pos The position to insert the string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be inserted.
 *
 * This function inserts @p str into @p buf at position @p pos. It
 * computes the length of @p str, so is slightly slower than
 * eina_strbuf_insert_length(). If the length is known beforehand,
 * consider using that variant.
  }
(* Const before type ignored *)
function eina_strbuf_insert(buf:PEina_Strbuf; str:Pchar; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts an escaped string into a buffer, reallocating as
 * necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to insert.
 * @param[in] pos The position to insert the string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be inserted.
 *
 * This function escapes and inserts the string @p str into @p buf at
 * position @p pos.
  }
(* Const before type ignored *)
function eina_strbuf_insert_escaped(buf:PEina_Strbuf; str:Pchar; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a string of a maximum length into a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to insert.
 * @param[in] maxlen The maximum number of chars to insert.
 * @param[in] pos The position to insert the string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be inserted.
 *
 * This function inserts @p str into @p buf at position @p pos, with at
 * most @p maxlen bytes. The number of inserted characters cannot be
 * greater than the length of @p str. It computes the length of
 * @p str, so is slightly slower than eina_strbuf_insert_length(). If the
 * length is known beforehand, consider using that variant (@p maxlen
 * should then be checked so that it is greater than the size of
 * @p str).
  }
(* Const before type ignored *)
function eina_strbuf_insert_n(buf:PEina_Strbuf; str:Pchar; maxlen:Tsize_t; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a string of an exact length into a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to insert.
 * @param[in] length The exact length to use.
 * @param[in] pos The position to insert the string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p string could not be inserted.
 *
 * This function inserts @p str into @p buf. @p str must be no longer
 * than @p length. It is slightly faster than eina_strbuf_insert() as
 * it does not compute the size of @p str. It is useful when dealing
 * with strings of known size, such as eina_stringshare.
 *
 * @see eina_stringshare_length()
 * @see eina_strbuf_insert()
 * @see eina_strbuf_insert_n()
  }
(* Const before type ignored *)
function eina_strbuf_insert_length(buf:PEina_Strbuf; str:Pchar; length:Tsize_t; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Insert a slice into a buffer, reallocating as necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] slice The slice to insert.
 * @param[in] pos The position to insert the string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p slice could not be inserted.
 *
 * This function inserts @p slice into @p buf at position @p pos.
 *
 * @since 1.19.0
  }
(* Const before type ignored *)
function eina_strbuf_insert_slice(buf:PEina_Strbuf; slice:TEina_Slice; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a character into a string buffer, reallocating as
 * necessary.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] c The character to insert.
 * @param[in] pos The position to insert the character.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p c could not be inserted.
 *
 * This function inserts @p c into @p buf at position @p pos.
  }
function eina_strbuf_insert_char(buf:PEina_Strbuf; c:char; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts data elements into a buffer using printf-style formatting.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The string to insert.
 * @param[in] pos The position to insert the string.
 * @param[in] ... Variable list of data parameters to be inserted.
 * @return #EINA_TRUE on success, #EINA_FALSE if the string could not be inserted.
 *
 * This function inserts a string as described by the format @p fmt into @p buf at
 * the position @p pos. @p fmt must be of a valid format for printf family of
 * functions.
  }
(* Const before type ignored *)
function eina_strbuf_insert_printf(buf:PEina_Strbuf; fmt:Pchar; pos:Tsize_t; args:array of const):TEina_Bool;cdecl;external;
function eina_strbuf_insert_printf(buf:PEina_Strbuf; fmt:Pchar; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Inserts data elements into a buffer using a va_list.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The string to insert.
 * @param[in] pos The position to insert the string.
 * @param[in] args The variable arguments.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * @see eina_strbuf_insert_printf
  }
(* Const before type ignored *)
function eina_strbuf_insert_vprintf(buf:PEina_Strbuf; fmt:Pchar; pos:Tsize_t; args:Tva_list):TEina_Bool;cdecl;external;
{*
 * @def eina_strbuf_prepend(buf, str)
 * @brief Prepends a string to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to prepend.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend(buf,str : longint) : longint;

{*
 * @def eina_strbuf_prepend_escaped(buf, str)
 * @brief Prepends an escaped string to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to prepend.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_escaped() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_escaped(buf,str : longint) : longint;

{*
 * @def eina_strbuf_prepend_n(buf, str)
 * @brief Prepends an escaped string to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to prepend.
 * @param[in] maxlen The maximum number of chars to prepend.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_n() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_n(buf,str,maxlen : longint) : longint;

{*
 * @def eina_strbuf_prepend_length(buf, str)
 * @brief Prepends an escaped string to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The string to prepend.
 * @param[in] length The exact length to use.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_length() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_length(buf,str,length : longint) : longint;

{*
 * @def eina_strbuf_prepend_char(buf, str)
 * @brief Prepends a character to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] c The character to prepend.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This macro simply calls eina_strbuf_insert_char() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_char(buf,c : longint) : longint;

{*
 * @def eina_strbuf_prepend_printf(buf, fmt, ...)
 * @brief Prepends data elements to the given buffer using printf-style formatting.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The string to prepend.
 * @param[in] ... Variable list of data elements to prepend.
 * @return #EINA_TRUE on success, #EINA_FALSE if data could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_printf() with position 0.
  }
{*
 * @def eina_strbuf_prepend_vprintf(buf, fmt, args)
 * @brief Prepends the given string to the given buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The string to prepend.
 * @param[in] args The variable arguments.
 * @return #EINA_TRUE on success, #EINA_FALSE if data could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_vprintf() with position 0.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_vprintf(buf,fmt,args : longint) : longint;

{*
 * @brief Removes a section from the given string buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] start The initial (inclusive) byte position to start removal.
 * @param[in] end The final (non-inclusive) byte position to end removal.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This function removes a slice of @p buf, starting at @p start
 * (inclusive) and ending at @p end (non-inclusive). Both values are
 * in bytes.
  }
function eina_strbuf_remove(buf:PEina_Strbuf; start:Tsize_t; end:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @brief Retrieves a pointer to the contents of a string buffer.
 *
 * @param[in] buf The string buffer.
 * @return The current string in the string buffer.
 *
 * This function returns the string contained in @p buf. The returned
 * value must not be modified and will no longer be valid if @p buf is
 * modified. In other words, calling eina_strbuf_append() or similar
 * functions will make this pointer invalid. The pointer returned by
 * this function <b>must not</b> be freed.
 *
 * @see eina_strbuf_string_steal()
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_string_get(buf:PEina_Strbuf):Pchar;cdecl;external;
{*
 * @brief Steals the contents of a string buffer.
 *
 * @param[in,out] buf The string buffer.
 * @return The string that was contained in @p buf.
 *
 * This function returns the string contained in @p buf. @p buf is
 * then initialized and does not own the returned string anymore. The
 * caller must release the memory of the returned string by calling
 * free().
 *
 * @see eina_strbuf_string_get()
  }
function eina_strbuf_string_steal(buf:PEina_Strbuf):Pchar;cdecl;external;
{*
 * @brief Frees the contents of a string buffer but not the buffer.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function frees the string contained in @p buf without freeing
 * @p buf.
  }
procedure eina_strbuf_string_free(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Retrieves the length of the string buffer's content.
 *
 * @param[in,out] buf The string buffer.
 * @return The current length of the string, in bytes.
 *
 * This function returns the length of @p buf.
  }
(* Const before type ignored *)
function eina_strbuf_length_get(buf:PEina_Strbuf):Tsize_t;cdecl;external;
{*
 * @brief Replaces a substring in the buffer with another string.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The text to match.
 * @param[in] with The replacement string.
 * @param[in] n The indexed occurrence to be replaced.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This function replaces the n-th occurrence of @p str in @p buf with
 * @p with.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_replace(buf:PEina_Strbuf; str:Pchar; with:Pchar; n:dword):TEina_Bool;cdecl;external;
{*
 * @def eina_strbuf_replace_first(buf, str, with)
 * @brief Replaces the first occurrence of a substring with another string.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The text to match.
 * @param[in] with The replacement string.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p str could not be
 * replaced in @p buf.
 *
 * This macro simply calls eina_strbuf_replace() with @p n
 * equal to @c 1.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_replace_first(buf,str,with : longint) : longint;

{*
 * @brief Replaces the last occurrence of a substring with another string.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The text to match.
 * @param[in] with The replacement string.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This function replaces the last occurrence of @p str in @p buf with
 * @p with.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_replace_last(buf:PEina_Strbuf; str:Pchar; with:Pchar):TEina_Bool;cdecl;external;
{*
 * @brief Replaces all matching substrings with another string.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] str The text to match.
 * @param[in] with The replacement string.
 * @return Number of replacements made, or @c 0 on failure.
 *
 * This function replaces all the occurrences of @p str in @p buf with
 * the string @p with.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_replace_all(buf:PEina_Strbuf; str:Pchar; with:Pchar):longint;cdecl;external;
{*
 * @brief Trims the string buffer.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function removes whitespace at the beginning and end of the
 * buffer's string.
  }
procedure eina_strbuf_trim(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Left trims the string buffer.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function removes whitespace at the beginning of the buffer's
 * string.
  }
procedure eina_strbuf_ltrim(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Right trims the string buffer.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function removes whitespace at the end of the buffer's string.
  }
procedure eina_strbuf_rtrim(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Converts the string to lower case.
 *
 * @param[in,out] buf The string buffer.
 *
 * This function converts all the characters in the buffer's string to
 * lower case.
 *
 * @since 1.17
  }
procedure eina_strbuf_tolower(buf:PEina_Strbuf);cdecl;external;
{*
 * @brief Obtains substring from a source string buffer.
 *
 * @param[in] buf The string buffer.
 * @param[in] pos The (0-based) position where the substring starts.
 * @param[in] len The length from @p pos that should be copied.
 * @return A string buffer containing the substring, or @c NULL if
 * invalid parameters were specified.
 *
 * This function creates a Eina_Strbuf containing a copy of a substring
 * of buf starting at @p pos with @p len length.  If len is 0, then an
 * empty strbuf will be returned.
 *
 * @since 1.17
  }
function eina_strbuf_substr_get(buf:PEina_Strbuf; pos:Tsize_t; len:Tsize_t):PEina_Strbuf;cdecl;external;
{*
 * @brief Gets a read-only slice of the buffer contents.
 *
 * @param[in] buf The string buffer.
 * @return A read-only slice of the current contents. It may become
 * invalid as soon as @p buf is changed.
 *
 * @since 1.19
  }
(* Const before type ignored *)
function eina_strbuf_slice_get(buf:PEina_Strbuf):TEina_Slice;cdecl;external;
{*
 * @brief Gets a read-write slice of the buffer contents.
 *
 * @param[in] buf The string buffer.
 * @return A read-write slice for the current contents. It may become
 * invalid as soon as the @p buf is changed, such as through calls like
 * eina_strbuf_append() or eina_strbuf_remove().
 *
 * @since 1.19.0
  }
(* Const before type ignored *)
function eina_strbuf_rw_slice_get(buf:PEina_Strbuf):TEina_Rw_Slice;cdecl;external;
{*
 * @brief Frees the buffer, returning its old contents.
 *
 * @param[in,out] buf The string buffer.
 * @return The string contained by buf. The caller must release the
 * memory of the returned string by calling free().
 *
 * @since 1.19
  }
function eina_strbuf_release(buf:PEina_Strbuf):Pchar;cdecl;external;
{*
 * @brief Appends a strftime-style timestamp to the buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The formatting string.
 * @param[in] tm The time value.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This function appends a timestamp to the buffer, formatted using
 * strftime.  A string of the exact size required by strftime's output
 * is added to the end.
 *
 * Example usage:
 * @code
 * time_t curr_time;
 * struct tm *info;
 * Eina_Strbuf *buf = eina_strbuf_new();
 * curr_time = time(NULL);
 * info = localtime(&curr_time);
 * eina_strbuf_append_strftime(buf, "%I:%M%p", info);
 * //after use
 * eina_strbuf_free(buf);
 * @endcode
 *
 * @since 1.21
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_append_strftime(buf:PEina_Strbuf; fmt:Pchar; tm:Ptm):TEina_Bool;cdecl;external;
{*
 * @brief Inserts a strftime-style timestamp into the buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The formatting string.
 * @param[in] tm The time value.
 * @param[in] pos The position in the buffer to insert the timestamp.
 * @return #EINA_TRUE on success, #EINA_FALSE on failure.
 *
 * This function inserts a timestamp into the buffer, formatted using
 * strftime.  The buffer's length will be increased by the exact amount
 * required by strftime's output.
 *
 * Example usage:
 * @code
 * time_t curr_time;
 * struct tm *info;
 * Eina_Strbuf *buf = eina_strbuf_new();
 * curr_time = time(NULL);
 * info = localtime(&curr_time);
 * eina_strbuf_insert_strftime(buf, "%I:%M%p", info, 2);
 * //after use
 * eina_strbuf_free(buf);
 * @endcode
 *
 * @since 1.21
  }
(* Const before type ignored *)
(* Const before type ignored *)
function eina_strbuf_insert_strftime(buf:PEina_Strbuf; fmt:Pchar; tm:Ptm; pos:Tsize_t):TEina_Bool;cdecl;external;
{*
 * @def eina_strbuf_prepend_strftime(buf, fmt, tm)
 * @brief Prepends a strftime-style timestamp to the buffer.
 *
 * @param[in,out] buf The string buffer.
 * @param[in] fmt The formatting string.
 * @param[in] tm The time value.
 * @return #EINA_TRUE on success, #EINA_FALSE if @p tm could not be prepended.
 *
 * This macro simply calls eina_strbuf_insert_strftime() with position 0.
 *
 * @since 1.21
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_strftime(buf,fmt,tm : longint) : longint;

{*
 * @
  }
{*
 * @
  }
{*
 * @
  }
{$endif}
{ EINA_STRBUF_H  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend(buf,str : longint) : longint;
begin
  eina_strbuf_prepend:=eina_strbuf_insert(buf,str,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_escaped(buf,str : longint) : longint;
begin
  eina_strbuf_prepend_escaped:=eina_strbuf_insert_escaped(buf,str,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_n(buf,str,maxlen : longint) : longint;
begin
  eina_strbuf_prepend_n:=eina_strbuf_insert_n(buf,str,maxlen,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_length(buf,str,length : longint) : longint;
begin
  eina_strbuf_prepend_length:=eina_strbuf_insert_length(buf,str,length,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_char(buf,c : longint) : longint;
begin
  eina_strbuf_prepend_char:=eina_strbuf_insert_char(buf,c,0);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_vprintf(buf,fmt,args : longint) : longint;
begin
  eina_strbuf_prepend_vprintf:=eina_strbuf_insert_vprintf(buf,fmt,0,args);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_replace_first(buf,str,with : longint) : longint;
begin
  eina_strbuf_replace_first:=eina_strbuf_replace(buf,str,with,1);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function eina_strbuf_prepend_strftime(buf,fmt,tm : longint) : longint;
begin
  eina_strbuf_prepend_strftime:=eina_strbuf_insert_strftime(buf,fmt,tm,0);
end;


end.
