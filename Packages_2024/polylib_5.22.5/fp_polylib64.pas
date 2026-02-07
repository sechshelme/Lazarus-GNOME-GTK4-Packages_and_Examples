unit fp_polylib64;

interface

const
  {$IFDEF Linux}
  libpolylib = 'polylib64';
  {$ENDIF}

  {$IFDEF Windows}
  libpolylib = 'libpolylib64.dll'; // ????
  {$ENDIF}

type
  PPdword = ^PWord;

  Tsize_t = SizeUInt;

  PFILE = type Pointer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_polylib_includes.inc}
  {$UNDEF read_interface}

  {$IFDEF linux}
  var
    stdout: PFILE; cvar; external 'c';
  {$ENDIF}

  {$IFDEF windows}
  function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

  function stdout: PFILE; inline;
  {$ENDIF}


implementation

{$DEFINE read_implementation}
{$include fp_polylib_includes.inc}
{$UNDEF read_implementation}


{$IFDEF windows}
function __iob_func: PFILE; cdecl; external 'msvcrt.dll';

function stdout: PFILE; inline;
begin
  Result := __iob_func + 48;
end;
{$ENDIF}

end.
