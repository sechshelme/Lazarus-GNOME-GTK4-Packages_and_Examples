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
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int64;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

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

//  PxmlOutputBuffer = type Pointer;



  {$DEFINE read_interface}
  {$include fp_xml2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_xml2_includes.inc}
{$UNDEF read_implementation}

// wegen "division_by_zero" in den clibs
{$IF defined(CPUX86) or defined(CPUX64)}
{$asmmode intel}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
{$ENDIF}

begin
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
end.
