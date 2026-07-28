
unit ges_track_element_deprecated;
interface

{
  Automatically converted by H2Pas 1.0.0 from ges_track_element_deprecated.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ges_track_element_deprecated.h
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
Pgchar  = ^gchar;
PGESTrackElement  = ^GESTrackElement;
PGList  = ^GList;
PGParamSpec  = ^GParamSpec;
PGstElement  = ^GstElement;
Pguint  = ^guint;
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{GES_DEPRECATED_FORges_track_element_get_nleobject) }

function ges_track_element_get_gnlobject(object:PGESTrackElement):PGstElement;cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_list_children_properties) }
function ges_track_element_list_children_properties(object:PGESTrackElement; n_properties:Pguint):^PGParamSpec;cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_lookup_child) }
(* Const before type ignored *)
function ges_track_element_lookup_child(object:PGESTrackElement; prop_name:Pgchar; element:PPGstElement; pspec:PPGParamSpec):Tgboolean;cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_get_child_property_valist) }
(* Const before type ignored *)
procedure ges_track_element_get_child_property_valist(object:PGESTrackElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_get_child_properties) }
(* Const before type ignored *)
procedure ges_track_element_get_child_properties(object:PGESTrackElement; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure ges_track_element_get_child_properties(object:PGESTrackElement; first_property_name:Pgchar);cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_set_child_property_valist) }
(* Const before type ignored *)
procedure ges_track_element_set_child_property_valist(object:PGESTrackElement; first_property_name:Pgchar; var_args:Tva_list);cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_set_child_property_by_spec) }
procedure ges_track_element_set_child_property_by_pspec(object:PGESTrackElement; pspec:PGParamSpec; value:PGValue);cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_set_child_properties) }
(* Const before type ignored *)
procedure ges_track_element_set_child_properties(object:PGESTrackElement; first_property_name:Pgchar; args:array of const);cdecl;external;
procedure ges_track_element_set_child_properties(object:PGESTrackElement; first_property_name:Pgchar);cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_set_child_property) }
(* Const before type ignored *)
function ges_track_element_set_child_property(object:PGESTrackElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_get_child_property) }
(* Const before type ignored *)
function ges_track_element_get_child_property(object:PGESTrackElement; property_name:Pgchar; value:PGValue):Tgboolean;cdecl;external;
{GES_DEPRECATED_FORges_timeline_element_edit) }
function ges_track_element_edit(object:PGESTrackElement; layers:PGList; mode:TGESEditMode; edge:TGESEdge; position:Tguint64):Tgboolean;cdecl;external;

implementation


end.
