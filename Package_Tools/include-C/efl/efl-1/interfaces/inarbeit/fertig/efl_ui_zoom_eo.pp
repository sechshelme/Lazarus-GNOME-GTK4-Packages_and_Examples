
unit efl_ui_zoom_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_zoom_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_zoom_eo.h
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
PEfl_Ui_Zoom  = ^Efl_Ui_Zoom;
PEfl_Ui_Zoom_Mode  = ^Efl_Ui_Zoom_Mode;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_UI_ZOOM_EO_H_}
{$define _EFL_UI_ZOOM_EO_H_}
{$ifndef _EFL_UI_ZOOM_EO_CLASS_TYPE}
{$define _EFL_UI_ZOOM_EO_CLASS_TYPE}
type
  PEfl_Ui_Zoom = ^TEfl_Ui_Zoom;
  TEfl_Ui_Zoom = TEo;
{$endif}
{$ifndef _EFL_UI_ZOOM_EO_TYPES}
{$define _EFL_UI_ZOOM_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* Types of zoom available.
 *
 * @ingroup Efl_Ui_Zoom_Mode
  }
{*< Zoom controlled manually by
                                * @ref efl_ui_zoom_level_get.  }
{*< Zoom until whole image fits inside object.
                              * Parts of the object might be left blank.  }
{*< Zoom until image fills the object. Parts of
                               * the image might not show.  }
{*< Zoom in until image fits inside object.  }
{*< Internal. Sentinel value to indicate last enum
                         * field during iteration.  }
type
  PEfl_Ui_Zoom_Mode = ^TEfl_Ui_Zoom_Mode;
  TEfl_Ui_Zoom_Mode =  Longint;
  Const
    EFL_UI_ZOOM_MODE_MANUAL = 0;
    EFL_UI_ZOOM_MODE_AUTO_FIT = 1;
    EFL_UI_ZOOM_MODE_AUTO_FILL = 2;
    EFL_UI_ZOOM_MODE_AUTO_FIT_IN = 3;
    EFL_UI_ZOOM_MODE_LAST = 4;
;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Efl UI zoom interface
 *
 * @ingroup Efl_Ui_Zoom
  }

{ was #define dname def_expr }
function EFL_UI_ZOOM_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_ui_zoom_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief This sets the zoom animation state to on or off for zoomable. The
 * default is off. When @c paused is @c true, it will stop zooming using
 * animation on zoom level changes and change instantly, stopping any existing
 * animations that are running.
 *
 * @param[in] obj The object.
 * @param[in] paused The paused state.
 *
 * @ingroup Efl_Ui_Zoom
  }
procedure efl_ui_zoom_animation_set(obj:PEo; paused:TEina_Bool);cdecl;external;
{*
 * @brief This sets the zoom animation state to on or off for zoomable. The
 * default is off. When @c paused is @c true, it will stop zooming using
 * animation on zoom level changes and change instantly, stopping any existing
 * animations that are running.
 *
 * @param[in] obj The object.
 *
 * @return The paused state.
 *
 * @ingroup Efl_Ui_Zoom
  }
(* Const before type ignored *)
function efl_ui_zoom_animation_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Zoom level of the image.
 *
 * This selects the zoom level. If @c zoom is 1, it means no zoom. If it's
 * smaller than 1, it means zoom in. If it's bigger than 1, it means zoom out.
 * For  example, @c zoom 1 will be 1:1 pixel for pixel. @c zoom 2 will be 2:1
 * (that is 2x2 photo pixels will display as 1 on-screen pixel) which is a zoom
 * out. 4:1 will be 4x4 photo pixels as 1 screen pixel, and so on. The @c zoom
 * parameter must be greater than 0. It is suggested to stick to powers of 2.
 * (1, 2, 4, 8, 16, 32, etc.).
 *
 * Note that if you set @ref efl_ui_zoom_mode_get to anything other than
 * @ref EFL_UI_ZOOM_MODE_MANUAL (which is the default value) the
 * @ref efl_ui_zoom_level_get might be changed at any time by the zoomable
 * object itself to account for image and viewport size changes.
 *
 * @param[in] obj The object.
 * @param[in] zoom The image's current zoom level.
 *
 * @ingroup Efl_Ui_Zoom
  }
procedure efl_ui_zoom_level_set(obj:PEo; zoom:Tdouble);cdecl;external;
{*
 * @brief Zoom level of the image.
 *
 * This selects the zoom level. If @c zoom is 1, it means no zoom. If it's
 * smaller than 1, it means zoom in. If it's bigger than 1, it means zoom out.
 * For  example, @c zoom 1 will be 1:1 pixel for pixel. @c zoom 2 will be 2:1
 * (that is 2x2 photo pixels will display as 1 on-screen pixel) which is a zoom
 * out. 4:1 will be 4x4 photo pixels as 1 screen pixel, and so on. The @c zoom
 * parameter must be greater than 0. It is suggested to stick to powers of 2.
 * (1, 2, 4, 8, 16, 32, etc.).
 *
 * Note that if you set @ref efl_ui_zoom_mode_get to anything other than
 * @ref EFL_UI_ZOOM_MODE_MANUAL (which is the default value) the
 * @ref efl_ui_zoom_level_get might be changed at any time by the zoomable
 * object itself to account for image and viewport size changes.
 *
 * @param[in] obj The object.
 *
 * @return The image's current zoom level.
 *
 * @ingroup Efl_Ui_Zoom
  }
(* Const before type ignored *)
function efl_ui_zoom_level_get(obj:PEo):Tdouble;cdecl;external;
{*
 * @brief Zoom mode.
 *
 * This sets the zoom mode to manual or one of several automatic levels.
 * @ref EFL_UI_ZOOM_MODE_MANUAL means that zoom is controlled manually by
 * @ref efl_ui_zoom_level_get and will stay at that level until changed by code
 * or until @ref efl_ui_zoom_mode_get is changed. This is the default mode. The
 * Automatic modes will allow the zoomable object to automatically adjust zoom
 * mode based on image and viewport size changes.
 *
 * @param[in] obj The object.
 * @param[in] mode The zoom mode.
 *
 * @ingroup Efl_Ui_Zoom
  }
procedure efl_ui_zoom_mode_set(obj:PEo; mode:TEfl_Ui_Zoom_Mode);cdecl;external;
{*
 * @brief Zoom mode.
 *
 * This sets the zoom mode to manual or one of several automatic levels.
 * @ref EFL_UI_ZOOM_MODE_MANUAL means that zoom is controlled manually by
 * @ref efl_ui_zoom_level_get and will stay at that level until changed by code
 * or until @ref efl_ui_zoom_mode_get is changed. This is the default mode. The
 * Automatic modes will allow the zoomable object to automatically adjust zoom
 * mode based on image and viewport size changes.
 *
 * @param[in] obj The object.
 *
 * @return The zoom mode.
 *
 * @ingroup Efl_Ui_Zoom
  }
(* Const before type ignored *)
function efl_ui_zoom_mode_get(obj:PEo):TEfl_Ui_Zoom_Mode;cdecl;external;
(* Const before type ignored *)
  var
    _EFL_UI_EVENT_ZOOM_START : TEfl_Event_Description;cvar;external;
{* Called when zooming started
 *
 * @ingroup Efl_Ui_Zoom
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ZOOM_STOP : TEfl_Event_Description;cvar;external;
{* Called when zooming stopped
 *
 * @ingroup Efl_Ui_Zoom
  }
(* Const before type ignored *)
    _EFL_UI_EVENT_ZOOM_CHANGE : TEfl_Event_Description;cvar;external;
{* Called when zooming changed
 *
 * @ingroup Efl_Ui_Zoom
  }

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_START : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_STOP : longint; { return type might be wrong }

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_CHANGE : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_UI_ZOOM_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_UI_ZOOM_INTERFACE:=efl_ui_zoom_interface_get;
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_START : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ZOOM_START:=@(_EFL_UI_EVENT_ZOOM_START);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_STOP : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ZOOM_STOP:=@(_EFL_UI_EVENT_ZOOM_STOP);
  end;

{ was #define dname def_expr }
function EFL_UI_EVENT_ZOOM_CHANGE : longint; { return type might be wrong }
  begin
    EFL_UI_EVENT_ZOOM_CHANGE:=@(_EFL_UI_EVENT_ZOOM_CHANGE);
  end;


end.
