unit fp_fuse;

interface

uses
  fp_socket;

const
  {$IFDEF linux}
  libfuse3 = 'libfuse3';
  {$ENDIF}

  {$IFDEF windows}
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tva_list = Pointer;

  Tmode_t = Pointer;


  Pflock = Pointer;
  Pstatvfs = Pointer;


  {$DEFINE read_interface}
  //  {$include fp_pcap_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
//{$include fp_pcap_includes.inc}
{$UNDEF read_interface}
end.
