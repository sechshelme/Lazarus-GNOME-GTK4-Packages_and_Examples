unit gstelementfactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstplugin, gsturi, gstpluginfeature;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
type
  PGstElementFactoryListType = ^TGstElementFactoryListType;
  TGstElementFactoryListType = Tguint64;
const
  GST_ELEMENT_FACTORY_KLASS_DECODER = 'Decoder';
  GST_ELEMENT_FACTORY_KLASS_ENCODER = 'Encoder';
  GST_ELEMENT_FACTORY_KLASS_SINK = 'Sink';
  GST_ELEMENT_FACTORY_KLASS_SRC = 'Source';
  GST_ELEMENT_FACTORY_KLASS_MUXER = 'Muxer';
  GST_ELEMENT_FACTORY_KLASS_DEMUXER = 'Demuxer';
  GST_ELEMENT_FACTORY_KLASS_PARSER = 'Parser';
  GST_ELEMENT_FACTORY_KLASS_PAYLOADER = 'Payloader';
  GST_ELEMENT_FACTORY_KLASS_DEPAYLOADER = 'Depayloader';
  GST_ELEMENT_FACTORY_KLASS_FORMATTER = 'Formatter';
  GST_ELEMENT_FACTORY_KLASS_DECRYPTOR = 'Decryptor';
  GST_ELEMENT_FACTORY_KLASS_ENCRYPTOR = 'Encryptor';
  GST_ELEMENT_FACTORY_KLASS_MEDIA_VIDEO = 'Video';
  GST_ELEMENT_FACTORY_KLASS_MEDIA_AUDIO = 'Audio';
  GST_ELEMENT_FACTORY_KLASS_MEDIA_IMAGE = 'Image';
  GST_ELEMENT_FACTORY_KLASS_MEDIA_SUBTITLE = 'Subtitle';
  GST_ELEMENT_FACTORY_KLASS_MEDIA_METADATA = 'Metadata';
  GST_ELEMENT_FACTORY_KLASS_HARDWARE = 'Hardware';

const
  GST_ELEMENT_FACTORY_TYPE_DECODER = TGstElementFactoryListType(QWord(1) shl 0);
  GST_ELEMENT_FACTORY_TYPE_ENCODER = TGstElementFactoryListType(QWord(1) shl 1);
  GST_ELEMENT_FACTORY_TYPE_SINK = TGstElementFactoryListType(QWord(1) shl 2);
  GST_ELEMENT_FACTORY_TYPE_SRC = TGstElementFactoryListType(QWord(1) shl 3);
  GST_ELEMENT_FACTORY_TYPE_MUXER = TGstElementFactoryListType(QWord(1) shl 4);
  GST_ELEMENT_FACTORY_TYPE_DEMUXER = TGstElementFactoryListType(QWord(1) shl 5);
  GST_ELEMENT_FACTORY_TYPE_PARSER = TGstElementFactoryListType(QWord(1) shl 6);
  GST_ELEMENT_FACTORY_TYPE_PAYLOADER = TGstElementFactoryListType(QWord(1) shl 7);
  GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER = TGstElementFactoryListType(QWord(1) shl 8);
  GST_ELEMENT_FACTORY_TYPE_FORMATTER = TGstElementFactoryListType(QWord(1) shl 9);
  GST_ELEMENT_FACTORY_TYPE_DECRYPTOR = TGstElementFactoryListType(QWord(1) shl 10);
  GST_ELEMENT_FACTORY_TYPE_ENCRYPTOR = TGstElementFactoryListType(QWord(1) shl 11);
  GST_ELEMENT_FACTORY_TYPE_HARDWARE = TGstElementFactoryListType(QWord(1) shl 12);
  GST_ELEMENT_FACTORY_TYPE_TIMESTAMPER = TGstElementFactoryListType(QWord(1) shl 13);
  GST_ELEMENT_FACTORY_TYPE_MAX_ELEMENTS = TGstElementFactoryListType(QWord(1) shl 48);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO = TGstElementFactoryListType(QWord(1) shl 49);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO = TGstElementFactoryListType(QWord(1) shl 50);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE = TGstElementFactoryListType(QWord(1) shl 51);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_SUBTITLE = TGstElementFactoryListType(QWord(1) shl 52);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_METADATA = TGstElementFactoryListType(QWord(1) shl 53);
  GST_ELEMENT_FACTORY_TYPE_ANY = TGstElementFactoryListType((QWord(1) shl 49) - 1);
  GST_ELEMENT_FACTORY_TYPE_MEDIA_ANY = TGstElementFactoryListType((not QWord(0)) shl 48);
  GST_ELEMENT_FACTORY_TYPE_VIDEO_ENCODER = TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  GST_ELEMENT_FACTORY_TYPE_AUDIO_ENCODER = TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_ENCODER or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO);
  GST_ELEMENT_FACTORY_TYPE_AUDIOVIDEO_SINKS = TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_SINK or GST_ELEMENT_FACTORY_TYPE_MEDIA_AUDIO or GST_ELEMENT_FACTORY_TYPE_MEDIA_VIDEO or GST_ELEMENT_FACTORY_TYPE_MEDIA_IMAGE);
  GST_ELEMENT_FACTORY_TYPE_DECODABLE = TGstElementFactoryListType(GST_ELEMENT_FACTORY_TYPE_DECODER or GST_ELEMENT_FACTORY_TYPE_DEMUXER or GST_ELEMENT_FACTORY_TYPE_DEPAYLOADER or GST_ELEMENT_FACTORY_TYPE_PARSER or GST_ELEMENT_FACTORY_TYPE_DECRYPTOR);
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGstElementFactory = type Pointer;
  PGstElementFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_element_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_element_factory_find(name: Pgchar): PGstElementFactory; cdecl; external libgstreamer;
function gst_element_factory_get_element_type(factory: PGstElementFactory): TGType; cdecl; external libgstreamer;
function gst_element_factory_get_metadata(factory: PGstElementFactory; key: Pgchar): Pgchar; cdecl; external libgstreamer;
function gst_element_factory_get_metadata_keys(factory: PGstElementFactory): PPgchar; cdecl; external libgstreamer;
function gst_element_factory_get_num_pad_templates(factory: PGstElementFactory): Tguint; cdecl; external libgstreamer;
function gst_element_factory_get_static_pad_templates(factory: PGstElementFactory): PGList; cdecl; external libgstreamer;
function gst_element_factory_get_uri_type(factory: PGstElementFactory): TGstURIType; cdecl; external libgstreamer;
function gst_element_factory_get_uri_protocols(factory: PGstElementFactory): PPgchar; cdecl; external libgstreamer;
function gst_element_factory_has_interface(factory: PGstElementFactory; interfacename: Pgchar): Tgboolean; cdecl; external libgstreamer;
function gst_element_factory_create(factory: PGstElementFactory; name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_create_full(factory: PGstElementFactory; first: Pgchar; args: array of const): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_create_full(factory: PGstElementFactory; first: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_create_valist(factory: PGstElementFactory; first: Pgchar; properties: Tva_list): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_create_with_properties(factory: PGstElementFactory; n: Tguint; names: PPgchar; values: PGValue): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_make(factoryname: Pgchar; name: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_make_full(factoryname: Pgchar; first: Pgchar; args: array of const): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_make_full(factoryname: Pgchar; first: Pgchar): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_make_valist(factoryname: Pgchar; first: Pgchar; properties: Tva_list): PGstElement; cdecl; external libgstreamer;
function gst_element_factory_make_with_properties(factoryname: Pgchar; n: Tguint; names: PPgchar; values: PGValue): PGstElement; cdecl; external libgstreamer;
function gst_element_register(plugin: PGstPlugin; name: Pgchar; rank: Tguint; _type: TGType): Tgboolean; cdecl; external libgstreamer;
procedure gst_element_type_set_skip_documentation(_type: TGType); cdecl; external libgstreamer;
function gst_element_factory_get_skip_documentation(factory: PGstElementFactory): Tgboolean; cdecl; external libgstreamer;

function gst_element_factory_list_is_type(factory: PGstElementFactory; _type: TGstElementFactoryListType): Tgboolean; cdecl; external libgstreamer;
function gst_element_factory_list_get_elements(_type: TGstElementFactoryListType; minrank: TGstRank): PGList; cdecl; external libgstreamer;
function gst_element_factory_list_filter(list: PGList; caps: PGstCaps; direction: TGstPadDirection; subsetonly: Tgboolean): PGList; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 10:58:58 ===

function GST_ELEMENT_FACTORY_CAST(obj: Pointer): PGstElementFactory;
function GST_TYPE_ELEMENT_FACTORY: TGType;
function GST_ELEMENT_FACTORY(obj: Pointer): PGstElementFactory;
function GST_ELEMENT_FACTORY_CLASS(klass: Pointer): PGstElementFactoryClass;
function GST_IS_ELEMENT_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_ELEMENT_FACTORY_CLASS(klass: Pointer): Tgboolean;
{$ENDIF read_struct}


implementation

function GST_TYPE_ELEMENT_FACTORY: TGType;
begin
  GST_TYPE_ELEMENT_FACTORY := gst_element_factory_get_type;
end;

function GST_ELEMENT_FACTORY(obj: Pointer): PGstElementFactory;
begin
  Result := PGstElementFactory(g_type_check_instance_cast(obj, GST_TYPE_ELEMENT_FACTORY));
end;

function GST_ELEMENT_FACTORY_CLASS(klass: Pointer): PGstElementFactoryClass;
begin
  Result := PGstElementFactoryClass(g_type_check_class_cast(klass, GST_TYPE_ELEMENT_FACTORY));
end;

function GST_IS_ELEMENT_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_ELEMENT_FACTORY);
end;

function GST_IS_ELEMENT_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_ELEMENT_FACTORY);
end;

function GST_ELEMENT_FACTORY_CAST(obj: Pointer): PGstElementFactory;
begin
  GST_ELEMENT_FACTORY_CAST := PGstElementFactory(obj);
end;

end.
