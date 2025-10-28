  {$IFDEF read_interface}


type
  Pu8 = ^Tu8;
  Tu8 = uint8;

  Pu16 = ^Tu16;
  Tu16 = uint16;

  Pu32 = ^Tu32;
  Tu32 = uint32;

  Pu64 = ^Tu64;
  Tu64 = uint64;

type
  Ppciaddr_t = ^Tpciaddr_t;
  Tpciaddr_t = Tu64;

const
  {$ifdef linux}
  PCI_U64_FMT_X = 'lx';
  PCI_U64_FMT_U = 'lu';
  {$endif}

  {$ifdef windows}
  PCI_U64_FMT_X = 'llx';
  PCI_U64_FMT_U = 'llu';
  {$endif}


  // === Konventiert am: 28-6-25 19:49:19 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
