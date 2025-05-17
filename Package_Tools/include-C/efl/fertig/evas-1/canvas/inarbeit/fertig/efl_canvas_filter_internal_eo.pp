
unit efl_canvas_filter_internal_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_filter_internal_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_filter_internal_eo.h
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
PEfl_Canvas_Filter_Internal  = ^Efl_Canvas_Filter_Internal;
PEfl_Canvas_Filter_State  = ^Efl_Canvas_Filter_State;
PEfl_Canvas_Filter_State_Name  = ^Efl_Canvas_Filter_State_Name;
PEfl_Canvas_Filter_State_Text  = ^Efl_Canvas_Filter_State_Text;
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Color32  = ^Efl_Gfx_Color32;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_FILTER_INTERNAL_EO_H_}
{$define _EFL_CANVAS_FILTER_INTERNAL_EO_H_}
{$ifndef _EFL_CANVAS_FILTER_INTERNAL_EO_CLASS_TYPE}
{$define _EFL_CANVAS_FILTER_INTERNAL_EO_CLASS_TYPE}
type
  PEfl_Canvas_Filter_Internal = ^TEfl_Canvas_Filter_Internal;
  TEfl_Canvas_Filter_Internal = TEo;
{$endif}
{$ifndef _EFL_CANVAS_FILTER_INTERNAL_EO_TYPES}
{$define _EFL_CANVAS_FILTER_INTERNAL_EO_TYPES}
{$ifdef EFL_BETA_API_SUPPORT}
{* 32 bit color data structure
 *
 * @ingroup Efl_Gfx_Color32
  }
{*< Red component of the color  }
{*< Green component of the color  }
{*< Blue component of the color  }
{*< Translucent component of the color  }
type
  PEfl_Gfx_Color32 = ^TEfl_Gfx_Color32;
  TEfl_Gfx_Color32 = record
      r : Tuint8_t;
      g : Tuint8_t;
      b : Tuint8_t;
      a : Tuint8_t;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Filter state name structure
 *
 * @ingroup Efl_Canvas_Filter_State_Name
  }
(* Const before type ignored *)
{*< Filter state name  }
{*< Filter state value  }
type
  PEfl_Canvas_Filter_State_Name = ^TEfl_Canvas_Filter_State_Name;
  TEfl_Canvas_Filter_State_Name = record
      name : Pchar;
      value : Tdouble;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Filter state text structure
 *
 * @ingroup Efl_Canvas_Filter_State_Text
  }
{*< Text outline color  }
{*< Text shadow color  }
{*< Text glow color  }
{*< Text glow2 color  }
type
  PEfl_Canvas_Filter_State_Text = ^TEfl_Canvas_Filter_State_Text;
  TEfl_Canvas_Filter_State_Text = record
      outline : TEfl_Gfx_Color32;
      shadow : TEfl_Gfx_Color32;
      glow : TEfl_Gfx_Color32;
      glow2 : TEfl_Gfx_Color32;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{* Internal structure representing the state of a Gfx Filter
 *
 * @ingroup Efl_Canvas_Filter_State
  }
{*< Text state  }
{*< Color  }
{*< Current state  }
{*< Next state  }
{*< Width  }
{*< Height  }
{*< Scale factor  }
{*< Position  }
type
  PEfl_Canvas_Filter_State = ^TEfl_Canvas_Filter_State;
  TEfl_Canvas_Filter_State = record
      text : TEfl_Canvas_Filter_State_Text;
      color : TEfl_Gfx_Color32;
      cur : TEfl_Canvas_Filter_State_Name;
      next : TEfl_Canvas_Filter_State_Name;
      w : longint;
      h : longint;
      scale : Tdouble;
      pos : Tdouble;
    end;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Evas internal implementation of filters.
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

{ was #define dname def_expr }
function EFL_CANVAS_FILTER_INTERNAL_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_filter_internal_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Marks this filter as changed.
 *
 * @param[in] obj The object.
 * @param[in] val @c true if filter changed, @c false otherwise
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }
procedure evas_filter_changed_set(obj:PEo; val:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Marks this filter as invalid.
 *
 * @param[in] obj The object.
 * @param[in] val @c true if filter is invalid, @c false otherwise
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

procedure evas_filter_invalid_set(obj:PEo; val:TEina_Bool);cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Called by Efl.Canvas.Filter.Internal to determine whether the input
 * is alpha or rgba.
 *
 * @param[in] obj The object.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

function evas_filter_input_alpha(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Called by Efl.Canvas.Filter.Internal to request the parent class for
 * state information (color, etc...).
 *
 * @param[in] obj The object.
 * @param[out] state State info to fill in
 * @param[in] data Private data for the class
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

procedure evas_filter_state_prepare(obj:PEo; state:PEfl_Canvas_Filter_State; data:pointer);cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Called by Efl.Canvas.Filter.Internal when the parent class must
 * render the input.
 *
 * @param[in] obj The object.
 * @param[in] filter Current filter context
 * @param[in] engine Engine context
 * @param[in] output Output context
 * @param[in] drawctx Draw context (for evas engine)
 * @param[in] data Private data used by textblock
 * @param[in] l Left
 * @param[in] r Right
 * @param[in] t Top
 * @param[in] b Bottom
 * @param[in] x X offset
 * @param[in] y Y offset
 * @param[in] do_async @c true when the operation should be done
 * asynchronously, @c false otherwise
 *
 * @return Indicates success from the object render function.
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

function evas_filter_input_render(obj:PEo; filter:pointer; engine:pointer; output:pointer; drawctx:pointer; 
           data:pointer; l:longint; r:longint; t:longint; b:longint; 
           x:longint; y:longint; do_async:TEina_Bool):TEina_Bool;cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Called when filter changes must trigger a redraw of the object.
 *
 * Virtual, to be implemented in the parent class.
 * @param[in] obj The object.
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }

procedure evas_filter_dirty(obj:PEo);cdecl;external;
{$endif}
{$ifdef EFL_CANVAS_FILTER_INTERNAL_PROTECTED}
{*
 * @brief Retrieves cached output buffer, if any.
 *
 * Does not increment the reference count.
 *
 * @param[in] obj The object.
 *
 * @return Output buffer
 *
 * @ingroup Efl_Canvas_Filter_Internal
  }
(* Const before type ignored *)

function evas_filter_output_buffer_get(obj:PEo):pointer;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_FILTER_INTERNAL_MIXIN : longint; { return type might be wrong }
  begin
    EFL_CANVAS_FILTER_INTERNAL_MIXIN:=efl_canvas_filter_internal_mixin_get;
  end;


end.
