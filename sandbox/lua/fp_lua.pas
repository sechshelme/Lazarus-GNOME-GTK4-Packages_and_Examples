unit fp_lua;

interface

const
  {$IFDEF Linux}
  libchafa = 'chafa';
  {$ENDIF}

  {$IFDEF Windows}
  libchafa = 'libchafa-0.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  Tptrdiff_t=PtrInt;

  {$DEFINE read_interface}
//  {$include fp_lua_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_lua_includes.inc}
{$UNDEF read_implementation}


end.

