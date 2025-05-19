
unit efl_gfx_image_orientable_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_image_orientable_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_image_orientable_eo.h
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
PEfl_Gfx_Image_Orientable  = ^Efl_Gfx_Image_Orientable;
PEfl_Gfx_Image_Orientation  = ^Efl_Gfx_Image_Orientation;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_IMAGE_ORIENTABLE_EO_H_}
{$define _EFL_GFX_IMAGE_ORIENTABLE_EO_H_}
{$ifndef _EFL_GFX_IMAGE_ORIENTABLE_EO_CLASS_TYPE}
{$define _EFL_GFX_IMAGE_ORIENTABLE_EO_CLASS_TYPE}
type
  PEfl_Gfx_Image_Orientable = ^TEfl_Gfx_Image_Orientable;
  TEfl_Gfx_Image_Orientable = TEo;
{$endif}
{$ifndef _EFL_GFX_IMAGE_ORIENTABLE_EO_TYPES}
{$define _EFL_GFX_IMAGE_ORIENTABLE_EO_TYPES}
{*
 * @brief An orientation type, to rotate and flip images.
 *
 * This is similar to EXIF's orientation. Directional values ($up, @c down,
 * @c left, @c right) indicate the final direction in which the top of the
 * image will be facing (e.g. a picture of a house will have its roof pointing
 * to the right if the @c right orientation is used). Flipping values
 * ($flip_horizontal and @c flip_vertical) can be additionally added to produce
 * a mirroring in each axis. Not to be confused with
 * @ref Efl_Ui_Layout_Orientation which is meant for widgets, rather than
 * images and canvases. This enum is used to rotate images, videos and the
 * like.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Image_Orientation
  }
{*< Default, same as up, do not rotate.
                                       *
                                       * @since 1.23  }
{*< Orient up, do not rotate.
                                     *
                                     * @since 1.23  }
{*< Orient right, rotate 90 degrees
                                        * clock-wise.
                                        *
                                        * @since 1.23  }
{*< Orient down, rotate 180 degrees.
                                       *
                                       * @since 1.23  }
{*< Orient left, rotate 270 degrees
                                       * clock-wise.
                                       *
                                       * @since 1.23  }
{*< Bitmask that can be used
                                                   * to isolate rotation
                                                   * values, that is, @c none,
                                                   * @c up, @c down, @c left
                                                   * and @c right.
                                                   *
                                                   * @since 1.23  }
{*< Mirror horizontally. Can
                                                  * be added to the other
                                                  * values.
                                                  *
                                                  * @since 1.23  }
{*< Mirror vertically. Can be
                                                * added to the other values.
                                                *
                                                * @since 1.23  }
{*< Bitmask that can be used to
                                               * isolate flipping values, that
                                               * is, @c flip_vertical and
                                               * @c flip_horizontal.
                                               *
                                               * @since 1.23  }
type
  PEfl_Gfx_Image_Orientation = ^TEfl_Gfx_Image_Orientation;
  TEfl_Gfx_Image_Orientation =  Longint;
  Const
    EFL_GFX_IMAGE_ORIENTATION_NONE = 0;
    EFL_GFX_IMAGE_ORIENTATION_UP = 0;
    EFL_GFX_IMAGE_ORIENTATION_RIGHT = 1;
    EFL_GFX_IMAGE_ORIENTATION_DOWN = 2;
    EFL_GFX_IMAGE_ORIENTATION_LEFT = 3;
    EFL_GFX_IMAGE_ORIENTATION_ROTATION_BITMASK = 3;
    EFL_GFX_IMAGE_ORIENTATION_FLIP_HORIZONTAL = 4;
    EFL_GFX_IMAGE_ORIENTATION_FLIP_VERTICAL = 8;
    EFL_GFX_IMAGE_ORIENTATION_FLIP_BITMASK = 12;
;
{$endif}
{*
 * @brief Interface for images which can be rotated or flipped (mirrored).
 *
 * Compare with @ref Efl_Ui_Layout_Orientable which works for layout objects
 * and does not include rotation.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Image_Orientable
  }

{ was #define dname def_expr }
function EFL_GFX_IMAGE_ORIENTABLE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_image_orientable_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Control the orientation (rotation and flipping) of a visual object.
 *
 * This can be used to set the rotation on an image or a window, for instance.
 *
 * @param[in] obj The object.
 * @param[in] dir The final orientation of the object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Image_Orientable
  }
procedure efl_gfx_image_orientation_set(obj:PEo; dir:TEfl_Gfx_Image_Orientation);cdecl;external;
{*
 * @brief Control the orientation (rotation and flipping) of a visual object.
 *
 * This can be used to set the rotation on an image or a window, for instance.
 *
 * @param[in] obj The object.
 *
 * @return The final orientation of the object.
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Image_Orientable
  }
(* Const before type ignored *)
function efl_gfx_image_orientation_get(obj:PEo):TEfl_Gfx_Image_Orientation;cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_IMAGE_ORIENTABLE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_IMAGE_ORIENTABLE_INTERFACE:=efl_gfx_image_orientable_interface_get;
  end;


end.
