
unit efl_gfx_view_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_view_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_view_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_View  = ^Efl_Gfx_View;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_VIEW_EO_H_}
{$define _EFL_GFX_VIEW_EO_H_}
{$ifndef _EFL_GFX_VIEW_EO_CLASS_TYPE}
{$define _EFL_GFX_VIEW_EO_CLASS_TYPE}
type
  PEfl_Gfx_View = ^TEfl_Gfx_View;
  TEfl_Gfx_View = TEo;
{$endif}
{$ifndef _EFL_GFX_VIEW_EO_TYPES}
{$define _EFL_GFX_VIEW_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Interface for graphical objects with a native size which might be different
 * from the desired rendered size (controlled through the
 * @ref efl_gfx_view_size_get property).
 *
 * @ingroup Efl_Gfx_View
  }

{ was #define dname def_expr }
function EFL_GFX_VIEW_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_view_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The dimensions of this object's viewport.
 *
 * This property represents the size of an image (file on disk, vector
 * graphics, GL or 3D scene, ...) view: this is the logical size of a view, not
 * the number of pixels in the buffer, nor its visible size on the window.
 *
 * For scalable scenes (vector graphics, 3D or GL), this means scaling the
 * contents of the scene and drawing more pixels as a result; For pixmaps this
 * means zooming and stretching up or down the backing buffer to fit this view.
 *
 * In most cases the view should have the same dimensions as the object on the
 * canvas, for best quality.
 *
 * @ref efl_gfx_view_size_set may not be implemented. If it is, it might
 * trigger a complete recalculation of the scene, or reload of the pixel data.
 *
 * Refer to each implementing class specific documentation for more details.
 *
 * @param[in] obj The object.
 * @param[in] size Size of the view.
 *
 * @ingroup Efl_Gfx_View
  }
procedure efl_gfx_view_size_set(obj:PEo; size:TEina_Size2D);cdecl;external;
{*
 * @brief The dimensions of this object's viewport.
 *
 * This property represents the size of an image (file on disk, vector
 * graphics, GL or 3D scene, ...) view: this is the logical size of a view, not
 * the number of pixels in the buffer, nor its visible size on the window.
 *
 * For scalable scenes (vector graphics, 3D or GL), this means scaling the
 * contents of the scene and drawing more pixels as a result; For pixmaps this
 * means zooming and stretching up or down the backing buffer to fit this view.
 *
 * In most cases the view should have the same dimensions as the object on the
 * canvas, for best quality.
 *
 * @ref efl_gfx_view_size_set may not be implemented. If it is, it might
 * trigger a complete recalculation of the scene, or reload of the pixel data.
 *
 * Refer to each implementing class specific documentation for more details.
 *
 * @param[in] obj The object.
 *
 * @return Size of the view.
 *
 * @ingroup Efl_Gfx_View
  }
(* Const before type ignored *)
function efl_gfx_view_size_get(obj:PEo):TEina_Size2D;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_VIEW_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_VIEW_INTERFACE:=efl_gfx_view_interface_get;
  end;


end.
