

{$IFDEF read_function}
function gegl_list_operations(n_operations_p: Pguint): PPgchar; cdecl; external libgegl;
function gegl_has_operation(operation_type: Pgchar): Tgboolean; cdecl; external libgegl;
function gegl_operation_list_properties(operation_type: Pgchar; n_properties_p: Pguint): PPGParamSpec; cdecl; external libgegl;
function gegl_operation_find_property(operation_type: Pgchar; property_name: Pgchar): PGParamSpec; cdecl; external libgegl;
function gegl_operation_get_property_key(operation_type: Pgchar; property_name: Pgchar; property_key_name: Pgchar): Pgchar; cdecl; external libgegl;
function gegl_operation_list_property_keys(operation_type: Pgchar; property_name: Pgchar; n_keys: Pguint): PPgchar; cdecl; external libgegl;
function gegl_param_spec_get_property_key(pspec: PGParamSpec; key_name: Pgchar): Pgchar; cdecl; external libgegl;
procedure gegl_param_spec_set_property_key(pspec: PGParamSpec; key_name: Pgchar; value: Pgchar); cdecl; external libgegl;
function gegl_operation_list_keys(operation_type: Pgchar; n_keys: Pguint): PPgchar; cdecl; external libgegl;
function gegl_operation_get_key(operation_type: Pgchar; key_name: Pgchar): Pgchar; cdecl; external libgegl;

// === Konventiert am: 12-8-26 15:08:35 ===

function gegl_coordinate_relative_to_pixel(relative: double; pixel_dim: double): double; inline;
function gegl_coordinate_pixel_to_relative(pixel: double; pixel_dim: double): double; inline;
{$ENDIF read_function}


{$IFDEF read_implementation}

function gegl_coordinate_relative_to_pixel(relative: double; pixel_dim: double): double; inline;
begin
  Result := relative * pixel_dim;
end;

function gegl_coordinate_pixel_to_relative(pixel: double; pixel_dim: double): double; inline;
begin
  Result := pixel / pixel_dim;
end;

{$ENDIF read_implementation}
