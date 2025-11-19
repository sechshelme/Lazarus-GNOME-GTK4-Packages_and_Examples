unit version;

interface

uses
  fp_asound;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  SND_LIB_MAJOR = 1;
  SND_LIB_MINOR = 2;
  SND_LIB_SUBMINOR = 11;
  SND_LIB_EXTRAVER = 1000000;

function SND_LIB_VER(maj, min, sub: longint): longint;
function SND_LIB_VERSION: longint;

const
  SND_LIB_VERSION_STR = '1.2.11';

  // === Konventiert am: 19-11-25 16:11:22 ===


implementation


function SND_LIB_VER(maj, min, sub: longint): longint;
begin
  SND_LIB_VER := ((maj shl 16) or (min shl 8)) or sub;
end;

function SND_LIB_VERSION: longint;
begin
  SND_LIB_VERSION := SND_LIB_VER(SND_LIB_MAJOR, SND_LIB_MINOR, SND_LIB_SUBMINOR);
end;


end.
