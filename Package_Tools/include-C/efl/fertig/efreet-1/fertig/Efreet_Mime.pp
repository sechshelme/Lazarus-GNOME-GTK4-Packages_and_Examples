
unit Efreet_Mime;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efreet_Mime.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efreet_Mime.h
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
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_MIME_H}
{$define EFREET_MIME_H}
{*
 * @file Efreet_Mime.h
 * @brief The file that must be included by any project wishing to use
 * @addtogroup Efreet_Mime Efreet_Mime: The XDG Shared Mime Info standard
 * Efreet Mime is a library designed to help apps work with the
 * Freedesktop.org Shared Mime Info standard.
 * Efreet_Mime.h provides all of the necessary headers and
 * includes to work with Efreet_Mime.
 *
 * @ingroup Efreet
 * @
  }
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @return @c 1 on success or @c 0 on failure.
 * @brief Initializes the efreet mime settings
  }

function efreet_mime_init:longint;cdecl;external;
{*
 * @return The number of times the init function has been called minus the
 * corresponding init call.
 * @brief Shuts down Efreet mime settings system if a balanced number of
 * init/shutdown calls have been made
  }
function efreet_mime_shutdown:longint;cdecl;external;
{*
 * @param file The file to find the mime type
 * @return Mime type as a string or NULL if the file doesn't exist.
 * @brief Retrieve the mime type of a file
 * @note The return value of this function is not guaranteed to be stringshared.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_type_get(file:Pchar):Pchar;cdecl;external;
{*
 * @param file The file to check the mime type
 * @return Mime type as a string.
 * @brief Retrieve the mime type of a file using magic
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_magic_type_get(file:Pchar):Pchar;cdecl;external;
{*
 * @param file The file to check the mime type
 * @return Mime type as a string.
 * @brief Retrieve the mime type of a file using globs
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_globs_type_get(file:Pchar):Pchar;cdecl;external;
{*
 * @param file The file to check the mime type
 * @return Mime type as a string.
 * @brief Retrieve the special mime type of a file
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_special_type_get(file:Pchar):Pchar;cdecl;external;
{*
 * @param file The file to check the mime type
 * @return Mime type as a string.
 * @brief Retrieve the fallback mime type of a file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_fallback_type_get(file:Pchar):Pchar;cdecl;external;
{*
 * @param mime The name of the mime type
 * @param theme The name of the theme to search icons in
 * @param size The wanted size of the icon
 * @return Mime type icon path as a string.
 * @brief Retrieve the mime type icon for a file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_mime_type_icon_get(mime:Pchar; theme:Pchar; size:dword):Pchar;cdecl;external;
{*
 * @brief Clear mime icons mapping cache
  }
procedure efreet_mime_type_cache_clear;cdecl;external;
{*
 * @brief Flush mime icons mapping cache
 *
 * Flush timeout is defined at compile time by
 * EFREET_MIME_ICONS_FLUSH_TIMEOUT
  }
procedure efreet_mime_type_cache_flush;cdecl;external;
{*
 * @
  }

implementation


end.
