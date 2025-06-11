
unit efreet_ini;
interface

{
  Automatically converted by H2Pas 1.0.0 from efreet_ini.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efreet_ini.h
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
PEfreet_Ini  = ^Efreet_Ini;
PEina_Hash  = ^Eina_Hash;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFREET_INI_H}
{$define EFREET_INI_H}
{*
 * @internal
 * @file efreet_ini.h
 * @brief A simple and fast INI parser
 * @addtogroup Efreet_Ini Efreet_Ini: An INI parser
 * @ingroup Efreet
 *
 * @
  }
{*
 * Efreet_Ini
  }
type
{*
 * Efreet_Ini
 * @brief Contains all the information about an ini file.
  }
{*< Hash of string => (Hash of string => string)  }
{*< currently selected section  }
  PEfreet_Ini = ^TEfreet_Ini;
  TEfreet_Ini = record
      data : PEina_Hash;
      section : PEina_Hash;
    end;

{*
 * @param file The file to parse
 * @return Returns a new Efreet_Ini structure initialized with the contents
 * of @a file, or NULL on memory allocation failure
 * @brief Creates and initializes a new Ini structure with the contents of
 * @a file, or NULL on failure
  }
(* Const before type ignored *)

function efreet_ini_new(file:Pchar):PEfreet_Ini;cdecl;external;
{*
 * @param ini The Efreet_Ini to work with
 * @return Returns no value
 * @brief Frees the given Efree_Ini structure.
  }
procedure efreet_ini_free(ini:PEfreet_Ini);cdecl;external;
{*
 * @param ini The Efreet_Ini to work with
 * @param file The file to load
 * @return Returns no value
 * @brief Saves the given Efree_Ini structure.
  }
(* Const before type ignored *)
function efreet_ini_save(ini:PEfreet_Ini; path:Pchar):longint;cdecl;external;
{*
 * @param ini The Efreet_Ini to work with
 * @param section The section of the ini file we want to get values from
 * @return Returns 1 if the section exists, otherwise 0
 * @brief Sets the current working section of the ini file to @a section
  }
(* Const before type ignored *)
function efreet_ini_section_set(ini:PEfreet_Ini; section:Pchar):longint;cdecl;external;
{*
 * @param ini The Efreet_Ini to work with
 * @param section The section of the ini file we want to add
 * @return Returns no value
 * @brief Adds a new working section of the ini file to @a section
  }
(* Const before type ignored *)
procedure efreet_ini_section_add(ini:PEfreet_Ini; section:Pchar);cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to lookup
 * @return Returns the string associated with the given key or NULL if not
 * found.
 * @brief Retrieves the value for the given key or NULL if none found.
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_ini_string_get(ini:PEfreet_Ini; key:Pchar):Pchar;cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to use
 * @param value The value to set
 * @return Returns no value
 * @brief Sets the value for the given key
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efreet_ini_string_set(ini:PEfreet_Ini; key:Pchar; value:Pchar);cdecl;external;
{*
 * @param ini The ini struct to work with
 * @param key The key to search for
 * @return Returns the utf8 encoded string associated with @a key, or NULL
 *         if none found
 * @brief Retrieves the utf8 encoded string associated with @a key in the current locale or NULL if none found
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efreet_ini_localestring_get(ini:PEfreet_Ini; key:Pchar):Pchar;cdecl;external;
{*
 * @param ini The ini struct to work with
 * @param key The key to use
 * @param value The value to set
 * @return Returns no value
 * @brief Sets the value for the given key
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efreet_ini_localestring_set(ini:PEfreet_Ini; key:Pchar; value:Pchar);cdecl;external;
{*
 * @param ini The ini struct to work with
 * @param key The key to search for
 * @return Returns 1 if the boolean is true, 0 otherwise
 * @brief Retrieves the boolean value at key @a key from the ini @a ini
  }
(* Const before type ignored *)
function efreet_ini_boolean_get(ini:PEfreet_Ini; key:Pchar):dword;cdecl;external;
{*
 * @param ini The ini struct to work with
 * @param key The key to use
 * @param value The value to set
 * @return Returns no value
 * @brief Sets the value for the given key
  }
(* Const before type ignored *)
procedure efreet_ini_boolean_set(ini:PEfreet_Ini; key:Pchar; value:dword);cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to lookup
 * @return Returns the integer associated with the given key or -1 if not
 * found.
 * @brief Retrieves the value for the given key or -1 if none found.
  }
(* Const before type ignored *)
function efreet_ini_int_get(ini:PEfreet_Ini; key:Pchar):longint;cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to use
 * @param value The value to set
 * @return Returns no value
 * @brief Sets the value for the given key
  }
(* Const before type ignored *)
procedure efreet_ini_int_set(ini:PEfreet_Ini; key:Pchar; value:longint);cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to lookup
 * @return Returns the double associated with the given key or -1 if not
 * found.
 * @brief Retrieves the value for the given key or -1 if none found.
  }
(* Const before type ignored *)
function efreet_ini_double_get(ini:PEfreet_Ini; key:Pchar):Tdouble;cdecl;external;
{*
 * @param ini The Efree_Ini to work with
 * @param key The key to use
 * @param value The value to set
 * @return Returns no value
 * @brief Sets the value for the given key
  }
(* Const before type ignored *)
procedure efreet_ini_double_set(ini:PEfreet_Ini; key:Pchar; value:Tdouble);cdecl;external;
{*
 * @param ini The ini struct to work with
 * @param key The key to remove
 * @return Returns no value
 * @brief Remove the given key from the ini struct
  }
(* Const before type ignored *)
procedure efreet_ini_key_unset(ini:PEfreet_Ini; key:Pchar);cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
