{$IFDEF read_interface}


type
  PL_HASHITEM = ^TL_Hashitem;

  TL_Hashitem = record
    key: Tl_uint64;
    val: Tl_uint64;
    count: Tl_int32;
    next: PL_Hashitem;
  end;

  TL_Hashmap = record
    nitems: Tl_int32;
    ntogo: Tl_int32;
    maxocc: Tl_int32;
    hashtab: ^PL_Hashitem;
    tabsize: Tl_int32;
  end;
  PL_HASHMAP = ^TL_Hashmap;
  PPL_HASHMAP = ^PL_HASHMAP;

const
  L_UNDEFINED = 0;
  L_HMAP_CHECK = 1;
  L_HMAP_CREATE = 2;


  // === Konventiert am: 17-8-25 13:40:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
