unit gstmetafactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gstmeta, gstplugin;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGstMetaFactory = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_meta_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_meta_factory_load(factoryname: Pgchar): PGstMetaInfo; cdecl; external libgstreamer;
function gst_meta_factory_register(plugin: PGstPlugin; meta_info: PGstMetaInfo): Tgboolean; cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:18:24 ===

function GST_TYPE_META_FACTORY: TGType;
function GST_META_FACTORY(obj: Pointer): PGstMetaFactory;
function GST_IS_META_FACTORY(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GST_TYPE_META_FACTORY: TGType;
begin
  Result := gst_meta_factory_get_type;
end;

function GST_META_FACTORY(obj: Pointer): PGstMetaFactory;
begin
  Result := PGstMetaFactory(g_type_check_instance_cast(obj, GST_TYPE_META_FACTORY));
end;

function GST_IS_META_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_META_FACTORY);
end;

end.
