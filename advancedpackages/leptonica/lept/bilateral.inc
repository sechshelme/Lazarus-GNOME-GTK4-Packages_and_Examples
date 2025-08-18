{$IFDEF read_interface}


type
  TL_Bilateral = record
    pixs: PPix;
    pixsc: PPix;
    reduction: Tl_int32;
    spatial_stdev: Tl_float32;
    range_stdev: Tl_float32;
    spatial: Pl_float32;
    range: Pl_float32;
    minval: Tl_int32;
    maxval: Tl_int32;
    ncomps: Tl_int32;
    nc: Pl_int32;
    kindex: Pl_int32;
    kfract: Pl_float32;
    pixac: PPixa;
    lineset: ^PPl_uint32;
  end;
  PL_BILATERAL = ^TL_Bilateral;


  // === Konventiert am: 17-8-25 13:39:47 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
