unit fp_rdf;

interface

const
  {$IFDEF Linux}
  librdf = 'rdf';
  {$ENDIF}

  {$IFDEF Windows}
  librdf = 'librdf.dll'; // ??????
  {$ENDIF}

type
  {$IFDEF Linux}
  Tlong = int64;
  Tulong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tlong = int32;
  Tulong = uint32;
  {$ENDIF}
  Pulong = ^Tulong;
  Plong = ^Tlong;

  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  PFILE=type Pointer;

  Tva_list=Pointer; // ????


  // /usr/include/raptor2/raptor2.h
type
  Traptor_unichar  =  Tulong;

  Praptor_locator=type Pointer;
  Praptor_world=type Pointer;
  Praptor_term = type Pointer;
  Praptor_statement = type Pointer;
  Praptor_iostream=type Pointer;

const // enum
  RAPTOR_TERM_TYPE_UNKNOWN = 0;
  RAPTOR_TERM_TYPE_URI     = 1;
  RAPTOR_TERM_TYPE_LITERAL = 2;
  RAPTOR_TERM_TYPE_BLANK   = 4;



// /usr/include/rasqal/rasqal.h
type
  Prasqal_world=type Pointer;


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


// === Konventiert am: 26-11-25 19:55:10 ===


implementation



end.
