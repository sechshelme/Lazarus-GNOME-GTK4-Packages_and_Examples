{$IFDEF read_interface}


type
  PElm_Photocam = ^TElm_Photocam;
  TElm_Photocam = TEo;

function elm_photocam_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_photocam_image_region_bring_in(obj: PEvas_Object; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
function elm_photocam_file_set(obj: PEvas_Object; file_: pchar): TEvas_Load_Error; cdecl; external libelementary;
function elm_photocam_file_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_photocam_image_orient_set(obj: PEvas_Object; orient: TEvas_Image_Orient); cdecl; external libelementary;
function elm_photocam_image_orient_get(obj: PEvas_Object): TEvas_Image_Orient; cdecl; external libelementary;
function elm_photocam_internal_image_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_photocam_image_region_show(obj: PEvas_Object; x: longint; y: longint; w: longint; h: longint); cdecl; external libelementary;
procedure elm_photocam_image_size_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary;
function elm_photocam_paused_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_photocam_paused_set(obj: PEvas_Object; paused: TEina_Bool); cdecl; external libelementary;
procedure elm_photocam_zoom_set(obj: PEvas_Object; zoom: double); cdecl; external libelementary;
function elm_photocam_zoom_get(obj: PEvas_Object): double; cdecl; external libelementary;

type
  PElm_Photocam_Zoom_Mode = ^TElm_Photocam_Zoom_Mode;
  TElm_Photocam_Zoom_Mode = longint;

const
  ELM_PHOTOCAM_ZOOM_MODE_MANUAL = 0;
  ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT = 1;
  ELM_PHOTOCAM_ZOOM_MODE_AUTO_FILL = 2;
  ELM_PHOTOCAM_ZOOM_MODE_AUTO_FIT_IN = 3;
  ELM_PHOTOCAM_ZOOM_MODE_LAST = 4;

procedure elm_photocam_zoom_mode_set(obj: PEvas_Object; mode: TElm_Photocam_Zoom_Mode); cdecl; external libelementary;
function elm_photocam_zoom_mode_get(obj: PEvas_Object): TElm_Photocam_Zoom_Mode; cdecl; external libelementary;
procedure elm_photocam_image_region_get(obj: PEvas_Object; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:40:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
