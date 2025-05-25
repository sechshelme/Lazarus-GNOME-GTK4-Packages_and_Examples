unit elm_pan_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Pan = ^TElm_Pan;
  TElm_Pan = TEo;

procedure elm_pan_pos_set(obj: PElm_Pan; x: longint; y: longint); cdecl; external libelementary;
procedure elm_pan_pos_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_pan_content_size_get(obj: PElm_Pan; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_pan_pos_min_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_pan_pos_max_get(obj: PElm_Pan; x: Plongint; y: Plongint); cdecl; external libelementary;

// === Konventiert am: 25-5-25 20:06:22 ===


implementation



end.
