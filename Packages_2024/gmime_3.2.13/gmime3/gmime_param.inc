{$IFDEF read_interface}



type
  TGMimeParam = record
    parent_object: TGObject;
    method: TGMimeParamEncodingMethod;
    charset: pchar;
    lang: pchar;
    name: pchar;
    value: pchar;
    changed: Tgpointer;
  end;
  PGMimeParam = ^TGMimeParam;

  TGMimeParamClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeParamClass = ^TGMimeParamClass;

function g_mime_param_get_type: TGType; cdecl; external libgmime3;
function g_mime_param_get_name(param: PGMimeParam): pchar; cdecl; external libgmime3;
function g_mime_param_get_value(param: PGMimeParam): pchar; cdecl; external libgmime3;
procedure g_mime_param_set_value(param: PGMimeParam; value: pchar); cdecl; external libgmime3;
function g_mime_param_get_charset(param: PGMimeParam): pchar; cdecl; external libgmime3;
procedure g_mime_param_set_charset(param: PGMimeParam; charset: pchar); cdecl; external libgmime3;
function g_mime_param_get_lang(param: PGMimeParam): pchar; cdecl; external libgmime3;
procedure g_mime_param_set_lang(param: PGMimeParam; lang: pchar); cdecl; external libgmime3;
function g_mime_param_get_encoding_method(param: PGMimeParam): TGMimeParamEncodingMethod; cdecl; external libgmime3;
procedure g_mime_param_set_encoding_method(param: PGMimeParam; method: TGMimeParamEncodingMethod); cdecl; external libgmime3;

type
  TGMimeParamList = record
    parent_object: TGObject;
    arr: PGPtrArray;
    changed: Tgpointer;
  end;
  PGMimeParamList = ^TGMimeParamList;

  TGMimeParamListClass = record
    parent_class: TGObjectClass;
  end;
  PGMimeParamListClass = ^TGMimeParamListClass;

function g_mime_param_list_get_type: TGType; cdecl; external libgmime3;
function g_mime_param_list_new: PGMimeParamList; cdecl; external libgmime3;
function g_mime_param_list_parse(options: PGMimeParserOptions; str: pchar): PGMimeParamList; cdecl; external libgmime3;
function g_mime_param_list_length(list: PGMimeParamList): longint; cdecl; external libgmime3;
procedure g_mime_param_list_clear(list: PGMimeParamList); cdecl; external libgmime3;
procedure g_mime_param_list_set_parameter(list: PGMimeParamList; name: pchar; value: pchar); cdecl; external libgmime3;
function g_mime_param_list_get_parameter(list: PGMimeParamList; name: pchar): PGMimeParam; cdecl; external libgmime3;
function g_mime_param_list_get_parameter_at(list: PGMimeParamList; index: longint): PGMimeParam; cdecl; external libgmime3;
function g_mime_param_list_remove(list: PGMimeParamList; name: pchar): Tgboolean; cdecl; external libgmime3;
function g_mime_param_list_remove_at(list: PGMimeParamList; index: longint): Tgboolean; cdecl; external libgmime3;
procedure g_mime_param_list_encode(list: PGMimeParamList; options: PGMimeFormatOptions; fold: Tgboolean; str: PGString); cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:31:20 ===

function GMIME_TYPE_PARAM: TGType;
function GMIME_PARAM(obj: Pointer): PGMimeParam;
function GMIME_PARAM_CLASS(klass: Pointer): PGMimeParamClass;
function GMIME_IS_PARAM(obj: Pointer): Tgboolean;
function GMIME_IS_PARAM_CLASS(klass: Pointer): Tgboolean;
function GMIME_PARAM_GET_CLASS(obj: Pointer): PGMimeParamClass;

function GMIME_TYPE_PARAM_LIST: TGType;
function GMIME_PARAM_LIST(obj: Pointer): PGMimeParamList;
function GMIME_PARAM_LIST_CLASS(klass: Pointer): PGMimeParamListClass;
function GMIME_IS_PARAM_LIST(obj: Pointer): Tgboolean;
function GMIME_IS_PARAM_LIST_CLASS(klass: Pointer): Tgboolean;
function GMIME_PARAM_LIST_GET_CLASS(obj: Pointer): PGMimeParamListClass;


{$ENDIF read_interface}


{$IFDEF read_implementation}

function GMIME_TYPE_PARAM: TGType;
begin
  GMIME_TYPE_PARAM := g_mime_param_get_type;
end;

function GMIME_PARAM(obj: Pointer): PGMimeParam;
begin
  Result := PGMimeParam(g_type_check_instance_cast(obj, GMIME_TYPE_PARAM));
end;

function GMIME_PARAM_CLASS(klass: Pointer): PGMimeParamClass;
begin
  Result := PGMimeParamClass(g_type_check_class_cast(klass, GMIME_TYPE_PARAM));
end;

function GMIME_IS_PARAM(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_PARAM);
end;

function GMIME_IS_PARAM_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_PARAM);
end;

function GMIME_PARAM_GET_CLASS(obj: Pointer): PGMimeParamClass;
begin
  Result := PGMimeParamClass(PGTypeInstance(obj)^.g_class);
end;

// ====

function GMIME_TYPE_PARAM_LIST: TGType;
begin
  GMIME_TYPE_PARAM_LIST := g_mime_param_list_get_type;
end;

function GMIME_PARAM_LIST(obj: Pointer): PGMimeParamList;
begin
  Result := PGMimeParamList(g_type_check_instance_cast(obj, GMIME_TYPE_PARAM_LIST));
end;

function GMIME_PARAM_LIST_CLASS(klass: Pointer): PGMimeParamListClass;
begin
  Result := PGMimeParamListClass(g_type_check_class_cast(klass, GMIME_TYPE_PARAM_LIST));
end;

function GMIME_IS_PARAM_LIST(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_PARAM_LIST);
end;

function GMIME_IS_PARAM_LIST_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_PARAM_LIST);
end;

function GMIME_PARAM_LIST_GET_CLASS(obj: Pointer): PGMimeParamListClass;
begin
  Result := PGMimeParamListClass(PGTypeInstance(obj)^.g_class);
end;


{$ENDIF read_implementation}
