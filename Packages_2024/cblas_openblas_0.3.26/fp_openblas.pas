unit fp_openblas;

interface

const
  {$IFDEF linux}
  libopenblas = 'openblas';
  {$ENDIF}

  {$IFDEF windows}
  libopenblas = 'libopenblas.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeUInt;

type // /usr/include/x86_64-linux-gnu/bits/cpu-set.h
  Pcpu_set_t = type Pointer;


  {$DEFINE read_interface}
  {$include openblas/openblas_config.inc}
  {$include openblas/cblas_openblas.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include openblas/openblas_config.inc}
{$include openblas/cblas_openblas.inc}
{$UNDEF read_interface}


end.
