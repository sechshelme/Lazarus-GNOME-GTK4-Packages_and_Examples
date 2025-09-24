unit InputStream;

interface

uses
  fp_sfml, Config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TsfInputStreamReadFunc = function(data: pointer; size: TsfInt64; userData: pointer): TsfInt64; cdecl;
  TsfInputStreamSeekFunc = function(position: TsfInt64; userData: pointer): TsfInt64; cdecl;
  TsfInputStreamTellFunc = function(userData: pointer): TsfInt64; cdecl;
  TsfInputStreamGetSizeFunc = function(userData: pointer): TsfInt64; cdecl;

  TsfInputStream = record
    read: TsfInputStreamReadFunc;
    seek: TsfInputStreamSeekFunc;
    tell: TsfInputStreamTellFunc;
    getSize: TsfInputStreamGetSizeFunc;
    userData: pointer;
  end;
  PsfInputStream = ^TsfInputStream;

  // === Konventiert am: 24-9-25 16:57:28 ===


implementation



end.
