
unit elm_interface_fileselector;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_interface_fileselector.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    elm_interface_fileselector.h
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
PEfl_Event_Description  = ^Efl_Event_Description;
PEfl_Model  = ^Efl_Model;
PEina_List  = ^Eina_List;
PEo  = ^Eo;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef ELM_INTEFARCE_FILESELECTOR_H}
{$define ELM_INTEFARCE_FILESELECTOR_H}
{$ifndef EFL_NOLEGACY_API_SUPPORT}
{$include "elm_interface_fileselector_eo.legacy.h"}
{$endif}
(* Const before type ignored *)

procedure _elm_fileselector_path_set_internal(obj:PEvas_Object; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_path_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function _elm_fileselector_selected_set_internal(obj:PEvas_Object; _path:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_selected_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_selected_paths_get_internal(obj:PEvas_Object):PEina_List;cdecl;external;
(* Const before type ignored *)
procedure _elm_fileselector_entry_path_set_internal(obj:PEvas_Object; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_entry_path_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function _elm_fileselector_entry_selected_set_internal(obj:PEvas_Object; path:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_entry_selected_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
procedure _elm_fileselector_button_path_set_internal(obj:PEvas_Object; path:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_button_path_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
function _elm_fileselector_button_selected_set_internal(obj:PEvas_Object; _path:Pchar):TEina_Bool;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_button_selected_get_internal(obj:PEvas_Object):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function _elm_fileselector_button_selected_paths_get_internal(obj:PEvas_Object):PEina_List;cdecl;external;
(* Const before type ignored *)
procedure _event_to_legacy_call(obj:PEo; evt:Pchar; event_info:pointer);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure _model_event_call(obj:PEo; evt_desc:PEfl_Event_Description; legacy_evt:Pchar; model:PEfl_Model; path:Pchar);cdecl;external;
{$endif}

implementation


end.
