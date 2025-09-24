unit fp_sfml;

interface

const
  {$IFDEF Linux}
  libsfml_audio = 'libsfml-audio';
  libsfml_graphics = 'libsfml-graphics';
  libsfml_network = 'libsfml-network';
  libsfml_system = 'libsfml-system';
  libsfml_window = 'libsfml-window';
  {$ENDIF}

  {$IFDEF Windows}
  libsfml_audio = 'libsfml-audio-3.dll';
  libsfml_graphics = 'libsfml-graphics-3.dll';
  libsfml_network = 'libsfml-network-3.dll';
  libsfml_system = 'libsfml-system-3.dll';
  libsfml_window = 'libsfml-window-3.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  type
  Tsize_t=SizeUInt;
  Psize_t=^Tsize_t;

  {$DEFINE read_interface}
  //  {$include fp_sfml_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
//{$include fp_sfml_includes.inc}
{$UNDEF read_implementation}

end.
