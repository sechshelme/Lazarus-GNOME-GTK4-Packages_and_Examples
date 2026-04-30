
unit matrix_coop;
interface

{
  Automatically converted by H2Pas 1.0.0 from matrix_coop.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    matrix_coop.h
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
PdReal  = ^dReal;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001-2003 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 ************************************************************************ }
{$ifndef _ODE_MATRIX_COOP_H_}
{$define _ODE_MATRIX_COOP_H_}
{$include <ode/common.h>}
{$include <ode/cooperative.h>}
{$include <ode/threading.h>}
{ C++ extern C conditionnal removed }
{*
 * @defgroup matrix_coop Matrix Cooperative Algorithms
 *
 * Cooperative algorithms operating on matrices and vectors.
 *
 * @ingroup coop
  }
{*
 * @brief Estimates resource requirements for a @c dCooperativelyFactorLDLT call
 *
 * The function updates the contents of @a requirements to also suffice for calling
 * @c dCooperativelyFactorLDLT with the given parameters. 
 * 
 * Note: The requirements that could have already been in the @a requirements parameter
 * are never decreased.
 * 
 * @param requirements The ResourceRequirements object to update
 * @param maximalAllowedThreadCount Maximal value of allowedThreadCount parameter that is going to be used
 * @param maximalRowCount Maximal value of rowCount parameter that is going to be used
 * @ingroup matrix_coop
 * @see dCooperativelyFactorLDLT
 * @see dResourceRequirementsCreate
  }

procedure dEstimateCooperativelyFactorLDLTResourceRequirements(requirements:TdResourceRequirementsID; maximalAllowedThreadCount:dword; maximalRowCount:dword);cdecl;external;
{*
 * @brief Cooperatively factorizes a matrix `A' into L*D*L'
 *
 * The function factorizes a matrix `A' into L*D*L', where `L' is lower triangular with ones on
 * the diagonal, and `D' is diagonal.
 * @a A is a rowCount*rowCount matrix stored by rows, with a leading dimension of @a rowCount rounded
 * up at least to 4 elements. `L; is written into the strict lower triangle of @a A 
 * (the ones are not written) and the reciprocal of the diagonal elements of `D' are written into @a d.
 *
 * The @a resources must have had been allocated from a ResourceRequirements object 
 * estimated in @c dEstimateCooperativelyFactorLDLTResourceRequirements.
 * 
 * The operation is performed cooperatively by up to @a allowedThreadCount threads
 * from thread pool available in @a resources. The threading must must not be simultaneously
 * used (via other @c dResourceContainerID instances) in other calls that employ its features.
 *
 * @param resources The resources allocated for the function
 * @param allowedThreadCount Maximum thread count to use (the actual thread count could be less, depending on other parameters)
 * @param A The `A' matrix
 * @param d The `d' vector
 * @param rowCount The row count in @a A and @a d
 * @param rowskip The actual number of elements to be added to skip to next row in @a A
 * @ingroup matrix_coop
 * @see dEstimateCooperativelyFactorLDLTResourceRequirements
 * @see dResourceContainerAcquire
 * @see dCooperativelySolveLDLT
  }
procedure dCooperativelyFactorLDLT(resources:TdResourceContainerID; allowedThreadCount:dword; A:PdReal; d:PdReal; rowCount:dword; 
            rowSkip:dword);cdecl;external;
{*
 * @brief Estimates resource requirements for a @c dCooperativelySolveLDLT call
 *
 * The function updates the contents of @a requirements to also suffice for calling
 * @c dCooperativelySolveLDLT with the given parameters. 
 * 
 * Note: The requirements that could have already been in the @a requirements parameter
 * are never decreased.
 * 
 * @param requirements The ResourceRequirements object to update
 * @param maximalAllowedThreadCount Maximal value of allowedThreadCount parameter that is going to be used
 * @param maximalRowCount Maximal value of rowCount parameter that is going to be used
 * @ingroup matrix_coop
 * @see dCooperativelySolveLDLT
 * @see dResourceRequirementsCreate
  }
procedure dEstimateCooperativelySolveLDLTResourceRequirements(requirements:TdResourceRequirementsID; maximalAllowedThreadCount:dword; maximalRowCount:dword);cdecl;external;
{*
 * @brief Cooperatively solves L*D*L'*x=b
 * 
 * Given `L', a rowCount*rowCount lower triangular matrix with ones on the diagonal,
 * and `d', a rowCount*1 vector of the reciprocal diagonal elements of a rowCount*rowCount matrix
 * D, the function solves L*D*L'*x=b where `x' and `b' are rowCount*1. 
 * The leading dimension of @a L is @a rowSkip. The resulting vector `x' overwrites @a b.
 *
 * The @a resources must have had been allocated from a ResourceRequirements object 
 * estimated in @c dEstimateCooperativelySolveLDLTResourceRequirements.
 * 
 * The operation is performed cooperatively by up to @a allowedThreadCount threads
 * from thread pool available in @a resources. The threading must must not be simultaneously
 * used (via other @c dResourceContainerID instances) in other calls that employ its features.
 *
 * @param resources The resources allocated for the function
 * @param allowedThreadCount Maximum thread count to use (the actual thread count could be less, depending on other parameters)
 * @param L The `L' matrix
 * @param d The `d' vector
 * @param b The `b' vector; also the result is stored here
 * @param rowCount The row count in @a L, @a d and @a b
 * @param rowskip The actual number of elements to be added to skip to next row in @a L
 * @ingroup matrix_coop
 * @see dEstimateCooperativelySolveLDLTResourceRequirements
 * @see dResourceContainerAcquire
 * @see dCooperativelyFactorLDLT
  }
(* Const before type ignored *)
(* Const before type ignored *)
procedure dCooperativelySolveLDLT(resources:TdResourceContainerID; allowedThreadCount:dword; L:PdReal; d:PdReal; b:PdReal; 
            rowCount:dword; rowSkip:dword);cdecl;external;
{*
 * @brief Estimates resource requirements for a @c dCooperativelySolveL1Straight call
 *
 * The function updates the contents of @a requirements to also suffice for calling
 * @c dCooperativelySolveL1Straight with the given parameters. 
 * 
 * Note: The requirements that could have already been in the @a requirements parameter
 * are never decreased.
 * 
 * @param requirements The ResourceRequirements object to update
 * @param maximalAllowedThreadCount Maximal value of allowedThreadCount parameter that is going to be used
 * @param maximalRowCount Maximal value of rowCount parameter that is going to be used
 * @ingroup matrix_coop
 * @see dCooperativelySolveL1Straight
 * @see dResourceRequirementsCreate
  }
procedure dEstimateCooperativelySolveL1StraightResourceRequirements(requirements:TdResourceRequirementsID; maximalAllowedThreadCount:dword; maximalRowCount:dword);cdecl;external;
{*
 * @brief Cooperatively solves L*x=b
 * 
 * The function solves L*x=b, where `L' is rowCount*rowCount lower triangular with ones on the diagonal,
 * and `x', `b' are rowCount*1. The leading dimension of @a L is @a rowSkip.
 * @a b is overwritten with `x'.
 *
 * The @a resources must have had been allocated from a ResourceRequirements object 
 * estimated in @c dEstimateCooperativelySolveL1StraightResourceRequirements.
 * 
 * The operation is performed cooperatively by up to @a allowedThreadCount threads
 * from thread pool available in @a resources. The threading must must not be simultaneously
 * used (via other @c dResourceContainerID instances) in other calls that employ its features.
 *
 * @param resources The resources allocated for the function
 * @param allowedThreadCount Maximum thread count to use (the actual thread count could be less, depending on other parameters)
 * @param L The `L' matrix
 * @param b The `b' vector; also the result is stored here
 * @param rowCount The row count in @a L and @a b
 * @param rowskip The actual number of elements to be added to skip to next row in @a L
 * @ingroup matrix_coop
 * @see dEstimateCooperativelySolveL1StraightResourceRequirements
 * @see dResourceContainerAcquire
 * @see dCooperativelyFactorLDLT
  }
(* Const before type ignored *)
procedure dCooperativelySolveL1Straight(resources:TdResourceContainerID; allowedThreadCount:dword; L:PdReal; b:PdReal; rowCount:dword; 
            rowSkip:dword);cdecl;external;
{*
 * @brief Estimates resource requirements for a @c dCooperativelySolveL1Transposed call
 *
 * The function updates the contents of @a requirements to also suffice for calling
 * @c dCooperativelySolveL1Transposed with the given parameters. 
 * 
 * Note: The requirements that could have already been in the @a requirements parameter
 * are never decreased.
 * 
 * @param requirements The ResourceRequirements object to update
 * @param maximalAllowedThreadCount Maximal value of allowedThreadCount parameter that is going to be used
 * @param maximalRowCount Maximal value of rowCount parameter that is going to be used
 * @ingroup matrix_coop
 * @see dCooperativelySolveL1Transposed
 * @see dResourceRequirementsCreate
  }
procedure dEstimateCooperativelySolveL1TransposedResourceRequirements(requirements:TdResourceRequirementsID; maximalAllowedThreadCount:dword; maximalRowCount:dword);cdecl;external;
{*
 * @brief Cooperatively solves L'*x=b
 *
 * The function solves L'*x=b, where `L' is rowCount*rowCount lower triangular with ones on the diagonal,
 * and `x', b are rowCount*1. The leading dimension of @a L is @a rowSkip.
 * @a b is overwritten with `x'.
 *
 * The @a resources must have had been allocated from a ResourceRequirements object 
 * estimated in @c dEstimateCooperativelySolveL1TransposedResourceRequirements.
 * 
 * The operation is performed cooperatively by up to @a allowedThreadCount threads
 * from thread pool available in @a resources. The threading must must not be simultaneously
 * used (via other @c dResourceContainerID instances) in other calls that employ its features.
 *
 * @param resources The resources allocated for the function
 * @param allowedThreadCount Maximum thread count to use (the actual thread count could be less, depending on other parameters)
 * @param L The `L' matrix
 * @param b The `b' vector; also the result is stored here
 * @param rowCount The row count in @a L and @a b
 * @param rowskip The actual number of elements to be added to skip to next row in @a L
 * @ingroup matrix_coop
 * @see dEstimateCooperativelySolveL1TransposedResourceRequirements
 * @see dResourceContainerAcquire
 * @see dCooperativelyFactorLDLT
  }
(* Const before type ignored *)
procedure dCooperativelySolveL1Transposed(resources:TdResourceContainerID; allowedThreadCount:dword; L:PdReal; b:PdReal; rowCount:dword; 
            rowSkip:dword);cdecl;external;
{*
 * @brief Estimates resource requirements for a @c dCooperativelyScaleVector call
 *
 * The function updates the contents of @a requirements to also suffice for calling
 * @c dCooperativelyScaleVector with the given parameters. 
 * 
 * Note: The requirements that could have already been in the @a requirements parameter
 * are never decreased.
 * 
 * @param requirements The ResourceRequirements object to update
 * @param maximalAllowedThreadCount Maximal value of allowedThreadCount parameter that is going to be used
 * @param maximalElementCount Maximal value of elementCount parameter that is going to be used
 * @ingroup matrix_coop
 * @see dCooperativelyScaleVector
 * @see dResourceRequirementsCreate
  }
procedure dEstimateCooperativelyScaleVectorResourceRequirements(requirements:TdResourceRequirementsID; maximalAllowedThreadCount:dword; maximalElementCount:dword);cdecl;external;
{*
 * @brief Multiplies elements of one vector by corresponding element of another one
 * 
 * In matlab syntax, the operation performed is: dataVector(1:elementCount) = dataVector(1:elementCount) .* scaleVector(1:elementCount) 
 *
 * The @a resources must have had been allocated from a ResourceRequirements object 
 * estimated in @c dEstimateCooperativelyScaleVectorResourceRequirements.
 * 
 * The operation is performed cooperatively by up to @a allowedThreadCount threads
 * from thread pool available in @a resources. The threading must must not be simultaneously
 * used (via other @c dResourceContainerID instances) in other calls that employ its features.
 *
 * @param resources The resources allocated for the function
 * @param allowedThreadCount Maximum thread count to use (the actual thread count could be less, depending on other parameters)
 * @param dataVector The vector to be scaled in place
 * @param scaleVector The scale vector
 * @param elementCount The number of elements in @a dataVector and @a scaleVector
 * @ingroup matrix_coop
 * @see dEstimateCooperativelyScaleVectorResourceRequirements
 * @see dResourceContainerAcquire
 * @see dCooperativelyFactorLDLT
  }
(* Const before type ignored *)
procedure dCooperativelyScaleVector(resources:TdResourceContainerID; allowedThreadCount:dword; dataVector:PdReal; scaleVector:PdReal; elementCount:dword);cdecl;external;
{$endif}
{ #ifndef _ODE_MATRIX_COOP_H_ }

implementation


end.
