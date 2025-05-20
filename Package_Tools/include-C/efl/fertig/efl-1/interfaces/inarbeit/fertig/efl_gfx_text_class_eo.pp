
unit efl_gfx_text_class_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_text_class_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_text_class_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Font_Size  = ^Efl_Font_Size;
PEfl_Gfx_Text_Class  = ^Efl_Gfx_Text_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_TEXT_CLASS_EO_H_}
{$define _EFL_GFX_TEXT_CLASS_EO_H_}
{$ifndef _EFL_GFX_TEXT_CLASS_EO_CLASS_TYPE}
{$define _EFL_GFX_TEXT_CLASS_EO_CLASS_TYPE}
type
  PEfl_Gfx_Text_Class = ^TEfl_Gfx_Text_Class;
  TEfl_Gfx_Text_Class = TEo;
{$endif}
{$ifndef _EFL_GFX_TEXT_CLASS_EO_TYPES}
{$define _EFL_GFX_TEXT_CLASS_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl Gfx Text Class interface
 *
 * @ingroup Efl_Gfx_Text_Class
  }

{ was #define dname def_expr }
function EFL_GFX_TEXT_CLASS_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_text_class_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Font and font size from edje text class.
 *
 * When reading the font string will only be valid until the text class is
 * changed or the edje object is deleted.
 *
 * @param[in] obj The object.
 * @param[in] text_class The text class name
 * @param[in] font Font name
 * @param[in] size Font Size
 *
 * @return @c true, on success or @c false, on error
 *
 * @ingroup Efl_Gfx_Text_Class
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_text_class_set(obj:PEo; text_class:Pchar; font:Pchar; size:TEfl_Font_Size):TEina_Bool;cdecl;external;
{*
 * @brief Font and font size from edje text class.
 *
 * When reading the font string will only be valid until the text class is
 * changed or the edje object is deleted.
 *
 * @param[in] obj The object.
 * @param[in] text_class The text class name
 * @param[out] font Font name
 * @param[out] size Font Size
 *
 * @return @c true, on success or @c false, on error
 *
 * @ingroup Efl_Gfx_Text_Class
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_text_class_get(obj:PEo; text_class:Pchar; font:PPchar; size:PEfl_Font_Size):TEina_Bool;cdecl;external;
{*
 * @brief Delete the text class.
 *
 * This function deletes any values for the specified text class.
 *
 * Deleting the text class will revert it to the values defined by
 * @ref efl_gfx_text_class_set() or the text class defined in the theme file.
 *
 * @param[in] obj The object.
 * @param[in] text_class The text class to be deleted.
 *
 * @ingroup Efl_Gfx_Text_Class
  }
(* Const before type ignored *)
procedure efl_gfx_text_class_del(obj:PEo; text_class:Pchar);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_TEXT_CLASS_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_TEXT_CLASS_INTERFACE:=efl_gfx_text_class_interface_get;
  end;


end.
