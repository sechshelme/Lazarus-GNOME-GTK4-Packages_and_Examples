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

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  PFILE = type Pointer;

  Tva_list = Pointer; // ????

  // /usr/include/raptor2/raptor2.h
type
  Traptor_unichar = Tulong;

  Praptor_locator = type Pointer;
  Praptor_world = type Pointer;
  Praptor_term = type Pointer;
  Praptor_statement = type Pointer;
  Praptor_iostream = type Pointer;
  Praptor_syntax_description = type Pointer;

const // enum
  RAPTOR_TERM_TYPE_UNKNOWN = 0;
  RAPTOR_TERM_TYPE_URI = 1;
  RAPTOR_TERM_TYPE_LITERAL = 2;
  RAPTOR_TERM_TYPE_BLANK = 4;



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
