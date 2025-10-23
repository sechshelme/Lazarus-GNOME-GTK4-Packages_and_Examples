unit fp_csfml;

interface

const
  {$IFDEF Linux}
  libcsfml_audio = 'libcsfml-audio';
  libcsfml_graphics = 'libcsfml-graphics';
  libcsfml_network = 'libcsfml-network';
  libcsfml_system = 'libcsfml-system';
  libcsfml_window = 'libcsfml-window';
  {$ENDIF}

  {$IFDEF Windows}
  libcsfml_audio = 'libcsfml-audio-3.dll';
  libcsfml_graphics = 'libcsfml-graphics-3.dll';
  libcsfml_network = 'libcsfml-network-3.dll';
  libcsfml_system = 'libcsfml-system-3.dll';
  libcsfml_window = 'libcsfml-window-3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;
  Pwchar_t = type Pointer;

  {$DEFINE read_interface}
  {$include fp_csfml_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_csfml_includes.inc}
{$UNDEF read_implementation}

end.
