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

function GSL_SPMATRIX_ISCOO(m: longint): longint;
function GSL_SPMATRIX_ISCSC(m: longint): longint;
function GSL_SPMATRIX_ISCSR(m: longint): longint;
function GSL_SPMATRIX_ISTRIPLET(m: longint): longint;
function GSL_SPMATRIX_ISCCS(m: longint): longint;
function GSL_SPMATRIX_ISCRS(m: longint): longint;

const
  GSL_SPMATRIX_FLG_GROW = 1 shl 0;
  GSL_SPMATRIX_FLG_FIXED = 1 shl 1;

function GSL_SPMATRIX_COMPARE_ROWCOL(m: Pointer; ia, ja, ib, jb: longint): longint;

procedure gsl_spmatrix_cumsum(n: Tsize_t; c: Plongint); cdecl; external libgsl;

// === Konventiert am: 20-8-25 17:32:48 ===


implementation


function GSL_SPMATRIX_ISCOO(m: longint): longint;
begin
  //  GSL_SPMATRIX_ISCOO := (m^.sptype) = GSL_SPMATRIX_COO;
end;

function GSL_SPMATRIX_ISCSC(m: longint): longint;
begin
  //  GSL_SPMATRIX_ISCSC := (m^.sptype) = GSL_SPMATRIX_CSC;
end;

function GSL_SPMATRIX_ISCSR(m: longint): longint;
begin
  //  GSL_SPMATRIX_ISCSR := (m^.sptype) = GSL_SPMATRIX_CSR;
end;

function GSL_SPMATRIX_ISTRIPLET(m: longint): longint;
begin
  GSL_SPMATRIX_ISTRIPLET := GSL_SPMATRIX_ISCOO(m);
end;

function GSL_SPMATRIX_ISCCS(m: longint): longint;
begin
  GSL_SPMATRIX_ISCCS := GSL_SPMATRIX_ISCSC(m);
end;

function GSL_SPMATRIX_ISCRS(m: longint): longint;
begin
  GSL_SPMATRIX_ISCRS := GSL_SPMATRIX_ISCSR(m);
end;

function GSL_SPMATRIX_COMPARE_ROWCOL(m: Pointer; ia, ja, ib, jb: longint): longint;
begin
  if ia < ib then begin
    Result := -1;
  end else if ia > ib then begin
    Result := 1;
  end else if ja < jb then begin
    Result := -1;
  end else if ja > jb then begin
    Result := 1;
  end else begin
    Result := 0;
  end;
end;


end.
