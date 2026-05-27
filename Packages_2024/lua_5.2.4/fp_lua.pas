unit fp_lua;

interface

const
  {$IFDEF Linux}
  liblua = 'lua5.2';
  {$ENDIF}

  {$IFDEF Windows}
  liblua = 'lua5.2.dll';
  {$ENDIF}


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  Tptrdiff_t = PtrInt;

  PFILE = type Pointer;

  Tva_list = Pointer; // ????

  PCallInfo = Pointer;

  {$DEFINE read_interface}
  {$include lua/luaconf.inc}
  {$include lua/lua.inc}
  {$include lua/lauxlib.inc}
  {$include lua/lualib.inc}
  {$UNDEF read_interface}

implementation

{$DEFINE read_implementation}
{$include lua/luaconf.inc}
{$include lua/lua.inc}
{$include lua/lauxlib.inc}
{$include lua/lualib.inc}
{$UNDEF read_implementation}


end.
