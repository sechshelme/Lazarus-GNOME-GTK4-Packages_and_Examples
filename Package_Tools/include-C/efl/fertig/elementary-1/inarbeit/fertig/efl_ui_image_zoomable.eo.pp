
unit efl_ui_image_zoomable;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_image_zoomable.eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_image_zoomable.eo.h
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
PEfl_Ui_Image_Zoomable  = ^Efl_Ui_Image_Zoomable;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_H_}
{$define _EFL_UI_IMAGE_ZOOMABLE_EO_H_}
{$ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_CLASS_TYPE}
{$define _EFL_UI_IMAGE_ZOOMABLE_EO_CLASS_TYPE}
type
  PEfl_Ui_Image_Zoomable = ^TEfl_Ui_Image_Zoomable;
  TEfl_Ui_Image_Zoomable = TEo;
{$endif}
{$ifndef _EFL_UI_IMAGE_ZOOMABLE_EO_TYPES}
{$define _EFL_UI_IMAGE_ZOOMABLE_EO_TYPES}
{$endif}
{* Elementary Image Zoomable class
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
  }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_image_zoomable_class_get:PEfl_Class;cdecl;external;
{*
 * @brief The gesture state for photocam.
 *
 * This sets the gesture state to on or off for photocam. The default is off.
 * This will start multi touch zooming.
 *
 * @param[in] obj The object.
 * @param[in] gesture The gesture state.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
  }
procedure efl_ui_image_zoomable_gesture_enabled_set(obj:PEo; gesture:TEina_Bool);cdecl;external;
{*
 * @brief The gesture state for photocam.
 *
 * This sets the gesture state to on or off for photocam. The default is off.
 * This will start multi touch zooming.
 *
 * @param[in] obj The object.
 *
 * @return The gesture state.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
  }
(* Const before type ignored *)
function efl_ui_image_zoomable_gesture_enabled_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The region of the image that is currently shown
 *
 * Setting it shows the region of the image without using animation.
 *
 * @param[in] obj The object.
 * @param[in] region The region in the original image pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
  }
procedure efl_ui_image_zoomable_image_region_set(obj:PEo; region:TEina_Rect);cdecl;external;
{*
 * @brief The region of the image that is currently shown
 *
 * Setting it shows the region of the image without using animation.
 *
 * @param[in] obj The object.
 *
 * @return The region in the original image pixels.
 *
 * @since 1.23
 *
 * @ingroup Efl_Ui_Image_Zoomable
  }
(* Const before type ignored *)
function efl_ui_image_zoomable_image_region_get(obj:PEo):TEina_Rect;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE : TEfl_Event_Description;cvar;external;
(* Const before type ignored *)
    _EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR : TEfl_Event_Description;cvar;external;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_CLASS : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_CLASS:=efl_ui_image_zoomable_class_get;
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_PRESS);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOAD_DETAIL);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_LOADED_DETAIL);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_START);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_PROGRESS);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_DONE);
  end;

{ was #define dname def_expr }
function EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR : longint; { return type might be wrong }
  begin
    EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR:=@(_EFL_UI_IMAGE_ZOOMABLE_EVENT_DOWNLOAD_ERROR);
  end;


end.
