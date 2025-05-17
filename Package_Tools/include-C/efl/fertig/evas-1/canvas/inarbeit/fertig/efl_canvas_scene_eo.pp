
unit efl_canvas_scene_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_scene_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_scene_eo.h
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
PEfl_Canvas_Scene  = ^Efl_Canvas_Scene;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Input_Device  = ^Efl_Input_Device;
PEina_Iterator  = ^Eina_Iterator;
PEina_Position2D  = ^Eina_Position2D;
PEina_Size2D  = ^Eina_Size2D;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_SCENE_EO_H_}
{$define _EFL_CANVAS_SCENE_EO_H_}
{$ifndef _EFL_CANVAS_SCENE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_SCENE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Scene = ^TEfl_Canvas_Scene;
  TEfl_Canvas_Scene = TEo;
{$endif}
{$ifndef _EFL_CANVAS_SCENE_EO_TYPES}
{$define _EFL_CANVAS_SCENE_EO_TYPES}
{$endif}
{* Interface containing basic canvas-related methods and events.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_scene_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The maximum image size the canvas can possibly handle.
 *
 * This function returns the largest image or surface size that the canvas can
 * handle in pixels, and if there is one, returns @c true. It returns @c false
 * if no extra constraint on maximum image size exists.
 *
 * The default limit is 65535x65535.
 *
 * @param[in] obj The object.
 * @param[out] max The maximum image size (in pixels).
 *
 * @return @c true on success, @c false otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)
function efl_canvas_scene_image_max_size_get(obj:PEo; max:PEina_Size2D):TEina_Bool;cdecl;external;
{* Call user-provided @c calculate group functions and unset the flag
 * signalling that the object needs to get recalculated to all group objects in
 * the canvas.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
procedure efl_canvas_scene_group_objects_calculate(obj:PEo);cdecl;external;
{*
 * @brief Get if the canvas is currently calculating group objects.
 *
 * @param[in] obj The object.
 *
 * @return @c true if currently calculating group objects.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)
function efl_canvas_scene_group_objects_calculating_get(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief Retrieve a list of objects at a given position in a canvas.
 *
 * This function will traverse all the layers of the given canvas, from top to
 * bottom, querying for objects with areas covering the given position. The
 * user can exclude from the query objects which are hidden and/or which are
 * set to pass events.
 *
 * @warning This function will only evaluate top-level objects; child or "sub"
 * objects will be skipped.
 *
 * @param[in] obj The object.
 * @param[in] pos The pixel position.
 * @param[in] include_pass_events_objects Boolean flag to include or not
 * objects which pass events in this calculation.
 * @param[in] include_hidden_objects Boolean flag to include or not hidden
 * objects in this calculation.
 *
 * @return The list of objects that are over the given position in @c e.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
function efl_canvas_scene_objects_at_xy_get(obj:PEo; pos:TEina_Position2D; include_pass_events_objects:TEina_Bool; include_hidden_objects:TEina_Bool):PEina_Iterator;cdecl;external;
{*
 * @brief Retrieve the object stacked at the top of a given position in a
 * canvas.
 *
 * This function will traverse all the layers of the given canvas, from top to
 * bottom, querying for objects with areas covering the given position. The
 * user can exclude from the query objects which are hidden and/or which are
 * set to pass events.
 *
 * @warning This function will only evaluate top-level objects; child or "sub"
 * objects will be skipped.
 *
 * @param[in] obj The object.
 * @param[in] pos The pixel position.
 * @param[in] include_pass_events_objects Boolean flag to include or not
 * objects which pass events in this calculation.
 * @param[in] include_hidden_objects Boolean flag to include or not hidden
 * objects in this calculation.
 *
 * @return The canvas object that is over all other objects at the given
 * position.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)
function efl_canvas_scene_object_top_at_xy_get(obj:PEo; pos:TEina_Position2D; include_pass_events_objects:TEina_Bool; include_hidden_objects:TEina_Bool):PEfl_Gfx_Entity;cdecl;external;
{*
 * @brief Retrieve a list of objects overlapping a given rectangular region in
 * a canvas.
 *
 * This function will traverse all the layers of the given canvas, from top to
 * bottom, querying for objects with areas overlapping with the given
 * rectangular region. The user can exclude from the query objects which are
 * hidden and/or which are set to pass events.
 *
 * @warning This function will only evaluate top-level objects; child or "sub"
 * objects will be skipped.
 *
 * @param[in] obj The object.
 * @param[in] rect The rectangular region.
 * @param[in] include_pass_events_objects Boolean flag to include or not
 * objects which pass events in this calculation.
 * @param[in] include_hidden_objects Boolean flag to include or not hidden
 * objects in this calculation.
 *
 * @return Iterator to objects
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
function efl_canvas_scene_objects_in_rectangle_get(obj:PEo; rect:TEina_Rect; include_pass_events_objects:TEina_Bool; include_hidden_objects:TEina_Bool):PEina_Iterator;cdecl;external;
{*
 * @brief Retrieve the canvas object stacked at the top of a given rectangular
 * region in a canvas
 *
 * This function will traverse all the layers of the given canvas, from top to
 * bottom, querying for objects with areas overlapping with the given
 * rectangular region. The user can exclude from the query objects which are
 * hidden and/or which are set to pass events.
 *
 * @warning This function will only evaluate top-level objects; child or "sub"
 * objects will be skipped.
 *
 * @param[in] obj The object.
 * @param[in] rect The rectangular region.
 * @param[in] include_pass_events_objects Boolean flag to include or not
 * objects which pass events in this calculation.
 * @param[in] include_hidden_objects Boolean flag to include or not hidden
 * objects in this calculation.
 *
 * @return The object that is over all other objects at the given rectangular
 * region.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)
function efl_canvas_scene_object_top_in_rectangle_get(obj:PEo; rect:TEina_Rect; include_pass_events_objects:TEina_Bool; include_hidden_objects:TEina_Bool):PEfl_Gfx_Entity;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Iterate over the available input device seats for the canvas.
 *
 * A "seat" is the term used for a group of input devices, typically including
 * a pointer and a keyboard. A seat object is the parent of the individual
 * input devices.
 *
 * @param[in] obj The object.
 *
 * @return An iterator over the attached seats.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
function efl_canvas_scene_seats(obj:PEo):PEina_Iterator;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief An input device attached to this canvas, found by name.
 *
 * @note This function is meant to find seats and not individual input devices.
 *
 * See also @ref efl_canvas_scene_seat_get to find a seat by id instead of by
 * name.
 *
 * Get a device by name.
 *
 * @param[in] obj The object.
 * @param[in] name The name of the seat to find.
 *
 * @return The device or seat, @c null if not found.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)
(* Const before type ignored *)

function efl_canvas_scene_device_get(obj:PEo; name:Pchar):PEfl_Input_Device;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Get a seat attached to this canvas using the seat's id property.
 *
 * Seats are associated with an arbitrary integer id. The id is not a
 * persistent value and should never be hardcoded, as it may change between
 * runs of an application depending on the environment.
 *
 * See also @ref efl_canvas_scene_device_get to find a seat by name instead of
 * by id.
 *
 * Get a seat by id.
 *
 * @param[in] obj The object.
 * @param[in] id The id of the seat to find.
 *
 * @return The seat or @c null if not found.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)

function efl_canvas_scene_seat_get(obj:PEo; id:longint):PEfl_Input_Device;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Get the default seat attached to this canvas.
 *
 * A canvas may have exactly one default seat.
 *
 * See also @ref efl_canvas_scene_device_get to find a seat by name. See also
 * @ref efl_canvas_scene_seat_get to find a seat by id.
 *
 * Get the default seat.
 *
 * @param[in] obj The object.
 *
 * @return The default seat or @c null if one does not exist.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)

function efl_canvas_scene_seat_default_get(obj:PEo):PEfl_Input_Device;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief The current known pointer coordinates.
 *
 * This function returns the current position of the main input pointer (mouse,
 * pen, etc...).
 *
 * @param[in] obj The object.
 * @param[in] seat The seat, or @c null to use the default.
 * @param[out] pos The pointer position in pixels.
 *
 * @return @c true if a pointer exists for the given seat, otherwise @c false.
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }
(* Const before type ignored *)

function efl_canvas_scene_pointer_position_get(obj:PEo; seat:PEfl_Input_Device; pos:PEina_Position2D):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN : TEfl_Event_Description;cvar;external;
{* Called when scene got focus
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT : TEfl_Event_Description;cvar;external;
{* Called when scene lost focus
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN : TEfl_Event_Description;cvar;external;
{* Called when object got focus
 * @return Efl_Input_Focus *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT : TEfl_Event_Description;cvar;external;
{* Called when object lost focus
 * @return Efl_Input_Focus *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT : longint; { return type might be wrong }

(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_RENDER_PRE : TEfl_Event_Description;cvar;external;
{* Called when pre render happens
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_RENDER_PRE : longint; { return type might be wrong }

{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_RENDER_POST : TEfl_Event_Description;cvar;external;
{* Called when post render happens
 * @return Efl_Gfx_Event_Render_Post
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_RENDER_POST : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED : TEfl_Event_Description;cvar;external;
{* Called when input device changed
 * @return Efl_Input_Device *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED : TEfl_Event_Description;cvar;external;
{* Called when input device was added
 * @return Efl_Input_Device *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
(* Const before type ignored *)
  var
    _EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED : TEfl_Event_Description;cvar;external;
{* Called when input device was removed
 * @return Efl_Input_Device *
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Scene
  }

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED : longint; { return type might be wrong }

{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_INTERFACE:=efl_canvas_scene_interface_get;
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN:=@(_EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_IN);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT:=@(_EFL_CANVAS_SCENE_EVENT_SCENE_FOCUS_OUT);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN:=@(_EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_IN);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT:=@(_EFL_CANVAS_SCENE_EVENT_OBJECT_FOCUS_OUT);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_RENDER_PRE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_RENDER_PRE:=@(_EFL_CANVAS_SCENE_EVENT_RENDER_PRE);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_RENDER_POST : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_RENDER_POST:=@(_EFL_CANVAS_SCENE_EVENT_RENDER_POST);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED:=@(_EFL_CANVAS_SCENE_EVENT_DEVICE_CHANGED);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED:=@(_EFL_CANVAS_SCENE_EVENT_DEVICE_ADDED);
  end;

{ was #define dname def_expr }
function EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED:=@(_EFL_CANVAS_SCENE_EVENT_DEVICE_REMOVED);
  end;


end.
