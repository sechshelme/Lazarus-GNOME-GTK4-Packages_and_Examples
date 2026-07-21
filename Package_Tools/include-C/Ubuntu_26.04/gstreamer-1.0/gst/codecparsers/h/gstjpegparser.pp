
unit gstjpegparser;
interface

{
  Automatically converted by H2Pas 1.0.0 from gstjpegparser.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gstjpegparser.h
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
PGstJpegEntropyCodingMode  = ^GstJpegEntropyCodingMode;
PGstJpegFrameComponent  = ^GstJpegFrameComponent;
PGstJpegFrameHdr  = ^GstJpegFrameHdr;
PGstJpegHuffmanTable  = ^GstJpegHuffmanTable;
PGstJpegHuffmanTables  = ^GstJpegHuffmanTables;
PGstJpegMarker  = ^GstJpegMarker;
PGstJpegProfile  = ^GstJpegProfile;
PGstJpegQuantTable  = ^GstJpegQuantTable;
PGstJpegQuantTables  = ^GstJpegQuantTables;
PGstJpegScanComponent  = ^GstJpegScanComponent;
PGstJpegScanHdr  = ^GstJpegScanHdr;
PGstJpegSegment  = ^GstJpegSegment;
Pguint  = ^guint;
Pguint8  = ^guint8;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  GStreamer JPEG parser
 *  Copyright (C) 2011-2012 Intel Corporation
 *  Copyright (C) 2015 Tim-Philipp Müller <tim@centricular.com>
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 *  Boston, MA 02110-1301 USA
  }
{$ifndef GST_JPEG_PARSER_H}
{$define GST_JPEG_PARSER_H}
{$include <gst/gst.h>}
{$include <gst/codecparsers/codecparsers-prelude.h>}
{*
 * GST_JPEG_MAX_FRAME_COMPONENTS:
 *
 * Maximum number of image components in a frame (Nf).
 *
 * Since: 1.6
  }

const
  GST_JPEG_MAX_FRAME_COMPONENTS = 256;  
{*
 * GST_JPEG_MAX_SCAN_COMPONENTS:
 *
 * Maximum number of image components in a scan (Ns).
 *
 * Since: 1.6
  }
  GST_JPEG_MAX_SCAN_COMPONENTS = 4;  
{*
 * GST_JPEG_MAX_QUANT_ELEMENTS:
 *
 * Number of elements in the quantization table.
 *
 * Since: 1.6
  }
  GST_JPEG_MAX_QUANT_ELEMENTS = 64;  
type
{*
 * GstJpegMarker:
 * @GST_JPEG_MARKER_SOF0: Start of frame marker code (Baseline)
 * @GST_JPEG_MARKER_SOF1: Start of frame marker code (Extended Sequential, Huffman)
 * @GST_JPEG_MARKER_SOF2: Start of frame marker code (Progressive, Huffman)
 * @GST_JPEG_MARKER_SOF3: Start of frame marker code (Lossless, Huffman)
 * @GST_JPEG_MARKER_SOF5: Start of frame marker code (Differential Sequential, Huffman)
 * @GST_JPEG_MARKER_SOF6: Start of frame marker code (Differential Progressive, Huffman)
 * @GST_JPEG_MARKER_SOF7: Start of frame marker code (Differential Lossless, Huffman)
 * @GST_JPEG_MARKER_SOF9: Start of frame marker code (Extended Sequential, Arithmetic)
 * @GST_JPEG_MARKER_SOF10: Start of frame marker code (Progressive, Arithmetic)
 * @GST_JPEG_MARKER_SOF11: Start of frame marker code (Lossless, Arithmetic)
 * @GST_JPEG_MARKER_SOF13: Start of frame marker code (Differential Sequential, Arithmetic)
 * @GST_JPEG_MARKER_SOF14: Start of frame marker code (Differential Progressive, Arithmetic)
 * @GST_JPEG_MARKER_SOF15: Start of frame marker code (Differential Lossless, Arithmetic)
 * @GST_JPEG_MARKER_DHT: Huffman table marker code
 * @GST_JPEG_MARKER_DAC: Arithmetic coding marker code
 * @GST_JPEG_MARKER_RST_MIN: Restart interval min marker code
 * @GST_JPEG_MARKER_RST_MAX: Restart interval max marker code
 * @GST_JPEG_MARKER_SOI: Start of image marker code
 * @GST_JPEG_MARKER_EOI: End of image marker code
 * @GST_JPEG_MARKER_SOS: Start of scan marker code
 * @GST_JPEG_MARKER_DQT: Define quantization table marker code
 * @GST_JPEG_MARKER_DNL: Define number of lines marker code
 * @GST_JPEG_MARKER_DRI: Define restart interval marker code
 * @GST_JPEG_MARKER_APP0: Application segment 0 marker code
 * @GST_JPEG_MARKER_APP1: Application segment 1 marker code
 * @GST_JPEG_MARKER_APP2: Application segment 2 marker code
 * @GST_JPEG_MARKER_APP3: Application segment 3 marker code
 * @GST_JPEG_MARKER_APP4: Application segment 4 marker code
 * @GST_JPEG_MARKER_APP5: Application segment 5 marker code
 * @GST_JPEG_MARKER_APP6: Application segment 6 marker code
 * @GST_JPEG_MARKER_APP7: Application segment 7 marker code
 * @GST_JPEG_MARKER_APP8: Application segment 8 marker code
 * @GST_JPEG_MARKER_APP9: Application segment 9 marker code
 * @GST_JPEG_MARKER_APP10: Application segment 10 marker code
 * @GST_JPEG_MARKER_APP11: Application segment 11 marker code
 * @GST_JPEG_MARKER_APP12: Application segment 12 marker code
 * @GST_JPEG_MARKER_APP13: Application segment 13 marker code
 * @GST_JPEG_MARKER_APP14: Application segment 14 marker code
 * @GST_JPEG_MARKER_APP15: Application segment 15 marker code
 * @GST_JPEG_MARKER_COM: Comment marker code
 *
 * Indicates the type of JPEG segment.
 *
 * Since: 1.6
  }
{ 0xC4 = DHT see below  }
{ 0xC8 = reserved  }
{ 0xCC = DAC see below  }

  PGstJpegMarker = ^TGstJpegMarker;
  TGstJpegMarker =  Longint;
  Const
    GST_JPEG_MARKER_SOF0 = $C0;
    GST_JPEG_MARKER_SOF1 = $C1;
    GST_JPEG_MARKER_SOF2 = $C2;
    GST_JPEG_MARKER_SOF3 = $C3;
    GST_JPEG_MARKER_SOF5 = $C5;
    GST_JPEG_MARKER_SOF6 = $C6;
    GST_JPEG_MARKER_SOF7 = $C7;
    GST_JPEG_MARKER_SOF9 = $C9;
    GST_JPEG_MARKER_SOF10 = $CA;
    GST_JPEG_MARKER_SOF11 = $CB;
    GST_JPEG_MARKER_SOF13 = $CD;
    GST_JPEG_MARKER_SOF14 = $CE;
    GST_JPEG_MARKER_SOF15 = $CF;
    GST_JPEG_MARKER_DHT = $C4;
    GST_JPEG_MARKER_DAC = $CC;
    GST_JPEG_MARKER_RST0 = $D0;
    GST_JPEG_MARKER_RST1 = $D1;
    GST_JPEG_MARKER_RST2 = $D2;
    GST_JPEG_MARKER_RST3 = $D3;
    GST_JPEG_MARKER_RST4 = $D4;
    GST_JPEG_MARKER_RST5 = $D5;
    GST_JPEG_MARKER_RST6 = $D6;
    GST_JPEG_MARKER_RST7 = $D7;
    GST_JPEG_MARKER_SOI = $D8;
    GST_JPEG_MARKER_EOI = $D9;
    GST_JPEG_MARKER_SOS = $DA;
    GST_JPEG_MARKER_DQT = $DB;
    GST_JPEG_MARKER_DNL = $DC;
    GST_JPEG_MARKER_DRI = $DD;
    GST_JPEG_MARKER_APP0 = $E0;
    GST_JPEG_MARKER_APP1 = $E1;
    GST_JPEG_MARKER_APP2 = $E2;
    GST_JPEG_MARKER_APP3 = $E3;
    GST_JPEG_MARKER_APP4 = $E4;
    GST_JPEG_MARKER_APP5 = $E5;
    GST_JPEG_MARKER_APP6 = $E6;
    GST_JPEG_MARKER_APP7 = $E7;
    GST_JPEG_MARKER_APP8 = $E8;
    GST_JPEG_MARKER_APP9 = $E9;
    GST_JPEG_MARKER_APP10 = $EA;
    GST_JPEG_MARKER_APP11 = $EB;
    GST_JPEG_MARKER_APP12 = $EC;
    GST_JPEG_MARKER_APP13 = $ED;
    GST_JPEG_MARKER_APP14 = $EE;
    GST_JPEG_MARKER_APP15 = $EF;
    GST_JPEG_MARKER_COM = $FE;
;
  GST_JPEG_MARKER_SOF_MIN = GST_JPEG_MARKER_SOF0;  
  GST_JPEG_MARKER_SOF_MAX = GST_JPEG_MARKER_SOF15;  
  GST_JPEG_MARKER_APP_MIN = GST_JPEG_MARKER_APP0;  
  GST_JPEG_MARKER_APP_MAX = GST_JPEG_MARKER_APP15;  
  GST_JPEG_MARKER_RST_MIN = GST_JPEG_MARKER_RST0;  
  GST_JPEG_MARKER_RST_MAX = GST_JPEG_MARKER_RST7;  
{*
 * GstJpegProfile:
 * @GST_JPEG_PROFILE_BASELINE: Baseline DCT
 * @GST_JPEG_PROFILE_EXTENDED: Extended sequential DCT
 * @GST_JPEG_PROFILE_PROGRESSIVE: Progressive DCT
 * @GST_JPEG_PROFILE_LOSSLESS: Lossless (sequential)
 *
 * JPEG encoding processes.
 *
 * Since: 1.6
  }
type
  PGstJpegProfile = ^TGstJpegProfile;
  TGstJpegProfile =  Longint;
  Const
    GST_JPEG_PROFILE_BASELINE = $00;
    GST_JPEG_PROFILE_EXTENDED = $01;
    GST_JPEG_PROFILE_PROGRESSIVE = $02;
    GST_JPEG_PROFILE_LOSSLESS = $03;
;
{*
 * GstJpegEntropyCodingMode:
 * @GST_JPEG_ENTROPY_CODING_HUFFMAN: Huffman coding
 * @GST_JPEG_ENTROPY_CODING_ARITHMETIC: arithmetic coding
 *
 * JPEG entropy coding mode.
 *
 * Since: 1.6
  }
type
  PGstJpegEntropyCodingMode = ^TGstJpegEntropyCodingMode;
  TGstJpegEntropyCodingMode =  Longint;
  Const
    GST_JPEG_ENTROPY_CODING_HUFFMAN = $00;
    GST_JPEG_ENTROPY_CODING_ARITHMETIC = $08;
;
{*
 * GstJpegQuantTable:
 * @quant_precision: Quantization table element precision (Pq)
 * @quant_table: Quantization table elements (Qk)
 * @valid: If the quantization table is valid, which means it has
 *   already been parsed
 *
 * Quantization table.
 *
 * Since: 1.6
  }
type
  PGstJpegQuantTable = ^TGstJpegQuantTable;
  TGstJpegQuantTable = record
      quant_precision : Tguint8;
      quant_table : array[0..(GST_JPEG_MAX_QUANT_ELEMENTS)-1] of Tguint16;
      valid : Tgboolean;
    end;

{*
 * GstJpegQuantTables:
 * @quant_tables: All quantization tables
 *
 * Helper data structure that holds all quantization tables used to
 * decode an image.
 *
 * Since: 1.6
  }
  PGstJpegQuantTables = ^TGstJpegQuantTables;
  TGstJpegQuantTables = record
      quant_tables : array[0..(GST_JPEG_MAX_SCAN_COMPONENTS)-1] of TGstJpegQuantTable;
    end;

{*
 * GstJpegHuffmanTable:
 * @huf_bits: Number of Huffman codes of length i + 1 (Li)
 * @huf_vales: Value associated with each Huffman code (Vij)
 * @valid: If the Huffman table is valid, which means it has already
 *   been parsed
 *
 * Huffman table.
 *
 * Since: 1.6
  }
  PGstJpegHuffmanTable = ^TGstJpegHuffmanTable;
  TGstJpegHuffmanTable = record
      huf_bits : array[0..15] of Tguint8;
      huf_values : array[0..255] of Tguint8;
      valid : Tgboolean;
    end;

{*
 * GstJpegHuffmanTables:
 * @dc_tables: DC Huffman tables
 * @ac_tables: AC Huffman tables
 *
 * Helper data structure that holds all AC/DC Huffman tables used to
 * decode an image.
 *
 * Since: 1.6
  }
  PGstJpegHuffmanTables = ^TGstJpegHuffmanTables;
  TGstJpegHuffmanTables = record
      dc_tables : array[0..(GST_JPEG_MAX_SCAN_COMPONENTS)-1] of TGstJpegHuffmanTable;
      ac_tables : array[0..(GST_JPEG_MAX_SCAN_COMPONENTS)-1] of TGstJpegHuffmanTable;
    end;

{*
 * GstJpegScanComponent:
 * @component_selector: Scan component selector (Csj)
 * @dc_selector: DC entropy coding table destination selector (Tdj)
 * @ac_selector: AC entropy coding table destination selector (Taj)

 * Component-specification parameters.
 *
 * Since: 1.6
  }
{ 0 .. 255      }
{ 0 .. 3        }
{ 0 .. 3        }
  PGstJpegScanComponent = ^TGstJpegScanComponent;
  TGstJpegScanComponent = record
      component_selector : Tguint8;
      dc_selector : Tguint8;
      ac_selector : Tguint8;
    end;

{*
 * GstJpegScanHdr:
 * @num_components: Number of image components in scan (Ns)
 * @components: Image components
 *
 * Scan header.
 *
 * Since: 1.6
  }
{ 1 .. 4        }
{< private > }
{ Ss  }
{ Se  }
{ Al  }
{ Ah  }
  PGstJpegScanHdr = ^TGstJpegScanHdr;
  TGstJpegScanHdr = record
      num_components : Tguint8;
      components : array[0..(GST_JPEG_MAX_SCAN_COMPONENTS)-1] of TGstJpegScanComponent;
      _reserved1 : Tguint8;
      _reserved2 : Tguint8;
      _reserved3 : Tguint8;
      _reserved4 : Tguint8;
    end;

{*
 * GstJpegFrameComponent:
 * @identifier: Component identifier (Ci)
 * @horizontal_factor: Horizontal sampling factor (Hi)
 * @vertical_factor: Vertical sampling factor (Vi)
 * @quant_table_selector: Quantization table destination selector (Tqi)
 *
 * Component-specification parameters.
 *
 * Since: 1.6
  }
{ 0 .. 255      }
{ 1 .. 4        }
{ 1 .. 4        }
{ 0 .. 3        }
  PGstJpegFrameComponent = ^TGstJpegFrameComponent;
  TGstJpegFrameComponent = record
      identifier : Tguint8;
      horizontal_factor : Tguint8;
      vertical_factor : Tguint8;
      quant_table_selector : Tguint8;
    end;

{*
 * GstJpegFrameHdr:
 * @sample_precision: Sample precision (P)
 * @height: Number of lines (Y)
 * @width: Number of samples per line (X)
 * @num_components: Number of image components in frame (Nf)
 * @components: Image components
 * @restart_interval: Number of MCU in the restart interval (Ri)
 *
 * Frame header.
 *
 * Since: 1.6
  }
{ 2 .. 16       }
{ 1 .. 65535    }
{ 0 .. 65535    }
{ 1 .. 255      }
  PGstJpegFrameHdr = ^TGstJpegFrameHdr;
  TGstJpegFrameHdr = record
      sample_precision : Tguint8;
      width : Tguint16;
      height : Tguint16;
      num_components : Tguint8;
      components : array[0..(GST_JPEG_MAX_FRAME_COMPONENTS)-1] of TGstJpegFrameComponent;
    end;

{*
 * GstJpegSegment:
 * @marker: The type of the segment that starts at @offset
 * @data: the data containing the jpeg segment starting at @offset
 * @offset: The offset to the segment start in bytes. This is the
 *   exact start of the segment, no marker code included
 * @size: The size of the segment in bytes, or -1 if the end was not
 *   found. It is the exact size of the segment, without the sync byte and
 *   marker code but including any length bytes.
 *
 * A structure that contains the type of a segment, its offset and its size.
 *
 * Since: 1.6
  }
(* Const before type ignored *)
  PGstJpegSegment = ^TGstJpegSegment;
  TGstJpegSegment = record
      marker : TGstJpegMarker;
      data : Pguint8;
      offset : Tguint;
      size : Tgssize;
    end;

(* Const before type ignored *)

function gst_jpeg_parse(seg:PGstJpegSegment; data:Pguint8; size:Tgsize; offset:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_segment_parse_frame_header(segment:PGstJpegSegment; frame_hdr:PGstJpegFrameHdr):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_segment_parse_scan_header(segment:PGstJpegSegment; scan_hdr:PGstJpegScanHdr):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_segment_parse_huffman_table(segment:PGstJpegSegment; huff_tables:PGstJpegHuffmanTables):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_segment_parse_restart_interval(segment:PGstJpegSegment; interval:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function gst_jpeg_segment_parse_quantization_table(segment:PGstJpegSegment; quant_tables:PGstJpegQuantTables):Tgboolean;cdecl;external;
procedure gst_jpeg_get_default_quantization_tables(quant_tables:PGstJpegQuantTables);cdecl;external;
procedure gst_jpeg_get_default_huffman_tables(huff_tables:PGstJpegHuffmanTables);cdecl;external;
{$endif}
{ GST_JPEG_PARSER_H  }

implementation


end.
