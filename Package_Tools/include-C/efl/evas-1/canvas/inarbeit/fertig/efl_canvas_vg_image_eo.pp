
unit efl_canvas_vg_image_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_vg_image_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_vg_image_eo.h
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
PEfl_Canvas_Vg_Image  = ^Efl_Canvas_Vg_Image;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_VG_IMAGE_EO_H_}
{$define _EFL_CANVAS_VG_IMAGE_EO_H_}
{$ifndef _EFL_CANVAS_VG_IMAGE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_VG_IMAGE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Vg_Image = ^TEfl_Canvas_Vg_Image;
  TEfl_Canvas_Vg_Image = TEo;
{$endif}
{$ifndef _EFL_CANVAS_VG_IMAGE_EO_TYPES}
{$define _EFL_CANVAS_VG_IMAGE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl vector graphics image class
 *
 * @ingroup Efl_Canvas_Vg_Image
  }

{ was #define dname def_expr }
function EFL_CANVAS_VG_IMAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_vg_image_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Set image data
 *
 * @param[in] obj The object.
 * @param[in] pixels Image pixels data. The pixel data type is 32bit RGBA
 * @param[in] size The size in pixels.
 *
 * @ingroup Efl_Canvas_Vg_Image
  }
procedure efl_canvas_vg_image_data_set(obj:PEo; pixels:pointer; size:TEina_Size2D);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_VG_IMAGE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_VG_IMAGE_CLASS:=efl_canvas_vg_image_class_get;
  end;


end.
