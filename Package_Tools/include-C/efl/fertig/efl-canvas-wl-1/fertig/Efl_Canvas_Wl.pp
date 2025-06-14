
unit Efl_Canvas_Wl;
interface

{
  Automatically converted by H2Pas 1.0.0 from Efl_Canvas_Wl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Efl_Canvas_Wl.h
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
PEfl_Canvas_Wl_Wl_Interface_Bind_Cb  = ^Efl_Canvas_Wl_Wl_Interface_Bind_Cb;
PEfl_Canvas_Wl_Wl_Interface_Data  = ^Efl_Canvas_Wl_Wl_Interface_Data;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_CANVAS_WL_H}
{$define EFL_CANVAS_WL_H}
{$include <Evas.h>}
{$include <Efl_Core.h>}
{$ifdef extern}
{$undef extern}
{$endif}
{$ifdef }
{$undef }
{$endif}
{$ifdef WAYLAND_UTIL_H}
type
  Twl_surface = TEfl_Canvas_Wl_Wl_Surface;
  Twl_global = TEfl_Canvas_Wl_Wl_Global;
  Twl_interface = TEfl_Canvas_Wl_Wl_Interface;
  Twl_array = TEfl_Canvas_Wl_Wl_Array;

  PEfl_Canvas_Wl_Wl_Interface_Data = ^TEfl_Canvas_Wl_Wl_Interface_Data;
  TEfl_Canvas_Wl_Wl_Interface_Data = pointer;

  PEfl_Canvas_Wl_Wl_Interface_Bind_Cb = ^TEfl_Canvas_Wl_Wl_Interface_Bind_Cb;
  TEfl_Canvas_Wl_Wl_Interface_Bind_Cb = pointer;
{$else}
type

  PEfl_Canvas_Wl_Wl_Interface_Data = ^TEfl_Canvas_Wl_Wl_Interface_Data;
  TEfl_Canvas_Wl_Wl_Interface_Data = pointer;

  PEfl_Canvas_Wl_Wl_Interface_Bind_Cb = ^TEfl_Canvas_Wl_Wl_Interface_Bind_Cb;
  TEfl_Canvas_Wl_Wl_Interface_Bind_Cb = pointer;
{$endif}
{$ifdef _XKBCOMMON_H_}
type
  Txkb_state = TEfl_Canvas_Wl_Xkb_State;
{$else}
type
{$endif}
{$include <efl_canvas_wl_surface.eo.h>}
{$include <efl_canvas_wl.eo.h>}
{*
 * Get the Evas_Object for an extracted wl_surface resource created by an efl_canvas_wl object
 *
 * @note Passing anything other than a valid wl_surface resource from an efl_canvas_wl object will guarantee a crash.
 *
 * @param surface_resource The wl_resource for a wl_surface
 * @return The Evas_Object of the surface, NULL on failure
 * @since 1.24
  }

function efl_canvas_wl_extracted_surface_object_find(surface_resource:pointer):PEvas_Object;cdecl;external;

implementation


end.
