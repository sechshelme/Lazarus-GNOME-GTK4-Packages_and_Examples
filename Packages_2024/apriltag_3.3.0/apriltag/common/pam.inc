{$IFDEF read_interface}


const
  PAM_GRAYSCALE_ALPHA = 5000;
  PAM_RGB_ALPHA = 5001;
  PAM_RGB = 5002;
  PAM_GRAYSCALE = 5003;

type
  Ppam_t = ^Tpam_t;
  Tpam_t = record
    _type: longint;
    width: longint;
    height: longint;
    depth: longint;
    maxval: longint;
    datalen: longint;
    data: Puint8_t;
  end;


function pam_create_from_file(inpath: pchar): Ppam_t; cdecl; external libapriltag_utils;
function pam_write_file(pam: Ppam_t; outpath: pchar): longint; cdecl; external libapriltag_utils;
procedure pam_destroy(pam: Ppam_t); cdecl; external libapriltag_utils;
function pam_copy(pam: Ppam_t): Ppam_t; cdecl; external libapriltag_utils;
function pam_convert(in_: Ppam_t; _type: longint): Ppam_t; cdecl; external libapriltag_utils;

// === Konventiert am: 12-9-26 17:22:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
