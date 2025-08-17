{$IFDEF read_interface}


const
  L_INT_TYPE = 1;
  L_UINT_TYPE = 2;
  L_FLOAT_TYPE = 3;

type
  TRB_TYPE = record
    case longint of
      0: (itype: Tl_int64);
      1: (utype: Tl_uint64);
      2: (ftype: Tl_float64);
      3: (ptype: pointer);
  end;
  PRB_TYPE = ^TRB_TYPE;

  PL_Rbtree_Node = ^TL_Rbtree_Node;

  TL_Rbtree_Node = record
    key: TRb_Type;
    value: TRb_Type;
    left: PL_Rbtree_Node;
    right: PL_Rbtree_Node;
    parent: PL_Rbtree_Node;
    color: Tl_int32;
  end;

  TL_Rbtree = record
    root: PL_Rbtree_Node;
    keytype: Tl_int32;
  end;
  PL_Rbtree = ^TL_Rbtree;
  PPL_Rbtree = ^PL_Rbtree;

  TL_AMAP = TL_Rbtree;
  PL_AMAP = ^TL_AMAP;
  PPL_AMAP = ^PL_AMAP;

  TL_ASET = TL_Rbtree;
  PL_ASET = ^TL_ASET;
  PPL_ASET = ^PL_ASET;

  TL_AMAP_NODE = TL_Rbtree_Node;
  PL_AMAP_NODE = ^TL_AMAP_NODE;

  TL_ASET_NODE = TL_Rbtree_Node;
  PL_ASET_NODE = ^TL_ASET_NODE;

  // === Konventiert am: 17-8-25 13:40:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
