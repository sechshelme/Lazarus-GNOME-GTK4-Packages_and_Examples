
unit efl_gfx_arrangement_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_arrangement_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_arrangement_eo.h
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
Pdword  = ^dword;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Align  = ^Efl_Gfx_Align;
PEfl_Gfx_Arrangement  = ^Efl_Gfx_Arrangement;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_ARRANGEMENT_EO_H_}
{$define _EFL_GFX_ARRANGEMENT_EO_H_}
{$ifndef _EFL_GFX_ARRANGEMENT_EO_CLASS_TYPE}
{$define _EFL_GFX_ARRANGEMENT_EO_CLASS_TYPE}
type
  PEfl_Gfx_Arrangement = ^TEfl_Gfx_Arrangement;
  TEfl_Gfx_Arrangement = TEo;
{$endif}
{$ifndef _EFL_GFX_ARRANGEMENT_EO_TYPES}
{$define _EFL_GFX_ARRANGEMENT_EO_TYPES}
{$endif}
{* This interface provides methods for manipulating how contents are arranged
 * within a container, providing more granularity for content positioning.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Arrangement
  }

{ was #define dname def_expr }
function EFL_GFX_ARRANGEMENT_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_arrangement_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief This property determines how contents will be aligned within a
 * container if there is unused space.
 *
 * It is different than the @ref efl_gfx_hint_align_get property in that it
 * affects the position of all the contents within the container instead of the
 * container itself. For example, if a box widget has extra space on the
 * horizontal axis, this property can be used to align the box's contents to
 * the left or the right side.
 *
 * See also @ref efl_gfx_hint_align_get.
 *
 * @param[in] obj The object.
 * @param[in] align_horiz Controls the horizontal alignment.
 * @param[in] align_vert Controls the vertical alignment.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Arrangement
  }
procedure efl_gfx_arrangement_content_align_set(obj:PEo; align_horiz:TEfl_Gfx_Align; align_vert:TEfl_Gfx_Align);cdecl;external;
{*
 * @brief This property determines how contents will be aligned within a
 * container if there is unused space.
 *
 * It is different than the @ref efl_gfx_hint_align_get property in that it
 * affects the position of all the contents within the container instead of the
 * container itself. For example, if a box widget has extra space on the
 * horizontal axis, this property can be used to align the box's contents to
 * the left or the right side.
 *
 * See also @ref efl_gfx_hint_align_get.
 *
 * @param[in] obj The object.
 * @param[out] align_horiz Controls the horizontal alignment.
 * @param[out] align_vert Controls the vertical alignment.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Arrangement
  }
(* Const before type ignored *)
procedure efl_gfx_arrangement_content_align_get(obj:PEo; align_horiz:PEfl_Gfx_Align; align_vert:PEfl_Gfx_Align);cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This property determines the space between a container's content
 * items.
 *
 * It is different than the @ref efl_gfx_hint_margin_get property in that it is
 * applied to each content item within the container instead of a single item.
 * The calculation for these two properties is cumulative.
 *
 * See also @ref efl_gfx_hint_margin_get.
 *
 * @param[in] obj The object.
 * @param[in] pad_horiz Horizontal padding.
 * @param[in] pad_vert Vertical padding.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Arrangement
  }
procedure efl_gfx_arrangement_content_padding_set(obj:PEo; pad_horiz:dword; pad_vert:dword);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief This property determines the space between a container's content
 * items.
 *
 * It is different than the @ref efl_gfx_hint_margin_get property in that it is
 * applied to each content item within the container instead of a single item.
 * The calculation for these two properties is cumulative.
 *
 * See also @ref efl_gfx_hint_margin_get.
 *
 * @param[in] obj The object.
 * @param[out] pad_horiz Horizontal padding.
 * @param[out] pad_vert Vertical padding.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Arrangement
  }
(* Const before type ignored *)

procedure efl_gfx_arrangement_content_padding_get(obj:PEo; pad_horiz:Pdword; pad_vert:Pdword);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_ARRANGEMENT_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_ARRANGEMENT_INTERFACE:=efl_gfx_arrangement_interface_get;
  end;


end.
