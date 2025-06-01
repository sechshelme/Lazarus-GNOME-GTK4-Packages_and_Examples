unit elm_plug_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Plug = ^TElm_Plug;
  TElm_Plug = TEo;

function elm_plug_image_object_get(obj: PElm_Plug): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_plug_connect(obj: PElm_Plug; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:00:52 ===


implementation



end.
