{$IFDEF read_interface}


type
  Plibvlc_media_discoverer_category_t = ^Tlibvlc_media_discoverer_category_t;
  Tlibvlc_media_discoverer_category_t = longint;

const
  libvlc_media_discoverer_devices = 0;
  libvlc_media_discoverer_lan = 1;
  libvlc_media_discoverer_podcasts = 2;
  libvlc_media_discoverer_localdirs = 3;

type
  Tlibvlc_media_discoverer_description_t = record
    psz_name: pchar;
    psz_longname: pchar;
    i_cat: Tlibvlc_media_discoverer_category_t;
  end;
  Plibvlc_media_discoverer_description_t = ^Tlibvlc_media_discoverer_description_t;
  PPlibvlc_media_discoverer_description_t = ^Plibvlc_media_discoverer_description_t;
  PPPlibvlc_media_discoverer_description_t = ^PPlibvlc_media_discoverer_description_t;

  Plibvlc_media_discoverer_t = type Pointer;

function libvlc_media_discoverer_new(p_inst: Plibvlc_instance_t; psz_name: pchar): Plibvlc_media_discoverer_t; cdecl; external libvlc;
function libvlc_media_discoverer_start(p_mdis: Plibvlc_media_discoverer_t): longint; cdecl; external libvlc;
procedure libvlc_media_discoverer_stop(p_mdis: Plibvlc_media_discoverer_t); cdecl; external libvlc;
procedure libvlc_media_discoverer_release(p_mdis: Plibvlc_media_discoverer_t); cdecl; external libvlc;
function libvlc_media_discoverer_media_list(p_mdis: Plibvlc_media_discoverer_t): Plibvlc_media_list_t; cdecl; external libvlc;
function libvlc_media_discoverer_is_running(p_mdis: Plibvlc_media_discoverer_t): longint; cdecl; external libvlc;
function libvlc_media_discoverer_list_get(p_inst: Plibvlc_instance_t; i_cat: Tlibvlc_media_discoverer_category_t; ppp_services: PPPlibvlc_media_discoverer_description_t): Tsize_t; cdecl; external libvlc;
procedure libvlc_media_discoverer_list_release(pp_services: PPlibvlc_media_discoverer_description_t; i_count: Tsize_t); cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
