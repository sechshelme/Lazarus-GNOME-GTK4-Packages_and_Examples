{$IFDEF read_interface}


const
  GSL_SPMATRIX_COO = 0;
  GSL_SPMATRIX_CSC_ = 1;
  GSL_SPMATRIX_CSR_ = 2;
  GSL_SPMATRIX_TRIPLET = GSL_SPMATRIX_COO;
  GSL_SPMATRIX_CCS_ = GSL_SPMATRIX_CSC_;
  GSL_SPMATRIX_CRS_ = GSL_SPMATRIX_CSR_;

type
  Pgsl_spmatrix_pool_node = ^Tgsl_spmatrix_pool_node;

  Tgsl_spmatrix_pool_node = record
    next: Pgsl_spmatrix_pool_node;
    block_ptr: pointer;
    free_slot: pbyte;
  end;

  Tgsl_spmatrix_pool = Tgsl_spmatrix_pool_node;
  Pgsl_spmatrix_pool = ^Tgsl_spmatrix_pool;

const
  GSL_SPMATRIX_FLG_GROW = 1 shl 0;
  GSL_SPMATRIX_FLG_FIXED = 1 shl 1;

procedure gsl_spmatrix_cumsum(n: Tsize_t; c: Plongint); cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:32:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
