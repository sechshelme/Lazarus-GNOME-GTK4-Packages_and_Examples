
unit ldl;
interface

{
  Automatically converted by H2Pas 1.0.0 from ldl.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    ldl.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pdouble  = ^double;
Pint32_t  = ^int32_t;
Pint64_t  = ^int64_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{------------------------------------------------------------------------------ }
{ LDL/Include/ldl.h: include file for the LDL package }
{------------------------------------------------------------------------------ }
{ LDL, Copyright (c) 2005-2024 by Timothy A. Davis. All Rights Reserved. }
{ SPDX-License-Identifier: LGPL-2.1+ }
{------------------------------------------------------------------------------ }
{$ifndef LDL_H}
{$define LDL_H}
{$include "SuiteSparse_config.h"}
{$ifdef LDL_LONG}

const
  LDL_int = int64_t;  
{ make it easy for C++ programs to include LDL  }
{ C++ extern C conditionnal removed }

procedure ldl_version(version:array[0..2] of longint);cdecl;external;
{ ==========================================================================  }
{ === int32_t version ======================================================  }
{ ==========================================================================  }
procedure ldl_symbolic(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Lp:Pint32_t; Parent:Pint32_t; 
            Lnz:Pint32_t; Flag:Pint32_t; P:Pint32_t; Pinv:Pint32_t);cdecl;external;
function ldl_numeric(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t; Ax:Pdouble; Lp:Pint32_t; 
           Parent:Pint32_t; Lnz:Pint32_t; Li:Pint32_t; Lx:Pdouble; D:Pdouble; 
           Y:Pdouble; Pattern:Pint32_t; Flag:Pint32_t; P:Pint32_t; Pinv:Pint32_t):Tint32_t;cdecl;external;
procedure ldl_lsolve(n:Tint32_t; X:Pdouble; Lp:Pint32_t; Li:Pint32_t; Lx:Pdouble);cdecl;external;
procedure ldl_dsolve(n:Tint32_t; X:Pdouble; D:Pdouble);cdecl;external;
procedure ldl_ltsolve(n:Tint32_t; X:Pdouble; Lp:Pint32_t; Li:Pint32_t; Lx:Pdouble);cdecl;external;
procedure ldl_perm(n:Tint32_t; X:Pdouble; B:Pdouble; P:Pint32_t);cdecl;external;
procedure ldl_permt(n:Tint32_t; X:Pdouble; B:Pdouble; P:Pint32_t);cdecl;external;
function ldl_valid_perm(n:Tint32_t; P:Pint32_t; Flag:Pint32_t):Tint32_t;cdecl;external;
function ldl_valid_matrix(n:Tint32_t; Ap:Pint32_t; Ai:Pint32_t):Tint32_t;cdecl;external;
{ ==========================================================================  }
{ === int64_t version ======================================================  }
{ ==========================================================================  }
procedure ldl_l_symbolic(n:Tint64_t; Ap:Pint64_t; Ai:Pint64_t; Lp:Pint64_t; Parent:Pint64_t; 
            Lnz:Pint64_t; Flag:Pint64_t; P:Pint64_t; Pinv:Pint64_t);cdecl;external;
function ldl_l_numeric(n:Tint64_t; Ap:Pint64_t; Ai:Pint64_t; Ax:Pdouble; Lp:Pint64_t; 
           Parent:Pint64_t; Lnz:Pint64_t; Li:Pint64_t; Lx:Pdouble; D:Pdouble; 
           Y:Pdouble; Pattern:Pint64_t; Flag:Pint64_t; P:Pint64_t; Pinv:Pint64_t):Tint64_t;cdecl;external;
procedure ldl_l_lsolve(n:Tint64_t; X:Pdouble; Lp:Pint64_t; Li:Pint64_t; Lx:Pdouble);cdecl;external;
procedure ldl_l_dsolve(n:Tint64_t; X:Pdouble; D:Pdouble);cdecl;external;
procedure ldl_l_ltsolve(n:Tint64_t; X:Pdouble; Lp:Pint64_t; Li:Pint64_t; Lx:Pdouble);cdecl;external;
procedure ldl_l_perm(n:Tint64_t; X:Pdouble; B:Pdouble; P:Pint64_t);cdecl;external;
procedure ldl_l_permt(n:Tint64_t; X:Pdouble; B:Pdouble; P:Pint64_t);cdecl;external;
function ldl_l_valid_perm(n:Tint64_t; P:Pint64_t; Flag:Pint64_t):Tint64_t;cdecl;external;
function ldl_l_valid_matrix(n:Tint64_t; Ap:Pint64_t; Ai:Pint64_t):Tint64_t;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ ==========================================================================  }
{ === LDL version ==========================================================  }
{ ==========================================================================  }
const
  LDL_DATE = 'Jan 10, 2024';  
  LDL_MAIN_VERSION = 3;  
  LDL_SUB_VERSION = 3;  
  LDL_SUBSUB_VERSION = 1;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function LDL_VERSION_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function LDL_VERSION : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function LDL_VERSION_CODE(main,sub : longint) : longint;
begin
  LDL_VERSION_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function LDL_VERSION : longint; { return type might be wrong }
  begin
    LDL_VERSION:=LDL_VERSION_CODE(3,3);
  end;


end.
