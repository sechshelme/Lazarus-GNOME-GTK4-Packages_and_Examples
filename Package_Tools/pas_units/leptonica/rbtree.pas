unit rbtree;

interface

uses
  fp_lept, environ;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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

  TL_AMAP = TL_Rbtree;

  TL_ASET = TL_Rbtree;
  PL_ASET=^TL_ASET;

  TL_AMAP_NODE = TL_Rbtree_Node;
  TL_ASET_NODE = TL_Rbtree_Node;

  // === Konventiert am: 17-8-25 13:40:29 ===


implementation



end.
