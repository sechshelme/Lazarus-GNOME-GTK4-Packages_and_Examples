unit btf;

interface

uses
  fp_suitesparse, SuiteSparse_config;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function btf_maxtrans(nrow: Tint32_t; ncol: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; maxwork: double;
  work: Pdouble; Match: Pint32_t; Work2: Pint32_t): Tint32_t; cdecl; external libbtf;
function btf_l_maxtrans(para1: Tint64_t; para2: Tint64_t; para3: Pint64_t; para4: Pint64_t; para5: double;
  para6: Pdouble; para7: Pint64_t; para8: Pint64_t): Tint64_t; cdecl; external libbtf;

function btf_strongcomp(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; Q: Pint32_t; P: Pint32_t;
  R: Pint32_t; Work: Pint32_t): Tint32_t; cdecl; external libbtf;
function btf_l_strongcomp(para1: Tint64_t; para2: Pint64_t; para3: Pint64_t; para4: Pint64_t; para5: Pint64_t;
  para6: Pint64_t; para7: Pint64_t): Tint64_t; cdecl; external libbtf;

function btf_order(n: Tint32_t; Ap: Pint32_t; Ai: Pint32_t; maxwork: double; work: Pdouble;
  P: Pint32_t; Q: Pint32_t; R: Pint32_t; nmatch: Pint32_t; Work2: Pint32_t): Tint32_t; cdecl; external libbtf;
function btf_l_order(para1: Tint64_t; para2: Pint64_t; para3: Pint64_t; para4: double; para5: Pdouble;
  para6: Pint64_t; para7: Pint64_t; para8: Pint64_t; para9: Pint64_t; para10: Pint64_t): Tint64_t; cdecl; external libbtf;

procedure btf_version(version: Plongint); cdecl; external libbtf;

function BTF_FLIP(j: longint): longint;
function BTF_ISFLIPPED(j: longint): boolean;
function BTF_UNFLIP(j: longint): longint;

const
  BTF_DATE = 'Jan 10, 2024';
  BTF_MAIN_VERSION = 2;
  BTF_SUB_VERSION = 3;
  BTF_SUBSUB_VERSION = 1;

function BTF_VERSION_CODE(main, sub: longint): longint;
function BTF_VERSION: longint;


// === Konventiert am: 4-11-25 19:28:15 ===


implementation


function BTF_FLIP(j: longint): longint;
begin
  BTF_FLIP := -j - 2;
end;

function BTF_ISFLIPPED(j: longint): boolean;
begin
  BTF_ISFLIPPED := j < -1;
end;

function BTF_UNFLIP(j: longint): longint;
begin
  if BTF_ISFLIPPED(j) then begin
    Result := BTF_FLIP(j);
  end else begin
    Result := j;
  end;
end;

function BTF_VERSION_CODE(main, sub: longint): longint;
begin
  BTF_VERSION_CODE := SUITESPARSE_VER_CODE(main, sub);
end;

function BTF_VERSION: longint;
begin
  BTF_VERSION := BTF_VERSION_CODE(2, 3);
end;


end.
