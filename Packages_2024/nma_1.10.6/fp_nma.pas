unit fp_nma;

interface

uses
  fp_glib2, fp_cairo, fp_GTK4, fp_nm;

const
  {$IFDEF Linux}
  libnma = 'nma-gtk4 ';
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
  {$include fp_nma_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_nma_includes.inc}
{$UNDEF read_implementation}

end.
