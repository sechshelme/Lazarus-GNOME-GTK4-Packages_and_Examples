unit fp_tcl;

interface

uses
  {$IFDEF Linux}
  x, xlib,
  {$ENDIF}
  ctypes;

const
{$IFDEF Linux}
libtcl8_6 = 'libtcl8.6';
libtk8_6 = 'libtk8.6';
libtclstub8_6 = 'libtclstub8.6';
libtkstub8_6 = 'libtkstub8.6';
{$ENDIF}


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

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$DEFINE read_interface}
  {$include fp_tcl_includes.inc}
  {$UNDEF read_interface}


implementation

{$DEFINE read_implementation}
{$include fp_tcl_includes.inc}
{$UNDEF read_implementation}

end.
