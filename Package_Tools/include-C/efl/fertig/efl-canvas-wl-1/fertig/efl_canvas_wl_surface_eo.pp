
unit efl_canvas_wl_surface_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_wl_surface_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_wl_surface_eo.h
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
PEfl_Canvas_Wl_Surface  = ^Efl_Canvas_Wl_Surface;
PEfl_Class  = ^Efl_Class;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_WL_SURFACE_EO_H_}
{$define _EFL_CANVAS_WL_SURFACE_EO_H_}
{$ifndef _EFL_CANVAS_WL_SURFACE_EO_CLASS_TYPE}
{$define _EFL_CANVAS_WL_SURFACE_EO_CLASS_TYPE}
type
  PEfl_Canvas_Wl_Surface = ^TEfl_Canvas_Wl_Surface;
  TEfl_Canvas_Wl_Surface = TEo;
{$endif}
{$ifndef _EFL_CANVAS_WL_SURFACE_EO_TYPES}
{$define _EFL_CANVAS_WL_SURFACE_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief A canvas object representing a Wayland toplevel or popup surface.
 *
 * This object's geometry properties reflect the properties of the underlying
 * surface. If the client is using a protocol to export its size hints, those
 * hints will be directly applied to this object any time they change in the
 * application.
 *
 * Changes to geometry and visibility of this object must not be made while
 * @ref efl_canvas_wl_surface_extracted_get is @c false.
 *
 * Changes to size of this object will be immediately propagated to the
 * underlying application.
 *
 * Hiding this object will have differing effects based on the surface's
 * xdg-shell role. If the surface is a popup, it will be sent the 'done'
 * protocol event which will close it. If the surface is a toplevel, it will be
 * deactivated if it was active.
 *
 * This object's lifetime is bound to the lifetime of the underlying surface or
 * the compositor widget.
 *
 * This object must not be manually deleted.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
  }

{ was #define dname def_expr }
function EFL_CANVAS_WL_SURFACE_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_wl_surface_class_get:PEfl_Class;cdecl;external;
{*
 * @brief Extract a surface from the compositor widget.
 *
 * Call this prior to making any calls which directly modify the geometry of
 * the surface. Once extracted, the compositor will no longer attempt to
 * automatically apply geometry or stacking changes to the surface.
 *
 * Once extracted, a surface cannot be un-extracted.
 *
 * @param[in] obj The object.
 *
 * @return Returns @c true if the surface was successfully extracted.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
  }
function efl_canvas_wl_surface_extract(obj:PEo):TEina_Bool;cdecl;external;
{*
 * @brief The process id of the surface's application.
 *
 * @param[in] obj The object.
 *
 * @return The process id, or -1 if the surface has been asynchronously
 * destroyed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
  }
(* Const before type ignored *)
function efl_canvas_wl_surface_pid_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The parent surface of the given surface. This value is @c NULL for
 * toplevel surfaces without a parent.
 *
 * For popup surfaces, this may be another popup or a toplevel. For toplevel
 * surfaces, this will always be another toplevel or @c NULL.
 *
 * @param[in] obj The object.
 *
 * @return The parent surface. @c NULL if no parent exists or the surface was
 * asynchronously destroyed.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
  }
(* Const before type ignored *)
function efl_canvas_wl_surface_parent_surface_get(obj:PEo):PEfl_Canvas_Wl_Surface;cdecl;external;
{*
 * @brief The extracted state of the surface.
 *
 * @param[in] obj The object.
 *
 * @return @c true if @ref efl_canvas_wl_surface_extract was successfully
 * called previously.
 *
 * @since 1.24
 *
 * @ingroup Efl_Canvas_Wl_Surface
  }
(* Const before type ignored *)
function efl_canvas_wl_surface_extracted_get(obj:PEo):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_WL_SURFACE_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_WL_SURFACE_CLASS:=efl_canvas_wl_surface_class_get;
  end;


end.
