unit fp_nm;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libnm = 'libnm';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  INET6_ADDRSTRLEN = 46;

  {$DEFINE read_enum}
  {$include fp_nm_includes.inc}
  {$UNDEF read_enum}

  {$DEFINE read_struct}
  {$include fp_nm_includes.inc}
  {$UNDEF read_struct}

  {$DEFINE read_function}
  {$include fp_nm_includes.inc}
  {$UNDEF read_function}

implementation

{$DEFINE read_implementation}
{$include fp_nm_includes.inc}
{$UNDEF read_implementation}

end.
