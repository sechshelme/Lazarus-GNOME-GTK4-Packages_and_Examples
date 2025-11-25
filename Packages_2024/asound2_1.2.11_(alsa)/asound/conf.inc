{$IFDEF read_interface}


type
  Psnd_config_type_t = ^Tsnd_config_type_t;
  Tsnd_config_type_t = longint;

const
  SND_CONFIG_TYPE_INTEGER = 0;
  SND_CONFIG_TYPE_INTEGER64 = 1;
  SND_CONFIG_TYPE_REAL = 2;
  SND_CONFIG_TYPE_STRING = 3;
  SND_CONFIG_TYPE_POINTER = 4;
  SND_CONFIG_TYPE_COMPOUND = 1024;

type
  Psnd_config_t = type Pointer;
  PPsnd_config_t = ^Psnd_config_t;

  Psnd_config_iterator_t = type Pointer;

  Psnd_config_update_t = type Pointer;
  PPsnd_config_update_t = ^Psnd_config_update_t;

var
  snd_config: Psnd_config_t; cvar;external libasound;

function snd_config_topdir: pchar; cdecl; external libasound;
function snd_config_top(config: PPsnd_config_t): longint; cdecl; external libasound;
function snd_config_load(config: Psnd_config_t; in_: Psnd_input_t): longint; cdecl; external libasound;
function snd_config_load_string(config: PPsnd_config_t; s: pchar; size: Tsize_t): longint; cdecl; external libasound;
function snd_config_load_override(config: Psnd_config_t; in_: Psnd_input_t): longint; cdecl; external libasound;
function snd_config_save(config: Psnd_config_t; out_: Psnd_output_t): longint; cdecl; external libasound;
function snd_config_update: longint; cdecl; external libasound;
function snd_config_update_r(top: PPsnd_config_t; update: PPsnd_config_update_t; path: pchar): longint; cdecl; external libasound;
function snd_config_update_free(update: Psnd_config_update_t): longint; cdecl; external libasound;
function snd_config_update_free_global: longint; cdecl; external libasound;
function snd_config_update_ref(top: PPsnd_config_t): longint; cdecl; external libasound;
procedure snd_config_ref(top: Psnd_config_t); cdecl; external libasound;
procedure snd_config_unref(top: Psnd_config_t); cdecl; external libasound;
function snd_config_search(config: Psnd_config_t; key: pchar; result: PPsnd_config_t): longint; cdecl; external libasound;
function snd_config_searchv(config: Psnd_config_t; result: PPsnd_config_t): longint; cdecl; varargs; external libasound;
function snd_config_search_definition(config: Psnd_config_t; base: pchar; key: pchar; result: PPsnd_config_t): longint; cdecl; external libasound;

type
  Tsnd_config_expand_fcn_t = function(dst: PPsnd_config_t; s: pchar; private_data: pointer): longint; cdecl;

function snd_config_expand_custom(config: Psnd_config_t; root: Psnd_config_t; fcn: Tsnd_config_expand_fcn_t; private_data: pointer; result: PPsnd_config_t): longint; cdecl; external libasound;
function snd_config_expand(config: Psnd_config_t; root: Psnd_config_t; args: pchar; private_data: Psnd_config_t; result: PPsnd_config_t): longint; cdecl; external libasound;
function snd_config_evaluate(config: Psnd_config_t; root: Psnd_config_t; private_data: Psnd_config_t; result: PPsnd_config_t): longint; cdecl; external libasound;
function snd_config_evaluate_string(dst: PPsnd_config_t; s: pchar; fcn: Tsnd_config_expand_fcn_t; private_data: pointer): longint; cdecl; external libasound;
function snd_config_add(config: Psnd_config_t; child: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_add_before(before: Psnd_config_t; child: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_add_after(after: Psnd_config_t; child: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_remove(config: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_delete(config: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_delete_compound_members(config: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_copy(dst: PPsnd_config_t; src: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_substitute(dst: Psnd_config_t; src: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_merge(dst: Psnd_config_t; src: Psnd_config_t; override: longint): longint; cdecl; external libasound;
function snd_config_make(config: PPsnd_config_t; key: pchar; _type: Tsnd_config_type_t): longint; cdecl; external libasound;
function snd_config_make_integer(config: PPsnd_config_t; key: pchar): longint; cdecl; external libasound;
function snd_config_make_integer64(config: PPsnd_config_t; key: pchar): longint; cdecl; external libasound;
function snd_config_make_real(config: PPsnd_config_t; key: pchar): longint; cdecl; external libasound;
function snd_config_make_string(config: PPsnd_config_t; key: pchar): longint; cdecl; external libasound;
function snd_config_make_pointer(config: PPsnd_config_t; key: pchar): longint; cdecl; external libasound;
function snd_config_make_compound(config: PPsnd_config_t; key: pchar; join: longint): longint; cdecl; external libasound;
function snd_config_make_path(config: PPsnd_config_t; root: Psnd_config_t; key: pchar; join: longint; override: longint): longint; cdecl; external libasound;

function snd_config_imake_integer(config: PPsnd_config_t; key: pchar; value: Tlong): longint; cdecl; external libasound;
function snd_config_imake_integer64(config: PPsnd_config_t; key: pchar; value: int64): longint; cdecl; external libasound;
function snd_config_imake_real(config: PPsnd_config_t; key: pchar; value: double): longint; cdecl; external libasound;
function snd_config_imake_string(config: PPsnd_config_t; key: pchar; ascii: pchar): longint; cdecl; external libasound;
function snd_config_imake_safe_string(config: PPsnd_config_t; key: pchar; ascii: pchar): longint; cdecl; external libasound;
function snd_config_imake_pointer(config: PPsnd_config_t; key: pchar; ptr: pointer): longint; cdecl; external libasound;

function snd_config_get_type(config: Psnd_config_t): Tsnd_config_type_t; cdecl; external libasound;
function snd_config_is_array(config: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_is_empty(config: Psnd_config_t): longint; cdecl; external libasound;

function snd_config_set_id(config: Psnd_config_t; id: pchar): longint; cdecl; external libasound;
function snd_config_set_integer(config: Psnd_config_t; value: Tlong): longint; cdecl; external libasound;
function snd_config_set_integer64(config: Psnd_config_t; value: int64): longint; cdecl; external libasound;
function snd_config_set_real(config: Psnd_config_t; value: double): longint; cdecl; external libasound;
function snd_config_set_string(config: Psnd_config_t; value: pchar): longint; cdecl; external libasound;
function snd_config_set_ascii(config: Psnd_config_t; ascii: pchar): longint; cdecl; external libasound;
function snd_config_set_pointer(config: Psnd_config_t; ptr: pointer): longint; cdecl; external libasound;
function snd_config_get_id(config: Psnd_config_t; value: PPchar): longint; cdecl; external libasound;
function snd_config_get_integer(config: Psnd_config_t; value: Pulong): longint; cdecl; external libasound;
function snd_config_get_integer64(config: Psnd_config_t; value: Pint64): longint; cdecl; external libasound;
function snd_config_get_real(config: Psnd_config_t; value: Pdouble): longint; cdecl; external libasound;
function snd_config_get_ireal(config: Psnd_config_t; value: Pdouble): longint; cdecl; external libasound;
function snd_config_get_string(config: Psnd_config_t; value: PPchar): longint; cdecl; external libasound;
function snd_config_get_ascii(config: Psnd_config_t; value: PPchar): longint; cdecl; external libasound;
function snd_config_get_pointer(config: Psnd_config_t; value: Ppointer): longint; cdecl; external libasound;
function snd_config_test_id(config: Psnd_config_t; id: pchar): longint; cdecl; external libasound;
function snd_config_iterator_first(node: Psnd_config_t): Psnd_config_iterator_t; cdecl; external libasound;
function snd_config_iterator_next(iterator: Psnd_config_iterator_t): Psnd_config_iterator_t; cdecl; external libasound;
function snd_config_iterator_end(node: Psnd_config_t): Psnd_config_iterator_t; cdecl; external libasound;
function snd_config_iterator_entry(iterator: Psnd_config_iterator_t): Psnd_config_t; cdecl; external libasound;

// #define snd_config_for_each(pos, next, node) for (pos = snd_config_iterator_first(node), next = snd_config_iterator_next(pos); pos != snd_config_iterator_end(node); pos = next, next = snd_config_iterator_next(pos))

function snd_config_get_bool_ascii(ascii: pchar): longint; cdecl; external libasound;
function snd_config_get_bool(conf: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_get_card(conf: Psnd_config_t): longint; cdecl; external libasound;
function snd_config_get_ctl_iface_ascii(ascii: pchar): longint; cdecl; external libasound;
function snd_config_get_ctl_iface(conf: Psnd_config_t): longint; cdecl; external libasound;

type
  PPsnd_devname_t = ^Psnd_devname_t;
  Psnd_devname_t = ^Tsnd_devname_t;
  Tsnd_devname_t = record
    name: pchar;
    comment: pchar;
    next: Psnd_devname_t;
  end;

function snd_names_list(iface: pchar; list: PPsnd_devname_t): longint; cdecl; external libasound;
procedure snd_names_list_free(list: Psnd_devname_t); cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:42 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
