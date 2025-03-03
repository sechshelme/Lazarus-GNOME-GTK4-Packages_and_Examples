unit xml2_common;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libxml2 = 'libxml2';
  {$ENDIF}

  {$IFDEF Windows}
  libxml2 = 'libxml2.dll'; // ????
  {$ENDIF}

type
  // system
  Tva_list = Pointer;
  Pva_list = ^Tva_list;

  Tsize_t=SizeInt;
  PFILE=Pointer;

  // /usr/include/unicode/ucnv_err.h
  TUConverter=record
  end;
  PUConverter=^TUConverter;

  // /usr/include/unicode/umachine.h
  TUChar=word;
  PUChar=^TUChar;

  // /usr/include/iconv.h
  Ticonv_t=Pointer;
  Piconv_t=^Ticonv_t;


//  // Internals
//type
//  TxmlSchemaTypePtr = Pointer; // /usr/include/libxml2/libxml/schemasInternals.h
//  TxmlSchemaValPtr = Pointer;
//  PxmlSchemaValPtr = ^TxmlSchemaValPtr;
//  TxmlSchemaFacetPtr=Pointer;
//  TxmlSchemaValType=LongInt;




implementation

end.
