
{$IFDEF read_struct}
type
  PGtkCssLocation = ^TGtkCssLocation;
  TGtkCssLocation = record
      bytes : Tgsize;
      chars : Tgsize;
      lines : Tgsize;
      line_bytes : Tgsize;
      line_chars : Tgsize;
    end;
  {$ENDIF read_struct}


// === Konventiert am: 2-8-24 19:06:05 ===


{$IFDEF read_implementation}



{$ENDIF read_implementation}
