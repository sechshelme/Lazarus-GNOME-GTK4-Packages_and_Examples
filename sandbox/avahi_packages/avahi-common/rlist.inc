{$IFDEF read_interface}


type
  PAvahiRList = ^TAvahiRList;

  TAvahiRList = record
    rlist_next: PAvahiRList;
    rlist_prev: PAvahiRList;
    data: Pointer;
  end;

function avahi_rlist_prepend(r: PAvahiRList; data: pointer): PAvahiRList; cdecl; external libavahi_common;
function avahi_rlist_remove(r: PAvahiRList; data: pointer): PAvahiRList; cdecl; external libavahi_common;
function avahi_rlist_remove_by_link(r: PAvahiRList; n: PAvahiRList): PAvahiRList; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:59:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
