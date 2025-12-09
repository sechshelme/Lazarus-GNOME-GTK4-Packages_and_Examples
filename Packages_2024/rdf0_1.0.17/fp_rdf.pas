unit fp_rdf;

interface

uses
  fp_raptor2;

const
  {$IFDEF Linux}
  librdf = 'rdf';
  {$ENDIF}

  {$IFDEF Windows}
  librdf = 'librdf.dll'; // ??????
  {$ENDIF}

type
  {$IFDEF Linux}
  Tclong = int64;
  Tculong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tclong = int32;
  Tculong = uint32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  Tva_list = Pointer; // ????


  // /usr/include/rasqal/rasqal.h
type
  Prasqal_world = type Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tset_msg_proc = procedure(user_data: pointer; msg: pchar); cdecl;

  // === Konventiert am: 26-11-25 19:55:10 ===

  {$DEFINE read_interface}
  {$include fp_rdf_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_rdf_includes.inc}
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

end.
