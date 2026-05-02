{$IFDEF read_interface}

type
  Pdint64 = ^Tdint64;
  Tdint64 = int64;

  Pduint64 = ^Tduint64;
  Tduint64 = uint64;

  Pdint32 = ^Tdint32;
  Tdint32 = int32;

  Pduint32 = ^Tduint32;
  Tduint32 = uint32;

  Pdint16 = ^Tdint16;
  Tdint16 = int16;

  Pduint16 = ^Tduint16;
  Tduint16 = uint16;

  Pdint8 = ^Tdint8;
  Tdint8 = int8;

  Pduint8 = ^Tduint8;
  Tduint8 = uint8;

  Pdintptr = ^Tdintptr;
  Tdintptr = PtrInt;

  Pduintptr = ^Tduintptr;
  Tduintptr = PtrUInt;

  Pddiffint = ^Tddiffint;
  Tddiffint = SizeInt;

  Pdsizeint = ^Tdsizeint;
  Tdsizeint = SizeUInt;

const
  dInfinity=1.0/0.0;

  // === Konventiert am: 30-4-26 17:09:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
