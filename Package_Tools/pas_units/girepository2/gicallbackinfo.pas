unit gicallbackinfo;

interface

uses
  fp_glib2, fp_girepository2, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  // === Konventiert am: 21-10-25 13:34:41 ===

function GI_TYPE_CALLBACK_INFO: TGType;
function GI_CALLBACK_INFO(obj: Pointer): PGICallbackInfo;
function GI_IS_CALLBACK_INFO(obj: Pointer): Tgboolean;

implementation

function GI_TYPE_CALLBACK_INFO: TGType;
begin
  GI_TYPE_CALLBACK_INFO := gi_callback_info_get_type;
end;

function GI_CALLBACK_INFO(obj: Pointer): PGICallbackInfo;
begin
  Result := PGICallbackInfo(g_type_check_instance_cast(obj, GI_TYPE_CALLBACK_INFO));
end;

function GI_IS_CALLBACK_INFO(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GI_TYPE_CALLBACK_INFO);
end;



end.
