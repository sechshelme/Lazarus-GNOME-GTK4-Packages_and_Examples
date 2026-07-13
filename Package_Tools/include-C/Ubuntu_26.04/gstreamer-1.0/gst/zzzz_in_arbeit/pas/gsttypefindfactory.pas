unit gsttypefindfactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, gsttypefind;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGstTypeFindFactory = type Pointer;
  PGstTypeFindFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gst_type_find_factory_get_type: TGType; cdecl; external libgstreamer;
function gst_type_find_factory_get_list: PGList; cdecl; external libgstreamer;
function gst_type_find_factory_get_extensions(factory: PGstTypeFindFactory): PPgchar; cdecl; external libgstreamer;
function gst_type_find_factory_get_caps(factory: PGstTypeFindFactory): PGstCaps; cdecl; external libgstreamer;
function gst_type_find_factory_has_function(factory: PGstTypeFindFactory): Tgboolean; cdecl; external libgstreamer;
procedure gst_type_find_factory_call_function(factory: PGstTypeFindFactory; find: PGstTypeFind); cdecl; external libgstreamer;

// === Konventiert am: 11-7-26 15:54:13 ===

function GST_TYPE_TYPE_FIND_FACTORY: TGType;
function GST_TYPE_FIND_FACTORY(obj: Pointer): PGstTypeFindFactory;
function GST_TYPE_FIND_FACTORY_CLASS(klass: Pointer): PGstTypeFindFactoryClass;
function GST_IS_TYPE_FIND_FACTORY(obj: Pointer): Tgboolean;
function GST_IS_TYPE_FIND_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GST_TYPE_FIND_FACTORY_GET_CLASS(obj: Pointer): PGstTypeFindFactoryClass;
{$ENDIF read_function}

implementation

function GST_TYPE_TYPE_FIND_FACTORY: TGType;
begin
  GST_TYPE_TYPE_FIND_FACTORY := gst_type_find_factory_get_type;
end;

function GST_TYPE_FIND_FACTORY(obj: Pointer): PGstTypeFindFactory;
begin
  Result := PGstTypeFindFactory(g_type_check_instance_cast(obj, GST_TYPE_TYPE_FIND_FACTORY));
end;

function GST_TYPE_FIND_FACTORY_CLASS(klass: Pointer): PGstTypeFindFactoryClass;
begin
  Result := PGstTypeFindFactoryClass(g_type_check_class_cast(klass, GST_TYPE_TYPE_FIND_FACTORY));
end;

function GST_IS_TYPE_FIND_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GST_TYPE_TYPE_FIND_FACTORY);
end;

function GST_IS_TYPE_FIND_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GST_TYPE_TYPE_FIND_FACTORY);
end;

function GST_TYPE_FIND_FACTORY_GET_CLASS(obj: Pointer): PGstTypeFindFactoryClass;
begin
  Result := PGstTypeFindFactoryClass(PGTypeInstance(obj)^.g_class);
end;

end.
