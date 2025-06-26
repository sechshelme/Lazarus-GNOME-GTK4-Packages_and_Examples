unit mgl_command;


interface

const
  {$ifdef linux}
  libclib = 'c';
  libmgl = 'libmgl';
  libmglqt = 'libmgl-qt';
  {$endif}

  {$ifdef windows}
  libclib = 'msvcrt';
  libmgl = 'mgl.dll'; // ???
  libmglqt = 'mgl-qt.dll';
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

  TFILE = record
  end;
  PFILE = ^TFILE;

implementation

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
end.

end.
