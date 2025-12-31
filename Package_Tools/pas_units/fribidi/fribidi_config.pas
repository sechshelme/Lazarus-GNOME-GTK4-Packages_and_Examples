unit fribidi_config;

interface

uses
  fp_fribidi;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ lib/fribidi-config.h.  Generated from fribidi-config.h.in by configure.  }
{ Not copyrighted, in public domain.  }
{$ifndef FRIBIDI_CONFIG_H}
{$define FRIBIDI_CONFIG_H}

const
  FRIBIDI = 'fribidi';  
  FRIBIDI_NAME = 'GNU FriBidi';  
  FRIBIDI_BUGREPORT = 'https://github.com/fribidi/fribidi/issues/new';  
  FRIBIDI_VERSION = '1.0.13';  
  FRIBIDI_MAJOR_VERSION = 1;  
  FRIBIDI_MINOR_VERSION = 0;  
  FRIBIDI_MICRO_VERSION = 13;  
  FRIBIDI_INTERFACE_VERSION = 4;  
  FRIBIDI_INTERFACE_VERSION_STRING = '4';  
{ The size of a `int', as computed by sizeof.  }
  FRIBIDI_SIZEOF_INT = 4;  
{ Define if fribidi was built with MSVC  }
{$undef FRIBIDI_BUILT_WITH_MSVC}
{$endif}
{ FRIBIDI_CONFIG_H  }

// === Konventiert am: 31-12-25 16:08:56 ===


implementation



end.
