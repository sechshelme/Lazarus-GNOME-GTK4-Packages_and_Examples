
unit efl_canvas_snapshot_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_canvas_snapshot_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_canvas_snapshot_eo.h
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
PEfl_Canvas_Snapshot  = ^Efl_Canvas_Snapshot;
PEfl_Class  = ^Efl_Class;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _EFL_CANVAS_SNAPSHOT_EO_H_}
{$define _EFL_CANVAS_SNAPSHOT_EO_H_}
{$ifndef _EFL_CANVAS_SNAPSHOT_EO_CLASS_TYPE}
{$define _EFL_CANVAS_SNAPSHOT_EO_CLASS_TYPE}
type
  PEfl_Canvas_Snapshot = ^TEfl_Canvas_Snapshot;
  TEfl_Canvas_Snapshot = TEo;
{$endif}
{$ifndef _EFL_CANVAS_SNAPSHOT_EO_TYPES}
{$define _EFL_CANVAS_SNAPSHOT_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{*
 * @brief Low-level snapshot image object.
 *
 * A snapshot is a special kind of image containing the pixels from all the
 * objects below it. This allows applications to save screenshots of all or
 * part of their UI, or apply filters to parts of the UI.
 *
 * @ingroup Efl_Canvas_Snapshot
  }

{ was #define dname def_expr }
function EFL_CANVAS_SNAPSHOT_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function efl_canvas_snapshot_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function EFL_CANVAS_SNAPSHOT_CLASS : longint; { return type might be wrong }
  begin
    EFL_CANVAS_SNAPSHOT_CLASS:=efl_canvas_snapshot_class_get;
  end;


end.
