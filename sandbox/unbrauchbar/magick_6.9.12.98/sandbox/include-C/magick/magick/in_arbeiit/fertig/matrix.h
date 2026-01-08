/*
  Copyright 1999 ImageMagick Studio LLC, a non-profit organization
  dedicated to making software imaging solutions freely available.
  
  You may not use this file except in compliance with the License.  You may
  obtain a copy of the License at
  
    https://imagemagick.org/script/license.php
  
  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.

  MagickCore matrix methods.
*/
#ifndef MAGICKCORE_MATRIX_H
#define MAGICKCORE_MATRIX_H


typedef struct _MatrixInfo
  MatrixInfo;

extern  double
  **AcquireMagickMatrix(const size_t,const size_t);
extern  double
  **RelinquishMagickMatrix(double **,const size_t);

extern  Image
  *MatrixToImage(const MatrixInfo *,ExceptionInfo *);

extern  MagickBooleanType
  GaussJordanElimination(double **,double **,const size_t,const size_t);
extern  MagickBooleanType
  GetMatrixElement(const MatrixInfo *,const ssize_t,const ssize_t,void *);
extern  MagickBooleanType
  NullMatrix(MatrixInfo *);
extern  MagickBooleanType
  SetMatrixElement(const MatrixInfo *,const ssize_t,const ssize_t,const void *);

 MatrixInfo
  *AcquireMatrixInfo(const size_t,const size_t,const size_t,ExceptionInfo *);
 MatrixInfo
  *DestroyMatrixInfo(MatrixInfo *);

 size_t
  GetMatrixColumns(const MatrixInfo *);
 size_t
  GetMatrixRows(const MatrixInfo *);

extern  void
  LeastSquaresAddTerms(double **,double **,const double *,const double *,
    const size_t,const size_t);

