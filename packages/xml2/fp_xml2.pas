unit fp_xml2;

interface

uses
  ctypes;

const
  {$IFDEF Linux}
  libxml2 = 'libxml2';
  {$ENDIF}

  {$IFDEF Windows}
  libxml2 = 'libxml2.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeInt;

  PFILE = Pointer;

  Tva_list = Pointer; // ????

  // /usr/include/unicode/ucnv_err.h
type
  PUConverter = type Pointer;

  // /usr/include/iconv.h
  Ticonv_t = Pointer;
  Piconv_t = ^Ticonv_t;



  {$DEFINE read_interface}
  {$include fp_xml2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_xml2_includes.inc}
{$UNDEF read_implementation}

end.
