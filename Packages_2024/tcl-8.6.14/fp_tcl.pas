unit fp_tcl;

interface

uses
  {$IFDEF Linux}
  x, xlib;
  {$ENDIF}

const
  {$IFDEF Linux}
  libtcl8_6 = 'libtcl8.6';
  libtk8_6 = 'libtk8.6';
  libtclstub8_6 = 'libtclstub8.6';
  libtkstub8_6 = 'libtkstub8.6';
  {$ENDIF}

  {$IFDEF Windows}
  libtcl8_6 = 'tcl86.dll';                  
  libtk8_6 = 'tk86.dll';                    
  libtclstub8_6 = libtcl8_6;
  libtkstub8_6 = libtk8_6;  
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  {$IFDEF Linux}
  Tculong = uint64;
  Tclong = int64;
  {$ENDIF}
  {$IFDEF windows}
  Tculong = uint32;
  Tclong = int32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;


type
  Pstat = procedure; cdecl;  // /usr/include/x86_64-linux-gnu/sys/stat.h

  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF Linux}
  Twchar_t = uint32;
  {$ENDIF}

  {$IFDEF Windows}
  Twchar_t = uint16;
  {$ENDIF}
  Pwchar_t = ^Twchar_t;
  PPwchar_t = ^Pwchar_t;

  Tuint32_t = uint32;
  Tuint64_t = uint64;

  PBusy = Pointer;

  Tva_list = Pointer;

  PTkOption = Pointer; //????????

  {$DEFINE read_interface}
  {$include fp_tcl_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_tcl_includes.inc}
{$UNDEF read_implementation}

end.
