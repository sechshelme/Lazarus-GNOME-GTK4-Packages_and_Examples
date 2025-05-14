
unit efl_canvas_pointer_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_pointer_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_pointer_eo.h
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
PEfl_Canvas_Pointer  = ^Efl_Canvas_Pointer;
PEfl_Class  = ^Efl_Class;
PEfl_Input_Device  = ^Efl_Input_Device;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_POINTER_EO_H_}
{$define _EFL_CANVAS_POINTER_EO_H_}
{$ifndef _EFL_CANVAS_POINTER_EO_CLASS_TYPE}
{$define _EFL_CANVAS_POINTER_EO_CLASS_TYPE}
type
  PEfl_Canvas_Pointer = ^TEfl_Canvas_Pointer;
  TEfl_Canvas_Pointer = TEo;
{$endif}
{$ifndef _EFL_CANVAS_POINTER_EO_TYPES}
{$define _EFL_CANVAS_POINTER_EO_TYPES}
{$endif}
{* Efl Canvas Pointer interface
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Pointer
  }

{ was #define dname def_expr }
function EFL_CANVAS_POINTER_INTERFACE : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_pointer_interface_get:PEfl_Class;cdecl;external;
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Whether the mouse pointer is logically inside the canvas.
 *
 * This value is @c false or @c true, depending on whether a pointer,in or
 * pointer,out event has been previously received.
 *
 * A return value of @c true indicates the mouse is logically inside the
 * canvas, and @c false implies it is logically outside the canvas.
 *
 * A canvas begins with the mouse being assumed outside ($false).
 *
 * @param[in] obj The object.
 * @param[in] seat The seat to consider, if @c null then the default seat will
 * be used.
 *
 * @return @c true if the mouse pointer is inside the canvas, @c false
 * otherwise
 *
 * @since 1.22
 *
 * @ingroup Efl_Canvas_Pointer
  }
(* Const before type ignored *)
function efl_canvas_pointer_inside_get(obj:PEo; seat:PEfl_Input_Device):TEina_Bool;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_POINTER_INTERFACE : longint; { return type might be wrong }
  begin
    EFL_CANVAS_POINTER_INTERFACE:=efl_canvas_pointer_interface_get;
  end;


end.
