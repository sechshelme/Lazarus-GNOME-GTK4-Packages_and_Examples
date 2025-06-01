  {$IFDEF read_interface}

type
  TEina_Slice = record
    len: Tsize_t;
    case longint of
      0: (mem: pointer);
      1: (bytes: Puint8);
  end;
  PEina_Slice = ^TEina_Slice;

  TEina_Rw_Slice = record
    len: Tsize_t;
    case longint of
      0: (mem: pointer);
      1: (bytes: Puint8);
  end;
  PEina_Rw_Slice = ^TEina_Rw_Slice;

const
  EINA_SLICE_STR_FMT = '%.*s';
  EINA_SLICE_FMT = '%p+%zu';

  // === Konventiert am: 16-5-25 17:19:46 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
