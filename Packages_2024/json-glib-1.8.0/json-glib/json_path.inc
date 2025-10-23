{$IFDEF read_interface}



function JSON_PATH_ERROR: TGQuark;

type
  PJsonPathError = ^TJsonPathError;
  TJsonPathError = longint;

const
  JSON_PATH_ERROR_INVALID_QUERY = 0;

type
  PJsonPath = type Pointer;

function json_path_get_type: TGType; cdecl; external libjsonglib;
function json_path_error_quark: TGQuark; cdecl; external libjsonglib;
function json_path_new: PJsonPath; cdecl; external libjsonglib;
function json_path_compile(path: PJsonPath; expression: pchar; error: PPGError): Tgboolean; cdecl; external libjsonglib;
function json_path_match(path: PJsonPath; root: PJsonNode): PJsonNode; cdecl; external libjsonglib;
function json_path_query(expression: pchar; root: PJsonNode; error: PPGError): PJsonNode; cdecl; external libjsonglib;

// === Konventiert am: 15-9-25 13:27:12 ===

function JSON_TYPE_PATH: TGType;
function JSON_PATH(obj: Pointer): PJsonPath;
function JSON_IS_PATH(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JSON_TYPE_PATH: TGType;
begin
  JSON_TYPE_PATH := json_path_get_type;
end;

function JSON_PATH(obj: Pointer): PJsonPath;
begin
  Result := PJsonPath(g_type_check_instance_cast(obj, JSON_TYPE_PATH));
end;

function JSON_IS_PATH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSON_TYPE_PATH);
end;


function JSON_PATH_ERROR: TGQuark;
begin
  JSON_PATH_ERROR := json_path_error_quark;
end;


{$ENDIF read_implementation}
