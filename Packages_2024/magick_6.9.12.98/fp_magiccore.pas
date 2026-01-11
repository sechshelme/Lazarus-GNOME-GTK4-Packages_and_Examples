unit fp_magiccore;

interface

const
  {$IFDEF Linux}
  libmagickcore = 'MagickCore-6.Q16';
  libmagickwand = 'MagickWand-6.Q16';
  {$ENDIF}

  {$IFDEF Windows}
  libmagickcore = 'libMagickCore-6.Q16-7.dll';
  libmagickwand = 'libMagickWand-6.Q16-7.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Tssize_t = SizeInt;
  Pssize_t = ^Tssize_t;

  PFILE = type Pointer;

  Tva_list = Pointer; // ?????

  Ttime_t = uint64;
  Ptime_t = ^Ttime_t;

  Toff_t = SizeInt;
  Poff_t = ^Toff_t;


const
  ENOMEM = 12;
  MAGICKCORE_QUANTUM_DEPTH = 16;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$DEFINE read_interface}
  {$include core/fp_magic_core_const_includes.inc}
  {$include core/fp_magic_core_type_includes.inc}
  {$include core/fp_magic_core_methodes_includes.inc}
  {$include core/fp_magic_core_macro_includes.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include core/fp_magic_core_macro_includes.inc}
{$UNDEF read_implementation}

end.
