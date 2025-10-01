{$IFDEF read_interface}


type
  TSoupHSTSEnforcer = record
    parent_instance: TGObject;
  end;
  PSoupHSTSEnforcer = ^TSoupHSTSEnforcer;

  TSoupHSTSEnforcerClass = record
    parent_class: TGObjectClass;
    is_persistent: function(hsts_enforcer: PSoupHSTSEnforcer): Tgboolean; cdecl;
    has_valid_policy: function(hsts_enforcer: PSoupHSTSEnforcer; domain: pchar): Tgboolean; cdecl;
    changed: procedure(enforcer: PSoupHSTSEnforcer; old_policy: PSoupHSTSPolicy; new_policy: PSoupHSTSPolicy); cdecl;
    padding: array[0..3] of Tgpointer;
  end;
  PSoupHSTSEnforcerClass = ^TSoupHSTSEnforcerClass;

function soup_hsts_enforcer_get_type: TGType; cdecl; external libsoup;
function soup_hsts_enforcer_new: PSoupHSTSEnforcer; cdecl; external libsoup;
function soup_hsts_enforcer_is_persistent(hsts_enforcer: PSoupHSTSEnforcer): Tgboolean; cdecl; external libsoup;
function soup_hsts_enforcer_has_valid_policy(hsts_enforcer: PSoupHSTSEnforcer; domain: pchar): Tgboolean; cdecl; external libsoup;
procedure soup_hsts_enforcer_set_session_policy(hsts_enforcer: PSoupHSTSEnforcer; domain: pchar; include_subdomains: Tgboolean); cdecl; external libsoup;
procedure soup_hsts_enforcer_set_policy(hsts_enforcer: PSoupHSTSEnforcer; policy: PSoupHSTSPolicy); cdecl; external libsoup;
function soup_hsts_enforcer_get_domains(hsts_enforcer: PSoupHSTSEnforcer; session_policies: Tgboolean): PGList; cdecl; external libsoup;
function soup_hsts_enforcer_get_policies(hsts_enforcer: PSoupHSTSEnforcer; session_policies: Tgboolean): PGList; cdecl; external libsoup;

// === Konventiert am: 29-9-25 19:44:47 ===

function SOUP_TYPE_HSTS_ENFORCER: TGType;
function SOUP_HSTS_ENFORCER(obj: Pointer): PSoupHSTSEnforcer;
function SOUP_IS_HSTS_ENFORCER(obj: Pointer): Tgboolean;
function SOUP_HSTS_ENFORCER_CLASS(klass: Pointer): PSoupHSTSEnforcerClass;
function SOUP_IS_HSTS_ENFORCER_CLASS(klass: Pointer): Tgboolean;
function SOUP_HSTS_ENFORCER_GET_CLASS(obj: Pointer): PSoupHSTSEnforcerClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function SOUP_TYPE_HSTS_ENFORCER: TGType;
begin
  Result := soup_hsts_enforcer_get_type;
end;

function SOUP_HSTS_ENFORCER(obj: Pointer): PSoupHSTSEnforcer;
begin
  Result := PSoupHSTSEnforcer(g_type_check_instance_cast(obj, SOUP_TYPE_HSTS_ENFORCER));
end;

function SOUP_IS_HSTS_ENFORCER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, SOUP_TYPE_HSTS_ENFORCER);
end;

function SOUP_HSTS_ENFORCER_CLASS(klass: Pointer): PSoupHSTSEnforcerClass;
begin
  Result := PSoupHSTSEnforcerClass(g_type_check_class_cast(klass, SOUP_TYPE_HSTS_ENFORCER));
end;

function SOUP_IS_HSTS_ENFORCER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, SOUP_TYPE_HSTS_ENFORCER);
end;

function SOUP_HSTS_ENFORCER_GET_CLASS(obj: Pointer): PSoupHSTSEnforcerClass;
begin
  Result := PSoupHSTSEnforcerClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
