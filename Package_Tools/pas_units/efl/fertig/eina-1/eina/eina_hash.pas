unit eina_hash;

interface

uses
  ctypes, efl, eina_types, eina_iterator;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

  type
  TEina_Hash_Tuple = record
      key : pointer;
      data : pointer;
      key_length : dword;
    end;
  PEina_Hash_Tuple = ^TEina_Hash_Tuple;

  TEina_Key_Length = function (key:pointer):dword;cdecl;


type
  TEina_Key_Cmp = function (key1:pointer; key1_length:longint; key2:pointer; key2_length:longint):longint;cdecl;

type
  TEina_Key_Hash = function (key:pointer; key_length:longint):longint;cdecl;

  TEina_Hash=record
      end;
  PEina_Hash=^TEina_Hash;

  function EINA_KEY_LENGTH(_Function : Pointer) : TEina_Key_Length;
function EINA_KEY_CMP(_Function : Pointer) : TEina_Key_Cmp;
function EINA_KEY_HASH(_Function : Pointer) : TEina_Key_Hash;
type
  TEina_Hash_Foreach = function (hash:PEina_Hash; key:pointer; data:pointer; fdata:pointer):TEina_Bool;cdecl;
function eina_hash_new(key_length_cb:TEina_Key_Length; key_cmp_cb:TEina_Key_Cmp; key_hash_cb:TEina_Key_Hash; data_free_cb:TEina_Free_Cb; buckets_power_size:longint):PEina_Hash;cdecl;external libeina;
procedure eina_hash_free_cb_set(hash:PEina_Hash; data_free_cb:TEina_Free_Cb);cdecl;external libeina;
function eina_hash_string_djb2_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_string_superfast_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_string_small_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_int32_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_int64_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_pointer_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_stringshared_new(data_free_cb:TEina_Free_Cb):PEina_Hash;cdecl;external libeina;
function eina_hash_add(hash:PEina_Hash; key:pointer; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_direct_add(hash:PEina_Hash; key:pointer; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_del(hash:PEina_Hash; key:pointer; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_find(hash:PEina_Hash; key:pointer):pointer;cdecl;external libeina;
function eina_hash_modify(hash:PEina_Hash; key:pointer; data:pointer):pointer;cdecl;external libeina;
function eina_hash_set(hash:PEina_Hash; key:pointer; data:pointer):pointer;cdecl;external libeina;
function eina_hash_move(hash:PEina_Hash; old_key:pointer; new_key:pointer):TEina_Bool;cdecl;external libeina;
procedure eina_hash_free(hash:PEina_Hash);cdecl;external libeina;
procedure eina_hash_free_buckets(hash:PEina_Hash);cdecl;external libeina;
function eina_hash_population(hash:PEina_Hash):longint;cdecl;external libeina;
function eina_hash_add_by_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_direct_add_by_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_del_by_key_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint):TEina_Bool;cdecl;external libeina;
function eina_hash_del_by_key(hash:PEina_Hash; key:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_del_by_data(hash:PEina_Hash; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_del_by_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint; data:pointer):TEina_Bool;cdecl;external libeina;
function eina_hash_find_by_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint):pointer;cdecl;external libeina;
function eina_hash_modify_by_hash(hash:PEina_Hash; key:pointer; key_length:longint; key_hash:longint; data:pointer):pointer;cdecl;external libeina;
function eina_hash_iterator_key_new(hash:PEina_Hash):PEina_Iterator;cdecl;external libeina;
function eina_hash_iterator_data_new(hash:PEina_Hash):PEina_Iterator;cdecl;external libeina;
function eina_hash_iterator_tuple_new(hash:PEina_Hash):PEina_Iterator;cdecl;external libeina;
procedure eina_hash_foreach(hash:PEina_Hash; func:TEina_Hash_Foreach; fdata:pointer);cdecl;external libeina;
procedure eina_hash_list_append(hash:PEina_Hash; key:pointer; data:pointer);cdecl;external libeina;
procedure eina_hash_list_direct_append(hash:PEina_Hash; key:pointer; data:pointer);cdecl;external libeina;
procedure eina_hash_list_prepend(hash:PEina_Hash; key:pointer; data:pointer);cdecl;external libeina;
procedure eina_hash_list_direct_prepend(hash:PEina_Hash; key:pointer; data:pointer);cdecl;external libeina;
procedure eina_hash_list_remove(hash:PEina_Hash; key:pointer; data:pointer);cdecl;external libeina;
function eina_hash_superfast(key:Pchar; len:longint):longint;cdecl;external libeina;

// === Konventiert am: 14-5-25 19:33:21 ===


implementation


function EINA_KEY_LENGTH(_Function: Pointer): TEina_Key_Length;
begin
  EINA_KEY_LENGTH:=TEina_Key_Length(_Function);
end;

function EINA_KEY_CMP(_Function: Pointer): TEina_Key_Cmp;
begin
  EINA_KEY_CMP:=TEina_Key_Cmp(_Function);
end;

function EINA_KEY_HASH(_Function: Pointer): TEina_Key_Hash;
begin
  EINA_KEY_HASH:=TEina_Key_Hash(_Function);
end;


end.
