
unit efl_canvas_layout_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_eo.h
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
PEfl_Canvas_Layout  = ^Efl_Canvas_Layout;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Input_Device  = ^Efl_Input_Device;
PEina_Iterator  = ^Eina_Iterator;
PEina_Stringshare  = ^Eina_Stringshare;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_EO_H_}
{$define _EFL_CANVAS_LAYOUT_EO_H_}
{$ifndef _EFL_CANVAS_LAYOUT_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout = ^TEfl_Canvas_Layout;
  TEfl_Canvas_Layout = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Edje object class
 *
 * The @ref efl_player_autoplay_get and @ref efl_player_playback_loop_get
 * properties both default to @c true in this class.
 *
 * @ingroup Efl_Canvas_Layout
  }

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_layout_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Whether this object is animating or not.
 *
 * This property indicates whether animations are stopped or not. Animations
 * here refer to transitions between states.
 *
 * If animations are disabled, transitions between states (as defined in EDC)
 * are then instantaneous. This is conceptually similar to setting the
 * @ref efl_player_playback_speed_get to an infinitely high value.
 *
 * @param[in] obj The object.
 * @param[in] on The animation state, @c true by default.
 *
 * @ingroup Efl_Canvas_Layout
  }
procedure efl_canvas_layout_animated_set(obj:PEo; on:TEina_Bool);cdecl;external;
{*
 * @brief Whether this object is animating or not.
 *
 * This property indicates whether animations are stopped or not. Animations
 * here refer to transitions between states.
 *
 * If animations are disabled, transitions between states (as defined in EDC)
 * are then instantaneous. This is conceptually similar to setting the
 * @ref efl_player_playback_speed_get to an infinitely high value.
 *
 * @param[in] obj The object.
 *
 * @return The animation state, @c true by default.
 *
 * @ingroup Efl_Canvas_Layout
  }
(* Const before type ignored *)
function efl_canvas_layout_animated_get(obj:PEo):TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Iterates over all accessibility-enabled part names.
 *
 * @param[in] obj The object.
 *
 * @return Part name iterator
 *
 * @ingroup Efl_Canvas_Layout
  }
function efl_canvas_layout_access_part_iterate(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{*
 * @brief The seat device given its Edje's name.
 *
 * Edje references seats by a name that differs from Evas. Edje naming follows
 * a incrementional convention: first registered name is "seat1", second is
 * "seat2", differently from Evas.
 *
 * @param[in] obj The object.
 * @param[in] name The name's character string.
 *
 * @return The seat device or @c null if not found.
 *
 * @ingroup Efl_Canvas_Layout
  }
(* Const before type ignored *)

function efl_canvas_layout_seat_get(obj:PEo; name:PEina_Stringshare):PEfl_Input_Device;cdecl;external;
{*
 * @brief The name given to a set by Edje.
 *
 * Edje references seats by a name that differs from Evas. Edje naming follows
 * a incrementional convention: first registered name is "seat1", second is
 * "seat2", differently from Evas.
 *
 * @param[in] obj The object.
 * @param[in] device The seat device
 *
 * @return The name's character string or @c null if not found.
 *
 * @ingroup Efl_Canvas_Layout
  }
(* Const before type ignored *)
function efl_canvas_layout_seat_name_get(obj:PEo; device:PEfl_Input_Device):PEina_Stringshare;cdecl;external;
{*
 * @brief The (last) file loading error for a given object.
 *
 * @param[in] obj The object.
 *
 * @return The load error code.
 *
 * @ingroup Efl_Canvas_Layout
  }
(* Const before type ignored *)
function efl_canvas_layout_load_error_get(obj:PEo):TEina_Error;cdecl;external;
{*
 * @brief Unswallow an object from this Edje.
 *
 * @param[in] obj The object.
 * @param[in] content To be removed content.
 *
 * @return @c false if @c content was not a child or can not be removed.
 *
 * @ingroup Efl_Canvas_Layout
  }
function efl_canvas_layout_content_remove(obj:PEo; content:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_LAYOUT_EVENT_PART_INVALID : TEfl_Event_Description;cvar;external;
{* Emitted when trying to use an invalid part. The value passed is the part
 * name.
 * @return const char *
 *
 * @ingroup Efl_Canvas_Layout
  }

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_PART_INVALID : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_LAYOUT_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_LAYOUT_CLASS:=efl_canvas_layout_class_get;
  end;

{ was #define dname def_expr }
function EFL_LAYOUT_EVENT_PART_INVALID : longint; { return type might be wrong }
  begin
    EFL_LAYOUT_EVENT_PART_INVALID:=@(_EFL_LAYOUT_EVENT_PART_INVALID);
  end;


end.
