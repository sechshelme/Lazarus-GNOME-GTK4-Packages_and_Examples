{$IFDEF read_interface}



const
  LIBVLC_VERSION_H = 1;
  LIBVLC_VERSION_MAJOR = 3;
  LIBVLC_VERSION_MINOR = 0;
  LIBVLC_VERSION_REVISION = 20;
  LIBVLC_VERSION_EXTRA = 0;

function LIBVLC_VERSION(maj, min, rev, extra: longint): longint;

function LIBVLC_VERSION_INT: longint;

// === Konventiert am: 13-10-25 19:24:53 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function LIBVLC_VERSION(maj, min, rev, extra: longint): longint;
begin
  LIBVLC_VERSION := (((maj shl 24) or (min shl 16)) or (rev shl 8)) or extra;
end;

function LIBVLC_VERSION_INT: longint;
begin
  LIBVLC_VERSION_INT := LIBVLC_VERSION(LIBVLC_VERSION_MAJOR, LIBVLC_VERSION_MINOR, LIBVLC_VERSION_REVISION, LIBVLC_VERSION_EXTRA);
end;


{$ENDIF read_implementation}
