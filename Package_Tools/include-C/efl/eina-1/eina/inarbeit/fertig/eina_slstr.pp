
unit eina_slstr;
interface

{
  Automatically converted by H2Pas 1.0.0 from eina_slstr.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    eina_slstr.h
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
PEina_Slstr  = ^Eina_Slstr;
PEina_Strbuf  = ^Eina_Strbuf;
PEina_Stringshare  = ^Eina_Stringshare;
PEina_Tmpstr  = ^Eina_Tmpstr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EINA_SLSTR_H_}
{$define EINA_SLSTR_H_}
{$include <stdlib.h>}
{$include "eina_config.h"}
{$include "eina_types.h"}
{$include "eina_tmpstr.h"}
{$include "eina_strbuf.h"}
{$include "eina_stringshare.h"}
{$include "eina_slice.h"}
{*
 * @addtogroup Eina_Slstr Short lived strings
 * @ingroup Eina
 *
 * @brief API for short lived strings (thread- and scope-local)
 *
 * This set of APIs provide a convenience feature to create and return strings
 * that are meant to be consumed in the local scope of the calling code block.
 * The lifecycle of those strings is bound to the loop of the current thread
 * or until the clear function is called explicitly.
 *
 * These strings will be automatically deleted.
 *
 * These functions shall return NULL only if out of memory.
 *
 * Do not call free or any similar function on a string created with this API!
 *
 * @since 1.19
  }
(* Const before type ignored *)
type
  PEina_Slstr = ^TEina_Slstr;
  TEina_Slstr = char;
{*
 * @brief Create a new short lived string by duplicating another string.
 *
 * @param[in] string An existing string, it will be copied.
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * char local[200];
 * sprintf(local, "Hello %d", value);
 * return eina_slstr_copy_new(local);
 * @endcode
 *
 * @since 1.19
  }
(* Const before type ignored *)

function eina_slstr_copy_new(_string:Pchar):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string by duplicating another string.
 *
 * @param[in] string An existing string, it will be copied.
 * @param[in] len How many charactere max to copy.
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * char local[200];
 * sprintf(local, "Hello %d", value);
 * return eina_slstr_copy_new_length(local, 5);
 * @endcode
 *
 * @since 1.19
  }
(* Const before type ignored *)
function eina_slstr_copy_new_length(_string:Pchar; len:Tsize_t):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string by taking ownership of a string.
 *
 * @param[in] string An existing string. It will not be duplicated.
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * char *local = strdup("Hello");
 * return eina_slstr_steal_new(local);
 * @endcode
 *
 * @since 1.19
  }
function eina_slstr_steal_new(_string:Pchar):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string by taking ownership of a stringshare.
 *
 * @param[in] string An existing stringshare, one reference belongs to this slstr.
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * Eina_Stringshare *local = eina_stringshare_add("Hello");
 * return eina_slstr_stringshare_new(local);
 * @endcode
 *
 * @since 1.19
  }
function eina_slstr_stringshare_new(_string:PEina_Stringshare):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string by taking ownership of a tmpstr.
 *
 * @param[in] string An existing tmpstr, it will be freed later.
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * Eina_Tmpstr *local = eina_tmpstr_add("Hello");
 * return eina_slstr_tmpstr_new(local);
 * @endcode
 *
 * @since 1.19
  }
function eina_slstr_tmpstr_new(_string:PEina_Tmpstr):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string by taking ownership of a strbuf.
 *
 * @param[in] string An existing strbuf, that will be released (i.e.. steal + free).
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * Eina_Strbuf *local = eina_strbuf_new();
 * eina_strbuf_append(local, "Hello");
 * eina_strbuf_append(local, " world");
 * return eina_slstr_strbuf_new(local);
 * @endcode
 *
 * @note Use eina_slstr_steal_new() if the strbuf will be used after this call.
 *
 * @since 1.19
  }
function eina_slstr_strbuf_new(_string:PEina_Strbuf):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string using sprintf.
 *
 * @param[in] fmt Format string for printf
 * @param[in] args List of format parameters for printf
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * @since 1.19
  }
(* Const before type ignored *)
function eina_slstr_vasprintf_new(fmt:Pchar; args:Tva_list):PEina_Slstr;cdecl;external;
{*
 * @brief Create a new short lived string using sprintf.
 *
 * @param[in] fmt Format string for printf
 * @param[in] args List of format parameters for printf
 * @return A new Eina_Slstr or NULL if out of memory.
 *
 * Usage example:
 * @code
 * return eina_slstr_printf("Hello world %d!", 42);
 * @endcode
 *
 * @since 1.19
  }
{
static inline Eina_Slstr *
eina_slstr_printf(const char *fmt, ...)

   Eina_Slstr *str;
   va_list args;

   va_start(args, fmt);
   str = eina_slstr_vasprintf_new(fmt, args);
   va_end(args);

   return str;

 }
{$ifdef EINA_SLSTR_INTERNAL}
{*
 * @brief Internal function to clear the strings.
 *
 * This internal function will be called by the local thread's loop to free
 * all the strings. Do not call this function unless you are absolutely certain
 * that no string in the queue will be used after this point.
 *
 * @since 1.19
  }
procedure eina_slstr_local_clear;cdecl;external;
{$endif}
{$endif}

implementation


end.
