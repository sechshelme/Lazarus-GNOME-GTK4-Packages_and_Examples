
unit emile_compress;
interface

{
  Automatically converted by H2Pas 1.0.0 from emile_compress.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    emile_compress.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PEina_Binbuf  = ^Eina_Binbuf;
PEmile_Compressor_Level  = ^Emile_Compressor_Level;
PEmile_Compressor_Type  = ^Emile_Compressor_Type;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef EMILE_COMPRESSION_H_}
{$define EMILE_COMPRESSION_H_}
{*
 * @defgroup Emile_Group_Compression Non destructive general purpose compression functions.
 * @ingroup Emile
 * Function that allow the compression and expansion of Eina_Binbuf with
 * non destructive algorithm.
 *
 * @
  }
{*
 * Supported type of compression algorithm.
 * @since 1.14
 *
 * @see emile_binbuf_compress()
 * @see emile_binbuf_uncompress()
 * @see emile_binbuf_expand()
  }
type
  PEmile_Compressor_Type = ^TEmile_Compressor_Type;
  TEmile_Compressor_Type =  Longint;
  Const
    EMILE_ZLIB = 0;
    EMILE_LZ4 = 1;
    EMILE_LZ4HC = 2;
;
{*
 * Compression level to apply.
 * @since 1.14
 *
 * @see emile_binbuf_compress();
  }
type
  PEmile_Compressor_Level = ^TEmile_Compressor_Level;
  TEmile_Compressor_Level =  Longint;
  Const
    EMILE_COMPRESSOR_DEFAULT = -(1);
    EMILE_COMPRESSOR_NONE = 0;
    EMILE_COMPRESSOR_FAST = 1;
    EMILE_COMPRESSOR_BEST = 9;
;
{*
 * @brief Compress an Eina_Binbuf into a new Eina_Binbuf
 *
 * @param in Buffer to compress.
 * @param t Type of compression logic to use.
 * @param level Level of compression to apply.
 *
 * @return On success it will return a buffer that contains
 * the compressed data, @c NULL otherwise.
 *
 * @since 1.14
  }
(* Const before type ignored *)

function emile_compress(in:PEina_Binbuf; t:TEmile_Compressor_Type; level:TEmile_Compressor_Level):PEina_Binbuf;cdecl;external;
{*
 * @brief Uncompress a buffer into a newly allocated buffer.
 *
 * @param in Buffer to uncompress.
 * @param t Type of compression logic to use.
 * @param dest_length Expected length of the decompressed data.
 *
 * @return a newly allocated buffer with the uncompressed data,
 * @c NULL if it failed.
 *
 * @since 1.14
 *
 * @note That if dest_length doesn't match the expanded data, it will
 * just fail and return @c NULL.
  }
(* Const before type ignored *)
function emile_decompress(in:PEina_Binbuf; t:TEmile_Compressor_Type; dest_length:dword):PEina_Binbuf;cdecl;external;
{*
 * @brief Uncompress a buffer into an existing buffer.
 *
 * @param in Buffer to uncompress.
 * @param out Buffer to expand data into.
 * @param t Type of compression logic to use.
 *
 * @return EINA_TRUE if it succeed, EINA_FALSE if it failed.
 * @since 1.14
 *
 * @note The out buffer should have the necessary size to hold the
 * expanded data or it will fail. In case of failure, random garbage
 * could fill the out buffer.
  }
(* Const before type ignored *)
function emile_expand(in:PEina_Binbuf; out:PEina_Binbuf; t:TEmile_Compressor_Type):TEina_Bool;cdecl;external;
{*
 * @
  }
{$endif}

implementation


end.
