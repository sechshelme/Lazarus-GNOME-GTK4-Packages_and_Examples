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

implementation

{$DEFINE read_implementation}
{$include fp_polylib_includes.inc}
{$UNDEF read_implementation}


end.
