
unit Efreet_Trash;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efreet_Trash.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efreet_Trash.h
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
PEfreet_Uri  = ^Efreet_Uri;
PEina_List  = ^Eina_List;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_TRASH_H}
{$define EFREET_TRASH_H}
{$ifdef extern}
{$undef extern}
{$endif}
{*
 * @file Efreet_Trash.h
 * @brief Contains the methods used to support the FDO trash specification.
 * @addtogroup Efreet_Trash Efreet_Trash: The XDG Trash Specification
 * Efreet_Trash.h provides all of the necessary headers and includes to
 * work with Efreet_Trash.
 *
 * @ingroup Efreet
 * @
  }
{*
 * @return @c 1 on success or @c 0 on failure.
 * @brief Initializes the efreet trash system
  }

function efreet_trash_init:longint;cdecl;external;
{*
 * @return No value.
 * @brief Cleans up the efreet trash system
  }
function efreet_trash_shutdown:longint;cdecl;external;
{*
 * @return The XDG Trash local directory or @c NULL on errors.
 * Return value must be freed with eina_stringshare_del.
 * @brief Retrieves the XDG Trash local directory
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_trash_dir_get(for_file:Pchar):Pchar;cdecl;external;
{*
 * @param uri The local uri to move in the trash
 * @param force_delete If you set this to @c 1 than files on different filesystems
 * will be deleted permanently
 * @return @c 1 on success, @c 0 on failure or @c -1 in case the uri is not on
 * the same filesystem and force_delete is not set.
 * @brief This function try to move the given uri to the trash. Files on
 * different filesystem can't be moved to trash. If force_delete
 * is @c 0 than non-local files will be ignored and @c -1 is returned, if you set
 * force_delete to @c 1 non-local files will be deleted without asking.
  }
function efreet_trash_delete_uri(uri:PEfreet_Uri; force_delete:longint):longint;cdecl;external;
{*
 * @return A list of strings with filename (remember to free the list
 * when you don't need anymore).
 * @brief List all the files and directory currently inside the trash.
  }
function efreet_trash_ls:PEina_List;cdecl;external;
{*
 * @return @c 1 if the trash is empty or @c 0 if some file are in.
 * @brief Check if the trash is currently empty
  }
function efreet_trash_is_empty:longint;cdecl;external;
{*
 * @return @c 1 on success or @c 0 on failure.
 * @brief Delete all the files inside the trash.
  }
function efreet_trash_empty_trash:longint;cdecl;external;
{*
 * @
  }

implementation


end.
