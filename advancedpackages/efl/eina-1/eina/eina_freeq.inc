{$IFDEF read_interface}

type
  PEina_FreeQ_Type = ^TEina_FreeQ_Type;
  TEina_FreeQ_Type = longint;

const
  EINA_FREEQ_DEFAULT = 0;
  EINA_FREEQ_POSTPONED = 1;

type
  TPEina_FreeQ = record
  end;
  PEina_FreeQ = ^TPEina_FreeQ;

function eina_freeq_new(_type: TEina_FreeQ_Type): PEina_FreeQ; cdecl; external libeina;
procedure eina_freeq_free(fq: PEina_FreeQ); cdecl; external libeina;
function eina_freeq_type_get(fq: PEina_FreeQ): TEina_FreeQ_Type; cdecl; external libeina;
function eina_freeq_main_get: PEina_FreeQ; cdecl; external libeina;
procedure eina_freeq_count_max_set(fq: PEina_FreeQ; count: longint); cdecl; external libeina;
function eina_freeq_count_max_get(fq: PEina_FreeQ): longint; cdecl; external libeina;
procedure eina_freeq_mem_max_set(fq: PEina_FreeQ; mem: Tsize_t); cdecl; external libeina;
function eina_freeq_mem_max_get(fq: PEina_FreeQ): Tsize_t; cdecl; external libeina;
procedure eina_freeq_clear(fq: PEina_FreeQ); cdecl; external libeina;
procedure eina_freeq_reduce(fq: PEina_FreeQ; count: longint); cdecl; external libeina;
function eina_freeq_ptr_pending(fq: PEina_FreeQ): TEina_Bool; cdecl; external libeina;

type
  Tfree_func = procedure(ptr: pointer); cdecl;

procedure eina_freeq_ptr_add(fq: PEina_FreeQ; ptr: pointer; free_func: Tfree_func; size: Tsize_t); cdecl; external libeina;
procedure eina_freeq_ptr_main_add(ptr: Pointer; free_func: Tfree_func; size: cardinal);


// === Konventiert am: 17-5-25 13:01:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

procedure eina_freeq_ptr_main_add(ptr: Pointer; free_func: Tfree_func; size: cardinal);
begin
  eina_freeq_ptr_add(eina_freeq_main_get(), ptr, free_func, size);
end;




{$ENDIF read_implementation}
