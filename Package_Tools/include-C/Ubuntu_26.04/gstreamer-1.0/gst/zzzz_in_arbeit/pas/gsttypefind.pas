unit gsttypefind;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstTypeFindProbability = ^TGstTypeFindProbability;
  TGstTypeFindProbability = longint;
const
  GST_TYPE_FIND_NONE = 0;
  GST_TYPE_FIND_MINIMUM = 1;
  GST_TYPE_FIND_POSSIBLE = 50;
  GST_TYPE_FIND_LIKELY = 80;
  GST_TYPE_FIND_NEARLY_CERTAIN = 99;
  GST_TYPE_FIND_MAXIMUM = 100;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstTypeFind = ^TGstTypeFind;
  TGstTypeFind = record
    peek: function(data: Tgpointer; offset: Tgint64; size: Tguint): Pguint8; cdecl;
    suggest: procedure(data: Tgpointer; probability: Tguint; caps: PGstCaps); cdecl;
    data: Tgpointer;
    get_length: function(data: Tgpointer): Tguint64; cdecl;
    _gst_reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;

  TGstTypeFindFunction = procedure(find: PGstTypeFind; user_data: Tgpointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_type_find_get_type: TGType; cdecl; external libgstreamer;
function gst_type_find_peek(find: PGstTypeFind; offset: Tgint64; size: Tguint): Pguint8; cdecl; external libgstreamer;
procedure gst_type_find_suggest(find: PGstTypeFind; probability: Tguint; caps: PGstCaps); cdecl; external libgstreamer;
procedure gst_type_find_suggest_empty_simple(find: PGstTypeFind; probability: Tguint; media_type: pchar); cdecl; external libgstreamer;
procedure gst_type_find_suggest_simple(find: PGstTypeFind; probability: Tguint; media_type: pchar; fieldname: pchar); cdecl; varargs; external libgstreamer;
function gst_type_find_get_length(find: PGstTypeFind): Tguint64; cdecl; external libgstreamer;
function gst_type_find_register(plugin: PGstPlugin; name: Pgchar; rank: Tguint; func: TGstTypeFindFunction; extensions: Pgchar;
  possible_caps: PGstCaps; data: Tgpointer; data_notify: TGDestroyNotify): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:54:19 ===

function GST_TYPE_TYPE_FIND: TGType;
{$ENDIF read_function}

implementation

function GST_TYPE_TYPE_FIND: TGType;
begin
  GST_TYPE_TYPE_FIND := gst_type_find_get_type;
end;

end.
