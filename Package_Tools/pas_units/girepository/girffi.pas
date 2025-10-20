unit girffi;

interface

uses
  fp_glib2, fp_girepository, gitypes, gibaseinfo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGIFFIClosureCallback = procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;

  PGIFunctionInvoker = type Pointer;

  PGIFFIReturnValue = ^TGIFFIReturnValue;
  TGIFFIReturnValue = TGIArgument;

function gi_type_tag_get_ffi_type(type_tag: TGITypeTag; is_pointer: Tgboolean): Pffi_type; cdecl; external libgirepository;
function g_type_info_get_ffi_type(info: PGITypeInfo): Pffi_type; cdecl; external libgirepository;
procedure gi_type_info_extract_ffi_return_value(return_info: PGITypeInfo; ffi_value: PGIFFIReturnValue; arg: PGIArgument); cdecl; external libgirepository;
procedure gi_type_tag_extract_ffi_return_value(return_tag: TGITypeTag; interface_type: TGIInfoType; ffi_value: PGIFFIReturnValue; arg: PGIArgument); cdecl; external libgirepository;
function g_function_info_prep_invoker(info: PGIFunctionInfo; invoker: PGIFunctionInvoker; error: PPGError): Tgboolean; cdecl; external libgirepository;
function g_function_invoker_new_for_address(addr: Tgpointer; info: PGICallableInfo; invoker: PGIFunctionInvoker; error: PPGError): Tgboolean; cdecl; external libgirepository;
procedure g_function_invoker_destroy(invoker: PGIFunctionInvoker); cdecl; external libgirepository;
function g_callable_info_prepare_closure(callable_info: PGICallableInfo; cif: Pffi_cif; callback: TGIFFIClosureCallback; user_data: Tgpointer): Pffi_closure; cdecl; external libgirepository; deprecated'g_callable_info_create_closure';

procedure g_callable_info_free_closure(callable_info: PGICallableInfo; closure: Pffi_closure); cdecl; external libgirepository; deprecated'g_callable_info_destroy_closure';
function g_callable_info_create_closure(callable_info: PGICallableInfo; cif: Pffi_cif; callback: TGIFFIClosureCallback; user_data: Tgpointer): Pffi_closure; cdecl; external libgirepository;
function g_callable_info_get_closure_native_address(callable_info: PGICallableInfo; closure: Pffi_closure): Pgpointer; cdecl; external libgirepository;
procedure g_callable_info_destroy_closure(callable_info: PGICallableInfo; closure: Pffi_closure); cdecl; external libgirepository;

// === Konventiert am: 20-10-25 16:02:13 ===


implementation



end.
