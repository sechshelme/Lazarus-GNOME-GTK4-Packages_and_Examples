{$IFDEF read_interface}


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
  Tuintptr_t = PtrUInt;
  Puintptr_t = ^Tuintptr_t;

  Tsize_t = SizeUInt;

  Twchar_t = widechar;
  Pwchar_t = ^Twchar_t;

  Ppthread_mutex_t = Pointer;

  TFILE = record
  end;
  PFILE = ^TFILE;

  PPsingle = ^PSingle;
  PPPsingle = ^PPSingle;

  PPdouble = ^Pdouble;
  PPPdouble = ^PPdouble;

{$ENDIF read_interface}


{$IFDEF read_implementation}

{$IF defined(CPUX86) or defined(CPUX64)}
procedure SetMXCSR;
var
  w2: word = 8064;
begin
  asm
           Ldmxcsr w2
  end;
end;
//{$ENDIF}
{$ENDIF}

begin
  //  SetExceptionMask([exInvalidOp, exDenormalized, exZeroDivide, exOverflow, exUnderflow, exPrecision]);
  //{$IFDEF Linux}
  {$IF defined(CPUX86) or defined(CPUX64)}
  SetMXCSR;
  {$ENDIF}
{$ENDIF read_implementation}
