unit fp_qhull_r;

interface

const
  {$ifdef linux}
  libqhull_r = 'qhull_r';
  {$endif}

  {$ifdef windows}
  libqhull_r = 'libqhull_r.dll';
  {$endif}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
    PFILE=type Pointer;

    Tsize_t=SizeUInt;

    Tjmp_buf=array[0..199]of Byte;

  type
    {$IFDEF Linux}
    Tculong = uint64;
    Tclong = int64;
    Tlong_double = extended;
    {$ENDIF}

    {$IFDEF Windows}
    Tculong = uint32;
    Tclong = int32;
    Tlong_double = double;
    {$ENDIF}
    Pculong = ^Tculong;
    Pclong = ^Tclong;

    {$IFDEF linux}
    var
      stdin: PFILE; cvar; external 'c';
      stdout: PFILE; cvar; external 'c';
      stderr: PFILE; cvar; external 'c';
    {$ENDIF}

    {$IFDEF windows}
    function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

    function stdout: PFILE; inline;
    {$ENDIF}


implementation

{$IFDEF windows}
function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;
{$ENDIF}


end.

