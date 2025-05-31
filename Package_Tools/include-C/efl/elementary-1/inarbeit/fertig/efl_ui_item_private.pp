
unit efl_ui_item_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_item_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_item_private.h
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
PEfl_Ui_Item  = ^Efl_Ui_Item;
PEfl_Ui_Item_Data  = ^Efl_Ui_Item_Data;
PEo  = ^Eo;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_ITEM_PRIVATE_H}
{$define EFL_UI_ITEM_PRIVATE_H}
{$include "Elementary.h"}
{ Eo Objects }
{ Parent Widget  }
{ Boolean Data }
{ State for item selected  }
type
  PEfl_Ui_Item_Data = ^TEfl_Ui_Item_Data;
  TEfl_Ui_Item_Data = record
      container : PEo;
      parent : PEfl_Ui_Item;
      flag0 : word;
    end;

const
  bm__Efl_Ui_Item_Data_selected = $1;
  bp__Efl_Ui_Item_Data_selected = 0;
  bm__Efl_Ui_Item_Data_locked = $2;
  bp__Efl_Ui_Item_Data_locked = 1;

function selected(var a : _Efl_Ui_Item_Data) : TEina_Bool;
procedure set_selected(var a : _Efl_Ui_Item_Data; __selected : TEina_Bool);
function locked(var a : _Efl_Ui_Item_Data) : TEina_Bool;
procedure set_locked(var a : _Efl_Ui_Item_Data; __locked : TEina_Bool);

implementation

function selected(var a : _Efl_Ui_Item_Data) : TEina_Bool;
begin
  selected:=(a.flag0 and bm__Efl_Ui_Item_Data_selected) shr bp__Efl_Ui_Item_Data_selected;
end;

procedure set_selected(var a : _Efl_Ui_Item_Data; __selected : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__selected shl bp__Efl_Ui_Item_Data_selected) and bm__Efl_Ui_Item_Data_selected);
end;

function locked(var a : _Efl_Ui_Item_Data) : TEina_Bool;
begin
  locked:=(a.flag0 and bm__Efl_Ui_Item_Data_locked) shr bp__Efl_Ui_Item_Data_locked;
end;

procedure set_locked(var a : _Efl_Ui_Item_Data; __locked : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__locked shl bp__Efl_Ui_Item_Data_locked) and bm__Efl_Ui_Item_Data_locked);
end;


end.
