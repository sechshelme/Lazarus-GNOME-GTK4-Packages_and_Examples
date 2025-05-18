unit eina_cow;

interface

uses
  ctypes, efl, eina_types;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TEina_Cow_Data = pointer;
  PEina_Cow_Data = ^TEina_Cow_Data;
  PPEina_Cow_Data = ^PEina_Cow_Data;

  TEina_Cow = record
  end;
  PEina_Cow = ^TEina_Cow;

function eina_cow_add(name: pchar; struct_size: dword; step: dword; default_value: pointer; gc: TEina_Bool): PEina_Cow; cdecl; external libeina;
procedure eina_cow_del(cow: PEina_Cow); cdecl; external libeina;
function eina_cow_alloc(cow: PEina_Cow): PEina_Cow_Data; cdecl; external libeina;
procedure eina_cow_free(cow: PEina_Cow; data: PPEina_Cow_Data); cdecl; external libeina;
function eina_cow_write(cow: PEina_Cow; src: PPEina_Cow_Data): pointer; cdecl; external libeina;
procedure eina_cow_done(cow: PEina_Cow; dst: PPEina_Cow_Data; data: pointer; needed_gc: TEina_Bool); cdecl; external libeina;
procedure eina_cow_memcpy(cow: PEina_Cow; dst: PPEina_Cow_Data; src: PEina_Cow_Data); cdecl; external libeina;
function eina_cow_gc(cow: PEina_Cow): TEina_Bool; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:52:16 ===


implementation



end.
