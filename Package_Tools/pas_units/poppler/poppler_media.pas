unit poppler_media;

interface

uses
  fp_glib2, fp_cairo, fp_poppler_glib, poppler;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TPopplerMediaSaveFunc = function(buf: Pgchar; count: Tgsize; data: Tgpointer; error: PPGError): Tgboolean; cdecl;

function poppler_media_get_type: TGType; cdecl; external poppler_glib;
function poppler_media_is_embedded(poppler_media: PPopplerMedia): Tgboolean; cdecl; external poppler_glib;
function poppler_media_get_filename(poppler_media: PPopplerMedia): Pgchar; cdecl; external poppler_glib;
function poppler_media_get_mime_type(poppler_media: PPopplerMedia): Pgchar; cdecl; external poppler_glib;
function poppler_media_get_auto_play(poppler_media: PPopplerMedia): Tgboolean; cdecl; external poppler_glib;
function poppler_media_get_show_controls(poppler_media: PPopplerMedia): Tgboolean; cdecl; external poppler_glib;
function poppler_media_get_repeat_count(poppler_media: PPopplerMedia): Tgfloat; cdecl; external poppler_glib;
function poppler_media_save(poppler_media: PPopplerMedia; filename: pchar; error: PPGError): Tgboolean; cdecl; external poppler_glib;

{$ifndef windows}
function poppler_media_save_to_fd(poppler_media: PPopplerMedia; fd: longint; error: PPGError): Tgboolean; cdecl; external poppler_glib;
{$endif}

function poppler_media_save_to_callback(poppler_media: PPopplerMedia; save_func: TPopplerMediaSaveFunc; user_data: Tgpointer; error: PPGError): Tgboolean; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:55:14 ===

function POPPLER_TYPE_MEDIA: TGType;
function POPPLER_MEDIA(obj: Pointer): PPopplerMedia;
function POPPLER_IS_MEDIA(obj: Pointer): Tgboolean;

implementation

function POPPLER_TYPE_MEDIA: TGType;
begin
  POPPLER_TYPE_MEDIA := poppler_media_get_type;
end;

function POPPLER_MEDIA(obj: Pointer): PPopplerMedia;
begin
  Result := PPopplerMedia(g_type_check_instance_cast(obj, POPPLER_TYPE_MEDIA));
end;

function POPPLER_IS_MEDIA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, POPPLER_TYPE_MEDIA);
end;



end.
