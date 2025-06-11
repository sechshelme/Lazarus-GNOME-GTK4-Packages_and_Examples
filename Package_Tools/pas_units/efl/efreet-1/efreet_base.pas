unit efreet_base;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function efreet_data_home_get: pchar; cdecl; external libefreet;
function efreet_data_dirs_get: PEina_List; cdecl; external libefreet;
function efreet_config_home_get: pchar; cdecl; external libefreet;
function efreet_desktop_dir_get: pchar; cdecl; external libefreet;
function efreet_download_dir_get: pchar; cdecl; external libefreet;
function efreet_templates_dir_get: pchar; cdecl; external libefreet;
function efreet_public_share_dir_get: pchar; cdecl; external libefreet;
function efreet_documents_dir_get: pchar; cdecl; external libefreet;
function efreet_music_dir_get: pchar; cdecl; external libefreet;
function efreet_pictures_dir_get: pchar; cdecl; external libefreet;
function efreet_videos_dir_get: pchar; cdecl; external libefreet;
function efreet_config_dirs_get: PEina_List; cdecl; external libefreet;
function efreet_cache_home_get: pchar; cdecl; external libefreet;
function efreet_runtime_dir_get: pchar; cdecl; external libefreet;
function efreet_hostname_get: pchar; cdecl; external libefreet;

type
  TEfreet_Event_Cache_Update = record
    error: longint;
  end;
  PEfreet_Event_Cache_Update = ^TEfreet_Event_Cache_Update;


  // === Konventiert am: 11-6-25 17:06:10 ===


implementation



end.
