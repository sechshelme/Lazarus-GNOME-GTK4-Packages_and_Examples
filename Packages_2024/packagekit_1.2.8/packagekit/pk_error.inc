{$IFDEF read_interface}


type
  PPkErrorPrivate = type Pointer;

  PPkError = ^TPkError;
  TPkError = record
    parent: TPkSource;
    priv: PPkErrorPrivate;
  end;

  PPkErrorClass = ^TPkErrorClass;
  TPkErrorClass = record
    parent_class: TPkSourceClass;
    _pk_reserved1: procedure; cdecl;
    _pk_reserved2: procedure; cdecl;
    _pk_reserved3: procedure; cdecl;
    _pk_reserved4: procedure; cdecl;
    _pk_reserved5: procedure; cdecl;
  end;

function pk_error_get_type: TGType; cdecl; external libpackagekit;
function pk_error_new: PPkError; cdecl; external libpackagekit;
function pk_error_get_code(error_code: PPkError): TPkErrorEnum; cdecl; external libpackagekit;
function pk_error_get_details(error_code: PPkError): Pgchar; cdecl; external libpackagekit;

// === Konventiert am: 7-9-26 15:08:41 ===

function PK_TYPE_ERROR_CODE: TGType;
function PK_ERROR_CODE(obj: Pointer): PPkError;
function PK_ERROR_CODE_CLASS(klass: Pointer): PPkErrorClass;
function PK_IS_ERROR_CODE(obj: Pointer): Tgboolean;
function PK_IS_ERROR_CODE_CLASS(klass: Pointer): Tgboolean;
function PK_ERROR_CODE_GET_CLASS(obj: Pointer): PPkErrorClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function PK_TYPE_ERROR_CODE: TGType;
begin
  PK_TYPE_ERROR_CODE := pk_error_get_type;
end;

function PK_ERROR_CODE(obj: Pointer): PPkError;
begin
  Result := PPkError(g_type_check_instance_cast(obj, PK_TYPE_ERROR_CODE));
end;

function PK_ERROR_CODE_CLASS(klass: Pointer): PPkErrorClass;
begin
  Result := PPkErrorClass(g_type_check_class_cast(klass, PK_TYPE_ERROR_CODE));
end;

function PK_IS_ERROR_CODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, PK_TYPE_ERROR_CODE);
end;

function PK_IS_ERROR_CODE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, PK_TYPE_ERROR_CODE);
end;

function PK_ERROR_CODE_GET_CLASS(obj: Pointer): PPkErrorClass;
begin
  Result := PPkErrorClass(PGTypeInstance(obj)^.g_class);
end;



{$ENDIF read_implementation}
