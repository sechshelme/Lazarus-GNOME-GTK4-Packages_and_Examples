unit mongoc_opcode;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_mongoc;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  Pmongoc_opcode_t = ^Tmongoc_opcode_t;
  Tmongoc_opcode_t = longint;

const
  MONGOC_OPCODE_REPLY = 1;
  MONGOC_OPCODE_UPDATE = 2001;
  MONGOC_OPCODE_INSERT = 2002;
  MONGOC_OPCODE_QUERY = 2004;
  MONGOC_OPCODE_GET_MORE = 2005;
  MONGOC_OPCODE_DELETE = 2006;
  MONGOC_OPCODE_KILL_CURSORS = 2007;
  MONGOC_OPCODE_COMPRESSED = 2012;
  MONGOC_OPCODE_MSG = 2013;
  {$ENDIF read_enum}

  // === Konventiert am: 15-5-26 15:15:14 ===


implementation



end.
