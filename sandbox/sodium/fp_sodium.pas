unit fp_sodium;

interface

const
  {$IFDEF Linux}
  libsodium = 'sodium';
  {$ENDIF}

  {$IFDEF windows}
  libsodium = 'libsodium.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
  Tsize_t=SizeUInt;

  Tuint8_t=UInt8;
  Tuint16_t=UInt16;
  Tuint32_t=UInt32 ;
  Tuint64_t=UInt64  ;

  Tprocedure=procedure;

  const
  SODIUM_SIZE_MAX = High(PtrUInt);


  {$DEFINE read_interface}
//  {$include fp_sodium_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_sodium_includes.inc}
{$UNDEF read_implementation}

end.

