unit fp_mgl2;

interface

  const
    {$ifdef linux}
    libclib = 'c';
    libmgl = 'libmgl';
    libmglqt = 'libmgl-qt';
    libmglfltk = 'libmgl-fltk';
    libmglqlut = 'libmgl-glut';
    libmglmpi = 'libmgl-mpi';
    libmglwnd = 'libmgl-wnd';
    {$endif}

    {$ifdef windows}
    libclib = 'msvcrt';
    libmgl = 'mgl.dll'; // ???
    libmglqt = 'mgl-qt.dll';
    libmglfltk = 'libmgl-fltk.dll';
    libmglqlut = 'libmgl-glut.dll';
    libmglmpi = 'libmgl-mpi.dll';
    libmglwnd = 'libmgl-wnd.dll';
    {$endif}

    {$ifdef darwin}
    libclib = 'c';
    libmgl = 'libmgldylib';   // ???
    {$endif}


  type
    {$IFDEF Linux}
    Twchar_t = uint32;
    {$ENDIF}

    {$IFDEF Windows}
    Twchar_t = uint16;
    {$ENDIF}
    Pwchar_t = ^Twchar_t;

    Tuintptr_t = PtrUInt;
    Puintptr_t = ^Tuintptr_t;

    Tsize_t = SizeUInt;

    Ppthread_mutex_t = Pointer;

    TFILE = record
    end;
    PFILE = ^TFILE;

    PPsingle = ^PSingle;
    PPPsingle = ^PPSingle;

    PPdouble = ^Pdouble;
    PPPdouble = ^PPdouble;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_mgl2_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_mgl2_includes.inc}
{$UNDEF read_implementation}

{$IF defined(CPUX86) or defined(CPUX64)}
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
