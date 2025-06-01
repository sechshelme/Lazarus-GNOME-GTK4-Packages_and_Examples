
unit efl_ui_spin_button_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spin_button_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spin_button_private.h
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
PEfl_Ui_Spin_Button_Data  = ^Efl_Ui_Spin_Button_Data;
PEina_Future  = ^Eina_Future;
PEvas_Object  = ^Evas_Object;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_SPIN_BUTTON_PRIVATE_H}
{$define EFL_UI_SPIN_BUTTON_PRIVATE_H}
type
{*< a timer for a delay,changed smart callback  }
  PEfl_Ui_Spin_Button_Data = ^TEfl_Ui_Spin_Button_Data;
  TEfl_Ui_Spin_Button_Data = record
      ent : PEvas_Object;
      inc_button : PEvas_Object;
      dec_button : PEvas_Object;
      text_button : PEvas_Object;
      delay_change_timer : PEina_Future;
      dir : TEfl_Ui_Layout_Orientation;
      step : Tdouble;
      flag0 : word;
    end;


const
  bm_TEfl_Ui_Spin_Button_Data_entry_visible = $1;
  bp_TEfl_Ui_Spin_Button_Data_entry_visible = 0;
  bm_TEfl_Ui_Spin_Button_Data_entry_reactivate = $2;
  bp_TEfl_Ui_Spin_Button_Data_entry_reactivate = 1;
  bm_TEfl_Ui_Spin_Button_Data_editable = $4;
  bp_TEfl_Ui_Spin_Button_Data_editable = 2;
  bm_TEfl_Ui_Spin_Button_Data_wraparound = $8;
  bp_TEfl_Ui_Spin_Button_Data_wraparound = 3;

function entry_visible(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
procedure set_entry_visible(var a : TEfl_Ui_Spin_Button_Data; __entry_visible : TEina_Bool);
function entry_reactivate(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
procedure set_entry_reactivate(var a : TEfl_Ui_Spin_Button_Data; __entry_reactivate : TEina_Bool);
function editable(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
procedure set_editable(var a : TEfl_Ui_Spin_Button_Data; __editable : TEina_Bool);
function wraparound(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
procedure set_wraparound(var a : TEfl_Ui_Spin_Button_Data; __wraparound : TEina_Bool);
{$endif}

implementation

function entry_visible(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
begin
  entry_visible:=(a.flag0 and bm_TEfl_Ui_Spin_Button_Data_entry_visible) shr bp_TEfl_Ui_Spin_Button_Data_entry_visible;
end;

procedure set_entry_visible(var a : TEfl_Ui_Spin_Button_Data; __entry_visible : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__entry_visible shl bp_TEfl_Ui_Spin_Button_Data_entry_visible) and bm_TEfl_Ui_Spin_Button_Data_entry_visible);
end;

function entry_reactivate(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
begin
  entry_reactivate:=(a.flag0 and bm_TEfl_Ui_Spin_Button_Data_entry_reactivate) shr bp_TEfl_Ui_Spin_Button_Data_entry_reactivate;
end;

procedure set_entry_reactivate(var a : TEfl_Ui_Spin_Button_Data; __entry_reactivate : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__entry_reactivate shl bp_TEfl_Ui_Spin_Button_Data_entry_reactivate) and bm_TEfl_Ui_Spin_Button_Data_entry_reactivate);
end;

function editable(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
begin
  editable:=(a.flag0 and bm_TEfl_Ui_Spin_Button_Data_editable) shr bp_TEfl_Ui_Spin_Button_Data_editable;
end;

procedure set_editable(var a : TEfl_Ui_Spin_Button_Data; __editable : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__editable shl bp_TEfl_Ui_Spin_Button_Data_editable) and bm_TEfl_Ui_Spin_Button_Data_editable);
end;

function wraparound(var a : TEfl_Ui_Spin_Button_Data) : TEina_Bool;
begin
  wraparound:=(a.flag0 and bm_TEfl_Ui_Spin_Button_Data_wraparound) shr bp_TEfl_Ui_Spin_Button_Data_wraparound;
end;

procedure set_wraparound(var a : TEfl_Ui_Spin_Button_Data; __wraparound : TEina_Bool);
begin
  a.flag0:=a.flag0 or ((__wraparound shl bp_TEfl_Ui_Spin_Button_Data_wraparound) and bm_TEfl_Ui_Spin_Button_Data_wraparound);
end;


end.
