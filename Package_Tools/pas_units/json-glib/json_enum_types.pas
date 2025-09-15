unit json_enum_types;

interface

uses
  fp_glib2, fp_json_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function json_parser_error_get_type: TGType; cdecl; external libjsonglib;
function JSON_TYPE_PARSER_ERROR: TGType;

function json_path_error_get_type: TGType; cdecl; external libjsonglib;
function JSON_TYPE_PATH_ERROR: TGType;

function json_reader_error_get_type: TGType; cdecl; external libjsonglib;
function JSON_TYPE_READER_ERROR: TGType;

function json_node_type_get_type: TGType; cdecl; external libjsonglib;
function JSON_TYPE_NODE_TYPE: TGType;


// === Konventiert am: 15-9-25 13:29:05 ===


implementation


function JSON_TYPE_PARSER_ERROR: TGType;
begin
  JSON_TYPE_PARSER_ERROR := json_parser_error_get_type;
end;

function JSON_TYPE_PATH_ERROR: TGType;
begin
  JSON_TYPE_PATH_ERROR := json_path_error_get_type;
end;

function JSON_TYPE_READER_ERROR: TGType;
begin
  JSON_TYPE_READER_ERROR := json_reader_error_get_type;
end;

function JSON_TYPE_NODE_TYPE: TGType;
begin
  JSON_TYPE_NODE_TYPE := json_node_type_get_type;
end;


end.
