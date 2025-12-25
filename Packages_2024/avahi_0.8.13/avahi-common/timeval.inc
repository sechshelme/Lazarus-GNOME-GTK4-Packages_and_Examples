{$IFDEF read_interface}


type
  PAvahiUsec = ^TAvahiUsec;
  TAvahiUsec = Tint64_t;

function avahi_timeval_compare(a:Ptimeval; b:Ptimeval):longint;cdecl;external libavahi_common;
function avahi_timeval_diff(a:Ptimeval; b:Ptimeval):TAvahiUsec;cdecl;external libavahi_common;
function avahi_timeval_add(a:Ptimeval; usec:TAvahiUsec):Ptimeval;cdecl;external libavahi_common;
function avahi_age(a:Ptimeval):TAvahiUsec;cdecl;external libavahi_common;
function avahi_elapse_time(tv:Ptimeval; ms:dword; j:dword):Ptimeval;cdecl;external libavahi_common;

// === Konventiert am: 24-12-25 15:59:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
