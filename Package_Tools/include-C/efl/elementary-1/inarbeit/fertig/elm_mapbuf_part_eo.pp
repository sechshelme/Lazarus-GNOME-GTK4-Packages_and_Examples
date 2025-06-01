
unit elm_mapbuf_part_eo;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_mapbuf_part_eo.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_mapbuf_part_eo.h
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
PElm_Mapbuf_Part  = ^Elm_Mapbuf_Part;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_MAPBUF_PART_EO_H_}
{$define _ELM_MAPBUF_PART_EO_H_}
{$ifndef _ELM_MAPBUF_PART_EO_CLASS_TYPE}
{$define _ELM_MAPBUF_PART_EO_CLASS_TYPE}
type
  PElm_Mapbuf_Part = ^TElm_Mapbuf_Part;
  TElm_Mapbuf_Part = TEo;
{$endif}
{$ifndef _ELM_MAPBUF_PART_EO_TYPES}
{$define _ELM_MAPBUF_PART_EO_TYPES}
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
{* Elementary mapbuf internal part class
 *
 * @ingroup Elm_Mapbuf_Part
  }

{ was #define dname def_expr }
function ELM_MAPBUF_PART_CLASS : longint; { return type might be wrong }

(* Const before type ignored *)
function elm_mapbuf_part_class_get:PEfl_Class;cdecl;external;
{$endif}
{ EFL_BETA_API_SUPPORT  }
{$endif}

implementation

{ was #define dname def_expr }
function ELM_MAPBUF_PART_CLASS : longint; { return type might be wrong }
  begin
    ELM_MAPBUF_PART_CLASS:=elm_mapbuf_part_class_get;
  end;


end.
