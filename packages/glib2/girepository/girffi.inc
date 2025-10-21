{$IFDEF read_interface}


type
  TGIFFIClosureCallback = procedure(cif: Pffi_cif; ret: pointer; args: Ppointer; user_data: pointer); cdecl;

  PGIFunctionInvoker = type Pointer;

  PGIFFIReturnValue = ^TGIFFIReturnValue;
  TGIFFIReturnValue = TGIArgument;

function gi_type_tag_get_ffi_type(type_tag: TGITypeTag; is_pointer: Tgboolean): Pffi_type; cdecl; external libgirepository2;
function gi_type_info_get_ffi_type(info: PGITypeInfo): Pffi_type; cdecl; external libgirepository2;
procedure gi_type_info_extract_ffi_return_value(return_info: PGITypeInfo; ffi_value: PGIFFIReturnValue; arg: PGIArgument); cdecl; external libgirepository2;
procedure gi_type_tag_extract_ffi_return_value(return_tag: TGITypeTag; interface_type: TGType; ffi_value: PGIFFIReturnValue; arg: PGIArgument); cdecl; external libgirepository2;
function gi_function_info_prep_invoker(info: PGIFunctionInfo; invoker: PGIFunctionInvoker; error: PPGError): Tgboolean; cdecl; external libgirepository2;
function gi_function_invoker_new_for_address(addr: pointer; info: PGICallableInfo; invoker: PGIFunctionInvoker; error: PPGError): Tgboolean; cdecl; external libgirepository2;
procedure gi_function_invoker_clear(invoker: PGIFunctionInvoker); cdecl; external libgirepository2;
function gi_callable_info_create_closure(callable_info: PGICallableInfo; cif: Pffi_cif; callback: TGIFFIClosureCallback; user_data: pointer): Pffi_closure; cdecl; external libgirepository2;
function gi_callable_info_get_closure_native_address(callable_info: PGICallableInfo; closure: Pffi_closure): Ppointer; cdecl; external libgirepository2;
procedure gi_callable_info_destroy_closure(callable_info: PGICallableInfo; closure: Pffi_closure); cdecl; external libgirepository2;

// === Konventiert am: 21-10-25 13:36:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
