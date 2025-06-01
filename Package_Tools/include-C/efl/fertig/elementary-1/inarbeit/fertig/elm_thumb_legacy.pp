
unit elm_thumb_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_thumb_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_thumb_legacy.h
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
Pdouble  = ^double;
PElm_Thumb_Animation_Setting  = ^Elm_Thumb_Animation_Setting;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{* Used to set if a video thumbnail is animating or not
 *
 * @ingroup Elm_Thumb
  }
{* Play animation once  }
{* Keep playing animation until stop is requested
                              }
{* Stop playing the animation  }
type
  PElm_Thumb_Animation_Setting = ^TElm_Thumb_Animation_Setting;
  TElm_Thumb_Animation_Setting =  Longint;
  Const
    ELM_THUMB_ANIMATION_START = 0;
    ELM_THUMB_ANIMATION_LOOP = 1;
    ELM_THUMB_ANIMATION_STOP = 2;
    ELM_THUMB_ANIMATION_LAST = 3;
;
{*
 * Add a new thumb object to the parent.
 *
 * @param parent The parent object.
 * @return The new object or NULL if it cannot be created.
 *
 * @see elm_thumb_file_set()
 * @see elm_thumb_ethumb_client_get()
 *
 * @ingroup Elm_Thumb
  }

function elm_thumb_add(parent:PEvas_Object):PEvas_Object;cdecl;external;
{*
 *
 * Set the file that will be used as thumbnail @b source.
 *
 * The file can be an image or a video (in that case extension will e used
 * to guess if it is a video or not). To start the video animation, use the
 * function elm_thumb_animate().
 *
 * @see elm_thumb_file_get()
 * @see elm_thumb_reload()
 * @see elm_thumb_animate()
 *
 * @ingroup Elm_Thumb
 *
 * @param[in] file The path to file that will be used as thumbnail source.
 * @param[in] key The key used in case of an EET file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_thumb_file_set(obj:PEo; file:Pchar; key:Pchar);cdecl;external;
{*
 *
 * Get the image or video path and key used to generate the thumbnail.
 *
 * @see elm_thumb_file_set()
 * @see elm_thumb_path_get()
 *
 * @ingroup Elm_Thumb
 *
 * @param[out] file The path to file that will be used as thumbnail source.
 * @param[out] key The key used in case of an EET file.
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_thumb_file_get(obj:PEo; file:PPchar; key:PPchar);cdecl;external;
{*
 * @brief Make the thumbnail 'editable'.
 *
 * This means the thumbnail is a valid drag target for drag and drop, and can
 * be cut or pasted too.
 *
 * @param[in] edit The editable state, default is @c false.
 *
 * @ingroup Elm_Thumb
  }
function elm_thumb_editable_set(obj:PEvas_Object; edit:TEina_Bool):TEina_Bool;cdecl;external;
{*
 * @brief Get whether the thumbnail is editable.
 *
 * This means the thumbnail is a valid drag target for drag and drop, and can
 * be cut or pasted too.
 *
 * @return The editable state, default is @c false.
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_editable_get(obj:PEvas_Object):TEina_Bool;cdecl;external;
{*
 * @brief Set the compression for the thumb object.
 *
 * @param[in] compress The compression of the thumb.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_compress_set(obj:PEvas_Object; compress:longint);cdecl;external;
{*
 * @brief Get the compression of the thumb object.
 *
 * @param[out] compress The compression of the thumb.
 *
 * @return Force the return type to be sure the argument doesn't become the
 * return
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
procedure elm_thumb_compress_get(obj:PEvas_Object; compress:Plongint);cdecl;external;
{*
 * @brief Set the format for the thumb object.
 *
 * @param[in] format The format setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_format_set(obj:PEvas_Object; format:TEthumb_Thumb_Format);cdecl;external;
{*
 * @brief Get the format of the thumb object.
 *
 * @return The format setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_format_get(obj:PEvas_Object):TEthumb_Thumb_Format;cdecl;external;
{*
 * @brief Set the animation state for the thumb object.
 *
 * If its content is an animated video, you may start/stop the animation or
 * tell it o play continuously and looping.
 *
 * @param[in] setting The animation setting or #ELM_THUMB_ANIMATION_LAST
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_animate_set(obj:PEvas_Object; setting:TElm_Thumb_Animation_Setting);cdecl;external;
{*
 * @brief Get the animation state for the thumb object.
 *
 * @return The animation setting or #ELM_THUMB_ANIMATION_LAST
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_animate_get(obj:PEvas_Object):TElm_Thumb_Animation_Setting;cdecl;external;
{*
 * @brief Set the FDO size for the thumb object.
 *
 * @param[in] size The FDO size setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_fdo_size_set(obj:PEvas_Object; size:TEthumb_Thumb_FDO_Size);cdecl;external;
{*
 * @brief Get the fdo size of the thumb object.
 *
 * @return The FDO size setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_fdo_size_get(obj:PEvas_Object):TEthumb_Thumb_FDO_Size;cdecl;external;
{*
 * @brief Set the orientation for the thumb object.
 *
 * @param[in] orient The orientation setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_orientation_set(obj:PEvas_Object; orient:TEthumb_Thumb_Orientation);cdecl;external;
{*
 * @brief Get the orientation of the thumb object.
 *
 * @return The orientation setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_orientation_get(obj:PEvas_Object):TEthumb_Thumb_Orientation;cdecl;external;
{*
 * @brief Set the aspect for the thumb object.
 *
 * @param[in] aspect The aspect setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_aspect_set(obj:PEvas_Object; aspect:TEthumb_Thumb_Aspect);cdecl;external;
{*
 * @brief Get the aspect of the thumb object.
 *
 * @return The aspect setting.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
function elm_thumb_aspect_get(obj:PEvas_Object):TEthumb_Thumb_Aspect;cdecl;external;
{*
 * @brief Set the quality for the thumb object.
 *
 * @param[in] quality The quality of the thumb.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_quality_set(obj:PEvas_Object; quality:longint);cdecl;external;
{*
 * @brief Get the quality of the thumb object.
 *
 * @param[out] quality The quality of the thumb.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
procedure elm_thumb_quality_get(obj:PEvas_Object; quality:Plongint);cdecl;external;
{*
 * @brief Set the size for the thumb object.
 *
 * @param[in] tw The width of the thumb.
 * @param[in] th The height of the thumb.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_size_set(obj:PEvas_Object; tw:longint; th:longint);cdecl;external;
{*
 * @brief Get the size of the thumb object.
 *
 * @param[out] tw The width of the thumb.
 * @param[out] th The height of the thumb.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
procedure elm_thumb_size_get(obj:PEvas_Object; tw:Plongint; th:Plongint);cdecl;external;
{*
 * @brief Set the crop alignment for the thumb object.
 *
 * @param[in] cropx The x coordinate of the crop.
 * @param[in] cropy The y coordinate of the crop.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_crop_align_set(obj:PEvas_Object; cropx:Tdouble; cropy:Tdouble);cdecl;external;
{*
 * @brief Get the crop alignment of the thumb object.
 *
 * @param[out] cropx The x coordinate of the crop.
 * @param[out] cropy The y coordinate of the crop.
 *
 * @since 1.8
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
procedure elm_thumb_crop_align_get(obj:PEvas_Object; cropx:Pdouble; cropy:Pdouble);cdecl;external;
{*
 * @brief Get the path and key to the image or video thumbnail generated by
 * ethumb.
 *
 * One just needs to make sure that the thumbnail was generated before getting
 * its path; otherwise, the path will be @c null. One way to do that is by
 * asking for the path when/after the "generate,stop" smart callback is called.
 *
 * @param[out] file Pointer to thumb path.
 * @param[out] key Pointer to thumb key.
 *
 * @ingroup Elm_Thumb
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure elm_thumb_path_get(obj:PEvas_Object; file:PPchar; key:PPchar);cdecl;external;
{*
 * @brief Reload thumbnail if it was generated before.
 *
 * This is useful if the ethumb client configuration changed, like its size,
 * aspect or any other property one set in the handle returned by
 * elm_thumb_ethumb_client_get().
 *
 * If the options didn't change, the thumbnail won't be generated again, but
 * the old one will still be used.
 *
 * @ingroup Elm_Thumb
  }
procedure elm_thumb_reload(obj:PEvas_Object);cdecl;external;
{$include "elm_thumb_eo.legacy.h"}

implementation


end.
