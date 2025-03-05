{$IFDEF read_interface}


type
  // system
  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  Tsize_t = SizeInt;
//  PFILE = Pointer;

  // /usr/include/unicode/ucnv_err.h
  TUConverter = record
  end;
  PUConverter = ^TUConverter;

  // /usr/include/unicode/umachine.h
  TUChar = word;
  PUChar = ^TUChar;

  // /usr/include/iconv.h
  Ticonv_t = Pointer;
  Piconv_t = ^Ticonv_t;


{$ENDIF read_interface}


{$IFDEF read_implementation}

{$ENDIF read_implementation}
