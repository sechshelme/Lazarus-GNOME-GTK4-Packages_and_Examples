unit gsl_spmatrix;

interface

uses
  fp_gsl, gsl_bst;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GSL_SPMATRIX_COO = 0;
  GSL_SPMATRIX_CSC = 1;
  GSL_SPMATRIX_CSR = 2;
  GSL_SPMATRIX_TRIPLET = GSL_SPMATRIX_COO;
  GSL_SPMATRIX_CCS = GSL_SPMATRIX_CSC;
  GSL_SPMATRIX_CRS = GSL_SPMATRIX_CSR;

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


implementation



end.
