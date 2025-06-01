
unit efl_access_component_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_access_component_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_access_component_eo.h
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
PEfl_Access_Component  = ^Efl_Access_Component;
PEfl_Class  = ^Efl_Class;
PEfl_Object  = ^Efl_Object;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_ACCESS_COMPONENT_EO_H_}
{$define _EFL_ACCESS_COMPONENT_EO_H_}
{$ifndef _EFL_ACCESS_COMPONENT_EO_CLASS_TYPE}
{$define _EFL_ACCESS_COMPONENT_EO_CLASS_TYPE}
type
  PEfl_Access_Component = ^TEfl_Access_Component;
  TEfl_Access_Component = TEo;
{$endif}
{$ifndef _EFL_ACCESS_COMPONENT_EO_TYPES}
{$define _EFL_ACCESS_COMPONENT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* AT-SPI component mixin
 *
 * @ingroup Efl_Access_Component
  }

{ was #define dname def_expr }
function EFL_ACCESS_COMPONENT_MIXIN : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_access_component_mixin_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Gets the depth at which the component is shown in relation to other
 * components in the same container.
 *
 * @param[in] obj The object.
 *
 * @return Z order of component
 *
 * @ingroup Efl_Access_Component
  }
(* Const before type ignored *)
function efl_access_component_z_order_get(obj:PEo):longint;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Geometry of accessible widget.
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] rect The geometry.
 *
 * @return @c true if geometry was set, @c false otherwise
 *
 * @ingroup Efl_Access_Component
  }

function efl_access_component_extents_set(obj:PEo; screen_coords:TEina_Bool; rect:TEina_Rect):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Geometry of accessible widget.
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true x and y values will be relative to
 * screen origin, otherwise relative to canvas
 *
 * @return The geometry.
 *
 * @ingroup Efl_Access_Component
  }
(* Const before type ignored *)

function efl_access_component_extents_get(obj:PEo; screen_coords:TEina_Bool):TEina_Rect;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Position of accessible widget.
 *
 * @param[in] obj The object.
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @return @c true if position was set, @c false otherwise
 *
 * @ingroup Efl_Access_Component
  }

function efl_access_component_screen_position_set(obj:PEo; x:longint; y:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Position of accessible widget.
 *
 * @param[in] obj The object.
 * @param[out] x X coordinate
 * @param[out] y Y coordinate
 *
 * @ingroup Efl_Access_Component
  }
(* Const before type ignored *)

procedure efl_access_component_screen_position_get(obj:PEo; x:Plongint; y:Plongint);cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Contains accessible widget
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @return @c true if params have been set, @c false otherwise
 *
 * @ingroup Efl_Access_Component
  }

function efl_access_component_contains(obj:PEo; screen_coords:TEina_Bool; x:longint; y:longint):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Focuses accessible widget.
 *
 * @param[in] obj The object.
 *
 * @return @c true if focus grab focus succeed, @c false otherwise.
 *
 * @ingroup Efl_Access_Component
  }

function efl_access_component_focus_grab(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$ifdef EFL_BETA_API_SUPPORT}
{$ifdef EFL_ACCESS_COMPONENT_PROTECTED}
{*
 * @brief Gets top component object occupying space at given coordinates.
 *
 * @param[in] obj The object.
 * @param[in] screen_coords If @c true x and y values will be relative to
 * screen origin, otherwise relative to canvas
 * @param[in] x X coordinate
 * @param[in] y Y coordinate
 *
 * @return Top component object at given coordinate
 *
 * @ingroup Efl_Access_Component
  }

function efl_access_component_accessible_at_point_get(obj:PEo; screen_coords:TEina_Bool; x:longint; y:longint):PEfl_Object;cdecl;external;
{$endif}
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_ACCESS_COMPONENT_MIXIN : longint; { return type might be wrong }
  begin
    EFL_ACCESS_COMPONENT_MIXIN:=efl_access_component_mixin_get;
  end;


end.
