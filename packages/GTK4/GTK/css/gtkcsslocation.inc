
{$IFDEF read_interface}

type
  PGtkCssLocation = ^TGtkCssLocation;
  TGtkCssLocation = record
      bytes : Tgsize;
      chars : Tgsize;
      lines : Tgsize;
      line_bytes : Tgsize;
      line_chars : Tgsize;
    end;


// === Konventiert am: 2-8-24 19:06:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
