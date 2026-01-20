unit fp_graphviz;

interface

const
  {$IFDEF Linux}
  libgvc = 'gvc';
  libgvpr = 'gvpr';
  libcgraph = 'cgraph';
  libcdt = 'cdt';
  libpathplan = 'pathplan';
  libxdot = 'xdot';
  {$ENDIF}

  {$IFDEF Windows}
  libgvc = 'libgvc-7.dll';
  libgvpr = 'libgvpr-2.dll';
  libcgraph = 'libcgraph-8.dll';
  libcdt = 'libcdt-6.dll';
  libpathplan = 'libpathplan-4.dll';
  libxdot = 'libxdot-4.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tsize_t = SizeUInt;
  Tssize_t = SizeInt;

  Pvmalloc_s = type Pointer; // Herkunft unbekannt

  PFILE = type Pointer;

  {$DEFINE read_interface}
  {$include fp_graphviz_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include fp_graphviz_includes.inc}
{$UNDEF read_interface}
end.
