
unit efl_canvas_layout_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_layout_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_layout_eo_legacy.h
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
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Input_Device  = ^Efl_Input_Device;
PEina_Stringshare  = ^Eina_Stringshare;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_LAYOUT_EO_LEGACY_H_}
{$define _EFL_CANVAS_LAYOUT_EO_LEGACY_H_}
{$ifndef _EFL_CANVAS_LAYOUT_EO_CLASS_TYPE}
{$define _EFL_CANVAS_LAYOUT_EO_CLASS_TYPE}
type
  PEfl_Canvas_Layout = ^TEfl_Canvas_Layout;
  TEfl_Canvas_Layout = TEo;
{$endif}
{$ifndef _EFL_CANVAS_LAYOUT_EO_TYPES}
{$define _EFL_CANVAS_LAYOUT_EO_TYPES}
{$endif}
{*
 * @brief Whether this object is animating or not.
 *
 * This property indicates whether animations are stopped or not. Animations
 * here refer to transitions between states.
 *
 * If animations are disabled, transitions between states (as defined in EDC)
 * are then instantaneous. This is conceptually similar to setting the
 * @ref Efl.Player.playback_speed to an infinitely high value.
 *
 * Start or stop animating this object.
 *
 * @param[in] obj The object.
 * @param[in] on The animation state, @c true by default.
 *
 * @ingroup Edje_Object_Group
  }

procedure edje_object_animation_set(obj:PEfl_Canvas_Layout; on:TEina_Bool);cdecl;external;
{*
 * @brief Whether this object is animating or not.
 *
 * This property indicates whether animations are stopped or not. Animations
 * here refer to transitions between states.
 *
 * If animations are disabled, transitions between states (as defined in EDC)
 * are then instantaneous. This is conceptually similar to setting the
 * @ref Efl.Player.playback_speed to an infinitely high value.
 *
 * Get the current state of animation, @c true by default.
 *
 * @param[in] obj The object.
 *
 * @return The animation state, @c true by default.
 *
 * @ingroup Edje_Object_Group
  }
(* Const before type ignored *)
function edje_object_animation_get(obj:PEfl_Canvas_Layout):TEina_Bool;cdecl;external;
{*
 * @brief Returns the seat device given its Edje's name.
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
 * @since 1.19
 *
 * @ingroup Edje_Object_Group
  }
(* Const before type ignored *)
function edje_object_seat_get(obj:PEfl_Canvas_Layout; name:PEina_Stringshare):PEfl_Input_Device;cdecl;external;
{*
 * @brief Gets the name given to a set by Edje.
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
 * @since 1.19
 *
 * @ingroup Edje_Object_Group
  }
(* Const before type ignored *)
function edje_object_seat_name_get(obj:PEfl_Canvas_Layout; device:PEfl_Input_Device):PEina_Stringshare;cdecl;external;
{*
 * @brief Gets the (last) file loading error for a given object.
 *
 * @param[in] obj The object.
 *
 * @return The load error code.
 *
 * @ingroup Edje_Object_Group
  }
(* Const before type ignored *)
function edje_object_layout_load_error_get(obj:PEfl_Canvas_Layout):TEina_Error;cdecl;external;
{*
 * @brief Unswallow an object from this Edje.
 *
 * @param[in] obj The object.
 * @param[in] content To be removed content.
 *
 * @return @c false if @c content was not a child or can not be removed.
 *
 * @ingroup Edje_Object_Group
  }
function edje_object_content_remove(obj:PEfl_Canvas_Layout; content:PEfl_Gfx_Entity):TEina_Bool;cdecl;external;
{$endif}

implementation


end.
