
unit SuiteSparseQR_definitions;
interface

{
  Automatically converted by H2Pas 1.0.0 from SuiteSparseQR_definitions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    SuiteSparseQR_definitions.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ ==========================================================================  }
{ === SuiteSparseQR_definitions.h ==========================================  }
{ ==========================================================================  }
{ SPQR, Copyright (c) 2008-2023, Timothy A Davis. All Rights Reserved. }
{ SPDX-License-Identifier: GPL-2.0+ }
{ Core definitions for both C and C++ programs.  }
{$ifndef SUITESPARSEQR_DEFINITIONS_H}
{$define SUITESPARSEQR_DEFINITIONS_H}
{$include "SuiteSparse_config.h"}
{ ordering options  }

const
  SPQR_ORDERING_FIXED = 0;  
  SPQR_ORDERING_NATURAL = 1;  
  SPQR_ORDERING_COLAMD = 2;  
{ only used for C/C++ interface  }
  SPQR_ORDERING_GIVEN = 3;  
{ CHOLMOD best-effort (COLAMD, METIS,...) }
  SPQR_ORDERING_CHOLMOD = 4;  
{ AMD(A'*A)  }
  SPQR_ORDERING_AMD = 5;  
{ metis(A'*A)  }
  SPQR_ORDERING_METIS = 6;  
{ SuiteSparseQR default ordering  }
  SPQR_ORDERING_DEFAULT = 7;  
{ try COLAMD, AMD, and METIS; pick best  }
  SPQR_ORDERING_BEST = 8;  
{ try COLAMD and AMD; pick best  }
  SPQR_ORDERING_BESTAMD = 9;  
{ Let [m n] = size of the matrix after pruning singletons.  The default
 * ordering strategy is to use COLAMD if m <= 2*n.  Otherwise, AMD(A'A) is
 * tried.  If there is a high fill-in with AMD then try METIS(A'A) and take
 * the best of AMD and METIS.  METIS is not tried if it isn't installed.  }
{ tol options  }
{ if tol <= -2, the default tol is used  }
  SPQR_DEFAULT_TOL = -(2);  
{ if -2 < tol < 0, then no tol is used  }
  SPQR_NO_TOL = -(1);  
{ for qmult, method can be 0,1,2,3:  }
  SPQR_QTX = 0;  
  SPQR_QX = 1;  
  SPQR_XQT = 2;  
  SPQR_XQ = 3;  
{ system can be 0,1,2,3:  Given Q*R=A*E from SuiteSparseQR_factorize:  }
{ solve R*X=B      or X = R\B           }
  SPQR_RX_EQUALS_B = 0;  
{ solve R*E'*X=B   or X = E*(R\B)       }
  SPQR_RETX_EQUALS_B = 1;  
{ solve R'*X=B     or X = R'\B          }
  SPQR_RTX_EQUALS_B = 2;  
{ solve R'*X=E'*B  or X = R'\(E'*B)     }
  SPQR_RTX_EQUALS_ETB = 3;  
{ ==========================================================================  }
{ === SuiteSparseQR version ================================================  }
{ ==========================================================================  }
{
   All versions of SuiteSparseQR will include the following definitions.
   As an example, to test if the version you are using is 1.3 or later:
  
        if (SPQR_VERSION >= SPQR_VER_CODE (1,3)) ...
  
   This also works during compile-time:
  
        #if SPQR_VERSION >= SPQR_VER_CODE (1,3)
            printf ("This is version 1.3 or later\n") ;
        #else
            printf ("This is version is earlier than 1.3\n") ;
        #endif
  }
  SPQR_DATE = 'Jan 20, 2024';  
  SPQR_MAIN_VERSION = 4;  
  SPQR_SUB_VERSION = 3;  
  SPQR_SUBSUB_VERSION = 2;  
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function SPQR_VER_CODE(main,sub : longint) : longint;

{ was #define dname def_expr }
function SPQR_VERSION : longint; { return type might be wrong }

{$endif}

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function SPQR_VER_CODE(main,sub : longint) : longint;
begin
  SPQR_VER_CODE:=SUITESPARSE_VER_CODE(main,sub);
end;

{ was #define dname def_expr }
function SPQR_VERSION : longint; { return type might be wrong }
  begin
    SPQR_VERSION:=SPQR_VER_CODE(4,3);
  end;


end.
