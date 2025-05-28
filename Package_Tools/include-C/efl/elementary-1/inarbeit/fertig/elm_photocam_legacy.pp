
unit elm_photocam_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_photocam_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_photocam_legacy.h
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
PElm_Photocam  = ^Elm_Photocam;
PElm_Photocam_Zoom_Mode  = ^Elm_Photocam_Zoom_Mode;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
  PElm_Photocam = ^TElm_Photocam;
  TElm_Photocam = TEo;
{*
 * @brief Add a new Photocam object
 *
 * @param parent The parent object
 * @return The new object or NULL if it cannot be created
 *
 * @ingroup Elm_Photocam_Group
  }

function elm_photocam_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Bring in the viewed portion of the image
 *
 * @param obj The photocam object
 * @param x X-coordinate of region in image original pixels
 * @param y Y-coordinate of region in image original pixels
 * @param w Width of region in image original pixels
 * @param h Height of region in image original pixels
 *
 * This shows the region of the image using animation.
 *
 * @ingroup Elm_Photocam_Group
  }
procedure elm_photocam_image_region_bring_in(obj:PEvas_Object; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 *
 * @brief Set the photo file to be shown
 *
 * @return The return error (see EVAS_LOAD_ERROR_NONE, EVAS_LOAD_ERROR_GENERIC etc.)
 *
 * This sets (and shows) the specified file (with a relative or absolute
 * path) and will return a load error (same error that
 * evas_object_image_load_error_get() will return). The image will change and
 * adjust its size at this point and begin a background load process for this
 * photo that at some time in the future will be displayed at the full
 * quality needed.
 *
 * @ingroup Elm_Photocam_Group
 *
 * @param[in] file The photo file
  }
(* Const before type ignored *)
function elm_photocam_file_set(obj:PEvas_Object; file:Pchar):TEvas_Load_Error;cdecl;external;
{*
 *
 * @brief Returns the path of the current image file
 *
 * @return Returns the path
 *
 * @see elm_photocam_file_set()
 *
 * @ingroup Elm_Photocam_Group
 *
  }
(* Const before type ignored *)
(* Const before type ignored *)
function elm_photocam_file_get(obj:PEvas_Object):Pchar;cdecl;external;
{*
 * @brief Set the photocam image orientation.
 *
 * This function allows to rotate or flip the photocam image.
 *
 * @param[in] orient The photocam image orientation @ref Evas_Image_Orient.
 * Default is #EVAS_IMAGE_ORIENT_NONE.
 *
 * @since 1.14
 *
 * @ingroup Elm_Photocam_Group
  }
procedure elm_photocam_image_orient_set(obj:PEvas_Object; orient:TEvas_Image_Orient);cdecl;external;
{*
 * @brief Get the photocam image orientation.
 *
 * @return The photocam image orientation @ref Evas_Image_Orient. Default is
 * #EVAS_IMAGE_ORIENT_NONE.
 *
 * @since 1.14
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
function elm_photocam_image_orient_get(obj:PEvas_Object):TEvas_Image_Orient;cdecl;external;
{*
 * @brief Get the internal low-res image used for photocam
 *
 * This gets the internal image object inside photocam. Do not modify it. It is
 * for inspection only, and hooking callbacks to. Nothing else. It may be
 * deleted at any time as well.
 *
 * @return The internal image object handle or @c null
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
function elm_photocam_internal_image_get(obj:PEvas_Object):PEvas_Object;cdecl;external;
{*
 * @brief Set the viewed region of the image
 *
 * This shows the region of the image without using animation.
 *
 * @param[in] x X-coordinate of region in image original pixels
 * @param[in] y Y-coordinate of region in image original pixels
 * @param[in] w Width of region in image original pixels
 * @param[in] h Height of region in image original pixels
 *
 * @ingroup Elm_Photocam_Group
  }
procedure elm_photocam_image_region_show(obj:PEvas_Object; x:longint; y:longint; w:longint; h:longint);cdecl;external;
{*
 * @brief Get the current image pixel width and height
 *
 * This gets the current photo pixel width and height (for the original). The
 * size will be returned in the integers @c w and @c h that are pointed to.
 *
 * @param[out] w A pointer to the width return
 * @param[out] h A pointer to the height return
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
procedure elm_photocam_image_size_get(obj:PEvas_Object; w:Plongint; h:Plongint);cdecl;external;
{*
 * @brief Get the paused state for photocam
 *
 * This gets the current paused state for the photocam object.
 *
 * @return The pause state.
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
function elm_photocam_paused_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the paused state for photocam
 *
 * This sets the paused state to on or off for photocam. The default is off.
 * This will stop zooming using animation on zoom level changes and change
 * instantly. This will stop any existing animations that are running.
 *
 * @param[in] paused The pause state.
 *
 * @ingroup Elm_Photocam_Group
  }
procedure elm_photocam_paused_set(obj:PEvas_Object; paused:TEina_Bool);cdecl;external;
{*
 * @brief Set the zoom level of the photo
 *
 * This sets the zoom level. If @c zoom is 1, it means no zoom. If it's smaller
 * than 1, it means zoom in. If it's bigger than 1, it means zoom out. For
 *  example, @c zoom 1 will be 1:1 pixel for pixel. @c zoom 2 will be 2:1 (that
 * is 2x2 photo pixels will display as 1 on-screen pixel) which is a zoom out.
 * 4:1 will be 4x4 photo pixels as 1 screen pixel, and so on. The @c zoom
 * parameter must be greater than 0. It is suggested to stick to powers of 2.
 * (1, 2, 4, 8, 16, 32, etc.).
 *
 * @param[in] zoom The zoom level to set
 *
 * @ingroup Elm_Photocam_Group
  }
procedure elm_photocam_zoom_set(obj:PEvas_Object; zoom:Tdouble);cdecl;external;
{*
 * @brief Get the zoom level of the photo
 *
 * This returns the current zoom level of the photocam object. Note that if you
 * set the fill mode to other than #ELM_PHOTOCAM_ZOOM_MODE_MANUAL (which is the
 * default), the zoom level may be changed at any time by the  photocam object
 * itself to account for photo size and photocam viewport size.
 *
 * @return The zoom level to set
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
function elm_photocam_zoom_get(obj:PEvas_Object):Tdouble;cdecl;external;
{*< Zoom controlled normally by elm_photocam_zoom_set  }
{*< Zoom until photo fits in zoomable object  }
{*< Zoom until photo fills zoomable object  }
{*< Zoom in until photo fits in zoomable object
                                  }
{*< Sentinel value to indicate last enum field during
                         * iteration  }
type
  PElm_Photocam_Zoom_Mode = ^TElm_Photocam_Zoom_Mode;
  TElm_Photocam_Zoom_Mode =  Longint;
  Const
    ELM_PHOTOCAM_ZOOM_MODE_MANUAL = 0;
    ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT = 1;
    ELM_PHOTOCAM_ZOOM_MODE_AUTO_FILL = 2;
    ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT_IN = 3;
    ELM_PHOTOCAM_ZOOM_MODE_LAST = 4;
;
{*
 * @brief Set the zoom mode
 *
 * This sets the zoom mode to manual or one of several automatic levels. Manual
 * (ELM_PHOTOCAM_ZOOM_MODE_MANUAL) means that zoom is set manually by
 * @ref elm_photocam_zoom_mode_set and will stay at that level until changed by
 * code or until zoom mode is changed. This is the default mode. The Automatic
 * modes will allow the photocam object to automatically adjust zoom mode based
 * on properties.
 *
 * #ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT) will adjust zoom so the photo fits EXACTLY
 * inside the scroll frame with no pixels outside this region.
 * #ELM_PHOTOCAM_ZOOM_MODE_AUTO_FILL will be similar but ensure no pixels
 * within the frame are left unfilled.
 *
 * @param[in] mode The zoom mode.
 *
 * @ingroup Elm_Photocam_Group
  }

procedure elm_photocam_zoom_mode_set(obj:PEvas_Object; mode:TElm_Photocam_Zoom_Mode);cdecl;external;
{*
 * @brief Get the zoom mode
 *
 * This gets the current zoom mode of the photocam object.
 *
 * @return The zoom mode.
 *
 * @ingroup Elm_Photocam_Group
  }
(* Const before type ignored *)
function elm_photocam_zoom_mode_get(obj:PEvas_Object):TElm_Photocam_Zoom_Mode;cdecl;external;
{*
 * @brief Get the region of the image that is currently shown
 *
 * See also @ref Efl.Ui.Image_Zoomable.image_region.set.
 *
 * @param[out] x X-coordinate of region in image original pixels
 * @param[out] y Y-coordinate of region in image original pixels
 * @param[out] w Width of region in image original pixels
 * @param[out] h Height of region in image original pixels
  }
(* Const before type ignored *)
procedure elm_photocam_image_region_get(obj:PEvas_Object; x:Plongint; y:Plongint; w:Plongint; h:Plongint);cdecl;external;
{$include "efl_ui_image_zoomable_eo.legacy.h"}

implementation


end.
