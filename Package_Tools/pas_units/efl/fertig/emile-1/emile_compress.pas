unit emile_compress;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEmile_Compressor_Type = ^TEmile_Compressor_Type;
  TEmile_Compressor_Type = longint;

const
  EMILE_ZLIB = 0;
  EMILE_LZ4 = 1;
  EMILE_LZ4HC = 2;

type
  PEmile_Compressor_Level = ^TEmile_Compressor_Level;
  TEmile_Compressor_Level = longint;

const
  EMILE_COMPRESSOR_DEFAULT = -(1);
  EMILE_COMPRESSOR_NONE = 0;
  EMILE_COMPRESSOR_FAST = 1;
  EMILE_COMPRESSOR_BEST = 9;

function emile_compress(in_: PEina_Binbuf; t: TEmile_Compressor_Type; level: TEmile_Compressor_Level): PEina_Binbuf; cdecl; external libemile;
function emile_decompress(in_: PEina_Binbuf; t: TEmile_Compressor_Type; dest_length: dword): PEina_Binbuf; cdecl; external libemile;
function emile_expand(in_: PEina_Binbuf; out_: PEina_Binbuf; t: TEmile_Compressor_Type): TEina_Bool; cdecl; external libemile;

// === Konventiert am: 20-5-25 15:35:36 ===


implementation



end.
