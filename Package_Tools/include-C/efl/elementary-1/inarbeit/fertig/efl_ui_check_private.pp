
unit efl_ui_check_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_check_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_check_private.h
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
PEfl_Ui_Check_Data  = ^Efl_Ui_Check_Data;
PEina_Bool  = ^Eina_Bool;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_CHECK_PRIVATE_H}
{$define EFL_UI_CHECK_PRIVATE_H}
{$include "Elementary.h"}
{ DO NOT USE THIS HEADER UNLESS YOU ARE PREPARED FOR BREAKING OF YOUR
 * CODE. THIS IS ELEMENTARY'S INTERNAL WIDGET API (for now) AND IS NOT
 * FINAL. CALL elm_widget_api_check(ELM_INTERNAL_API_VERSION) TO CHECK
 * IT AT RUNTIME.
  }
{*
 * @addtogroup Widget
 * @
 *
 * @section elm-check-class The Elementary Check Class
 *
 * Elementary, besides having the @ref Check widget, exposes its
 * foundation -- the Elementary Check Class -- in order to create other
 * widgets which are a check with some more logic on top.
  }
{*
 * Base layout smart data extended with check instance data.
  }
type
  PEfl_Ui_Check_Data = ^TEfl_Ui_Check_Data;
  TEfl_Ui_Check_Data = record
      statep : PEina_Bool;
      selected : TEina_Bool;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect = $1;
  bp_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect = 0;
  bm_TEfl_Ui_Check_Data_legacy_changed_emitted_select = $2;
  bp_TEfl_Ui_Check_Data_legacy_changed_emitted_select = 1;

function legacy_changed_emitted_unselect(var a : TEfl_Ui_Check_Data) : TEina_Bool;
procedure set_legacy_changed_emitted_unselect(var a : TEfl_Ui_Check_Data; __legacy_changed_emitted_unselect : TEina_Bool);
function legacy_changed_emitted_select(var a : TEfl_Ui_Check_Data) : TEina_Bool;
procedure set_legacy_changed_emitted_select(var a : TEfl_Ui_Check_Data; __legacy_changed_emitted_select : TEina_Bool);
{*
 * @
  }

implementation

function legacy_changed_emitted_unselect(var a : TEfl_Ui_Check_Data) : TEina_Bool;
begin
  legacy_changed_emitted_unselect:=(a.flag0 and bm_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect) shr bp_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect;
end;

procedure set_legacy_changed_emitted_unselect(var a : TEfl_Ui_Check_Data; __legacy_changed_emitted_unselect : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__legacy_changed_emitted_unselect shl bp_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect) and bm_TEfl_Ui_Check_Data_legacy_changed_emitted_unselect);
end;

function legacy_changed_emitted_select(var a : TEfl_Ui_Check_Data) : TEina_Bool;
begin
  legacy_changed_emitted_select:=(a.flag0 and bm_TEfl_Ui_Check_Data_legacy_changed_emitted_select) shr bp_TEfl_Ui_Check_Data_legacy_changed_emitted_select;
end;

procedure set_legacy_changed_emitted_select(var a : TEfl_Ui_Check_Data; __legacy_changed_emitted_select : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__legacy_changed_emitted_select shl bp_TEfl_Ui_Check_Data_legacy_changed_emitted_select) and bm_TEfl_Ui_Check_Data_legacy_changed_emitted_select);
end;


end.
