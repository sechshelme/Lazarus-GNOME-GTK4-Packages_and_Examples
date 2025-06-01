
unit efl_ui_spin_private;
interface

{
  Automatically converted by H2Pas 1.0.0 from efl_ui_spin_private.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    efl_ui_spin_private.h
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
PEfl_Ui_Spin_Data  = ^Efl_Ui_Spin_Data;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EFL_UI_SPIN_PRIVATE_H}
{$define EFL_UI_SPIN_PRIVATE_H}
{$include "Elementary.h"}
type
  PEfl_Ui_Spin_Data = ^TEfl_Ui_Spin_Data;
  TEfl_Ui_Spin_Data = record
      val : Tdouble;
      val_min : Tdouble;
      val_max : Tdouble;
    end;

{$endif}

implementation


end.
