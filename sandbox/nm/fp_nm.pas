unit fp_nm;

interface

uses
  fp_glib2;

const
  {$IFDEF Linux}
  libnm = 'nm';
  {$ENDIF}

  {$IFDEF Windows}
  {$FATAL  no supported}
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
    INET6_ADDRSTRLEN = 46;

  {$DEFINE read_interface}
//  {$include fp_nm_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_nm_includes.inc}
{$UNDEF read_implementation}

end.

