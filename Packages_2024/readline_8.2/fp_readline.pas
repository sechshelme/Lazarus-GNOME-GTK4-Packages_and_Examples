unit fp_readline;

interface

uses
  ctypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

const
  {$IFDEF linux}
  libreadline = 'libreadline';
  {$ENDIF}

  {$IFDEF windows}
  libreadline = 'libreadline8.dll';
  {$ENDIF}

type
  PFILE = type Pointer;

  Tsize_t = SizeUInt;

  // /usr/include/x86_64-linux-gnu/bits/types/time_t.h
  Ttime_t = longint;
  Ptime_t = ^Ttime_t;

  {$DEFINE read_interface}
  {$include readline/tilde}
  {$include readline/rlconf}
  {$include readline/rltypedefs}
  {$include readline/keymaps}
  {$include readline/readline}
  {$include readline/history}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include readline/tilde}
{$include readline/rlconf}
{$include readline/rltypedefs}
{$include readline/keymaps}
{$include readline/readline}
{$include readline/history}
{$UNDEF read_implementation}

end.
