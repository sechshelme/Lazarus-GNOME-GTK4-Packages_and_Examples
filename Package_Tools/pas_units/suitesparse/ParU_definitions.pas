unit ParU_definitions;

interface

uses
  fp_suitesparse;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ============================================================================/ }
{ ======================= ParU_definitions.h =================================/ }
{ ============================================================================/ }
{ ParU, Mohsen Aznaveh and Timothy A. Davis, (c) 2023, All Rights Reserved. }
{ SPDX-License-Identifier: GNU GPL 3.0 }
{ some defintions that are used both in C and C++ }
{$ifndef PARU_DEFINITIONS_H}
{$define PARU_DEFINITIONS_H}
{$include "SuiteSparse_config.h"}
{$include "cholmod.h"}
{$include "umfpack.h"}
type
  PParU_Ret = ^TParU_Ret;
  TParU_Ret =  Longint;
  Const
    PARU_SUCCESS = 0;
    PARU_OUT_OF_MEMORY = -(1);
    PARU_INVALID = -(2);
    PARU_SINGULAR = -(3);
    PARU_TOO_LARGE = -(4);
;
  PARU_MEM_CHUNK = 1024*1024;  
  PARU_DATE = 'Jan 20, 2024';  
  PARU_VERSION_MAJOR = 0;  
  PARU_VERSION_MINOR = 1;  
  PARU_VERSION_UPDATE = 2;  
{  the same values as UMFPACK_STRATEGY defined in UMFPACK/Include/umfpack.h }
  PARU_STRATEGY_AUTO = 0;  { decided to use sym. or unsym. strategy }
  PARU_STRATEGY_UNSYMMETRIC = 1;  { COLAMD(A), metis, ... }
  PARU_STRATEGY_SYMMETRIC = 3;  { prefer diagonal }
{$endif}
{PARU_DEFINITIONS_H }

// === Konventiert am: 4-11-25 19:29:19 ===


implementation



end.
