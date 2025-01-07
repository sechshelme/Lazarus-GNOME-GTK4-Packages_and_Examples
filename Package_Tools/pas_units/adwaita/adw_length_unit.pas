unit adw_length_unit;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PAdwLengthUnit = ^TAdwLengthUnit;
  TAdwLengthUnit = longint;

const
  ADW_LENGTH_UNIT_PX = 0;
  ADW_LENGTH_UNIT_PT = 1;
  ADW_LENGTH_UNIT_SP = 2;

function adw_length_unit_to_px(unit_: TAdwLengthUnit; Value: Tdouble; settings: PGtkSettings): Tdouble; cdecl; external libadwaita;
function adw_length_unit_from_px(unit_: TAdwLengthUnit; Value: Tdouble; settings: PGtkSettings): Tdouble; cdecl; external libadwaita;

// === Konventiert am: 7-1-25 19:54:53 ===


implementation



end.
