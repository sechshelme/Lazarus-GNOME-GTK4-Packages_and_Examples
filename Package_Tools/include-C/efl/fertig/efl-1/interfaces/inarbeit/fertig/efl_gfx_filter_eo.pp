
unit efl_gfx_filter_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_gfx_filter_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_gfx_filter_eo.h
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
PEfl_Class  = ^Efl_Class;
PEfl_Gfx_Entity  = ^Efl_Gfx_Entity;
PEfl_Gfx_Filter  = ^Efl_Gfx_Filter;
PEina_Bool  = ^Eina_Bool;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_GFX_FILTER_EO_H_}
{$define _EFL_GFX_FILTER_EO_H_}
{$ifndef _EFL_GFX_FILTER_EO_CLASS_TYPE}
{$define _EFL_GFX_FILTER_EO_CLASS_TYPE}
type
  PEfl_Gfx_Filter = ^TEfl_Gfx_Filter;
  TEfl_Gfx_Filter = TEo;
{$endif}
{$ifndef _EFL_GFX_FILTER_EO_TYPES}
{$define _EFL_GFX_FILTER_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Graphical filters can be applied to any object implementing this
 * interface.
 *
 * Filters are programmable effects that run whenever the object is rendered on
 * its canvas. The program language is Lua and a complete reference can be
 * found under "EFL Graphics Filters".
 *
 * This was a beta feature since 1.15.
 *
 * @ingroup Efl_Gfx_Filter
  }

{ was #define dname def_expr }
function EFL_GFX_FILTER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_gfx_filter_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief A graphical filter program on this object.
 *
 * Valid for Text and Image objects at the moment.
 *
 * The argument passed to this function is a string containing a valid Lua
 * program based on the filters API as described in the "EFL Graphics Filters"
 * reference page.
 *
 * Set to @c null to disable filtering.
 *
 * @param[in] obj The object.
 * @param[in] code The Lua program source code.
 * @param[in] name An optional name for this filter.
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_program_set(obj:PEo; code:Pchar; name:Pchar);cdecl;external;
{*
 * @brief A graphical filter program on this object.
 *
 * Valid for Text and Image objects at the moment.
 *
 * The argument passed to this function is a string containing a valid Lua
 * program based on the filters API as described in the "EFL Graphics Filters"
 * reference page.
 *
 * Set to @c null to disable filtering.
 *
 * @param[in] obj The object.
 * @param[out] code The Lua program source code.
 * @param[out] name An optional name for this filter.
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_program_get(obj:PEo; code:PPchar; name:PPchar);cdecl;external;
{*
 * @brief Set the current state of the filter.
 *
 * This should be used by Edje (EFL's internal layout engine), but could also
 * be used when implementing animations programmatically.
 *
 * A full state is defined by two states (name + value): origin state and
 * target state of an ongoing animation, as well as the @c pos progress (from 0
 * to 1) of that animation timeline. The second state can be omitted if there
 * is no ongoing animation.
 *
 * @param[in] obj The object.
 * @param[in] cur_state Current state of the filter
 * @param[in] cur_val Current value
 * @param[in] next_state Next filter state, optional
 * @param[in] next_val Next value, optional
 * @param[in] pos Position, optional
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_state_set(obj:PEo; cur_state:Pchar; cur_val:Tdouble; next_state:Pchar; next_val:Tdouble; 
            pos:Tdouble);cdecl;external;
{*
 * @brief Set the current state of the filter.
 *
 * This should be used by Edje (EFL's internal layout engine), but could also
 * be used when implementing animations programmatically.
 *
 * A full state is defined by two states (name + value): origin state and
 * target state of an ongoing animation, as well as the @c pos progress (from 0
 * to 1) of that animation timeline. The second state can be omitted if there
 * is no ongoing animation.
 *
 * @param[in] obj The object.
 * @param[out] cur_state Current state of the filter
 * @param[out] cur_val Current value
 * @param[out] next_state Next filter state, optional
 * @param[out] next_val Next value, optional
 * @param[out] pos Position, optional
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_state_get(obj:PEo; cur_state:PPchar; cur_val:Pdouble; next_state:PPchar; next_val:Pdouble; 
            pos:Pdouble);cdecl;external;
{*
 * @brief Required padding to apply this filter without cropping.
 *
 * Read-only property that can be used to calculate the object's final
 * geometry. This can be overridden (set) from inside the filter program by
 * using the function 'padding_set' in the Lua program.
 *
 * @param[in] obj The object.
 * @param[out] l Padding on the left
 * @param[out] r Padding on the right
 * @param[out] t Padding on the top
 * @param[out] b Padding on the bottom
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
procedure efl_gfx_filter_padding_get(obj:PEo; l:Plongint; r:Plongint; t:Plongint; b:Plongint);cdecl;external;
{*
 * @brief Bind an object to use as a mask or texture in a filter program.
 *
 * This will create automatically a new RGBA buffer containing the source
 * object's pixels (as it is rendered).
 *
 * @param[in] obj The object.
 * @param[in] name Buffer name as used in the program.
 * @param[in] source Object to use as a source of pixels.
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
procedure efl_gfx_filter_source_set(obj:PEo; name:Pchar; source:PEfl_Gfx_Entity);cdecl;external;
{*
 * @brief Bind an object to use as a mask or texture in a filter program.
 *
 * This will create automatically a new RGBA buffer containing the source
 * object's pixels (as it is rendered).
 *
 * @param[in] obj The object.
 * @param[in] name Buffer name as used in the program.
 *
 * @return Object to use as a source of pixels.
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
function efl_gfx_filter_source_get(obj:PEo; name:Pchar):PEfl_Gfx_Entity;cdecl;external;
{*
 * @brief Extra data used by the filter program.
 *
 * Each data element is a string ($value) stored as a global variable @c name.
 * The program is then responsible for conversion to numbers, tables, etc...
 *
 * If the @c execute flag is set, then the @c value can be complex and run, as
 * if the original Lua program contained a line 'name = value'. This can be
 * used to pass in tables.
 *
 * @param[in] obj The object.
 * @param[in] name Name of the global variable
 * @param[in] value String value to use as data
 * @param[in] execute If @c true, execute 'name = value'
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_data_set(obj:PEo; name:Pchar; value:Pchar; execute:TEina_Bool);cdecl;external;
{*
 * @brief Extra data used by the filter program.
 *
 * Each data element is a string ($value) stored as a global variable @c name.
 * The program is then responsible for conversion to numbers, tables, etc...
 *
 * If the @c execute flag is set, then the @c value can be complex and run, as
 * if the original Lua program contained a line 'name = value'. This can be
 * used to pass in tables.
 *
 * @param[in] obj The object.
 * @param[in] name Name of the global variable
 * @param[out] value String value to use as data
 * @param[out] execute If @c true, execute 'name = value'
 *
 * @ingroup Efl_Gfx_Filter
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure efl_gfx_filter_data_get(obj:PEo; name:Pchar; value:PPchar; execute:PEina_Bool);cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_GFX_FILTER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_GFX_FILTER_INTERFACE:=efl_gfx_filter_interface_get;
  end;


end.
