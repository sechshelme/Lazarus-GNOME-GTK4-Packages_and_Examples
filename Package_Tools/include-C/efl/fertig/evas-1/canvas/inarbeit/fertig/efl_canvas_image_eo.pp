
unit efl_canvas_image_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_image_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_image_eo.h
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
PEfl_Canvas_Image  = ^Efl_Canvas_Image;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_IMAGE_EO_H_}
{$define _EFL_CANVAS_IMAGE_EO_H_}
{$ifndef _EFL_CANVAS_IMAGE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_IMAGE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Image = ^TEfl_Canvas_Image;
  TEfl_Canvas_Image = TEo;
{$endif}
{$ifndef _EFL_CANVAS_IMAGE_EO_TYPES}
{$define _EFL_CANVAS_IMAGE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Low-level Image object.
 *
 * This replaces the legacy Evas Object Image, with only image-related
 * interfaces: file and data images only. This object does not implement any
 * special features such as proxy, snapshot or GL.
 *
 * @ingroup Efl_Canvas_Image
  }

{ was #define dname def_expr }
function EFL_CANVAS_IMAGE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_image_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_IMAGE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_IMAGE_CLASS:=efl_canvas_image_class_get;
  end;


end.
