unit soup_session_feature;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



type
  TSoupSessionFeature = record
  end;
  PSoupSessionFeature = ^TSoupSessionFeature;

  TSoupSessionFeatureInterface = record
  end;
  PSoupSessionFeatureInterface = ^TSoupSessionFeatureInterface;

  // === Konventiert am: 29-9-25 19:44:02 ===

function soup_session_feature_get_type: TGType; cdecl; external libsoup;
function SOUP_TYPE_SESSION_FEATURE: TGType;
function SOUP_SESSION_FEATURE(obj: Pointer): PSoupSessionFeature;
function SOUP_IS_SESSION_FEATURE(obj: Pointer): Tgboolean;
function SOUP_SESSION_FEATURE_GET_IFACE(obj: Pointer): PSoupSessionFeatureInterface;

implementation

function SOUP_TYPE_SESSION_FEATURE: TGType;
begin
  Result := soup_session_feature_get_type;
end;

function SOUP_SESSION_FEATURE(obj: Pointer): PSoupSessionFeature;
begin
  Result := PSoupSessionFeature(g_type_check_instance_cast(obj, SOUP_TYPE_SESSION_FEATURE));
end;

function SOUP_IS_SESSION_FEATURE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_SESSION_FEATURE);
end;

function SOUP_SESSION_FEATURE_GET_IFACE(obj: Pointer): PSoupSessionFeatureInterface;
begin
  Result := g_type_interface_peek(obj, SOUP_TYPE_SESSION_FEATURE);
end;



end.
