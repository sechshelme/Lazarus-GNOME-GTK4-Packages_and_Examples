
unit efl_gfx_stack_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_stack_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_stack_eo.h
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
PEfl_Gfx_Stack  = ^Efl_Gfx_Stack;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_STACK_EO_H_}
{$define _EFL_GFX_STACK_EO_H_}
{$ifndef _EFL_GFX_STACK_EO_CLASS_TYPE}
{$define _EFL_GFX_STACK_EO_CLASS_TYPE}
type
  PEfl_Gfx_Stack = ^TEfl_Gfx_Stack;
  TEfl_Gfx_Stack = TEo;
{$endif}
{$ifndef _EFL_GFX_STACK_EO_TYPES}
{$define _EFL_GFX_STACK_EO_TYPES}
{$ifndef EFL_GFX_STACK_LAYER_MIN}
{* bottom-most layer number
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Stack_Layer_Min
  }
{ +32768  }

const
  EFL_GFX_STACK_LAYER_MIN = -(32768);  
{$endif}
{$ifndef EFL_GFX_STACK_LAYER_MAX}
{* top-most layer number
 *
 * @since 1.23
 *
 * @ingroup Efl_Gfx_Stack_Layer_Max
  }

const
  EFL_GFX_STACK_LAYER_MAX = 32767;  
{$endif}
{$endif}
{* Efl graphics stack interface
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }

{ was #define dname def_expr }
function EFL_GFX_STACK_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_stack_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief The layer of its canvas that the given object will be part of.
 *
 * If you don't use this property, you'll be dealing with a unique layer of
 * objects (the default one). Additional layers are handy when you don't want a
 * set of objects to interfere with another set with regard to stacking. Two
 * layers are completely disjoint in that matter.
 *
 * This is a low-level function, which you'd be using when something should be
 * always on top, for example.
 *
 * @warning Don't change the layer of smart objects' children. Smart objects
 * have a layer of their own, which should contain all their child objects.
 *
 * @param[in] obj The object.
 * @param[in] l The number of the layer to place the object on. Must be between
 * @ref EFL_GFX_STACK_LAYER_MIN and @ref EFL_GFX_STACK_LAYER_MAX.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
procedure efl_gfx_stack_layer_set(obj:PEo; l:smallint);cdecl;external;
{*
 * @brief The layer of its canvas that the given object will be part of.
 *
 * If you don't use this property, you'll be dealing with a unique layer of
 * objects (the default one). Additional layers are handy when you don't want a
 * set of objects to interfere with another set with regard to stacking. Two
 * layers are completely disjoint in that matter.
 *
 * This is a low-level function, which you'd be using when something should be
 * always on top, for example.
 *
 * @warning Don't change the layer of smart objects' children. Smart objects
 * have a layer of their own, which should contain all their child objects.
 *
 * @param[in] obj The object.
 *
 * @return The number of the layer to place the object on. Must be between
 * @ref EFL_GFX_STACK_LAYER_MIN and @ref EFL_GFX_STACK_LAYER_MAX.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
(* Const before type ignored *)
function efl_gfx_stack_layer_get(obj:PEo):smallint;cdecl;external;
{*
 * @brief The Evas object stacked right below this object.
 *
 * This function will traverse layers in its search, if there are objects on
 * layers below the one @c obj is placed at.
 *
 * See also @ref efl_gfx_stack_layer_get.
 *
 * @param[in] obj The object.
 *
 * @return The @ref Efl_Gfx_Stack object directly below @c obj, if any, or
 * @c null, if none.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
(* Const before type ignored *)
function efl_gfx_stack_below_get(obj:PEo):PEfl_Gfx_Stack;cdecl;external;
{*
 * @brief Get the Evas object stacked right above this object.
 *
 * This function will traverse layers in its search, if there are objects on
 * layers above the one @c obj is placed at.
 *
 * See also @ref efl_gfx_stack_layer_get and @ref efl_gfx_stack_below_get
 *
 * @param[in] obj The object.
 *
 * @return The @ref Efl_Gfx_Stack object directly below @c obj, if any, or
 * @c null, if none.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
(* Const before type ignored *)
function efl_gfx_stack_above_get(obj:PEo):PEfl_Gfx_Stack;cdecl;external;
{*
 * @brief Stack @c obj immediately @c below
 *
 * Objects, in a given canvas, are stacked in the order they're added. This
 * means that, if they overlap, the highest ones will cover the lowest ones, in
 * that order. This function is a way to change the stacking order for the
 * objects.
 *
 * Its intended to be used with objects belonging to the same layer in a given
 * canvas, otherwise it will fail (and accomplish nothing).
 *
 * If you have smart objects on your canvas and @c obj is a member of one of
 * them, then @c below must also be a member of the same smart object.
 *
 * Similarly, if @c obj is not a member of a smart object, @c below must not be
 * either.
 *
 * See also @ref efl_gfx_stack_layer_get(), @ref efl_gfx_stack_layer_set() and
 * @ref efl_gfx_stack_below()
 *
 * @param[in] obj The object.
 * @param[in] below The object below which to stack
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
procedure efl_gfx_stack_below(obj:PEo; below:PEfl_Gfx_Stack);cdecl;external;
{*
 * @brief Raise @c obj to the top of its layer.
 *
 * @c obj will, then, be the highest one in the layer it belongs to. Object on
 * other layers won't get touched.
 *
 * See also @ref efl_gfx_stack_above(), @ref efl_gfx_stack_below() and
 * @ref efl_gfx_stack_lower_to_bottom()
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
procedure efl_gfx_stack_raise_to_top(obj:PEo);cdecl;external;
{*
 * @brief Stack @c obj immediately @c above
 *
 * Objects, in a given canvas, are stacked in the order they're added. This
 * means that, if they overlap, the highest ones will cover the lowest ones, in
 * that order. This function is a way to change the stacking order for the
 * objects.
 *
 * Its intended to be used with objects belonging to the same layer in a given
 * canvas, otherwise it will fail (and accomplish nothing).
 *
 * If you have smart objects on your canvas and @c obj is a member of one of
 * them, then @c above must also be a member of the same smart object.
 *
 * Similarly, if @c obj is not a member of a smart object, @c above must not be
 * either.
 *
 * See also @ref efl_gfx_stack_layer_get(), @ref efl_gfx_stack_layer_set() and
 * @ref efl_gfx_stack_below()
 *
 * @param[in] obj The object.
 * @param[in] above The object above which to stack
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
procedure efl_gfx_stack_above(obj:PEo; above:PEfl_Gfx_Stack);cdecl;external;
{*
 * @brief Lower @c obj to the bottom of its layer.
 *
 * @c obj will, then, be the lowest one in the layer it belongs to. Objects on
 * other layers won't get touched.
 *
 * See also @ref efl_gfx_stack_above(), @ref efl_gfx_stack_below() and
 * @ref efl_gfx_stack_raise_to_top()
 *
 * @param[in] obj The object.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }
procedure efl_gfx_stack_lower_to_bottom(obj:PEo);cdecl;external;
(* Const before type ignored *)
  var
    _EFL_GFX_ENTITY_EVENT_STACKING_CHANGED : TEfl_Event_Description;cvar;external;
{* Object stacking was changed.
 *
 * @since 1.22
 *
 * @ingroup Efl_Gfx_Stack
  }

{ was #define dname def_expr }
function EFL_GFX_ENTITY_EVENT_STACKING_CHANGED : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_STACK_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_STACK_INTERFACE:=efl_gfx_stack_interface_get;
  end;

{ was #define dname def_expr }
function EFL_GFX_ENTITY_EVENT_STACKING_CHANGED : longint; { return type might be wrong }
  begin
    EFL_GFX_ENTITY_EVENT_STACKING_CHANGED:=@(_EFL_GFX_ENTITY_EVENT_STACKING_CHANGED);
  end;


end.
