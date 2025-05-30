
unit efl_access_editable_text_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_editable_text_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_editable_text_eo.h
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
PEfl_Access_Editable_Text  = ^Efl_Access_Editable_Text;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_EDITABLE_TEXT_EO_H_}
{$define _EFL_ACCESS_EDITABLE_TEXT_EO_H_}
{$ifndef _EFL_ACCESS_EDITABLE_TEXT_EO_CLASS_TYPE}
{$define _EFL_ACCESS_EDITABLE_TEXT_EO_CLASS_TYPE}
type
  PEfl_Access_Editable_Text = ^TEfl_Access_Editable_Text;
  TEfl_Access_Editable_Text = TEo;
{$endif}
{$ifndef _EFL_ACCESS_EDITABLE_TEXT_EO_TYPES}
{$define _EFL_ACCESS_EDITABLE_TEXT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary editable text interface
 *
 * @ingroup Efl_Access_Editable_Text
  }

{ was #define dname def_expr }
function EFL_ACCESS_EDITABLE_TEXT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_editable_text_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Editable content property
 *
 * @param[in] obj The object.
 * @param[in] string Content
 *
 * @return @c true if setting the value succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }
(* Const before type ignored *)
function efl_access_editable_text_content_set(obj:PEo; _string:Pchar):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Insert text at given position
 *
 * @param[in] obj The object.
 * @param[in] string String to be inserted
 * @param[in] position Position to insert string
 *
 * @return @c true if insert succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }
(* Const before type ignored *)

function efl_access_editable_text_insert(obj:PEo; _string:Pchar; position:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Copy text between start and end parameter
 *
 * @param[in] obj The object.
 * @param[in] start Start position to copy
 * @param[in] end End position to copy
 *
 * @return @c true if copy succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }

function efl_access_editable_text_copy(obj:PEo; start:longint; end:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Cut text between start and end parameter
 *
 * @param[in] obj The object.
 * @param[in] start Start position to cut
 * @param[in] end End position to cut
 *
 * @return @c true if cut succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }

function efl_access_editable_text_cut(obj:PEo; start:longint; end:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Delete text between start and end parameter
 *
 * @param[in] obj The object.
 * @param[in] start Start position to delete
 * @param[in] end End position to delete
 *
 * @return @c true if delete succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }

function efl_access_editable_text_delete(obj:PEo; start:longint; end:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_EDITABLE_TEXT_PROTECTED}
{*
 * @brief Paste text at given position
 *
 * @param[in] obj The object.
 * @param[in] position Position to insert text
 *
 * @return @c true if paste succeeded, @c false otherwise
 *
 * @ingroup Efl_Access_Editable_Text
  }

function efl_access_editable_text_paste(obj:PEo; position:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_EDITABLE_TEXT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_ACCESS_EDITABLE_TEXT_INTERFACE:=efl_access_editable_text_interface_get;
  end;


end.
