unit elm_route_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Route = ^TElm_Route;
  TElm_Route = TEo;

procedure elm_route_emap_set(obj: PElm_Route; emap: pointer); cdecl; external libelementary;
procedure elm_route_longitude_min_max_get(obj: PElm_Route; min: Pdouble; max: Pdouble); cdecl; external libelementary;
procedure elm_route_latitude_min_max_get(obj: PElm_Route; min: Pdouble; max: Pdouble); cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:01:04 ===


implementation



end.
