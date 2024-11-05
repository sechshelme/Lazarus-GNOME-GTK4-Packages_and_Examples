/////////////////////////////////////////////////////////////
//                                                         //
//   WARNUNG, dies Datei wird automatisch durch            //
//   das Program "Convert_Unit_to_pas_includes" erzeugt !  //
//   Erzeugt am: 07-10-2024   16:40                        //
//                                                         //
/////////////////////////////////////////////////////////////

{$IFDEF read_interface}

const
  GST_RTP_HDREXT_BASE = 'urn:ietf:params:rtp-hdrext:';  
  GST_RTP_HDREXT_NTP_64 = 'ntp-64';
  GST_RTP_HDREXT_NTP_64_SIZE = 8;  

function gst_rtp_hdrext_set_ntp_64(data:Tgpointer; size:Tguint; ntptime:Tguint64):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_hdrext_get_ntp_64(data:Tgpointer; size:Tguint; ntptime:Pguint64):Tgboolean;cdecl;external libgstrtp;
const
  GST_RTP_HDREXT_NTP_56 = 'ntp-56';  
  GST_RTP_HDREXT_NTP_56_SIZE = 7;  

function gst_rtp_hdrext_set_ntp_56(data:Tgpointer; size:Tguint; ntptime:Tguint64):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_hdrext_get_ntp_56(data:Tgpointer; size:Tguint; ntptime:Pguint64):Tgboolean;cdecl;external libgstrtp;
const
  GST_RTP_HDREXT_ELEMENT_CLASS = 'Network/Extension/RTPHeader';  

function gst_rtp_header_extension_get_type:TGType;cdecl;external libgstrtp;

type
  PGstRTPHeaderExtensionFlags = ^TGstRTPHeaderExtensionFlags;
  TGstRTPHeaderExtensionFlags =  Longint;
  Const
    GST_RTP_HEADER_EXTENSION_ONE_BYTE = 1 shl 0;
    GST_RTP_HEADER_EXTENSION_TWO_BYTE = 1 shl 1;
type
  PGstRTPHeaderExtensionDirection = ^TGstRTPHeaderExtensionDirection;
  TGstRTPHeaderExtensionDirection =  Longint;
  Const
    GST_RTP_HEADER_EXTENSION_DIRECTION_INACTIVE = 0;
    GST_RTP_HEADER_EXTENSION_DIRECTION_SENDONLY = 1 shl 0;
    GST_RTP_HEADER_EXTENSION_DIRECTION_RECVONLY = 1 shl 1;
    GST_RTP_HEADER_EXTENSION_DIRECTION_SENDRECV = GST_RTP_HEADER_EXTENSION_DIRECTION_SENDONLY or GST_RTP_HEADER_EXTENSION_DIRECTION_RECVONLY;
    GST_RTP_HEADER_EXTENSION_DIRECTION_INHERITED = 1 shl 2;
type
  TGstRTPHeaderExtension = record
      parent : TGstElement;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;
  PGstRTPHeaderExtension = ^TGstRTPHeaderExtension;

  TGstRTPHeaderExtensionClass = record
      parent_class : TGstElementClass;
      get_supported_flags : function (ext:PGstRTPHeaderExtension):TGstRTPHeaderExtensionFlags;cdecl;
      get_max_size : function (ext:PGstRTPHeaderExtension; input_meta:PGstBuffer):Tgsize;cdecl;
      write : function (ext:PGstRTPHeaderExtension; input_meta:PGstBuffer; write_flags:TGstRTPHeaderExtensionFlags; output:PGstBuffer; data:Pguint8; 
                   size:Tgsize):Tgssize;cdecl;
      read : function (ext:PGstRTPHeaderExtension; read_flags:TGstRTPHeaderExtensionFlags; data:Pguint8; size:Tgsize; buffer:PGstBuffer):Tgboolean;cdecl;
      set_non_rtp_sink_caps : function (ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;
      update_non_rtp_src_caps : function (ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;
      set_attributes : function (ext:PGstRTPHeaderExtension; direction:TGstRTPHeaderExtensionDirection; attributes:Pgchar):Tgboolean;cdecl;
      set_caps_from_attributes : function (ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;
      _gst_reserved : array[0..(GST_PADDING_LARGE)-1] of Tgpointer;
    end;
  PGstRTPHeaderExtensionClass = ^TGstRTPHeaderExtensionClass;

const
  GST_RTP_HEADER_EXTENSION_URI_METADATA_KEY = 'RTP-Header-Extension-URI';  

procedure gst_rtp_header_extension_class_set_uri(klass:PGstRTPHeaderExtensionClass; uri:Pgchar);cdecl;external libgstrtp;
function gst_rtp_header_extension_get_uri(ext:PGstRTPHeaderExtension):Pgchar;cdecl;external libgstrtp;
function gst_rtp_header_extension_get_max_size(ext:PGstRTPHeaderExtension; input_meta:PGstBuffer):Tgsize;cdecl;external libgstrtp;
function gst_rtp_header_extension_get_supported_flags(ext:PGstRTPHeaderExtension):TGstRTPHeaderExtensionFlags;cdecl;external libgstrtp;
function gst_rtp_header_extension_get_id(ext:PGstRTPHeaderExtension):Tguint;cdecl;external libgstrtp;
procedure gst_rtp_header_extension_set_id(ext:PGstRTPHeaderExtension; ext_id:Tguint);cdecl;external libgstrtp;
function gst_rtp_header_extension_write(ext:PGstRTPHeaderExtension; input_meta:PGstBuffer; write_flags:TGstRTPHeaderExtensionFlags; output:PGstBuffer; data:Pguint8; 
           size:Tgsize):Tgssize;cdecl;external libgstrtp;
function gst_rtp_header_extension_read(ext:PGstRTPHeaderExtension; read_flags:TGstRTPHeaderExtensionFlags; data:Pguint8; size:Tgsize; buffer:PGstBuffer):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_header_extension_set_non_rtp_sink_caps(ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_header_extension_wants_update_non_rtp_src_caps(ext:PGstRTPHeaderExtension):Tgboolean;cdecl;external libgstrtp;
procedure gst_rtp_header_extension_set_wants_update_non_rtp_src_caps(ext:PGstRTPHeaderExtension; state:Tgboolean);cdecl;external libgstrtp;
function gst_rtp_header_extension_update_non_rtp_src_caps(ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_header_extension_set_caps_from_attributes(ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_header_extension_set_attributes_from_caps(ext:PGstRTPHeaderExtension; caps:PGstCaps):Tgboolean;cdecl;external libgstrtp;
function gst_rtp_get_header_extension_list:PGList;cdecl;external libgstrtp;
function gst_rtp_header_extension_create_from_uri(uri:Pgchar):PGstRTPHeaderExtension;cdecl;external libgstrtp;
function gst_rtp_header_extension_get_sdp_caps_field_name(ext:PGstRTPHeaderExtension):Pgchar;cdecl;external libgstrtp;
procedure gst_rtp_header_extension_set_direction(ext:PGstRTPHeaderExtension; direction:TGstRTPHeaderExtensionDirection);cdecl;external libgstrtp;
function gst_rtp_header_extension_get_direction(ext:PGstRTPHeaderExtension):TGstRTPHeaderExtensionDirection;cdecl;external libgstrtp;
function gst_rtp_header_extension_set_caps_from_attributes_helper(ext:PGstRTPHeaderExtension; caps:PGstCaps; attributes:Pgchar):Tgboolean;cdecl;external libgstrtp;

function GST_RTP_HEADER_EXTENSION_CAST(obj : Pointer) : PGstRTPHeaderExtension;

// === Konventiert am: 7-10-24 16:10:01 ===

function GST_TYPE_RTP_HEADER_EXTENSION : TGType;
function GST_RTP_HEADER_EXTENSION(obj : Pointer) : PGstRTPHeaderExtension;
function GST_RTP_HEADER_EXTENSION_CLASS(klass : Pointer) : PGstRTPHeaderExtensionClass;
function GST_IS_RTP_HEADER_EXTENSION(obj : Pointer) : Tgboolean;
function GST_IS_RTP_HEADER_EXTENSION_CLASS(klass : Pointer) : Tgboolean;
function GST_RTP_HEADER_EXTENSION_GET_CLASS(obj : Pointer) : PGstRTPHeaderExtensionClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GST_TYPE_RTP_HEADER_EXTENSION : TGType;
  begin
    GST_TYPE_RTP_HEADER_EXTENSION:=gst_rtp_header_extension_get_type;
  end;

function GST_RTP_HEADER_EXTENSION(obj : Pointer) : PGstRTPHeaderExtension;
begin
  Result := PGstRTPHeaderExtension(g_type_check_instance_cast(obj, GST_TYPE_RTP_HEADER_EXTENSION));
end;

function GST_RTP_HEADER_EXTENSION_CLASS(klass : Pointer) : PGstRTPHeaderExtensionClass;
begin
  Result := PGstRTPHeaderExtensionClass(g_type_check_class_cast(klass, GST_TYPE_RTP_HEADER_EXTENSION));
end;

function GST_IS_RTP_HEADER_EXTENSION(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_RTP_HEADER_EXTENSION);
end;

function GST_IS_RTP_HEADER_EXTENSION_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GST_TYPE_RTP_HEADER_EXTENSION);
end;

function GST_RTP_HEADER_EXTENSION_GET_CLASS(obj : Pointer) : PGstRTPHeaderExtensionClass;
begin
  Result := PGstRTPHeaderExtensionClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GST_RTP_HEADER_EXTENSION_CAST(obj: Pointer): PGstRTPHeaderExtension;
begin
  GST_RTP_HEADER_EXTENSION_CAST:=PGstRTPHeaderExtension(obj);
end;


{$ENDIF read_implementation}
