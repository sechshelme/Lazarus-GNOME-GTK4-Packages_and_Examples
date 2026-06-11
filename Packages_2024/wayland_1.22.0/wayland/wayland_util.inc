

{$IFDEF read_struct}
type
  Twl_message = record
    name: pchar;
    signature: pchar;
    types: ^Pwl_interface;
  end;
  Pwl_message = ^Twl_message;

  Twl_interface = record
    name: pchar;
    version: longint;
    method_count: longint;
    methods: Pwl_message;
    event_count: longint;
    events: Pwl_message;
  end;
  Pwl_interface = ^Twl_interface;
  PPwl_interface = ^Pwl_interface;

  Pwl_list = ^Twl_list;

  Twl_list = record
    prev: Pwl_list;
    next: Pwl_list;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure wl_list_init(list: Pwl_list); cdecl; external libwayland_client;
procedure wl_list_insert(list: Pwl_list; elm: Pwl_list); cdecl; external libwayland_client;
procedure wl_list_remove(elm: Pwl_list); cdecl; external libwayland_client;
function wl_list_length(list: Pwl_list): longint; cdecl; external libwayland_client;
function wl_list_empty(list: Pwl_list): longint; cdecl; external libwayland_client;
procedure wl_list_insert_list(list: Pwl_list; other: Pwl_list); cdecl; external libwayland_client;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Twl_array = record
    size: Tsize_t;
    alloc: Tsize_t;
    data: pointer;
  end;
  Pwl_array = ^Twl_array;
  {$ENDIF read_struct}

{$IFDEF read_function}
procedure wl_array_init(arr: Pwl_array); cdecl; external libwayland_client;
procedure wl_array_release(arr: Pwl_array); cdecl; external libwayland_client;
function wl_array_add(arr: Pwl_array; size: Tsize_t): pointer; cdecl; external libwayland_client;
function wl_array_copy(arr: Pwl_array; source: Pwl_array): longint; cdecl; external libwayland_client;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  Pwl_fixed_t = ^Twl_fixed_t;
  Twl_fixed_t = Tint32_t;
  Twl_argument = record
    case longint of
      0: (i: Tint32_t);
      1: (u: Tuint32_t);
      2: (f: Twl_fixed_t);
      3: (s: pchar);
//      4: (o: Pwl_object);
      4: (o: Pointer);
      5: (n: Tuint32_t);
      6: (a: Pwl_array);
      7: (h: Tint32_t);
  end;
  Pwl_argument = ^Twl_argument;

  Twl_dispatcher_func_t = function(user_data: pointer; target: pointer; opcode: Tuint32_t; msg: Pwl_message; args: Pwl_argument): longint; cdecl;
  Twl_log_func_t = procedure(fmt: pchar; args: Tva_list); cdecl;
  {$ENDIF read_struct}

  {$IFDEF read_enum}
type
  Twl_iterator_result = longint;

const
  WL_ITERATOR_STOP = 0;
  WL_ITERATOR_CONTINUE = 1;
  {$ENDIF read_enum}

  // === Konventiert am: 9-6-26 16:48:12 ===

{$IFDEF read_function}
function wl_fixed_to_double(f: Twl_fixed_t): double; inline;
function wl_fixed_from_double(d: double): Twl_fixed_t; inline;
function wl_fixed_to_int(f: Twl_fixed_t): integer; inline;
function wl_fixed_from_int(i: integer): Twl_fixed_t; inline;
{$ENDIF read_function}


{$IFDEF read_implementation}
function wl_fixed_to_double(f: Twl_fixed_t): double; inline;
var
  u: record
    case byte of
      0: (d: double);
      1: (i: int64);
      end;
begin
  u.i := (int64(1023 + 44) shl 52) + (int64(1) shl 51) + f;
  Result := u.d - (int64(3) shl 43);
end;

function wl_fixed_from_double(d: double): Twl_fixed_t; inline;
var
  u: record
    case byte of
      0: (d: double);
      1: (i: int64);
      end;
begin
  u.d := d + double(int64(3) shl (51 - 8));
  Result := Twl_fixed_t(u.i);
end;

function wl_fixed_to_int(f: Twl_fixed_t): integer; inline;
begin
  Result := f div 256;
end;

function wl_fixed_from_int(i: integer): Twl_fixed_t; inline;
begin
  Result := i * 256;
end;

{$ENDIF read_implementation}
