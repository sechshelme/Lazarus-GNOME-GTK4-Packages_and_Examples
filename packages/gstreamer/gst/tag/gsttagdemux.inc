
{$IFDEF read_interface}

type
  PGstTagDemuxResult = ^TGstTagDemuxResult;
  TGstTagDemuxResult = longint;

const
  GST_TAG_DEMUX_RESULT_BROKEN_TAG = 0;
  GST_TAG_DEMUX_RESULT_AGAIN = 1;
  GST_TAG_DEMUX_RESULT_OK = 2;

type
  TGstTagDemuxPrivate = record
  end;
  PGstTagDemuxPrivate = ^TGstTagDemuxPrivate;

  TGstTagDemux = record
    element: TGstElement;
    priv: PGstTagDemuxPrivate;
    reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTagDemux = ^TGstTagDemux;

  TGstTagDemuxClass = record
    parent_class: TGstElementClass;
    min_start_size: Tguint;
    min_end_size: Tguint;
    identify_tag: function(demux: PGstTagDemux; buffer: PGstBuffer; start_tag: Tgboolean; tag_size: Pguint): Tgboolean; cdecl;
    parse_tag: function(demux: PGstTagDemux; buffer: PGstBuffer; start_tag: Tgboolean; tag_size: Pguint; tags: PPGstTagList): TGstTagDemuxResult; cdecl;
    merge_tags: function(demux: PGstTagDemux; start_tags: PGstTagList; end_tags: PGstTagList): PGstTagList; cdecl;
    reserved: array[0..(GST_PADDING) - 1] of Tgpointer;
  end;
  PGstTagDemuxClass = ^TGstTagDemuxClass;


function gst_tag_demux_get_type: TGType; cdecl; external libgsttag;

// === Konventiert am: 6-10-24 19:20:51 ===

function GST_TYPE_TAG_DEMUX: TGType;
function GST_TAG_DEMUX(obj: Pointer): PGstTagDemux;
function GST_TAG_DEMUX_CLASS(klass: Pointer): PGstTagDemuxClass;
function GST_IS_TAG_DEMUX(obj: Pointer): Tgboolean;
function GST_IS_TAG_DEMUX_CLASS(klass: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_TAG_DEMUX: TGType;
begin
  GST_TYPE_TAG_DEMUX := gst_tag_demux_get_type;
end;

function GST_TAG_DEMUX(obj: Pointer): PGstTagDemux;
begin
  Result := PGstTagDemux(g_type_check_instance_cast(obj, GST_TYPE_TAG_DEMUX));
end;

function GST_TAG_DEMUX_CLASS(klass: Pointer): PGstTagDemuxClass;
begin
  Result := PGstTagDemuxClass(g_type_check_class_cast(klass, GST_TYPE_TAG_DEMUX));
end;

function GST_IS_TAG_DEMUX(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TAG_DEMUX);
end;

function GST_IS_TAG_DEMUX_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TAG_DEMUX);
end;



{$ENDIF read_implementation}
