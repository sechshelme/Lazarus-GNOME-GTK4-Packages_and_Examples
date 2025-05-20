
unit efl_screen_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_screen_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_screen_eo.h
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
PEfl_Screen  = ^Efl_Screen;
PEo  = ^Eo;
Plongint  = ^longint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_SCREEN_EO_H_}
{$define _EFL_SCREEN_EO_H_}
{$ifndef _EFL_SCREEN_EO_CLASS_TYPE}
{$define _EFL_SCREEN_EO_CLASS_TYPE}
type
  PEfl_Screen = ^TEfl_Screen;
  TEfl_Screen = TEo;
{$endif}
{$ifndef _EFL_SCREEN_EO_TYPES}
{$define _EFL_SCREEN_EO_TYPES}
{$endif}
{* Efl screen interface
 *
 * @since 1.22
 *
 * @ingroup Efl_Screen
  }

{ was #define dname def_expr }
function EFL_SCREEN_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_screen_interface_get:PEfl_Class;cdecl;external;
{*
 * @brief Screen size (in pixels) for the screen.
 *
 * Note that on some display systems this information is not available and a
 * value of 0x0 will be returned.
 *
 * @param[in] obj The object.
 *
 * @return The screen size in pixels.
 *
 * @since 1.22
 *
 * @ingroup Efl_Screen
  }
(* Const before type ignored *)
function efl_screen_size_in_pixels_get(obj:PEo):TEina_Size2D;cdecl;external;
{*
 * @brief Screen scaling factor.
 *
 * This is the factor by which window contents will be scaled on the screen.
 *
 * Note that on some display systems this information is not available and a
 * value of 1.0 will be returned.
 *
 * @param[in] obj The object.
 *
 * @return The screen scaling factor.
 *
 * @since 1.22
 *
 * @ingroup Efl_Screen
  }
(* Const before type ignored *)
function efl_screen_scale_factor_get(obj:PEo):single;cdecl;external;
{*
 * @brief The rotation of the screen.
 *
 * Most engines only return multiples of 90.
 *
 * @param[in] obj The object.
 *
 * @return Screen rotation in degrees.
 *
 * @since 1.22
 *
 * @ingroup Efl_Screen
  }
(* Const before type ignored *)
function efl_screen_rotation_get(obj:PEo):longint;cdecl;external;
{*
 * @brief The pixel density in DPI (Dots Per Inch) for the screen that a window
 * is on.
 *
 * @param[in] obj The object.
 * @param[out] xdpi Horizontal DPI.
 * @param[out] ydpi Vertical DPI.
 *
 * @since 1.22
 *
 * @ingroup Efl_Screen
  }
(* Const before type ignored *)
procedure efl_screen_dpi_get(obj:PEo; xdpi:Plongint; ydpi:Plongint);cdecl;external;
{$endif}

implementation

{ was #define dname def_expr }
function EFL_SCREEN_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_SCREEN_INTERFACE:=efl_screen_interface_get;
  end;


end.
