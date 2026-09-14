{$IFDEF read_interface}


type
  Pzmaxheap_t = type Pointer;
  Pzmaxheap_iterator_t = ^Tzmaxheap_iterator_t;
  Tzmaxheap_iterator_t = record
    heap: Pzmaxheap_t;
    in_: longint;
    out_: longint;
  end;


function zmaxheap_create(el_sz: Tsize_t): Pzmaxheap_t; cdecl; external libapriltag;
procedure zmaxheap_vmap(heap: Pzmaxheap_t; f: Pointer); cdecl; external libapriltag;
procedure zmaxheap_destroy(heap: Pzmaxheap_t); cdecl; external libapriltag;
procedure zmaxheap_add(heap: Pzmaxheap_t; p: pointer; v: single); cdecl; external libapriltag;
function zmaxheap_size(heap: Pzmaxheap_t): longint; cdecl; external libapriltag;
function zmaxheap_remove_max(heap: Pzmaxheap_t; p: pointer; v: Psingle): longint; cdecl; external libapriltag;
procedure zmaxheap_iterator_init(heap: Pzmaxheap_t; it: Pzmaxheap_iterator_t); cdecl; external libapriltag;
function zmaxheap_iterator_next(it: Pzmaxheap_iterator_t; p: pointer; v: Psingle): longint; cdecl; external libapriltag;
function zmaxheap_iterator_next_volatile(it: Pzmaxheap_iterator_t; p: pointer; v: Psingle): longint; cdecl; external libapriltag;
procedure zmaxheap_iterator_remove(it: Pzmaxheap_iterator_t); cdecl; external libapriltag;
procedure zmaxheap_iterator_finish(it: Pzmaxheap_iterator_t); cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:28:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
