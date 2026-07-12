unit gstformat;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstiterator;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstFormat = ^TGstFormat;
  TGstFormat = longint;
const
  GST_FORMAT_UNDEFINED = 0;
  GST_FORMAT_DEFAULT = 1;
  GST_FORMAT_BYTES = 2;
  GST_FORMAT_TIME = 3;
  GST_FORMAT_BUFFERS = 4;
  GST_FORMAT_PERCENT = 5;

const
  GST_FORMAT_PERCENT_MAX = 1000000;
  GST_FORMAT_PERCENT_SCALE = 10000;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstFormatDefinition = ^TGstFormatDefinition;
  TGstFormatDefinition = record
    value: TGstFormat;
    nick: Pgchar;
    description: Pgchar;
    quark: TGQuark;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_format_get_name(format: TGstFormat): Pgchar; cdecl; external libgstreamer;
function gst_format_to_quark(format: TGstFormat): TGQuark; cdecl; external libgstreamer;
function gst_format_register(nick: Pgchar; description: Pgchar): TGstFormat; cdecl; external libgstreamer;
function gst_format_get_by_nick(nick: Pgchar): TGstFormat; cdecl; external libgstreamer;
function gst_formats_contains(formats: PGstFormat; format: TGstFormat): Tgboolean; cdecl; external libgstreamer;
function gst_format_get_details(format: TGstFormat): PGstFormatDefinition; cdecl; external libgstreamer;
function gst_format_iterate_definitions: PGstIterator; cdecl; external libgstreamer;
{$ENDIF read_function}

// === Konventiert am: 11-7-26 11:31:03 ===


implementation

end.
