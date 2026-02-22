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

    {$ifdef linux}
    Tjmp_buf=array[0..199]of Byte;
    {$endif}

    {$ifdef windows}
    Tjmp_buf=array[0..255]of Byte;
    {$endif}


  type
    {$IFDEF Linux}
    Tculong = uint64;
    Tclong = int64;
    Tlong_double = extended;
    {$ENDIF}

    {$IFDEF Windows}
    Tculong = uint64;
    Tclong = int64;
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
    function stdin: PFILE; inline;
    function stdout: PFILE; inline;
    function stderr: PFILE; inline;
    {$ENDIF}


    {$DEFINE read_interface}
    {$include fp_qhull_includes.inc}
    {$UNDEF read_interface}


  implementation

  {$DEFINE read_implementation}
  {$include fp_qhull_includes.inc}
  {$UNDEF read_implementation}

{$IFDEF windows}
function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

function stdin: PFILE; inline;
begin
  Result := __iob_func + 0;
end;

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;

function stderr: PFILE; inline;
begin
  Result := __iob_func + 96;
end;

{$ENDIF}


end.

