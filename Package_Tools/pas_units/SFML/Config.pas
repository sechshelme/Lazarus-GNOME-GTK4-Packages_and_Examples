unit Config;

interface

uses
  fp_sfml;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  CSFML_VERSION_MAJOR = 2;
  CSFML_VERSION_MINOR = 6;
  CSFML_VERSION_PATCH = 0;

type
  PsfBool = ^TsfBool;
  TsfBool = Boolean32;

const
  sfFalse = False;
  sfTrue = True;

type
  PsfInt8 = ^TsfInt8;
  TsfInt8 = int8;

  PsfUint8 = ^TsfUint8;
  TsfUint8 = uint8;

  PsfInt16 = ^TsfInt16;
  TsfInt16 = int16;

  PsfUint16 = ^TsfUint16;
  TsfUint16 = uint16;

  PsfInt32 = ^TsfInt32;
  TsfInt32 = int32;

  PsfUint32 = ^TsfUint32;
  TsfUint32 = uint32;

  PsfInt64 = ^TsfInt64;
  TsfInt64 = int64;

  PsfUint64 = ^TsfUint64;
  TsfUint64 = uint64;

  // === Konventiert am: 24-9-25 17:00:00 ===


implementation



end.
