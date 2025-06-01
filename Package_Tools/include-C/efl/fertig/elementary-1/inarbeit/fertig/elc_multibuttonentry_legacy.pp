
unit elc_multibuttonentry_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elc_multibuttonentry_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elc_multibuttonentry_legacy.h
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
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$include "elm_multibuttonentry_item_eo.legacy.h"}
{$include "elm_multibuttonentry_eo.legacy.h"}
{*
 * @brief Add a new multibuttonentry to the parent
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 *
 * @ingroup Multibuttonentry
  }

function elm_multibuttonentry_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set a function to format the string that will be used to display the
 * hidden items counter.
 *
 * If @c format_function is @c NULL, the default format will be used, which is
 * $"... + %d".
 *
 * @param[in] obj The object.
 * @param[in] format_function Format_function The actual format function
 * @param[in] data Data User data to passed to @c format_function
 *
 * @since 1.9
 *
 * @ingroup Multibuttonentry
  }
(* Const before type ignored *)
procedure elm_multibuttonentry_format_function_set(obj:PEo; format_function:TElm_Multibuttonentry_Format_Cb; data:pointer);cdecl;external;

implementation


end.
