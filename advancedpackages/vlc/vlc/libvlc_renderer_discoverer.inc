{$IFDEF read_interface}


const
  VLC_LIBVLC_RENDERER_DISCOVERER_H = 1;

type
  Plibvlc_renderer_discoverer_t = type Pointer;

  Tlibvlc_rd_description_t = record
    psz_name: pchar;
    psz_longname: pchar;
  end;
  Plibvlc_rd_description_t = ^Tlibvlc_rd_description_t;
  PPlibvlc_rd_description_t = ^Plibvlc_rd_description_t;
  PPPlibvlc_rd_description_t = ^PPlibvlc_rd_description_t;

const
  LIBVLC_RENDERER_CAN_AUDIO = $0001;
  LIBVLC_RENDERER_CAN_VIDEO = $0002;

type
  Plibvlc_renderer_item_t = type Pointer;

function libvlc_renderer_item_hold(p_item: Plibvlc_renderer_item_t): Plibvlc_renderer_item_t; cdecl; external libvlc;
procedure libvlc_renderer_item_release(p_item: Plibvlc_renderer_item_t); cdecl; external libvlc;
function libvlc_renderer_item_name(p_item: Plibvlc_renderer_item_t): pchar; cdecl; external libvlc;
function libvlc_renderer_item_type(p_item: Plibvlc_renderer_item_t): pchar; cdecl; external libvlc;
function libvlc_renderer_item_icon_uri(p_item: Plibvlc_renderer_item_t): pchar; cdecl; external libvlc;
function libvlc_renderer_item_flags(p_item: Plibvlc_renderer_item_t): longint; cdecl; external libvlc;
function libvlc_renderer_discoverer_new(p_inst: Plibvlc_instance_t; psz_name: pchar): Plibvlc_renderer_discoverer_t; cdecl; external libvlc;
procedure libvlc_renderer_discoverer_release(p_rd: Plibvlc_renderer_discoverer_t); cdecl; external libvlc;
function libvlc_renderer_discoverer_start(p_rd: Plibvlc_renderer_discoverer_t): longint; cdecl; external libvlc;
procedure libvlc_renderer_discoverer_stop(p_rd: Plibvlc_renderer_discoverer_t); cdecl; external libvlc;
function libvlc_renderer_discoverer_event_manager(p_rd: Plibvlc_renderer_discoverer_t): Pointer; cdecl; external libvlc;
function libvlc_renderer_discoverer_list_get(p_inst: Plibvlc_instance_t; ppp_services: PPPlibvlc_rd_description_t): Tsize_t; cdecl; external libvlc;
procedure libvlc_renderer_discoverer_list_release(pp_services: PPlibvlc_rd_description_t; i_count: Tsize_t); cdecl; external libvlc;

// === Konventiert am: 13-10-25 19:24:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
