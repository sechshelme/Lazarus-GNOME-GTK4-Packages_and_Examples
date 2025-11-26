{$IFDEF read_interface}


type
  TSoupHSTSEnforcerDB = record
  end;
  PSoupHSTSEnforcerDB = ^TSoupHSTSEnforcerDB;

  TSoupHSTSEnforcerDBClass = record
    parent_class: TSoupHSTSEnforcerClass;
  end;
  PSoupHSTSEnforcerDBClass = ^TSoupHSTSEnforcerDBClass;

function soup_hsts_enforcer_db_get_type: TGType; cdecl; external libsoup;
function soup_hsts_enforcer_db_new(filename: pchar): PSoupHSTSEnforcer; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:44 ===

function SOUP_TYPE_HSTS_ENFORCER_DB: TGType;
function SOUP_HSTS_ENFORCER_DB(obj: Pointer): PSoupHSTSEnforcerDB;
function SOUP_IS_HSTS_ENFORCER_DB(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_HSTS_ENFORCER_DB: TGType;
begin
  Result := soup_hsts_enforcer_db_get_type;
end;

function SOUP_HSTS_ENFORCER_DB(obj: Pointer): PSoupHSTSEnforcerDB;
begin
  Result := PSoupHSTSEnforcerDB(g_type_check_instance_cast(obj, SOUP_TYPE_HSTS_ENFORCER_DB));
end;

function SOUP_IS_HSTS_ENFORCER_DB(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_HSTS_ENFORCER_DB);
end;



{$ENDIF read_implementation}
