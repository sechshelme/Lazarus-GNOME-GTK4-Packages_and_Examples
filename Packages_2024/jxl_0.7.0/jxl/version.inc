{$IFDEF read_interface}


const
  JPEGXL_MAJOR_VERSION = 0;
  JPEGXL_MINOR_VERSION = 7;
  JPEGXL_PATCH_VERSION = 0;

function JPEGXL_COMPUTE_NUMERIC_VERSION(major, minor, patch: longint): longint;
function JPEGXL_NUMERIC_VERSION: longint;

// === Konventiert am: 14-8-26 19:27:38 ===

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JPEGXL_COMPUTE_NUMERIC_VERSION(major, minor, patch: longint): longint;
begin
  JPEGXL_COMPUTE_NUMERIC_VERSION := (((major shl 24) or (minor shl 16)) or (patch shl 8)) or 0;
end;

function JPEGXL_NUMERIC_VERSION: longint;
begin
  JPEGXL_NUMERIC_VERSION := JPEGXL_COMPUTE_NUMERIC_VERSION(JPEGXL_MAJOR_VERSION, JPEGXL_MINOR_VERSION, JPEGXL_PATCH_VERSION);
end;

{$ENDIF read_implementation}
