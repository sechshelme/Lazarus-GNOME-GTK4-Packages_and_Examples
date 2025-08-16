
unit allheaders;
interface

{
  Automatically converted by H2Pas 1.0.0 from allheaders.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    allheaders.h
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
PBOX  = ^BOX;
PBOXA  = ^BOXA;
PBOXAA  = ^BOXAA;
PCCBORD  = ^CCBORD;
PCCBORDA  = ^CCBORDA;
Pchar  = ^char;
PDLLIST  = ^DLLIST;
PDPIX  = ^DPIX;
PFILE  = ^FILE;
PFPIX  = ^FPIX;
PFPIXA  = ^FPIXA;
PGPLOT  = ^GPLOT;
PJBCLASSER  = ^JBCLASSER;
PJBDATA  = ^JBDATA;
PL_AMAP  = ^L_AMAP;
PL_AMAP_NODE  = ^L_AMAP_NODE;
PL_ASET  = ^L_ASET;
PL_ASET_NODE  = ^L_ASET_NODE;
PL_BBUFFER  = ^L_BBUFFER;
PL_BMF  = ^L_BMF;
PL_BYTEA  = ^L_BYTEA;
PL_COLORFILL  = ^L_COLORFILL;
PL_COMP_DATA  = ^L_COMP_DATA;
PL_DEWARP  = ^L_DEWARP;
PL_DEWARPA  = ^L_DEWARPA;
PL_DNA  = ^L_DNA;
PL_DNAA  = ^L_DNAA;
PL_DNAHASH  = ^L_DNAHASH;
Pl_float32  = ^l_float32;
Pl_float64  = ^l_float64;
PL_HASHITEM  = ^L_HASHITEM;
PL_HASHMAP  = ^L_HASHMAP;
PL_HEAP  = ^L_HEAP;
Pl_int32  = ^l_int32;
PL_KERNEL  = ^L_KERNEL;
PL_PDF_DATA  = ^L_PDF_DATA;
PL_PTRA  = ^L_PTRA;
PL_PTRAA  = ^L_PTRAA;
PL_QUEUE  = ^L_QUEUE;
PL_RBTREE  = ^L_RBTREE;
PL_RBTREE_NODE  = ^L_RBTREE_NODE;
PL_RCH  = ^L_RCH;
PL_RCHA  = ^L_RCHA;
PL_RDID  = ^L_RDID;
PL_RECOG  = ^L_RECOG;
PL_REGPARAMS  = ^L_REGPARAMS;
PL_STACK  = ^L_STACK;
PL_STRCODE  = ^L_STRCODE;
PL_SUDOKU  = ^L_SUDOKU;
Pl_uint32  = ^l_uint32;
Pl_uint64  = ^l_uint64;
Pl_uint8  = ^l_uint8;
PL_WALLTIMER  = ^L_WALLTIMER;
PL_WSHED  = ^L_WSHED;
PNUMA  = ^NUMA;
PNUMAA  = ^NUMAA;
PPIX  = ^PIX;
PPIXA  = ^PIXA;
PPIXAA  = ^PIXAA;
PPIXAC  = ^PIXAC;
PPIXACC  = ^PIXACC;
PPIXC  = ^PIXC;
PPIXCMAP  = ^PIXCMAP;
PPIXTILING  = ^PIXTILING;
PPTA  = ^PTA;
PPTAA  = ^PTAA;
PRB_TYPE  = ^RB_TYPE;
PSARRAY  = ^SARRAY;
PSEL  = ^SEL;
PSELA  = ^SELA;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{====================================================================*
 -  Copyright (C) 2001 Leptonica.  All rights reserved.
 -
 -  Redistribution and use in source and binary forms, with or without
 -  modification, are permitted provided that the following conditions
 -  are met:
 -  1. Redistributions of source code must retain the above copyright
 -     notice, this list of conditions and the following disclaimer.
 -  2. Redistributions in binary form must reproduce the above
 -     copyright notice, this list of conditions and the following
 -     disclaimer in the documentation and/or other materials
 -     provided with the distribution.
 -
 -  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 -  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 -  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 -  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL ANY
 -  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 -  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 -  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 -  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 -  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 -  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 -  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *==================================================================== }
{$ifndef  LEPTONICA_ALLHEADERS_H}
{$define LEPTONICA_ALLHEADERS_H}

const
  LIBLEPT_MAJOR_VERSION = 1;  
  LIBLEPT_MINOR_VERSION = 82;  
  LIBLEPT_PATCH_VERSION = 0;  
{$include "alltypes.h"}
{$ifndef NO_PROTOS}
{
 *  These prototypes were autogen'd by xtractprotos, v. 1.5
  }
{ C++ extern C conditionnal removed }
{ __cplusplus  }

function pixCleanBackgroundToWhite(pixs:PPIX; pixim:PPIX; pixg:PPIX; gamma:Tl_float32; blackval:Tl_int32; 
           whiteval:Tl_int32):PPIX;cdecl;external;
function pixBackgroundNormSimple(pixs:PPIX; pixim:PPIX; pixg:PPIX):PPIX;cdecl;external;
function pixBackgroundNorm(pixs:PPIX; pixim:PPIX; pixg:PPIX; sx:Tl_int32; sy:Tl_int32; 
           thresh:Tl_int32; mincount:Tl_int32; bgval:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32):PPIX;cdecl;external;
function pixBackgroundNormMorph(pixs:PPIX; pixim:PPIX; reduction:Tl_int32; size:Tl_int32; bgval:Tl_int32):PPIX;cdecl;external;
function pixBackgroundNormGrayArray(pixs:PPIX; pixim:PPIX; sx:Tl_int32; sy:Tl_int32; thresh:Tl_int32; 
           mincount:Tl_int32; bgval:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixBackgroundNormRGBArrays(pixs:PPIX; pixim:PPIX; pixg:PPIX; sx:Tl_int32; sy:Tl_int32; 
           thresh:Tl_int32; mincount:Tl_int32; bgval:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; 
           ppixr:PPPIX; ppixg:PPPIX; ppixb:PPPIX):Tl_ok;cdecl;external;
function pixBackgroundNormGrayArrayMorph(pixs:PPIX; pixim:PPIX; reduction:Tl_int32; size:Tl_int32; bgval:Tl_int32; 
           ppixd:PPPIX):Tl_ok;cdecl;external;
function pixBackgroundNormRGBArraysMorph(pixs:PPIX; pixim:PPIX; reduction:Tl_int32; size:Tl_int32; bgval:Tl_int32; 
           ppixr:PPPIX; ppixg:PPPIX; ppixb:PPPIX):Tl_ok;cdecl;external;
function pixGetBackgroundGrayMap(pixs:PPIX; pixim:PPIX; sx:Tl_int32; sy:Tl_int32; thresh:Tl_int32; 
           mincount:Tl_int32; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixGetBackgroundRGBMap(pixs:PPIX; pixim:PPIX; pixg:PPIX; sx:Tl_int32; sy:Tl_int32; 
           thresh:Tl_int32; mincount:Tl_int32; ppixmr:PPPIX; ppixmg:PPPIX; ppixmb:PPPIX):Tl_ok;cdecl;external;
function pixGetBackgroundGrayMapMorph(pixs:PPIX; pixim:PPIX; reduction:Tl_int32; size:Tl_int32; ppixm:PPPIX):Tl_ok;cdecl;external;
function pixGetBackgroundRGBMapMorph(pixs:PPIX; pixim:PPIX; reduction:Tl_int32; size:Tl_int32; ppixmr:PPPIX; 
           ppixmg:PPPIX; ppixmb:PPPIX):Tl_ok;cdecl;external;
function pixFillMapHoles(pix:PPIX; nx:Tl_int32; ny:Tl_int32; filltype:Tl_int32):Tl_ok;cdecl;external;
function pixExtendByReplication(pixs:PPIX; addw:Tl_int32; addh:Tl_int32):PPIX;cdecl;external;
function pixSmoothConnectedRegions(pixs:PPIX; pixm:PPIX; factor:Tl_int32):Tl_ok;cdecl;external;
function pixGetInvBackgroundMap(pixs:PPIX; bgval:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32):PPIX;cdecl;external;
function pixApplyInvBackgroundGrayMap(pixs:PPIX; pixm:PPIX; sx:Tl_int32; sy:Tl_int32):PPIX;cdecl;external;
function pixApplyInvBackgroundRGBMap(pixs:PPIX; pixmr:PPIX; pixmg:PPIX; pixmb:PPIX; sx:Tl_int32; 
           sy:Tl_int32):PPIX;cdecl;external;
function pixApplyVariableGrayMap(pixs:PPIX; pixg:PPIX; target:Tl_int32):PPIX;cdecl;external;
function pixGlobalNormRGB(pixd:PPIX; pixs:PPIX; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; 
           mapval:Tl_int32):PPIX;cdecl;external;
function pixGlobalNormNoSatRGB(pixd:PPIX; pixs:PPIX; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; 
           factor:Tl_int32; rank:Tl_float32):PPIX;cdecl;external;
function pixThresholdSpreadNorm(pixs:PPIX; filtertype:Tl_int32; edgethresh:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; 
           gamma:Tl_float32; minval:Tl_int32; maxval:Tl_int32; targetthresh:Tl_int32; ppixth:PPPIX; 
           ppixb:PPPIX; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixBackgroundNormFlex(pixs:PPIX; sx:Tl_int32; sy:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; 
           delta:Tl_int32):PPIX;cdecl;external;
function pixContrastNorm(pixd:PPIX; pixs:PPIX; sx:Tl_int32; sy:Tl_int32; mindiff:Tl_int32; 
           smoothx:Tl_int32; smoothy:Tl_int32):PPIX;cdecl;external;
function pixAffineSampledPta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixAffineSampled(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixAffinePta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixAffine(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixAffinePtaColor(pixs:PPIX; ptad:PPTA; ptas:PPTA; colorval:Tl_uint32):PPIX;cdecl;external;
function pixAffineColor(pixs:PPIX; vc:Pl_float32; colorval:Tl_uint32):PPIX;cdecl;external;
function pixAffinePtaGray(pixs:PPIX; ptad:PPTA; ptas:PPTA; grayval:Tl_uint8):PPIX;cdecl;external;
function pixAffineGray(pixs:PPIX; vc:Pl_float32; grayval:Tl_uint8):PPIX;cdecl;external;
function pixAffinePtaWithAlpha(pixs:PPIX; ptad:PPTA; ptas:PPTA; pixg:PPIX; fract:Tl_float32; 
           border:Tl_int32):PPIX;cdecl;external;
function getAffineXformCoeffs(ptas:PPTA; ptad:PPTA; pvc:PPl_float32):Tl_ok;cdecl;external;
function affineInvertXform(vc:Pl_float32; pvci:PPl_float32):Tl_ok;cdecl;external;
function affineXformSampledPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_int32; pyp:Pl_int32):Tl_ok;cdecl;external;
function affineXformPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_float32; pyp:Pl_float32):Tl_ok;cdecl;external;
function linearInterpolatePixelColor(datas:Pl_uint32; wpls:Tl_int32; w:Tl_int32; h:Tl_int32; x:Tl_float32; 
           y:Tl_float32; colorval:Tl_uint32; pval:Pl_uint32):Tl_ok;cdecl;external;
function linearInterpolatePixelGray(datas:Pl_uint32; wpls:Tl_int32; w:Tl_int32; h:Tl_int32; x:Tl_float32; 
           y:Tl_float32; grayval:Tl_int32; pval:Pl_int32):Tl_ok;cdecl;external;
function gaussjordan(a:PPl_float32; b:Pl_float32; n:Tl_int32):Tl_int32;cdecl;external;
function pixAffineSequential(pixs:PPIX; ptad:PPTA; ptas:PPTA; bw:Tl_int32; bh:Tl_int32):PPIX;cdecl;external;
function createMatrix2dTranslate(transx:Tl_float32; transy:Tl_float32):Pl_float32;cdecl;external;
function createMatrix2dScale(scalex:Tl_float32; scaley:Tl_float32):Pl_float32;cdecl;external;
function createMatrix2dRotate(xc:Tl_float32; yc:Tl_float32; angle:Tl_float32):Pl_float32;cdecl;external;
function ptaTranslate(ptas:PPTA; transx:Tl_float32; transy:Tl_float32):PPTA;cdecl;external;
function ptaScale(ptas:PPTA; scalex:Tl_float32; scaley:Tl_float32):PPTA;cdecl;external;
function ptaRotate(ptas:PPTA; xc:Tl_float32; yc:Tl_float32; angle:Tl_float32):PPTA;cdecl;external;
function boxaTranslate(boxas:PBOXA; transx:Tl_float32; transy:Tl_float32):PBOXA;cdecl;external;
function boxaScale(boxas:PBOXA; scalex:Tl_float32; scaley:Tl_float32):PBOXA;cdecl;external;
function boxaRotate(boxas:PBOXA; xc:Tl_float32; yc:Tl_float32; angle:Tl_float32):PBOXA;cdecl;external;
function ptaAffineTransform(ptas:PPTA; mat:Pl_float32):PPTA;cdecl;external;
function boxaAffineTransform(boxas:PBOXA; mat:Pl_float32):PBOXA;cdecl;external;
function l_productMatVec(mat:Pl_float32; vecs:Pl_float32; vecd:Pl_float32; size:Tl_int32):Tl_ok;cdecl;external;
function l_productMat2(mat1:Pl_float32; mat2:Pl_float32; matd:Pl_float32; size:Tl_int32):Tl_ok;cdecl;external;
function l_productMat3(mat1:Pl_float32; mat2:Pl_float32; mat3:Pl_float32; matd:Pl_float32; size:Tl_int32):Tl_ok;cdecl;external;
function l_productMat4(mat1:Pl_float32; mat2:Pl_float32; mat3:Pl_float32; mat4:Pl_float32; matd:Pl_float32; 
           size:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_getDataBit(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataBit(line:pointer; n:Tl_int32);cdecl;external;
procedure l_clearDataBit(line:pointer; n:Tl_int32);cdecl;external;
procedure l_setDataBitVal(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
(* Const before type ignored *)
function l_getDataDibit(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataDibit(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
procedure l_clearDataDibit(line:pointer; n:Tl_int32);cdecl;external;
(* Const before type ignored *)
function l_getDataQbit(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataQbit(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
procedure l_clearDataQbit(line:pointer; n:Tl_int32);cdecl;external;
(* Const before type ignored *)
function l_getDataByte(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataByte(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
(* Const before type ignored *)
function l_getDataTwoBytes(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataTwoBytes(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
(* Const before type ignored *)
function l_getDataFourBytes(line:pointer; n:Tl_int32):Tl_int32;cdecl;external;
procedure l_setDataFourBytes(line:pointer; n:Tl_int32; val:Tl_int32);cdecl;external;
function barcodeDispatchDecoder(barstr:Pchar; format:Tl_int32; debugflag:Tl_int32):Pchar;cdecl;external;
function barcodeFormatIsSupported(format:Tl_int32):Tl_int32;cdecl;external;
function pixFindBaselines(pixs:PPIX; ppta:PPPTA; pixadb:PPIXA):PNUMA;cdecl;external;
function pixDeskewLocal(pixs:PPIX; nslices:Tl_int32; redsweep:Tl_int32; redsearch:Tl_int32; sweeprange:Tl_float32; 
           sweepdelta:Tl_float32; minbsdelta:Tl_float32):PPIX;cdecl;external;
function pixGetLocalSkewTransform(pixs:PPIX; nslices:Tl_int32; redsweep:Tl_int32; redsearch:Tl_int32; sweeprange:Tl_float32; 
           sweepdelta:Tl_float32; minbsdelta:Tl_float32; pptas:PPPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function pixGetLocalSkewAngles(pixs:PPIX; nslices:Tl_int32; redsweep:Tl_int32; redsearch:Tl_int32; sweeprange:Tl_float32; 
           sweepdelta:Tl_float32; minbsdelta:Tl_float32; pa:Pl_float32; pb:Pl_float32; debug:Tl_int32):PNUMA;cdecl;external;
(* Const before type ignored *)
function bbufferCreate(indata:Pl_uint8; nalloc:Tl_int32):PL_BBUFFER;cdecl;external;
procedure bbufferDestroy(pbb:PPL_BBUFFER);cdecl;external;
function bbufferDestroyAndSaveData(pbb:PPL_BBUFFER; pnbytes:Psize_t):Pl_uint8;cdecl;external;
function bbufferRead(bb:PL_BBUFFER; src:Pl_uint8; nbytes:Tl_int32):Tl_ok;cdecl;external;
function bbufferReadStream(bb:PL_BBUFFER; fp:PFILE; nbytes:Tl_int32):Tl_ok;cdecl;external;
function bbufferExtendArray(bb:PL_BBUFFER; nbytes:Tl_int32):Tl_ok;cdecl;external;
function bbufferWrite(bb:PL_BBUFFER; dest:Pl_uint8; nbytes:Tsize_t; pnout:Psize_t):Tl_ok;cdecl;external;
function bbufferWriteStream(bb:PL_BBUFFER; fp:PFILE; nbytes:Tsize_t; pnout:Psize_t):Tl_ok;cdecl;external;
function pixBilateral(pixs:PPIX; spatial_stdev:Tl_float32; range_stdev:Tl_float32; ncomps:Tl_int32; reduction:Tl_int32):PPIX;cdecl;external;
function pixBilateralGray(pixs:PPIX; spatial_stdev:Tl_float32; range_stdev:Tl_float32; ncomps:Tl_int32; reduction:Tl_int32):PPIX;cdecl;external;
function pixBilateralExact(pixs:PPIX; spatial_kel:PL_KERNEL; range_kel:PL_KERNEL):PPIX;cdecl;external;
function pixBilateralGrayExact(pixs:PPIX; spatial_kel:PL_KERNEL; range_kel:PL_KERNEL):PPIX;cdecl;external;
function pixBlockBilateralExact(pixs:PPIX; spatial_stdev:Tl_float32; range_stdev:Tl_float32):PPIX;cdecl;external;
function makeRangeKernel(range_stdev:Tl_float32):PL_KERNEL;cdecl;external;
function pixBilinearSampledPta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixBilinearSampled(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixBilinearPta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixBilinear(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixBilinearPtaColor(pixs:PPIX; ptad:PPTA; ptas:PPTA; colorval:Tl_uint32):PPIX;cdecl;external;
function pixBilinearColor(pixs:PPIX; vc:Pl_float32; colorval:Tl_uint32):PPIX;cdecl;external;
function pixBilinearPtaGray(pixs:PPIX; ptad:PPTA; ptas:PPTA; grayval:Tl_uint8):PPIX;cdecl;external;
function pixBilinearGray(pixs:PPIX; vc:Pl_float32; grayval:Tl_uint8):PPIX;cdecl;external;
function pixBilinearPtaWithAlpha(pixs:PPIX; ptad:PPTA; ptas:PPTA; pixg:PPIX; fract:Tl_float32; 
           border:Tl_int32):PPIX;cdecl;external;
function getBilinearXformCoeffs(ptas:PPTA; ptad:PPTA; pvc:PPl_float32):Tl_ok;cdecl;external;
function bilinearXformSampledPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_int32; pyp:Pl_int32):Tl_ok;cdecl;external;
function bilinearXformPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_float32; pyp:Pl_float32):Tl_ok;cdecl;external;
function pixOtsuAdaptiveThreshold(pixs:PPIX; sx:Tl_int32; sy:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; 
           scorefract:Tl_float32; ppixth:PPPIX; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixOtsuThreshOnBackgroundNorm(pixs:PPIX; pixim:PPIX; sx:Tl_int32; sy:Tl_int32; thresh:Tl_int32; 
           mincount:Tl_int32; bgval:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; scorefract:Tl_float32; 
           pthresh:Pl_int32):PPIX;cdecl;external;
function pixMaskedThreshOnBackgroundNorm(pixs:PPIX; pixim:PPIX; sx:Tl_int32; sy:Tl_int32; thresh:Tl_int32; 
           mincount:Tl_int32; smoothx:Tl_int32; smoothy:Tl_int32; scorefract:Tl_float32; pthresh:Pl_int32):PPIX;cdecl;external;
function pixSauvolaBinarizeTiled(pixs:PPIX; whsize:Tl_int32; factor:Tl_float32; nx:Tl_int32; ny:Tl_int32; 
           ppixth:PPPIX; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixSauvolaBinarize(pixs:PPIX; whsize:Tl_int32; factor:Tl_float32; addborder:Tl_int32; ppixm:PPPIX; 
           ppixsd:PPPIX; ppixth:PPPIX; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixSauvolaOnContrastNorm(pixs:PPIX; mindiff:Tl_int32; ppixn:PPPIX; ppixth:PPPIX):PPIX;cdecl;external;
function pixThreshOnDoubleNorm(pixs:PPIX; mindiff:Tl_int32):PPIX;cdecl;external;
function pixThresholdByConnComp(pixs:PPIX; pixm:PPIX; start:Tl_int32; end:Tl_int32; incr:Tl_int32; 
           thresh48:Tl_float32; threshdiff:Tl_float32; pglobthresh:Pl_int32; ppixd:PPPIX; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixThresholdByHisto(pixs:PPIX; factor:Tl_int32; halfw:Tl_int32; delta:Tl_float32; pthresh:Pl_int32; 
           ppixd:PPPIX; ppixhisto:PPPIX):Tl_ok;cdecl;external;
function pixExpandBinaryReplicate(pixs:PPIX; xfact:Tl_int32; yfact:Tl_int32):PPIX;cdecl;external;
function pixExpandBinaryPower2(pixs:PPIX; factor:Tl_int32):PPIX;cdecl;external;
function pixReduceBinary2(pixs:PPIX; intab:Pl_uint8):PPIX;cdecl;external;
function pixReduceRankBinaryCascade(pixs:PPIX; level1:Tl_int32; level2:Tl_int32; level3:Tl_int32; level4:Tl_int32):PPIX;cdecl;external;
function pixReduceRankBinary2(pixs:PPIX; level:Tl_int32; intab:Pl_uint8):PPIX;cdecl;external;
function makeSubsampleTab2x:Pl_uint8;cdecl;external;
function pixBlend(pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; fract:Tl_float32):PPIX;cdecl;external;
function pixBlendMask(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32; _type:Tl_int32):PPIX;cdecl;external;
function pixBlendGray(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32; _type:Tl_int32; transparent:Tl_int32; transpix:Tl_uint32):PPIX;cdecl;external;
function pixBlendGrayInverse(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32):PPIX;cdecl;external;
function pixBlendColor(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32; transparent:Tl_int32; transpix:Tl_uint32):PPIX;cdecl;external;
function pixBlendColorByChannel(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           rfract:Tl_float32; gfract:Tl_float32; bfract:Tl_float32; transparent:Tl_int32; transpix:Tl_uint32):PPIX;cdecl;external;
function pixBlendGrayAdapt(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32; shift:Tl_int32):PPIX;cdecl;external;
function pixFadeWithGray(pixs:PPIX; pixb:PPIX; factor:Tl_float32; _type:Tl_int32):PPIX;cdecl;external;
function pixBlendHardLight(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; x:Tl_int32; y:Tl_int32; 
           fract:Tl_float32):PPIX;cdecl;external;
function pixBlendCmap(pixs:PPIX; pixb:PPIX; x:Tl_int32; y:Tl_int32; sindex:Tl_int32):Tl_ok;cdecl;external;
function pixBlendWithGrayMask(pixs1:PPIX; pixs2:PPIX; pixg:PPIX; x:Tl_int32; y:Tl_int32):PPIX;cdecl;external;
function pixBlendBackgroundToColor(pixd:PPIX; pixs:PPIX; box:PBOX; color:Tl_uint32; gamma:Tl_float32; 
           minval:Tl_int32; maxval:Tl_int32):PPIX;cdecl;external;
function pixMultiplyByColor(pixd:PPIX; pixs:PPIX; box:PBOX; color:Tl_uint32):PPIX;cdecl;external;
function pixAlphaBlendUniform(pixs:PPIX; color:Tl_uint32):PPIX;cdecl;external;
function pixAddAlphaToBlend(pixs:PPIX; fract:Tl_float32; invert:Tl_int32):PPIX;cdecl;external;
function pixSetAlphaOverWhite(pixs:PPIX):PPIX;cdecl;external;
function pixLinearEdgeFade(pixs:PPIX; dir:Tl_int32; fadeto:Tl_int32; distfract:Tl_float32; maxfade:Tl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function bmfCreate(dir:Pchar; fontsize:Tl_int32):PL_BMF;cdecl;external;
procedure bmfDestroy(pbmf:PPL_BMF);cdecl;external;
function bmfGetPix(bmf:PL_BMF; chr:char):PPIX;cdecl;external;
function bmfGetWidth(bmf:PL_BMF; chr:char; pw:Pl_int32):Tl_ok;cdecl;external;
function bmfGetBaseline(bmf:PL_BMF; chr:char; pbaseline:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaGetFont(dir:Pchar; fontsize:Tl_int32; pbl0:Pl_int32; pbl1:Pl_int32; pbl2:Pl_int32):PPIXA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixaSaveFont(indir:Pchar; outdir:Pchar; fontsize:Tl_int32):Tl_ok;cdecl;external;
function pixReadStreamBmp(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadMemBmp(cdata:Pl_uint8; size:Tsize_t):PPIX;cdecl;external;
function pixWriteStreamBmp(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteMemBmp(pfdata:PPl_uint8; pfsize:Psize_t; pixs:PPIX):Tl_ok;cdecl;external;
function l_bootnum_gen1:PPIXA;cdecl;external;
function l_bootnum_gen2:PPIXA;cdecl;external;
function l_bootnum_gen3:PPIXA;cdecl;external;
function l_bootnum_gen4(nsamp:Tl_int32):PPIXA;cdecl;external;
function boxCreate(x:Tl_int32; y:Tl_int32; w:Tl_int32; h:Tl_int32):PBOX;cdecl;external;
function boxCreateValid(x:Tl_int32; y:Tl_int32; w:Tl_int32; h:Tl_int32):PBOX;cdecl;external;
function boxCopy(box:PBOX):PBOX;cdecl;external;
function boxClone(box:PBOX):PBOX;cdecl;external;
procedure boxDestroy(pbox:PPBOX);cdecl;external;
function boxGetGeometry(box:PBOX; px:Pl_int32; py:Pl_int32; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function boxSetGeometry(box:PBOX; x:Tl_int32; y:Tl_int32; w:Tl_int32; h:Tl_int32):Tl_ok;cdecl;external;
function boxGetSideLocations(box:PBOX; pl:Pl_int32; pr:Pl_int32; pt:Pl_int32; pb:Pl_int32):Tl_ok;cdecl;external;
function boxSetSideLocations(box:PBOX; l:Tl_int32; r:Tl_int32; t:Tl_int32; b:Tl_int32):Tl_ok;cdecl;external;
function boxGetRefcount(box:PBOX):Tl_int32;cdecl;external;
function boxChangeRefcount(box:PBOX; delta:Tl_int32):Tl_ok;cdecl;external;
function boxIsValid(box:PBOX; pvalid:Pl_int32):Tl_ok;cdecl;external;
function boxaCreate(n:Tl_int32):PBOXA;cdecl;external;
function boxaCopy(boxa:PBOXA; copyflag:Tl_int32):PBOXA;cdecl;external;
procedure boxaDestroy(pboxa:PPBOXA);cdecl;external;
function boxaAddBox(boxa:PBOXA; box:PBOX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function boxaExtendArray(boxa:PBOXA):Tl_ok;cdecl;external;
function boxaExtendArrayToSize(boxa:PBOXA; size:Tsize_t):Tl_ok;cdecl;external;
function boxaGetCount(boxa:PBOXA):Tl_int32;cdecl;external;
function boxaGetValidCount(boxa:PBOXA):Tl_int32;cdecl;external;
function boxaGetBox(boxa:PBOXA; index:Tl_int32; accessflag:Tl_int32):PBOX;cdecl;external;
function boxaGetValidBox(boxa:PBOXA; index:Tl_int32; accessflag:Tl_int32):PBOX;cdecl;external;
function boxaFindInvalidBoxes(boxa:PBOXA):PNUMA;cdecl;external;
function boxaGetBoxGeometry(boxa:PBOXA; index:Tl_int32; px:Pl_int32; py:Pl_int32; pw:Pl_int32; 
           ph:Pl_int32):Tl_ok;cdecl;external;
function boxaIsFull(boxa:PBOXA; pfull:Pl_int32):Tl_ok;cdecl;external;
function boxaReplaceBox(boxa:PBOXA; index:Tl_int32; box:PBOX):Tl_ok;cdecl;external;
function boxaInsertBox(boxa:PBOXA; index:Tl_int32; box:PBOX):Tl_ok;cdecl;external;
function boxaRemoveBox(boxa:PBOXA; index:Tl_int32):Tl_ok;cdecl;external;
function boxaRemoveBoxAndSave(boxa:PBOXA; index:Tl_int32; pbox:PPBOX):Tl_ok;cdecl;external;
function boxaSaveValid(boxas:PBOXA; copyflag:Tl_int32):PBOXA;cdecl;external;
function boxaInitFull(boxa:PBOXA; box:PBOX):Tl_ok;cdecl;external;
function boxaClear(boxa:PBOXA):Tl_ok;cdecl;external;
function boxaaCreate(n:Tl_int32):PBOXAA;cdecl;external;
function boxaaCopy(baas:PBOXAA; copyflag:Tl_int32):PBOXAA;cdecl;external;
procedure boxaaDestroy(pbaa:PPBOXAA);cdecl;external;
function boxaaAddBoxa(baa:PBOXAA; ba:PBOXA; copyflag:Tl_int32):Tl_ok;cdecl;external;
function boxaaExtendArray(baa:PBOXAA):Tl_ok;cdecl;external;
function boxaaExtendArrayToSize(baa:PBOXAA; size:Tl_int32):Tl_ok;cdecl;external;
function boxaaGetCount(baa:PBOXAA):Tl_int32;cdecl;external;
function boxaaGetBoxCount(baa:PBOXAA):Tl_int32;cdecl;external;
function boxaaGetBoxa(baa:PBOXAA; index:Tl_int32; accessflag:Tl_int32):PBOXA;cdecl;external;
function boxaaGetBox(baa:PBOXAA; iboxa:Tl_int32; ibox:Tl_int32; accessflag:Tl_int32):PBOX;cdecl;external;
function boxaaInitFull(baa:PBOXAA; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaaExtendWithInit(baa:PBOXAA; maxindex:Tl_int32; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaaReplaceBoxa(baa:PBOXAA; index:Tl_int32; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaaInsertBoxa(baa:PBOXAA; index:Tl_int32; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaaRemoveBoxa(baa:PBOXAA; index:Tl_int32):Tl_ok;cdecl;external;
function boxaaAddBox(baa:PBOXAA; index:Tl_int32; box:PBOX; accessflag:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function boxaaReadFromFiles(dirname:Pchar; substr:Pchar; first:Tl_int32; nfiles:Tl_int32):PBOXAA;cdecl;external;
(* Const before type ignored *)
function boxaaRead(filename:Pchar):PBOXAA;cdecl;external;
function boxaaReadStream(fp:PFILE):PBOXAA;cdecl;external;
(* Const before type ignored *)
function boxaaReadMem(data:Pl_uint8; size:Tsize_t):PBOXAA;cdecl;external;
(* Const before type ignored *)
function boxaaWrite(filename:Pchar; baa:PBOXAA):Tl_ok;cdecl;external;
function boxaaWriteStream(fp:PFILE; baa:PBOXAA):Tl_ok;cdecl;external;
function boxaaWriteMem(pdata:PPl_uint8; psize:Psize_t; baa:PBOXAA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function boxaRead(filename:Pchar):PBOXA;cdecl;external;
function boxaReadStream(fp:PFILE):PBOXA;cdecl;external;
(* Const before type ignored *)
function boxaReadMem(data:Pl_uint8; size:Tsize_t):PBOXA;cdecl;external;
(* Const before type ignored *)
function boxaWriteDebug(filename:Pchar; boxa:PBOXA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function boxaWrite(filename:Pchar; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaWriteStream(fp:PFILE; boxa:PBOXA):Tl_ok;cdecl;external;
function boxaWriteStderr(boxa:PBOXA):Tl_ok;cdecl;external;
function boxaWriteMem(pdata:PPl_uint8; psize:Psize_t; boxa:PBOXA):Tl_ok;cdecl;external;
function boxPrintStreamInfo(fp:PFILE; box:PBOX):Tl_ok;cdecl;external;
function boxContains(box1:PBOX; box2:PBOX; presult:Pl_int32):Tl_ok;cdecl;external;
function boxIntersects(box1:PBOX; box2:PBOX; presult:Pl_int32):Tl_ok;cdecl;external;
function boxaContainedInBox(boxas:PBOXA; box:PBOX):PBOXA;cdecl;external;
function boxaContainedInBoxCount(boxa:PBOXA; box:PBOX; pcount:Pl_int32):Tl_ok;cdecl;external;
function boxaContainedInBoxa(boxa1:PBOXA; boxa2:PBOXA; pcontained:Pl_int32):Tl_ok;cdecl;external;
function boxaIntersectsBox(boxas:PBOXA; box:PBOX):PBOXA;cdecl;external;
function boxaIntersectsBoxCount(boxa:PBOXA; box:PBOX; pcount:Pl_int32):Tl_ok;cdecl;external;
function boxaClipToBox(boxas:PBOXA; box:PBOX):PBOXA;cdecl;external;
function boxaCombineOverlaps(boxas:PBOXA; pixadb:PPIXA):PBOXA;cdecl;external;
function boxaCombineOverlapsInPair(boxas1:PBOXA; boxas2:PBOXA; pboxad1:PPBOXA; pboxad2:PPBOXA; pixadb:PPIXA):Tl_ok;cdecl;external;
function boxOverlapRegion(box1:PBOX; box2:PBOX):PBOX;cdecl;external;
function boxBoundingRegion(box1:PBOX; box2:PBOX):PBOX;cdecl;external;
function boxOverlapFraction(box1:PBOX; box2:PBOX; pfract:Pl_float32):Tl_ok;cdecl;external;
function boxOverlapArea(box1:PBOX; box2:PBOX; parea:Pl_int32):Tl_ok;cdecl;external;
function boxaHandleOverlaps(boxas:PBOXA; op:Tl_int32; range:Tl_int32; min_overlap:Tl_float32; max_ratio:Tl_float32; 
           pnamap:PPNUMA):PBOXA;cdecl;external;
function boxOverlapDistance(box1:PBOX; box2:PBOX; ph_ovl:Pl_int32; pv_ovl:Pl_int32):Tl_ok;cdecl;external;
function boxSeparationDistance(box1:PBOX; box2:PBOX; ph_sep:Pl_int32; pv_sep:Pl_int32):Tl_ok;cdecl;external;
function boxCompareSize(box1:PBOX; box2:PBOX; _type:Tl_int32; prel:Pl_int32):Tl_ok;cdecl;external;
function boxContainsPt(box:PBOX; x:Tl_float32; y:Tl_float32; pcontains:Pl_int32):Tl_ok;cdecl;external;
function boxaGetNearestToPt(boxa:PBOXA; x:Tl_int32; y:Tl_int32):PBOX;cdecl;external;
function boxaGetNearestToLine(boxa:PBOXA; x:Tl_int32; y:Tl_int32):PBOX;cdecl;external;
function boxaFindNearestBoxes(boxa:PBOXA; dist_select:Tl_int32; range:Tl_int32; pnaaindex:PPNUMAA; pnaadist:PPNUMAA):Tl_ok;cdecl;external;
function boxaGetNearestByDirection(boxa:PBOXA; i:Tl_int32; dir:Tl_int32; dist_select:Tl_int32; range:Tl_int32; 
           pindex:Pl_int32; pdist:Pl_int32):Tl_ok;cdecl;external;
function boxGetCenter(box:PBOX; pcx:Pl_float32; pcy:Pl_float32):Tl_ok;cdecl;external;
function boxIntersectByLine(box:PBOX; x:Tl_int32; y:Tl_int32; slope:Tl_float32; px1:Pl_int32; 
           py1:Pl_int32; px2:Pl_int32; py2:Pl_int32; pn:Pl_int32):Tl_ok;cdecl;external;
function boxClipToRectangle(box:PBOX; wi:Tl_int32; hi:Tl_int32):PBOX;cdecl;external;
function boxClipToRectangleParams(box:PBOX; w:Tl_int32; h:Tl_int32; pxstart:Pl_int32; pystart:Pl_int32; 
           pxend:Pl_int32; pyend:Pl_int32; pbw:Pl_int32; pbh:Pl_int32):Tl_ok;cdecl;external;
function boxRelocateOneSide(boxd:PBOX; boxs:PBOX; loc:Tl_int32; sideflag:Tl_int32):PBOX;cdecl;external;
function boxaAdjustSides(boxas:PBOXA; delleft:Tl_int32; delright:Tl_int32; deltop:Tl_int32; delbot:Tl_int32):PBOXA;cdecl;external;
function boxaAdjustBoxSides(boxa:PBOXA; index:Tl_int32; delleft:Tl_int32; delright:Tl_int32; deltop:Tl_int32; 
           delbot:Tl_int32):Tl_ok;cdecl;external;
function boxAdjustSides(boxd:PBOX; boxs:PBOX; delleft:Tl_int32; delright:Tl_int32; deltop:Tl_int32; 
           delbot:Tl_int32):PBOX;cdecl;external;
function boxaSetSide(boxad:PBOXA; boxas:PBOXA; side:Tl_int32; val:Tl_int32; thresh:Tl_int32):PBOXA;cdecl;external;
function boxSetSide(boxs:PBOX; side:Tl_int32; val:Tl_int32; thresh:Tl_int32):Tl_ok;cdecl;external;
function boxaAdjustWidthToTarget(boxad:PBOXA; boxas:PBOXA; sides:Tl_int32; target:Tl_int32; thresh:Tl_int32):PBOXA;cdecl;external;
function boxaAdjustHeightToTarget(boxad:PBOXA; boxas:PBOXA; sides:Tl_int32; target:Tl_int32; thresh:Tl_int32):PBOXA;cdecl;external;
function boxEqual(box1:PBOX; box2:PBOX; psame:Pl_int32):Tl_ok;cdecl;external;
function boxaEqual(boxa1:PBOXA; boxa2:PBOXA; maxdist:Tl_int32; pnaindex:PPNUMA; psame:Pl_int32):Tl_ok;cdecl;external;
function boxSimilar(box1:PBOX; box2:PBOX; leftdiff:Tl_int32; rightdiff:Tl_int32; topdiff:Tl_int32; 
           botdiff:Tl_int32; psimilar:Pl_int32):Tl_ok;cdecl;external;
function boxaSimilar(boxa1:PBOXA; boxa2:PBOXA; leftdiff:Tl_int32; rightdiff:Tl_int32; topdiff:Tl_int32; 
           botdiff:Tl_int32; debug:Tl_int32; psimilar:Pl_int32; pnasim:PPNUMA):Tl_ok;cdecl;external;
function boxaJoin(boxad:PBOXA; boxas:PBOXA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function boxaaJoin(baad:PBOXAA; baas:PBOXAA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function boxaSplitEvenOdd(boxa:PBOXA; fillflag:Tl_int32; pboxae:PPBOXA; pboxao:PPBOXA):Tl_ok;cdecl;external;
function boxaMergeEvenOdd(boxae:PBOXA; boxao:PBOXA; fillflag:Tl_int32):PBOXA;cdecl;external;
function boxaTransform(boxas:PBOXA; shiftx:Tl_int32; shifty:Tl_int32; scalex:Tl_float32; scaley:Tl_float32):PBOXA;cdecl;external;
function boxTransform(box:PBOX; shiftx:Tl_int32; shifty:Tl_int32; scalex:Tl_float32; scaley:Tl_float32):PBOX;cdecl;external;
function boxaTransformOrdered(boxas:PBOXA; shiftx:Tl_int32; shifty:Tl_int32; scalex:Tl_float32; scaley:Tl_float32; 
           xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; order:Tl_int32):PBOXA;cdecl;external;
function boxTransformOrdered(boxs:PBOX; shiftx:Tl_int32; shifty:Tl_int32; scalex:Tl_float32; scaley:Tl_float32; 
           xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; order:Tl_int32):PBOX;cdecl;external;
function boxaRotateOrth(boxas:PBOXA; w:Tl_int32; h:Tl_int32; rotation:Tl_int32):PBOXA;cdecl;external;
function boxRotateOrth(box:PBOX; w:Tl_int32; h:Tl_int32; rotation:Tl_int32):PBOX;cdecl;external;
function boxaShiftWithPta(boxas:PBOXA; pta:PPTA; dir:Tl_int32):PBOXA;cdecl;external;
function boxaSort(boxas:PBOXA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA):PBOXA;cdecl;external;
function boxaBinSort(boxas:PBOXA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA):PBOXA;cdecl;external;
function boxaSortByIndex(boxas:PBOXA; naindex:PNUMA):PBOXA;cdecl;external;
function boxaSort2d(boxas:PBOXA; pnaad:PPNUMAA; delta1:Tl_int32; delta2:Tl_int32; minh1:Tl_int32):PBOXAA;cdecl;external;
function boxaSort2dByIndex(boxas:PBOXA; naa:PNUMAA):PBOXAA;cdecl;external;
function boxaExtractAsNuma(boxa:PBOXA; pnal:PPNUMA; pnat:PPNUMA; pnar:PPNUMA; pnab:PPNUMA; 
           pnaw:PPNUMA; pnah:PPNUMA; keepinvalid:Tl_int32):Tl_ok;cdecl;external;
function boxaExtractAsPta(boxa:PBOXA; pptal:PPPTA; pptat:PPPTA; pptar:PPPTA; pptab:PPPTA; 
           pptaw:PPPTA; pptah:PPPTA; keepinvalid:Tl_int32):Tl_ok;cdecl;external;
function boxaExtractCorners(boxa:PBOXA; loc:Tl_int32):PPTA;cdecl;external;
function boxaGetRankVals(boxa:PBOXA; fract:Tl_float32; px:Pl_int32; py:Pl_int32; pr:Pl_int32; 
           pb:Pl_int32; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function boxaGetMedianVals(boxa:PBOXA; px:Pl_int32; py:Pl_int32; pr:Pl_int32; pb:Pl_int32; 
           pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function boxaGetAverageSize(boxa:PBOXA; pw:Pl_float32; ph:Pl_float32):Tl_ok;cdecl;external;
function boxaaGetExtent(baa:PBOXAA; pw:Pl_int32; ph:Pl_int32; pbox:PPBOX; pboxa:PPBOXA):Tl_ok;cdecl;external;
function boxaaFlattenToBoxa(baa:PBOXAA; pnaindex:PPNUMA; copyflag:Tl_int32):PBOXA;cdecl;external;
function boxaaFlattenAligned(baa:PBOXAA; num:Tl_int32; fillerbox:PBOX; copyflag:Tl_int32):PBOXA;cdecl;external;
function boxaEncapsulateAligned(boxa:PBOXA; num:Tl_int32; copyflag:Tl_int32):PBOXAA;cdecl;external;
function boxaaTranspose(baas:PBOXAA):PBOXAA;cdecl;external;
function boxaaAlignBox(baa:PBOXAA; box:PBOX; delta:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixMaskConnComp(pixs:PPIX; connectivity:Tl_int32; pboxa:PPBOXA):PPIX;cdecl;external;
function pixMaskBoxa(pixd:PPIX; pixs:PPIX; boxa:PBOXA; op:Tl_int32):PPIX;cdecl;external;
function pixPaintBoxa(pixs:PPIX; boxa:PBOXA; val:Tl_uint32):PPIX;cdecl;external;
function pixSetBlackOrWhiteBoxa(pixs:PPIX; boxa:PBOXA; op:Tl_int32):PPIX;cdecl;external;
function pixPaintBoxaRandom(pixs:PPIX; boxa:PBOXA):PPIX;cdecl;external;
function pixBlendBoxaRandom(pixs:PPIX; boxa:PBOXA; fract:Tl_float32):PPIX;cdecl;external;
function pixDrawBoxa(pixs:PPIX; boxa:PBOXA; width:Tl_int32; val:Tl_uint32):PPIX;cdecl;external;
function pixDrawBoxaRandom(pixs:PPIX; boxa:PBOXA; width:Tl_int32):PPIX;cdecl;external;
function boxaaDisplay(pixs:PPIX; baa:PBOXAA; linewba:Tl_int32; linewb:Tl_int32; colorba:Tl_uint32; 
           colorb:Tl_uint32; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixaDisplayBoxaa(pixas:PPIXA; baa:PBOXAA; colorflag:Tl_int32; width:Tl_int32):PPIXA;cdecl;external;
function pixSplitIntoBoxa(pixs:PPIX; minsum:Tl_int32; skipdist:Tl_int32; delta:Tl_int32; maxbg:Tl_int32; 
           maxcomps:Tl_int32; remainder:Tl_int32):PBOXA;cdecl;external;
function pixSplitComponentIntoBoxa(pix:PPIX; box:PBOX; minsum:Tl_int32; skipdist:Tl_int32; delta:Tl_int32; 
           maxbg:Tl_int32; maxcomps:Tl_int32; remainder:Tl_int32):PBOXA;cdecl;external;
function makeMosaicStrips(w:Tl_int32; h:Tl_int32; direction:Tl_int32; size:Tl_int32):PBOXA;cdecl;external;
function boxaCompareRegions(boxa1:PBOXA; boxa2:PBOXA; areathresh:Tl_int32; pnsame:Pl_int32; pdiffarea:Pl_float32; 
           pdiffxor:Pl_float32; ppixdb:PPPIX):Tl_ok;cdecl;external;
function pixSelectLargeULComp(pixs:PPIX; areaslop:Tl_float32; yslop:Tl_int32; connectivity:Tl_int32):PBOX;cdecl;external;
function boxaSelectLargeULBox(boxas:PBOXA; areaslop:Tl_float32; yslop:Tl_int32):PBOX;cdecl;external;
function boxaSelectRange(boxas:PBOXA; first:Tl_int32; last:Tl_int32; copyflag:Tl_int32):PBOXA;cdecl;external;
function boxaaSelectRange(baas:PBOXAA; first:Tl_int32; last:Tl_int32; copyflag:Tl_int32):PBOXAA;cdecl;external;
function boxaSelectBySize(boxas:PBOXA; width:Tl_int32; height:Tl_int32; _type:Tl_int32; relation:Tl_int32; 
           pchanged:Pl_int32):PBOXA;cdecl;external;
function boxaMakeSizeIndicator(boxa:PBOXA; width:Tl_int32; height:Tl_int32; _type:Tl_int32; relation:Tl_int32):PNUMA;cdecl;external;
function boxaSelectByArea(boxas:PBOXA; area:Tl_int32; relation:Tl_int32; pchanged:Pl_int32):PBOXA;cdecl;external;
function boxaMakeAreaIndicator(boxa:PBOXA; area:Tl_int32; relation:Tl_int32):PNUMA;cdecl;external;
function boxaSelectByWHRatio(boxas:PBOXA; ratio:Tl_float32; relation:Tl_int32; pchanged:Pl_int32):PBOXA;cdecl;external;
function boxaMakeWHRatioIndicator(boxa:PBOXA; ratio:Tl_float32; relation:Tl_int32):PNUMA;cdecl;external;
function boxaSelectWithIndicator(boxas:PBOXA; na:PNUMA; pchanged:Pl_int32):PBOXA;cdecl;external;
function boxaPermutePseudorandom(boxas:PBOXA):PBOXA;cdecl;external;
function boxaPermuteRandom(boxad:PBOXA; boxas:PBOXA):PBOXA;cdecl;external;
function boxaSwapBoxes(boxa:PBOXA; i:Tl_int32; j:Tl_int32):Tl_ok;cdecl;external;
function boxaConvertToPta(boxa:PBOXA; ncorners:Tl_int32):PPTA;cdecl;external;
function ptaConvertToBoxa(pta:PPTA; ncorners:Tl_int32):PBOXA;cdecl;external;
function boxConvertToPta(box:PBOX; ncorners:Tl_int32):PPTA;cdecl;external;
function ptaConvertToBox(pta:PPTA):PBOX;cdecl;external;
function boxaGetExtent(boxa:PBOXA; pw:Pl_int32; ph:Pl_int32; pbox:PPBOX):Tl_ok;cdecl;external;
function boxaGetCoverage(boxa:PBOXA; wc:Tl_int32; hc:Tl_int32; exactflag:Tl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function boxaaSizeRange(baa:PBOXAA; pminw:Pl_int32; pminh:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function boxaSizeRange(boxa:PBOXA; pminw:Pl_int32; pminh:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function boxaLocationRange(boxa:PBOXA; pminx:Pl_int32; pminy:Pl_int32; pmaxx:Pl_int32; pmaxy:Pl_int32):Tl_ok;cdecl;external;
function boxaGetSizes(boxa:PBOXA; pnaw:PPNUMA; pnah:PPNUMA):Tl_ok;cdecl;external;
function boxaGetArea(boxa:PBOXA; parea:Pl_int32):Tl_ok;cdecl;external;
function boxaDisplayTiled(boxas:PBOXA; pixa:PPIXA; first:Tl_int32; last:Tl_int32; maxwidth:Tl_int32; 
           linewidth:Tl_int32; scalefactor:Tl_float32; background:Tl_int32; spacing:Tl_int32; border:Tl_int32):PPIX;cdecl;external;
function boxaSmoothSequenceMedian(boxas:PBOXA; halfwin:Tl_int32; subflag:Tl_int32; maxdiff:Tl_int32; extrapixels:Tl_int32; 
           debug:Tl_int32):PBOXA;cdecl;external;
function boxaWindowedMedian(boxas:PBOXA; halfwin:Tl_int32; debug:Tl_int32):PBOXA;cdecl;external;
function boxaModifyWithBoxa(boxas:PBOXA; boxam:PBOXA; subflag:Tl_int32; maxdiff:Tl_int32; extrapixels:Tl_int32):PBOXA;cdecl;external;
function boxaReconcilePairWidth(boxas:PBOXA; delw:Tl_int32; op:Tl_int32; factor:Tl_float32; na:PNUMA):PBOXA;cdecl;external;
function boxaSizeConsistency(boxas:PBOXA; _type:Tl_int32; threshp:Tl_float32; threshm:Tl_float32; pfvarp:Pl_float32; 
           pfvarm:Pl_float32; psame:Pl_int32):Tl_ok;cdecl;external;
function boxaReconcileAllByMedian(boxas:PBOXA; select1:Tl_int32; select2:Tl_int32; thresh:Tl_int32; extra:Tl_int32; 
           pixadb:PPIXA):PBOXA;cdecl;external;
function boxaReconcileSidesByMedian(boxas:PBOXA; select:Tl_int32; thresh:Tl_int32; extra:Tl_int32; pixadb:PPIXA):PBOXA;cdecl;external;
function boxaReconcileSizeByMedian(boxas:PBOXA; _type:Tl_int32; dfract:Tl_float32; sfract:Tl_float32; factor:Tl_float32; 
           pnadelw:PPNUMA; pnadelh:PPNUMA; pratiowh:Pl_float32):PBOXA;cdecl;external;
(* Const before type ignored *)
function boxaPlotSides(boxa:PBOXA; plotname:Pchar; pnal:PPNUMA; pnat:PPNUMA; pnar:PPNUMA; 
           pnab:PPNUMA; ppixd:PPPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function boxaPlotSizes(boxa:PBOXA; plotname:Pchar; pnaw:PPNUMA; pnah:PPNUMA; ppixd:PPPIX):Tl_ok;cdecl;external;
function boxaFillSequence(boxas:PBOXA; useflag:Tl_int32; debug:Tl_int32):PBOXA;cdecl;external;
function boxaSizeVariation(boxa:PBOXA; _type:Tl_int32; pdel_evenodd:Pl_float32; prms_even:Pl_float32; prms_odd:Pl_float32; 
           prms_all:Pl_float32):Tl_ok;cdecl;external;
function boxaMedianDimensions(boxas:PBOXA; pmedw:Pl_int32; pmedh:Pl_int32; pmedwe:Pl_int32; pmedwo:Pl_int32; 
           pmedhe:Pl_int32; pmedho:Pl_int32; pnadelw:PPNUMA; pnadelh:PPNUMA):Tl_ok;cdecl;external;
function l_byteaCreate(nbytes:Tsize_t):PL_BYTEA;cdecl;external;
(* Const before type ignored *)
function l_byteaInitFromMem(data:Pl_uint8; size:Tsize_t):PL_BYTEA;cdecl;external;
(* Const before type ignored *)
function l_byteaInitFromFile(fname:Pchar):PL_BYTEA;cdecl;external;
function l_byteaInitFromStream(fp:PFILE):PL_BYTEA;cdecl;external;
function l_byteaCopy(bas:PL_BYTEA; copyflag:Tl_int32):PL_BYTEA;cdecl;external;
procedure l_byteaDestroy(pba:PPL_BYTEA);cdecl;external;
function l_byteaGetSize(ba:PL_BYTEA):Tsize_t;cdecl;external;
function l_byteaGetData(ba:PL_BYTEA; psize:Psize_t):Pl_uint8;cdecl;external;
function l_byteaCopyData(ba:PL_BYTEA; psize:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function l_byteaAppendData(ba:PL_BYTEA; newdata:Pl_uint8; newbytes:Tsize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_byteaAppendString(ba:PL_BYTEA; str:Pchar):Tl_ok;cdecl;external;
function l_byteaJoin(ba1:PL_BYTEA; pba2:PPL_BYTEA):Tl_ok;cdecl;external;
function l_byteaSplit(ba1:PL_BYTEA; splitloc:Tsize_t; pba2:PPL_BYTEA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_byteaFindEachSequence(ba:PL_BYTEA; sequence:Pl_uint8; seqlen:Tsize_t; pda:PPL_DNA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_byteaWrite(fname:Pchar; ba:PL_BYTEA; startloc:Tsize_t; nbytes:Tsize_t):Tl_ok;cdecl;external;
function l_byteaWriteStream(fp:PFILE; ba:PL_BYTEA; startloc:Tsize_t; nbytes:Tsize_t):Tl_ok;cdecl;external;
function ccbaCreate(pixs:PPIX; n:Tl_int32):PCCBORDA;cdecl;external;
procedure ccbaDestroy(pccba:PPCCBORDA);cdecl;external;
function ccbCreate(pixs:PPIX):PCCBORD;cdecl;external;
procedure ccbDestroy(pccb:PPCCBORD);cdecl;external;
function ccbaAddCcb(ccba:PCCBORDA; ccb:PCCBORD):Tl_ok;cdecl;external;
function ccbaGetCount(ccba:PCCBORDA):Tl_int32;cdecl;external;
function ccbaGetCcb(ccba:PCCBORDA; index:Tl_int32):PCCBORD;cdecl;external;
function pixGetAllCCBorders(pixs:PPIX):PCCBORDA;cdecl;external;
function pixGetOuterBordersPtaa(pixs:PPIX):PPTAA;cdecl;external;
function pixGetOuterBorder(ccb:PCCBORD; pixs:PPIX; box:PBOX):Tl_ok;cdecl;external;
function ccbaGenerateGlobalLocs(ccba:PCCBORDA):Tl_ok;cdecl;external;
function ccbaGenerateStepChains(ccba:PCCBORDA):Tl_ok;cdecl;external;
function ccbaStepChainsToPixCoords(ccba:PCCBORDA; coordtype:Tl_int32):Tl_ok;cdecl;external;
function ccbaGenerateSPGlobalLocs(ccba:PCCBORDA; ptsflag:Tl_int32):Tl_ok;cdecl;external;
function ccbaGenerateSinglePath(ccba:PCCBORDA):Tl_ok;cdecl;external;
function getCutPathForHole(pix:PPIX; pta:PPTA; boxinner:PBOX; pdir:Pl_int32; plen:Pl_int32):PPTA;cdecl;external;
function ccbaDisplayBorder(ccba:PCCBORDA):PPIX;cdecl;external;
function ccbaDisplaySPBorder(ccba:PCCBORDA):PPIX;cdecl;external;
function ccbaDisplayImage1(ccba:PCCBORDA):PPIX;cdecl;external;
function ccbaDisplayImage2(ccba:PCCBORDA):PPIX;cdecl;external;
(* Const before type ignored *)
function ccbaWrite(filename:Pchar; ccba:PCCBORDA):Tl_ok;cdecl;external;
function ccbaWriteStream(fp:PFILE; ccba:PCCBORDA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ccbaRead(filename:Pchar):PCCBORDA;cdecl;external;
function ccbaReadStream(fp:PFILE):PCCBORDA;cdecl;external;
(* Const before type ignored *)
function ccbaWriteSVG(filename:Pchar; ccba:PCCBORDA):Tl_ok;cdecl;external;
function ccbaWriteSVGString(ccba:PCCBORDA):Pchar;cdecl;external;
function pixaThinConnected(pixas:PPIXA; _type:Tl_int32; connectivity:Tl_int32; maxiters:Tl_int32):PPIXA;cdecl;external;
function pixThinConnected(pixs:PPIX; _type:Tl_int32; connectivity:Tl_int32; maxiters:Tl_int32):PPIX;cdecl;external;
function pixThinConnectedBySet(pixs:PPIX; _type:Tl_int32; sela:PSELA; maxiters:Tl_int32):PPIX;cdecl;external;
function selaMakeThinSets(index:Tl_int32; debug:Tl_int32):PSELA;cdecl;external;
function pixFindCheckerboardCorners(pixs:PPIX; size:Tl_int32; dilation:Tl_int32; nsels:Tl_int32; ppix_corners:PPPIX; 
           ppta_corners:PPPTA; pixadb:PPIXA):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jbCorrelation(dirin:Pchar; thresh:Tl_float32; weight:Tl_float32; components:Tl_int32; rootname:Pchar; 
           firstpage:Tl_int32; npages:Tl_int32; renderflag:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jbRankHaus(dirin:Pchar; size:Tl_int32; rank:Tl_float32; components:Tl_int32; rootname:Pchar; 
           firstpage:Tl_int32; npages:Tl_int32; renderflag:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function jbWordsInTextlines(dirin:Pchar; reduction:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; thresh:Tl_float32; 
           weight:Tl_float32; pnatl:PPNUMA; firstpage:Tl_int32; npages:Tl_int32):PJBCLASSER;cdecl;external;
function pixGetWordsInTextlines(pixs:PPIX; minwidth:Tl_int32; minheight:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; 
           pboxad:PPBOXA; ppixad:PPPIXA; pnai:PPNUMA):Tl_ok;cdecl;external;
function pixGetWordBoxesInTextlines(pixs:PPIX; minwidth:Tl_int32; minheight:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; 
           pboxad:PPBOXA; pnai:PPNUMA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixFindWordAndCharacterBoxes(pixs:PPIX; boxs:PBOX; thresh:Tl_int32; pboxaw:PPBOXA; pboxaac:PPBOXAA; 
           debugdir:Pchar):Tl_ok;cdecl;external;
function boxaExtractSortedPattern(boxa:PBOXA; na:PNUMA):PNUMAA;cdecl;external;
function numaaCompareImagesByBoxes(naa1:PNUMAA; naa2:PNUMAA; nperline:Tl_int32; nreq:Tl_int32; maxshiftx:Tl_int32; 
           maxshifty:Tl_int32; delx:Tl_int32; dely:Tl_int32; psame:Pl_int32; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixColorContent(pixs:PPIX; rref:Tl_int32; gref:Tl_int32; bref:Tl_int32; mingray:Tl_int32; 
           ppixr:PPPIX; ppixg:PPPIX; ppixb:PPPIX):Tl_ok;cdecl;external;
function pixColorMagnitude(pixs:PPIX; rref:Tl_int32; gref:Tl_int32; bref:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixColorFraction(pixs:PPIX; darkthresh:Tl_int32; lightthresh:Tl_int32; diffthresh:Tl_int32; factor:Tl_int32; 
           ppixfract:Pl_float32; pcolorfract:Pl_float32):Tl_ok;cdecl;external;
function pixColorShiftWhitePoint(pixs:PPIX; rref:Tl_int32; gref:Tl_int32; bref:Tl_int32):PPIX;cdecl;external;
function pixMaskOverColorPixels(pixs:PPIX; threshdiff:Tl_int32; mindist:Tl_int32):PPIX;cdecl;external;
function pixMaskOverGrayPixels(pixs:PPIX; maxlimit:Tl_int32; satlimit:Tl_int32):PPIX;cdecl;external;
function pixMaskOverColorRange(pixs:PPIX; rmin:Tl_int32; rmax:Tl_int32; gmin:Tl_int32; gmax:Tl_int32; 
           bmin:Tl_int32; bmax:Tl_int32):PPIX;cdecl;external;
function pixFindColorRegions(pixs:PPIX; pixm:PPIX; factor:Tl_int32; lightthresh:Tl_int32; darkthresh:Tl_int32; 
           mindiff:Tl_int32; colordiff:Tl_int32; edgefract:Tl_float32; pcolorfract:Pl_float32; pcolormask1:PPPIX; 
           pcolormask2:PPPIX; pixadb:PPIXA):Tl_ok;cdecl;external;
function pixNumSignificantGrayColors(pixs:PPIX; darkthresh:Tl_int32; lightthresh:Tl_int32; minfract:Tl_float32; factor:Tl_int32; 
           pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixColorsForQuantization(pixs:PPIX; thresh:Tl_int32; pncolors:Pl_int32; piscolor:Pl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function pixNumColors(pixs:PPIX; factor:Tl_int32; pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixConvertRGBToCmapLossless(pixs:PPIX):PPIX;cdecl;external;
function pixGetMostPopulatedColors(pixs:PPIX; sigbits:Tl_int32; factor:Tl_int32; ncolors:Tl_int32; parray:PPl_uint32; 
           pcmap:PPPIXCMAP):Tl_ok;cdecl;external;
function pixSimpleColorQuantize(pixs:PPIX; sigbits:Tl_int32; factor:Tl_int32; ncolors:Tl_int32):PPIX;cdecl;external;
function pixGetRGBHistogram(pixs:PPIX; sigbits:Tl_int32; factor:Tl_int32):PNUMA;cdecl;external;
function makeRGBIndexTables(prtab:PPl_uint32; pgtab:PPl_uint32; pbtab:PPl_uint32; sigbits:Tl_int32):Tl_ok;cdecl;external;
function getRGBFromIndex(index:Tl_uint32; sigbits:Tl_int32; prval:Pl_int32; pgval:Pl_int32; pbval:Pl_int32):Tl_ok;cdecl;external;
function pixHasHighlightRed(pixs:PPIX; factor:Tl_int32; minfract:Tl_float32; fthresh:Tl_float32; phasred:Pl_int32; 
           pratio:Pl_float32; ppixdb:PPPIX):Tl_ok;cdecl;external;
function l_colorfillCreate(pixs:PPIX; nx:Tl_int32; ny:Tl_int32):PL_COLORFILL;cdecl;external;
procedure l_colorfillDestroy(pcf:PPL_COLORFILL);cdecl;external;
function pixColorContentByLocation(cf:PL_COLORFILL; rref:Tl_int32; gref:Tl_int32; bref:Tl_int32; minmax:Tl_int32; 
           maxdiff:Tl_int32; minarea:Tl_int32; smooth:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function pixColorFill(pixs:PPIX; minmax:Tl_int32; maxdiff:Tl_int32; smooth:Tl_int32; minarea:Tl_int32; 
           debug:Tl_int32):PPIX;cdecl;external;
function makeColorfillTestData(w:Tl_int32; h:Tl_int32; nseeds:Tl_int32; range:Tl_int32):PPIXA;cdecl;external;
function pixColorGrayRegions(pixs:PPIX; boxa:PBOXA; _type:Tl_int32; thresh:Tl_int32; rval:Tl_int32; 
           gval:Tl_int32; bval:Tl_int32):PPIX;cdecl;external;
function pixColorGray(pixs:PPIX; box:PBOX; _type:Tl_int32; thresh:Tl_int32; rval:Tl_int32; 
           gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixColorGrayMasked(pixs:PPIX; pixm:PPIX; _type:Tl_int32; thresh:Tl_int32; rval:Tl_int32; 
           gval:Tl_int32; bval:Tl_int32):PPIX;cdecl;external;
function pixSnapColor(pixd:PPIX; pixs:PPIX; srcval:Tl_uint32; dstval:Tl_uint32; diff:Tl_int32):PPIX;cdecl;external;
function pixSnapColorCmap(pixd:PPIX; pixs:PPIX; srcval:Tl_uint32; dstval:Tl_uint32; diff:Tl_int32):PPIX;cdecl;external;
function pixLinearMapToTargetColor(pixd:PPIX; pixs:PPIX; srcval:Tl_uint32; dstval:Tl_uint32):PPIX;cdecl;external;
function pixelLinearMapToTargetColor(scolor:Tl_uint32; srcmap:Tl_uint32; dstmap:Tl_uint32; pdcolor:Pl_uint32):Tl_ok;cdecl;external;
function pixShiftByComponent(pixd:PPIX; pixs:PPIX; srcval:Tl_uint32; dstval:Tl_uint32):PPIX;cdecl;external;
function pixelShiftByComponent(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; srcval:Tl_uint32; dstval:Tl_uint32; 
           ppixel:Pl_uint32):Tl_ok;cdecl;external;
function pixelFractionalShift(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; fract:Tl_float32; ppixel:Pl_uint32):Tl_ok;cdecl;external;
function pixMapWithInvariantHue(pixd:PPIX; pixs:PPIX; srcval:Tl_uint32; fract:Tl_float32):PPIX;cdecl;external;
function pixcmapCreate(depth:Tl_int32):PPIXCMAP;cdecl;external;
function pixcmapCreateRandom(depth:Tl_int32; hasblack:Tl_int32; haswhite:Tl_int32):PPIXCMAP;cdecl;external;
function pixcmapCreateLinear(d:Tl_int32; nlevels:Tl_int32):PPIXCMAP;cdecl;external;
(* Const before type ignored *)
function pixcmapCopy(cmaps:PPIXCMAP):PPIXCMAP;cdecl;external;
procedure pixcmapDestroy(pcmap:PPPIXCMAP);cdecl;external;
(* Const before type ignored *)
function pixcmapIsValid(cmap:PPIXCMAP; pix:PPIX; pvalid:Pl_int32):Tl_ok;cdecl;external;
function pixcmapAddColor(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixcmapAddRGBA(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; aval:Tl_int32):Tl_ok;cdecl;external;
function pixcmapAddNewColor(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapAddNearestColor(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapUsableColor(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pusable:Pl_int32):Tl_ok;cdecl;external;
function pixcmapAddBlackOrWhite(cmap:PPIXCMAP; color:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapSetBlackAndWhite(cmap:PPIXCMAP; setblack:Tl_int32; setwhite:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcmapGetCount(cmap:PPIXCMAP):Tl_int32;cdecl;external;
function pixcmapGetFreeCount(cmap:PPIXCMAP):Tl_int32;cdecl;external;
function pixcmapGetDepth(cmap:PPIXCMAP):Tl_int32;cdecl;external;
function pixcmapGetMinDepth(cmap:PPIXCMAP; pmindepth:Pl_int32):Tl_ok;cdecl;external;
function pixcmapClear(cmap:PPIXCMAP):Tl_ok;cdecl;external;
function pixcmapGetColor(cmap:PPIXCMAP; index:Tl_int32; prval:Pl_int32; pgval:Pl_int32; pbval:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetColor32(cmap:PPIXCMAP; index:Tl_int32; pval32:Pl_uint32):Tl_ok;cdecl;external;
function pixcmapGetRGBA(cmap:PPIXCMAP; index:Tl_int32; prval:Pl_int32; pgval:Pl_int32; pbval:Pl_int32; 
           paval:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetRGBA32(cmap:PPIXCMAP; index:Tl_int32; pval32:Pl_uint32):Tl_ok;cdecl;external;
function pixcmapResetColor(cmap:PPIXCMAP; index:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixcmapSetAlpha(cmap:PPIXCMAP; index:Tl_int32; aval:Tl_int32):Tl_ok;cdecl;external;
function pixcmapGetIndex(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pindex:Pl_int32):Tl_int32;cdecl;external;
function pixcmapHasColor(cmap:PPIXCMAP; pcolor:Pl_int32):Tl_ok;cdecl;external;
function pixcmapIsOpaque(cmap:PPIXCMAP; popaque:Pl_int32):Tl_ok;cdecl;external;
function pixcmapNonOpaqueColorsInfo(cmap:PPIXCMAP; pntrans:Pl_int32; pmax_trans:Pl_int32; pmin_opaque:Pl_int32):Tl_ok;cdecl;external;
function pixcmapIsBlackAndWhite(cmap:PPIXCMAP; pblackwhite:Pl_int32):Tl_ok;cdecl;external;
function pixcmapCountGrayColors(cmap:PPIXCMAP; pngray:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetRankIntensity(cmap:PPIXCMAP; rankval:Tl_float32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetNearestIndex(cmap:PPIXCMAP; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetNearestGrayIndex(cmap:PPIXCMAP; val:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetDistanceToColor(cmap:PPIXCMAP; index:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; 
           pdist:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGetRangeValues(cmap:PPIXCMAP; select:Tl_int32; pminval:Pl_int32; pmaxval:Pl_int32; pminindex:Pl_int32; 
           pmaxindex:Pl_int32):Tl_ok;cdecl;external;
function pixcmapGrayToFalseColor(gamma:Tl_float32):PPIXCMAP;cdecl;external;
function pixcmapGrayToColor(color:Tl_uint32):PPIXCMAP;cdecl;external;
function pixcmapColorToGray(cmaps:PPIXCMAP; rwt:Tl_float32; gwt:Tl_float32; bwt:Tl_float32):PPIXCMAP;cdecl;external;
function pixcmapConvertTo4(cmaps:PPIXCMAP):PPIXCMAP;cdecl;external;
function pixcmapConvertTo8(cmaps:PPIXCMAP):PPIXCMAP;cdecl;external;
(* Const before type ignored *)
function pixcmapRead(filename:Pchar):PPIXCMAP;cdecl;external;
function pixcmapReadStream(fp:PFILE):PPIXCMAP;cdecl;external;
(* Const before type ignored *)
function pixcmapReadMem(data:Pl_uint8; size:Tsize_t):PPIXCMAP;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixcmapWrite(filename:Pchar; cmap:PPIXCMAP):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcmapWriteStream(fp:PFILE; cmap:PPIXCMAP):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcmapWriteMem(pdata:PPl_uint8; psize:Psize_t; cmap:PPIXCMAP):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcmapToArrays(cmap:PPIXCMAP; prmap:PPl_int32; pgmap:PPl_int32; pbmap:PPl_int32; pamap:PPl_int32):Tl_ok;cdecl;external;
function pixcmapToRGBTable(cmap:PPIXCMAP; ptab:PPl_uint32; pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixcmapSerializeToMemory(cmap:PPIXCMAP; cpc:Tl_int32; pncolors:Pl_int32; pdata:PPl_uint8):Tl_ok;cdecl;external;
function pixcmapDeserializeFromMemory(data:Pl_uint8; cpc:Tl_int32; ncolors:Tl_int32):PPIXCMAP;cdecl;external;
function pixcmapConvertToHex(data:Pl_uint8; ncolors:Tl_int32):Pchar;cdecl;external;
function pixcmapGammaTRC(cmap:PPIXCMAP; gamma:Tl_float32; minval:Tl_int32; maxval:Tl_int32):Tl_ok;cdecl;external;
function pixcmapContrastTRC(cmap:PPIXCMAP; factor:Tl_float32):Tl_ok;cdecl;external;
function pixcmapShiftIntensity(cmap:PPIXCMAP; fraction:Tl_float32):Tl_ok;cdecl;external;
function pixcmapShiftByComponent(cmap:PPIXCMAP; srcval:Tl_uint32; dstval:Tl_uint32):Tl_ok;cdecl;external;
function pixColorMorph(pixs:PPIX; _type:Tl_int32; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOctreeColorQuant(pixs:PPIX; colors:Tl_int32; ditherflag:Tl_int32):PPIX;cdecl;external;
function pixOctreeColorQuantGeneral(pixs:PPIX; colors:Tl_int32; ditherflag:Tl_int32; validthresh:Tl_float32; colorthresh:Tl_float32):PPIX;cdecl;external;
function makeRGBToIndexTables(cqlevels:Tl_int32; prtab:PPl_uint32; pgtab:PPl_uint32; pbtab:PPl_uint32):Tl_ok;cdecl;external;
procedure getOctcubeIndexFromRGB(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; rtab:Pl_uint32; gtab:Pl_uint32; 
            btab:Pl_uint32; pindex:Pl_uint32);cdecl;external;
function pixOctreeQuantByPopulation(pixs:PPIX; level:Tl_int32; ditherflag:Tl_int32):PPIX;cdecl;external;
function pixOctreeQuantNumColors(pixs:PPIX; maxcolors:Tl_int32; subsample:Tl_int32):PPIX;cdecl;external;
function pixOctcubeQuantMixedWithGray(pixs:PPIX; depth:Tl_int32; graylevels:Tl_int32; delta:Tl_int32):PPIX;cdecl;external;
function pixFixedOctcubeQuant256(pixs:PPIX; ditherflag:Tl_int32):PPIX;cdecl;external;
function pixFewColorsOctcubeQuant1(pixs:PPIX; level:Tl_int32):PPIX;cdecl;external;
function pixFewColorsOctcubeQuant2(pixs:PPIX; level:Tl_int32; na:PNUMA; ncolors:Tl_int32; pnerrors:Pl_int32):PPIX;cdecl;external;
function pixFewColorsOctcubeQuantMixed(pixs:PPIX; level:Tl_int32; darkthresh:Tl_int32; lightthresh:Tl_int32; diffthresh:Tl_int32; 
           minfract:Tl_float32; maxspan:Tl_int32):PPIX;cdecl;external;
function pixFixedOctcubeQuantGenRGB(pixs:PPIX; level:Tl_int32):PPIX;cdecl;external;
function pixQuantFromCmap(pixs:PPIX; cmap:PPIXCMAP; mindepth:Tl_int32; level:Tl_int32; metric:Tl_int32):PPIX;cdecl;external;
function pixOctcubeQuantFromCmap(pixs:PPIX; cmap:PPIXCMAP; mindepth:Tl_int32; level:Tl_int32; metric:Tl_int32):PPIX;cdecl;external;
function pixOctcubeHistogram(pixs:PPIX; level:Tl_int32; pncolors:Pl_int32):PNUMA;cdecl;external;
function pixcmapToOctcubeLUT(cmap:PPIXCMAP; level:Tl_int32; metric:Tl_int32):Pl_int32;cdecl;external;
function pixRemoveUnusedColors(pixs:PPIX):Tl_ok;cdecl;external;
function pixNumberOccupiedOctcubes(pix:PPIX; level:Tl_int32; mincount:Tl_int32; minfract:Tl_float32; pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixMedianCutQuant(pixs:PPIX; ditherflag:Tl_int32):PPIX;cdecl;external;
function pixMedianCutQuantGeneral(pixs:PPIX; ditherflag:Tl_int32; outdepth:Tl_int32; maxcolors:Tl_int32; sigbits:Tl_int32; 
           maxsub:Tl_int32; checkbw:Tl_int32):PPIX;cdecl;external;
function pixMedianCutQuantMixed(pixs:PPIX; ncolor:Tl_int32; ngray:Tl_int32; darkthresh:Tl_int32; lightthresh:Tl_int32; 
           diffthresh:Tl_int32):PPIX;cdecl;external;
function pixFewColorsMedianCutQuantMixed(pixs:PPIX; ncolor:Tl_int32; ngray:Tl_int32; maxncolors:Tl_int32; darkthresh:Tl_int32; 
           lightthresh:Tl_int32; diffthresh:Tl_int32):PPIX;cdecl;external;
function pixMedianCutHisto(pixs:PPIX; sigbits:Tl_int32; subsample:Tl_int32):Pl_int32;cdecl;external;
function pixColorSegment(pixs:PPIX; maxdist:Tl_int32; maxcolors:Tl_int32; selsize:Tl_int32; finalcolors:Tl_int32; 
           debugflag:Tl_int32):PPIX;cdecl;external;
function pixColorSegmentCluster(pixs:PPIX; maxdist:Tl_int32; maxcolors:Tl_int32; debugflag:Tl_int32):PPIX;cdecl;external;
function pixAssignToNearestColor(pixd:PPIX; pixs:PPIX; pixm:PPIX; level:Tl_int32; countarray:Pl_int32):Tl_ok;cdecl;external;
function pixColorSegmentClean(pixs:PPIX; selsize:Tl_int32; countarray:Pl_int32):Tl_ok;cdecl;external;
function pixColorSegmentRemoveColors(pixd:PPIX; pixs:PPIX; finalcolors:Tl_int32):Tl_ok;cdecl;external;
function pixConvertRGBToHSV(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixConvertHSVToRGB(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function convertRGBToHSV(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; phval:Pl_int32; psval:Pl_int32; 
           pvval:Pl_int32):Tl_ok;cdecl;external;
function convertHSVToRGB(hval:Tl_int32; sval:Tl_int32; vval:Tl_int32; prval:Pl_int32; pgval:Pl_int32; 
           pbval:Pl_int32):Tl_ok;cdecl;external;
function pixcmapConvertRGBToHSV(cmap:PPIXCMAP):Tl_ok;cdecl;external;
function pixcmapConvertHSVToRGB(cmap:PPIXCMAP):Tl_ok;cdecl;external;
function pixConvertRGBToHue(pixs:PPIX):PPIX;cdecl;external;
function pixConvertRGBToSaturation(pixs:PPIX):PPIX;cdecl;external;
function pixConvertRGBToValue(pixs:PPIX):PPIX;cdecl;external;
function pixMakeRangeMaskHS(pixs:PPIX; huecenter:Tl_int32; huehw:Tl_int32; satcenter:Tl_int32; sathw:Tl_int32; 
           regionflag:Tl_int32):PPIX;cdecl;external;
function pixMakeRangeMaskHV(pixs:PPIX; huecenter:Tl_int32; huehw:Tl_int32; valcenter:Tl_int32; valhw:Tl_int32; 
           regionflag:Tl_int32):PPIX;cdecl;external;
function pixMakeRangeMaskSV(pixs:PPIX; satcenter:Tl_int32; sathw:Tl_int32; valcenter:Tl_int32; valhw:Tl_int32; 
           regionflag:Tl_int32):PPIX;cdecl;external;
function pixMakeHistoHS(pixs:PPIX; factor:Tl_int32; pnahue:PPNUMA; pnasat:PPNUMA):PPIX;cdecl;external;
function pixMakeHistoHV(pixs:PPIX; factor:Tl_int32; pnahue:PPNUMA; pnaval:PPNUMA):PPIX;cdecl;external;
function pixMakeHistoSV(pixs:PPIX; factor:Tl_int32; pnasat:PPNUMA; pnaval:PPNUMA):PPIX;cdecl;external;
function pixFindHistoPeaksHSV(pixs:PPIX; _type:Tl_int32; width:Tl_int32; height:Tl_int32; npeaks:Tl_int32; 
           erasefactor:Tl_float32; ppta:PPPTA; pnatot:PPNUMA; ppixa:PPPIXA):Tl_ok;cdecl;external;
function displayHSVColorRange(hval:Tl_int32; sval:Tl_int32; vval:Tl_int32; huehw:Tl_int32; sathw:Tl_int32; 
           nsamp:Tl_int32; factor:Tl_int32):PPIX;cdecl;external;
function pixConvertRGBToYUV(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixConvertYUVToRGB(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function convertRGBToYUV(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pyval:Pl_int32; puval:Pl_int32; 
           pvval:Pl_int32):Tl_ok;cdecl;external;
function convertYUVToRGB(yval:Tl_int32; uval:Tl_int32; vval:Tl_int32; prval:Pl_int32; pgval:Pl_int32; 
           pbval:Pl_int32):Tl_ok;cdecl;external;
function pixcmapConvertRGBToYUV(cmap:PPIXCMAP):Tl_ok;cdecl;external;
function pixcmapConvertYUVToRGB(cmap:PPIXCMAP):Tl_ok;cdecl;external;
function pixConvertRGBToXYZ(pixs:PPIX):PFPIXA;cdecl;external;
function fpixaConvertXYZToRGB(fpixa:PFPIXA):PPIX;cdecl;external;
function convertRGBToXYZ(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pfxval:Pl_float32; pfyval:Pl_float32; 
           pfzval:Pl_float32):Tl_ok;cdecl;external;
function convertXYZToRGB(fxval:Tl_float32; fyval:Tl_float32; fzval:Tl_float32; blackout:Tl_int32; prval:Pl_int32; 
           pgval:Pl_int32; pbval:Pl_int32):Tl_ok;cdecl;external;
function fpixaConvertXYZToLAB(fpixas:PFPIXA):PFPIXA;cdecl;external;
function fpixaConvertLABToXYZ(fpixas:PFPIXA):PFPIXA;cdecl;external;
function convertXYZToLAB(xval:Tl_float32; yval:Tl_float32; zval:Tl_float32; plval:Pl_float32; paval:Pl_float32; 
           pbval:Pl_float32):Tl_ok;cdecl;external;
function convertLABToXYZ(lval:Tl_float32; aval:Tl_float32; bval:Tl_float32; pxval:Pl_float32; pyval:Pl_float32; 
           pzval:Pl_float32):Tl_ok;cdecl;external;
function pixConvertRGBToLAB(pixs:PPIX):PFPIXA;cdecl;external;
function fpixaConvertLABToRGB(fpixa:PFPIXA):PPIX;cdecl;external;
function convertRGBToLAB(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; pflval:Pl_float32; pfaval:Pl_float32; 
           pfbval:Pl_float32):Tl_ok;cdecl;external;
function convertLABToRGB(flval:Tl_float32; faval:Tl_float32; fbval:Tl_float32; prval:Pl_int32; pgval:Pl_int32; 
           pbval:Pl_int32):Tl_ok;cdecl;external;
function pixMakeGamutRGB(scale:Tl_int32):PPIX;cdecl;external;
function pixEqual(pix1:PPIX; pix2:PPIX; psame:Pl_int32):Tl_ok;cdecl;external;
function pixEqualWithAlpha(pix1:PPIX; pix2:PPIX; use_alpha:Tl_int32; psame:Pl_int32):Tl_ok;cdecl;external;
function pixEqualWithCmap(pix1:PPIX; pix2:PPIX; psame:Pl_int32):Tl_ok;cdecl;external;
function cmapEqual(cmap1:PPIXCMAP; cmap2:PPIXCMAP; ncomps:Tl_int32; psame:Pl_int32):Tl_ok;cdecl;external;
function pixUsesCmapColor(pixs:PPIX; pcolor:Pl_int32):Tl_ok;cdecl;external;
function pixCorrelationBinary(pix1:PPIX; pix2:PPIX; pval:Pl_float32):Tl_ok;cdecl;external;
function pixDisplayDiffBinary(pix1:PPIX; pix2:PPIX):PPIX;cdecl;external;
function pixCompareBinary(pix1:PPIX; pix2:PPIX; comptype:Tl_int32; pfract:Pl_float32; ppixdiff:PPPIX):Tl_ok;cdecl;external;
function pixCompareGrayOrRGB(pix1:PPIX; pix2:PPIX; comptype:Tl_int32; plottype:Tl_int32; psame:Pl_int32; 
           pdiff:Pl_float32; prmsdiff:Pl_float32; ppixdiff:PPPIX):Tl_ok;cdecl;external;
function pixCompareGray(pix1:PPIX; pix2:PPIX; comptype:Tl_int32; plottype:Tl_int32; psame:Pl_int32; 
           pdiff:Pl_float32; prmsdiff:Pl_float32; ppixdiff:PPPIX):Tl_ok;cdecl;external;
function pixCompareRGB(pix1:PPIX; pix2:PPIX; comptype:Tl_int32; plottype:Tl_int32; psame:Pl_int32; 
           pdiff:Pl_float32; prmsdiff:Pl_float32; ppixdiff:PPPIX):Tl_ok;cdecl;external;
function pixCompareTiled(pix1:PPIX; pix2:PPIX; sx:Tl_int32; sy:Tl_int32; _type:Tl_int32; 
           ppixdiff:PPPIX):Tl_ok;cdecl;external;
function pixCompareRankDifference(pix1:PPIX; pix2:PPIX; factor:Tl_int32):PNUMA;cdecl;external;
function pixTestForSimilarity(pix1:PPIX; pix2:PPIX; factor:Tl_int32; mindiff:Tl_int32; maxfract:Tl_float32; 
           maxave:Tl_float32; psimilar:Pl_int32; details:Tl_int32):Tl_ok;cdecl;external;
function pixGetDifferenceStats(pix1:PPIX; pix2:PPIX; factor:Tl_int32; mindiff:Tl_int32; pfractdiff:Pl_float32; 
           pavediff:Pl_float32; details:Tl_int32):Tl_ok;cdecl;external;
function pixGetDifferenceHistogram(pix1:PPIX; pix2:PPIX; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetPerceptualDiff(pixs1:PPIX; pixs2:PPIX; sampling:Tl_int32; dilation:Tl_int32; mindiff:Tl_int32; 
           pfract:Pl_float32; ppixdiff1:PPPIX; ppixdiff2:PPPIX):Tl_ok;cdecl;external;
function pixGetPSNR(pix1:PPIX; pix2:PPIX; factor:Tl_int32; ppsnr:Pl_float32):Tl_ok;cdecl;external;
function pixaComparePhotoRegionsByHisto(pixa:PPIXA; minratio:Tl_float32; textthresh:Tl_float32; factor:Tl_int32; n:Tl_int32; 
           simthresh:Tl_float32; pnai:PPNUMA; pscores:PPl_float32; ppixd:PPPIX; debug:Tl_int32):Tl_ok;cdecl;external;
function pixComparePhotoRegionsByHisto(pix1:PPIX; pix2:PPIX; box1:PBOX; box2:PBOX; minratio:Tl_float32; 
           factor:Tl_int32; n:Tl_int32; pscore:Pl_float32; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixGenPhotoHistos(pixs:PPIX; box:PBOX; factor:Tl_int32; thresh:Tl_float32; n:Tl_int32; 
           pnaa:PPNUMAA; pw:Pl_int32; ph:Pl_int32; debugindex:Tl_int32):Tl_ok;cdecl;external;
function pixPadToCenterCentroid(pixs:PPIX; factor:Tl_int32):PPIX;cdecl;external;
function pixCentroid8(pixs:PPIX; factor:Tl_int32; pcx:Pl_float32; pcy:Pl_float32):Tl_ok;cdecl;external;
function pixDecideIfPhotoImage(pix:PPIX; factor:Tl_int32; thresh:Tl_float32; n:Tl_int32; pnaa:PPNUMAA; 
           pixadebug:PPIXA):Tl_ok;cdecl;external;
function compareTilesByHisto(naa1:PNUMAA; naa2:PNUMAA; minratio:Tl_float32; w1:Tl_int32; h1:Tl_int32; 
           w2:Tl_int32; h2:Tl_int32; pscore:Pl_float32; pixadebug:PPIXA):Tl_ok;cdecl;external;
function pixCompareGrayByHisto(pix1:PPIX; pix2:PPIX; box1:PBOX; box2:PBOX; minratio:Tl_float32; 
           maxgray:Tl_int32; factor:Tl_int32; n:Tl_int32; pscore:Pl_float32; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixCropAlignedToCentroid(pix1:PPIX; pix2:PPIX; factor:Tl_int32; pbox1:PPBOX; pbox2:PPBOX):Tl_ok;cdecl;external;
function l_compressGrayHistograms(naa:PNUMAA; w:Tl_int32; h:Tl_int32; psize:Psize_t):Pl_uint8;cdecl;external;
function l_uncompressGrayHistograms(bytea:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32):PNUMAA;cdecl;external;
function pixCompareWithTranslation(pix1:PPIX; pix2:PPIX; thresh:Tl_int32; pdelx:Pl_int32; pdely:Pl_int32; 
           pscore:Pl_float32; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixBestCorrelation(pix1:PPIX; pix2:PPIX; area1:Tl_int32; area2:Tl_int32; etransx:Tl_int32; 
           etransy:Tl_int32; maxshift:Tl_int32; tab8:Pl_int32; pdelx:Pl_int32; pdely:Pl_int32; 
           pscore:Pl_float32; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixConnComp(pixs:PPIX; ppixa:PPPIXA; connectivity:Tl_int32):PBOXA;cdecl;external;
function pixConnCompPixa(pixs:PPIX; ppixa:PPPIXA; connectivity:Tl_int32):PBOXA;cdecl;external;
function pixConnCompBB(pixs:PPIX; connectivity:Tl_int32):PBOXA;cdecl;external;
function pixCountConnComp(pixs:PPIX; connectivity:Tl_int32; pcount:Pl_int32):Tl_ok;cdecl;external;
function nextOnPixelInRaster(pixs:PPIX; xstart:Tl_int32; ystart:Tl_int32; px:Pl_int32; py:Pl_int32):Tl_int32;cdecl;external;
function pixSeedfillBB(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32; connectivity:Tl_int32):PBOX;cdecl;external;
function pixSeedfill4BB(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32):PBOX;cdecl;external;
function pixSeedfill8BB(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32):PBOX;cdecl;external;
function pixSeedfill(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32; connectivity:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfill4(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfill8(pixs:PPIX; stack:PL_STACK; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertFilesTo1bpp(dirin:Pchar; substr:Pchar; upscaling:Tl_int32; thresh:Tl_int32; firstpage:Tl_int32; 
           npages:Tl_int32; dirout:Pchar; outformat:Tl_int32):Tl_ok;cdecl;external;
function pixBlockconv(pix:PPIX; wc:Tl_int32; hc:Tl_int32):PPIX;cdecl;external;
function pixBlockconvGray(pixs:PPIX; pixacc:PPIX; wc:Tl_int32; hc:Tl_int32):PPIX;cdecl;external;
function pixBlockconvAccum(pixs:PPIX):PPIX;cdecl;external;
function pixBlockconvGrayUnnormalized(pixs:PPIX; wc:Tl_int32; hc:Tl_int32):PPIX;cdecl;external;
function pixBlockconvTiled(pix:PPIX; wc:Tl_int32; hc:Tl_int32; nx:Tl_int32; ny:Tl_int32):PPIX;cdecl;external;
function pixBlockconvGrayTile(pixs:PPIX; pixacc:PPIX; wc:Tl_int32; hc:Tl_int32):PPIX;cdecl;external;
function pixWindowedStats(pixs:PPIX; wc:Tl_int32; hc:Tl_int32; hasborder:Tl_int32; ppixm:PPPIX; 
           ppixms:PPPIX; pfpixv:PPFPIX; pfpixrv:PPFPIX):Tl_ok;cdecl;external;
function pixWindowedMean(pixs:PPIX; wc:Tl_int32; hc:Tl_int32; hasborder:Tl_int32; normflag:Tl_int32):PPIX;cdecl;external;
function pixWindowedMeanSquare(pixs:PPIX; wc:Tl_int32; hc:Tl_int32; hasborder:Tl_int32):PPIX;cdecl;external;
function pixWindowedVariance(pixm:PPIX; pixms:PPIX; pfpixv:PPFPIX; pfpixrv:PPFPIX):Tl_ok;cdecl;external;
function pixMeanSquareAccum(pixs:PPIX):PDPIX;cdecl;external;
function pixBlockrank(pixs:PPIX; pixacc:PPIX; wc:Tl_int32; hc:Tl_int32; rank:Tl_float32):PPIX;cdecl;external;
function pixBlocksum(pixs:PPIX; pixacc:PPIX; wc:Tl_int32; hc:Tl_int32):PPIX;cdecl;external;
function pixCensusTransform(pixs:PPIX; halfsize:Tl_int32; pixacc:PPIX):PPIX;cdecl;external;
function pixConvolve(pixs:PPIX; kel:PL_KERNEL; outdepth:Tl_int32; normflag:Tl_int32):PPIX;cdecl;external;
function pixConvolveSep(pixs:PPIX; kelx:PL_KERNEL; kely:PL_KERNEL; outdepth:Tl_int32; normflag:Tl_int32):PPIX;cdecl;external;
function pixConvolveRGB(pixs:PPIX; kel:PL_KERNEL):PPIX;cdecl;external;
function pixConvolveRGBSep(pixs:PPIX; kelx:PL_KERNEL; kely:PL_KERNEL):PPIX;cdecl;external;
function fpixConvolve(fpixs:PFPIX; kel:PL_KERNEL; normflag:Tl_int32):PFPIX;cdecl;external;
function fpixConvolveSep(fpixs:PFPIX; kelx:PL_KERNEL; kely:PL_KERNEL; normflag:Tl_int32):PFPIX;cdecl;external;
function pixConvolveWithBias(pixs:PPIX; kel1:PL_KERNEL; kel2:PL_KERNEL; force8:Tl_int32; pbias:Pl_int32):PPIX;cdecl;external;
procedure l_setConvolveSampling(xfact:Tl_int32; yfact:Tl_int32);cdecl;external;
function pixAddGaussianNoise(pixs:PPIX; stdev:Tl_float32):PPIX;cdecl;external;
function gaussDistribSampling:Tl_float32;cdecl;external;
function pixCorrelationScore(pix1:PPIX; pix2:PPIX; area1:Tl_int32; area2:Tl_int32; delx:Tl_float32; 
           dely:Tl_float32; maxdiffw:Tl_int32; maxdiffh:Tl_int32; tab:Pl_int32; pscore:Pl_float32):Tl_ok;cdecl;external;
function pixCorrelationScoreThresholded(pix1:PPIX; pix2:PPIX; area1:Tl_int32; area2:Tl_int32; delx:Tl_float32; 
           dely:Tl_float32; maxdiffw:Tl_int32; maxdiffh:Tl_int32; tab:Pl_int32; downcount:Pl_int32; 
           score_threshold:Tl_float32):Tl_int32;cdecl;external;
function pixCorrelationScoreSimple(pix1:PPIX; pix2:PPIX; area1:Tl_int32; area2:Tl_int32; delx:Tl_float32; 
           dely:Tl_float32; maxdiffw:Tl_int32; maxdiffh:Tl_int32; tab:Pl_int32; pscore:Pl_float32):Tl_ok;cdecl;external;
function pixCorrelationScoreShifted(pix1:PPIX; pix2:PPIX; area1:Tl_int32; area2:Tl_int32; delx:Tl_int32; 
           dely:Tl_int32; tab:Pl_int32; pscore:Pl_float32):Tl_ok;cdecl;external;
function dewarpCreate(pixs:PPIX; pageno:Tl_int32):PL_DEWARP;cdecl;external;
function dewarpCreateRef(pageno:Tl_int32; refpage:Tl_int32):PL_DEWARP;cdecl;external;
procedure dewarpDestroy(pdew:PPL_DEWARP);cdecl;external;
function dewarpaCreate(nptrs:Tl_int32; sampling:Tl_int32; redfactor:Tl_int32; minlines:Tl_int32; maxdist:Tl_int32):PL_DEWARPA;cdecl;external;
function dewarpaCreateFromPixacomp(pixac:PPIXAC; useboth:Tl_int32; sampling:Tl_int32; minlines:Tl_int32; maxdist:Tl_int32):PL_DEWARPA;cdecl;external;
procedure dewarpaDestroy(pdewa:PPL_DEWARPA);cdecl;external;
function dewarpaDestroyDewarp(dewa:PL_DEWARPA; pageno:Tl_int32):Tl_ok;cdecl;external;
function dewarpaInsertDewarp(dewa:PL_DEWARPA; dew:PL_DEWARP):Tl_ok;cdecl;external;
function dewarpaGetDewarp(dewa:PL_DEWARPA; index:Tl_int32):PL_DEWARP;cdecl;external;
function dewarpaSetCurvatures(dewa:PL_DEWARPA; max_linecurv:Tl_int32; min_diff_linecurv:Tl_int32; max_diff_linecurv:Tl_int32; max_edgecurv:Tl_int32; 
           max_diff_edgecurv:Tl_int32; max_edgeslope:Tl_int32):Tl_ok;cdecl;external;
function dewarpaUseBothArrays(dewa:PL_DEWARPA; useboth:Tl_int32):Tl_ok;cdecl;external;
function dewarpaSetCheckColumns(dewa:PL_DEWARPA; check_columns:Tl_int32):Tl_ok;cdecl;external;
function dewarpaSetMaxDistance(dewa:PL_DEWARPA; maxdist:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpRead(filename:Pchar):PL_DEWARP;cdecl;external;
function dewarpReadStream(fp:PFILE):PL_DEWARP;cdecl;external;
(* Const before type ignored *)
function dewarpReadMem(data:Pl_uint8; size:Tsize_t):PL_DEWARP;cdecl;external;
(* Const before type ignored *)
function dewarpWrite(filename:Pchar; dew:PL_DEWARP):Tl_ok;cdecl;external;
function dewarpWriteStream(fp:PFILE; dew:PL_DEWARP):Tl_ok;cdecl;external;
function dewarpWriteMem(pdata:PPl_uint8; psize:Psize_t; dew:PL_DEWARP):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpaRead(filename:Pchar):PL_DEWARPA;cdecl;external;
function dewarpaReadStream(fp:PFILE):PL_DEWARPA;cdecl;external;
(* Const before type ignored *)
function dewarpaReadMem(data:Pl_uint8; size:Tsize_t):PL_DEWARPA;cdecl;external;
(* Const before type ignored *)
function dewarpaWrite(filename:Pchar; dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaWriteStream(fp:PFILE; dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaWriteMem(pdata:PPl_uint8; psize:Psize_t; dewa:PL_DEWARPA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpBuildPageModel(dew:PL_DEWARP; debugfile:Pchar):Tl_ok;cdecl;external;
function dewarpFindVertDisparity(dew:PL_DEWARP; ptaa:PPTAA; rotflag:Tl_int32):Tl_ok;cdecl;external;
function dewarpFindHorizDisparity(dew:PL_DEWARP; ptaa:PPTAA):Tl_ok;cdecl;external;
function dewarpGetTextlineCenters(pixs:PPIX; debugflag:Tl_int32):PPTAA;cdecl;external;
function dewarpRemoveShortLines(pixs:PPIX; ptaas:PPTAA; fract:Tl_float32; debugflag:Tl_int32):PPTAA;cdecl;external;
function dewarpFindHorizSlopeDisparity(dew:PL_DEWARP; pixb:PPIX; fractthresh:Tl_float32; parity:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpBuildLineModel(dew:PL_DEWARP; opensize:Tl_int32; debugfile:Pchar):Tl_ok;cdecl;external;
function dewarpaModelStatus(dewa:PL_DEWARPA; pageno:Tl_int32; pvsuccess:Pl_int32; phsuccess:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpaApplyDisparity(dewa:PL_DEWARPA; pageno:Tl_int32; pixs:PPIX; grayin:Tl_int32; x:Tl_int32; 
           y:Tl_int32; ppixd:PPPIX; debugfile:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpaApplyDisparityBoxa(dewa:PL_DEWARPA; pageno:Tl_int32; pixs:PPIX; boxas:PBOXA; mapdir:Tl_int32; 
           x:Tl_int32; y:Tl_int32; pboxad:PPBOXA; debugfile:Pchar):Tl_ok;cdecl;external;
function dewarpMinimize(dew:PL_DEWARP):Tl_ok;cdecl;external;
function dewarpPopulateFullRes(dew:PL_DEWARP; pix:PPIX; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function dewarpSinglePage(pixs:PPIX; thresh:Tl_int32; adaptive:Tl_int32; useboth:Tl_int32; check_columns:Tl_int32; 
           ppixd:PPPIX; pdewa:PPL_DEWARPA; debug:Tl_int32):Tl_ok;cdecl;external;
function dewarpSinglePageInit(pixs:PPIX; thresh:Tl_int32; adaptive:Tl_int32; useboth:Tl_int32; check_columns:Tl_int32; 
           ppixb:PPPIX; pdewa:PPL_DEWARPA):Tl_ok;cdecl;external;
function dewarpSinglePageRun(pixs:PPIX; pixb:PPIX; dewa:PL_DEWARPA; ppixd:PPPIX; debug:Tl_int32):Tl_ok;cdecl;external;
function dewarpaListPages(dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaSetValidModels(dewa:PL_DEWARPA; notests:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function dewarpaInsertRefModels(dewa:PL_DEWARPA; notests:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function dewarpaStripRefModels(dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaRestoreModels(dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaInfo(fp:PFILE; dewa:PL_DEWARPA):Tl_ok;cdecl;external;
function dewarpaModelStats(dewa:PL_DEWARPA; pnnone:Pl_int32; pnvsuccess:Pl_int32; pnvvalid:Pl_int32; pnhsuccess:Pl_int32; 
           pnhvalid:Pl_int32; pnref:Pl_int32):Tl_ok;cdecl;external;
function dewarpaShowArrays(dewa:PL_DEWARPA; scalefact:Tl_float32; first:Tl_int32; last:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpDebug(dew:PL_DEWARP; subdirs:Pchar; index:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function dewarpShowResults(dewa:PL_DEWARPA; sa:PSARRAY; boxa:PBOXA; firstpage:Tl_int32; lastpage:Tl_int32; 
           pdfout:Pchar):Tl_ok;cdecl;external;
function l_dnaCreate(n:Tl_int32):PL_DNA;cdecl;external;
function l_dnaCreateFromIArray(iarray:Pl_int32; size:Tl_int32):PL_DNA;cdecl;external;
function l_dnaCreateFromDArray(darray:Pl_float64; size:Tl_int32; copyflag:Tl_int32):PL_DNA;cdecl;external;
function l_dnaMakeSequence(startval:Tl_float64; increment:Tl_float64; size:Tl_int32):PL_DNA;cdecl;external;
procedure l_dnaDestroy(pda:PPL_DNA);cdecl;external;
function l_dnaCopy(da:PL_DNA):PL_DNA;cdecl;external;
function l_dnaClone(da:PL_DNA):PL_DNA;cdecl;external;
function l_dnaEmpty(da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaAddNumber(da:PL_DNA; val:Tl_float64):Tl_ok;cdecl;external;
function l_dnaInsertNumber(da:PL_DNA; index:Tl_int32; val:Tl_float64):Tl_ok;cdecl;external;
function l_dnaRemoveNumber(da:PL_DNA; index:Tl_int32):Tl_ok;cdecl;external;
function l_dnaReplaceNumber(da:PL_DNA; index:Tl_int32; val:Tl_float64):Tl_ok;cdecl;external;
function l_dnaGetCount(da:PL_DNA):Tl_int32;cdecl;external;
function l_dnaSetCount(da:PL_DNA; newcount:Tl_int32):Tl_ok;cdecl;external;
function l_dnaGetDValue(da:PL_DNA; index:Tl_int32; pval:Pl_float64):Tl_ok;cdecl;external;
function l_dnaGetIValue(da:PL_DNA; index:Tl_int32; pival:Pl_int32):Tl_ok;cdecl;external;
function l_dnaSetValue(da:PL_DNA; index:Tl_int32; val:Tl_float64):Tl_ok;cdecl;external;
function l_dnaShiftValue(da:PL_DNA; index:Tl_int32; diff:Tl_float64):Tl_ok;cdecl;external;
function l_dnaGetIArray(da:PL_DNA):Pl_int32;cdecl;external;
function l_dnaGetDArray(da:PL_DNA; copyflag:Tl_int32):Pl_float64;cdecl;external;
function l_dnaGetRefcount(da:PL_DNA):Tl_int32;cdecl;external;
function l_dnaChangeRefcount(da:PL_DNA; delta:Tl_int32):Tl_ok;cdecl;external;
function l_dnaGetParameters(da:PL_DNA; pstartx:Pl_float64; pdelx:Pl_float64):Tl_ok;cdecl;external;
function l_dnaSetParameters(da:PL_DNA; startx:Tl_float64; delx:Tl_float64):Tl_ok;cdecl;external;
function l_dnaCopyParameters(dad:PL_DNA; das:PL_DNA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_dnaRead(filename:Pchar):PL_DNA;cdecl;external;
function l_dnaReadStream(fp:PFILE):PL_DNA;cdecl;external;
(* Const before type ignored *)
function l_dnaReadMem(data:Pl_uint8; size:Tsize_t):PL_DNA;cdecl;external;
(* Const before type ignored *)
function l_dnaWrite(filename:Pchar; da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaWriteStream(fp:PFILE; da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaWriteStderr(da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaWriteMem(pdata:PPl_uint8; psize:Psize_t; da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaaCreate(n:Tl_int32):PL_DNAA;cdecl;external;
function l_dnaaCreateFull(nptr:Tl_int32; n:Tl_int32):PL_DNAA;cdecl;external;
function l_dnaaTruncate(daa:PL_DNAA):Tl_ok;cdecl;external;
procedure l_dnaaDestroy(pdaa:PPL_DNAA);cdecl;external;
function l_dnaaAddDna(daa:PL_DNAA; da:PL_DNA; copyflag:Tl_int32):Tl_ok;cdecl;external;
function l_dnaaGetCount(daa:PL_DNAA):Tl_int32;cdecl;external;
function l_dnaaGetDnaCount(daa:PL_DNAA; index:Tl_int32):Tl_int32;cdecl;external;
function l_dnaaGetNumberCount(daa:PL_DNAA):Tl_int32;cdecl;external;
function l_dnaaGetDna(daa:PL_DNAA; index:Tl_int32; accessflag:Tl_int32):PL_DNA;cdecl;external;
function l_dnaaReplaceDna(daa:PL_DNAA; index:Tl_int32; da:PL_DNA):Tl_ok;cdecl;external;
function l_dnaaGetValue(daa:PL_DNAA; i:Tl_int32; j:Tl_int32; pval:Pl_float64):Tl_ok;cdecl;external;
function l_dnaaAddNumber(daa:PL_DNAA; index:Tl_int32; val:Tl_float64):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_dnaaRead(filename:Pchar):PL_DNAA;cdecl;external;
function l_dnaaReadStream(fp:PFILE):PL_DNAA;cdecl;external;
(* Const before type ignored *)
function l_dnaaReadMem(data:Pl_uint8; size:Tsize_t):PL_DNAA;cdecl;external;
(* Const before type ignored *)
function l_dnaaWrite(filename:Pchar; daa:PL_DNAA):Tl_ok;cdecl;external;
function l_dnaaWriteStream(fp:PFILE; daa:PL_DNAA):Tl_ok;cdecl;external;
function l_dnaaWriteMem(pdata:PPl_uint8; psize:Psize_t; daa:PL_DNAA):Tl_ok;cdecl;external;
function l_dnaJoin(dad:PL_DNA; das:PL_DNA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function l_dnaaFlattenToDna(daa:PL_DNAA):PL_DNA;cdecl;external;
function l_dnaSelectRange(das:PL_DNA; first:Tl_int32; last:Tl_int32):PL_DNA;cdecl;external;
function l_dnaConvertToNuma(da:PL_DNA):PNUMA;cdecl;external;
function numaConvertToDna(na:PNUMA):PL_DNA;cdecl;external;
function pixConvertDataToDna(pix:PPIX):PL_DNA;cdecl;external;
function l_asetCreateFromDna(da:PL_DNA):PL_ASET;cdecl;external;
function l_dnaRemoveDupsByAset(das:PL_DNA; pdad:PPL_DNA):Tl_ok;cdecl;external;
function l_dnaUnionByAset(da1:PL_DNA; da2:PL_DNA; pdad:PPL_DNA):Tl_ok;cdecl;external;
function l_dnaIntersectionByAset(da1:PL_DNA; da2:PL_DNA; pdad:PPL_DNA):Tl_ok;cdecl;external;
function l_hmapCreateFromDna(da:PL_DNA):PL_HASHMAP;cdecl;external;
function l_dnaRemoveDupsByHmap(das:PL_DNA; pdad:PPL_DNA; phmap:PPL_HASHMAP):Tl_ok;cdecl;external;
function l_dnaUnionByHmap(da1:PL_DNA; da2:PL_DNA; pdad:PPL_DNA):Tl_ok;cdecl;external;
function l_dnaIntersectionByHmap(da1:PL_DNA; da2:PL_DNA; pdad:PPL_DNA):Tl_ok;cdecl;external;
function l_dnaMakeHistoByHmap(das:PL_DNA; pdav:PPL_DNA; pdac:PPL_DNA):Tl_ok;cdecl;external;
function l_dnaDiffAdjValues(das:PL_DNA):PL_DNA;cdecl;external;
function l_dnaHashCreate(nbuckets:Tl_int32; initsize:Tl_int32):PL_DNAHASH;cdecl;external;
procedure l_dnaHashDestroy(pdahash:PPL_DNAHASH);cdecl;external;
function l_dnaHashGetDna(dahash:PL_DNAHASH; key:Tl_uint64; copyflag:Tl_int32):PL_DNA;cdecl;external;
function l_dnaHashAdd(dahash:PL_DNAHASH; key:Tl_uint64; value:Tl_float64):Tl_ok;cdecl;external;
function pixMorphDwa_2(pixd:PPIX; pixs:PPIX; operation:Tl_int32; selname:Pchar):PPIX;cdecl;external;
function pixFMorphopGen_2(pixd:PPIX; pixs:PPIX; operation:Tl_int32; selname:Pchar):PPIX;cdecl;external;
function fmorphopgen_low_2(datad:Pl_uint32; w:Tl_int32; h:Tl_int32; wpld:Tl_int32; datas:Pl_uint32; 
           wpls:Tl_int32; index:Tl_int32):Tl_int32;cdecl;external;
function pixSobelEdgeFilter(pixs:PPIX; orientflag:Tl_int32):PPIX;cdecl;external;
function pixTwoSidedEdgeFilter(pixs:PPIX; orientflag:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMeasureEdgeSmoothness(pixs:PPIX; side:Tl_int32; minjump:Tl_int32; minreversal:Tl_int32; pjpl:Pl_float32; 
           pjspl:Pl_float32; prpl:Pl_float32; debugfile:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixGetEdgeProfile(pixs:PPIX; side:Tl_int32; debugfile:Pchar):PNUMA;cdecl;external;
function pixGetLastOffPixelInRun(pixs:PPIX; x:Tl_int32; y:Tl_int32; direction:Tl_int32; ploc:Pl_int32):Tl_ok;cdecl;external;
function pixGetLastOnPixelInRun(pixs:PPIX; x:Tl_int32; y:Tl_int32; direction:Tl_int32; ploc:Pl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function encodeBase64(inarray:Pl_uint8; insize:Tl_int32; poutsize:Pl_int32):Pchar;cdecl;external;
(* Const before type ignored *)
function decodeBase64(inarray:Pchar; insize:Tl_int32; poutsize:Pl_int32):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function encodeAscii85(inarray:Pl_uint8; insize:Tsize_t; poutsize:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function decodeAscii85(inarray:Pchar; insize:Tsize_t; poutsize:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function encodeAscii85WithComp(indata:Pl_uint8; insize:Tsize_t; poutsize:Psize_t):Pchar;cdecl;external;
(* Const before type ignored *)
function decodeAscii85WithComp(instr:Pchar; insize:Tsize_t; poutsize:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function reformatPacked64(inarray:Pchar; insize:Tl_int32; leadspace:Tl_int32; linechars:Tl_int32; addquotes:Tl_int32; 
           poutsize:Pl_int32):Pchar;cdecl;external;
function pixGammaTRC(pixd:PPIX; pixs:PPIX; gamma:Tl_float32; minval:Tl_int32; maxval:Tl_int32):PPIX;cdecl;external;
function pixGammaTRCMasked(pixd:PPIX; pixs:PPIX; pixm:PPIX; gamma:Tl_float32; minval:Tl_int32; 
           maxval:Tl_int32):PPIX;cdecl;external;
function pixGammaTRCWithAlpha(pixd:PPIX; pixs:PPIX; gamma:Tl_float32; minval:Tl_int32; maxval:Tl_int32):PPIX;cdecl;external;
function numaGammaTRC(gamma:Tl_float32; minval:Tl_int32; maxval:Tl_int32):PNUMA;cdecl;external;
function pixContrastTRC(pixd:PPIX; pixs:PPIX; factor:Tl_float32):PPIX;cdecl;external;
function pixContrastTRCMasked(pixd:PPIX; pixs:PPIX; pixm:PPIX; factor:Tl_float32):PPIX;cdecl;external;
function numaContrastTRC(factor:Tl_float32):PNUMA;cdecl;external;
function pixEqualizeTRC(pixd:PPIX; pixs:PPIX; fract:Tl_float32; factor:Tl_int32):PPIX;cdecl;external;
function numaEqualizeTRC(pix:PPIX; fract:Tl_float32; factor:Tl_int32):PNUMA;cdecl;external;
function pixTRCMap(pixs:PPIX; pixm:PPIX; na:PNUMA):Tl_int32;cdecl;external;
function pixTRCMapGeneral(pixs:PPIX; pixm:PPIX; nar:PNUMA; nag:PNUMA; nab:PNUMA):Tl_int32;cdecl;external;
function pixUnsharpMasking(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32):PPIX;cdecl;external;
function pixUnsharpMaskingGray(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32):PPIX;cdecl;external;
function pixUnsharpMaskingFast(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32; direction:Tl_int32):PPIX;cdecl;external;
function pixUnsharpMaskingGrayFast(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32; direction:Tl_int32):PPIX;cdecl;external;
function pixUnsharpMaskingGray1D(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32; direction:Tl_int32):PPIX;cdecl;external;
function pixUnsharpMaskingGray2D(pixs:PPIX; halfwidth:Tl_int32; fract:Tl_float32):PPIX;cdecl;external;
function pixModifyHue(pixd:PPIX; pixs:PPIX; fract:Tl_float32):PPIX;cdecl;external;
function pixModifySaturation(pixd:PPIX; pixs:PPIX; fract:Tl_float32):PPIX;cdecl;external;
function pixMeasureSaturation(pixs:PPIX; factor:Tl_int32; psat:Pl_float32):Tl_int32;cdecl;external;
function pixModifyBrightness(pixd:PPIX; pixs:PPIX; fract:Tl_float32):PPIX;cdecl;external;
function pixMosaicColorShiftRGB(pixs:PPIX; roff:Tl_float32; goff:Tl_float32; boff:Tl_float32; delta:Tl_float32; 
           nincr:Tl_int32):PPIX;cdecl;external;
function pixColorShiftRGB(pixs:PPIX; rfract:Tl_float32; gfract:Tl_float32; bfract:Tl_float32):PPIX;cdecl;external;
function pixDarkenGray(pixd:PPIX; pixs:PPIX; thresh:Tl_int32; satlimit:Tl_int32):PPIX;cdecl;external;
function pixMultConstantColor(pixs:PPIX; rfact:Tl_float32; gfact:Tl_float32; bfact:Tl_float32):PPIX;cdecl;external;
function pixMultMatrixColor(pixs:PPIX; kel:PL_KERNEL):PPIX;cdecl;external;
function pixHalfEdgeByBandpass(pixs:PPIX; sm1h:Tl_int32; sm1v:Tl_int32; sm2h:Tl_int32; sm2v:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function fhmtautogen(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fhmtautogen1(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fhmtautogen2(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixHMTDwa_1(pixd:PPIX; pixs:PPIX; selname:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
function pixFHMTGen_1(pixd:PPIX; pixs:PPIX; selname:Pchar):PPIX;cdecl;external;
function fhmtgen_low_1(datad:Pl_uint32; w:Tl_int32; h:Tl_int32; wpld:Tl_int32; datas:Pl_uint32; 
           wpls:Tl_int32; index:Tl_int32):Tl_int32;cdecl;external;
function pixItalicWords(pixs:PPIX; boxaw:PBOXA; pixw:PPIX; pboxa:PPBOXA; debugflag:Tl_int32):Tl_ok;cdecl;external;
function pixOrientCorrect(pixs:PPIX; minupconf:Tl_float32; minratio:Tl_float32; pupconf:Pl_float32; pleftconf:Pl_float32; 
           protation:Pl_int32; debug:Tl_int32):PPIX;cdecl;external;
function pixOrientDetect(pixs:PPIX; pupconf:Pl_float32; pleftconf:Pl_float32; mincount:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function makeOrientDecision(upconf:Tl_float32; leftconf:Tl_float32; minupconf:Tl_float32; minratio:Tl_float32; porient:Pl_int32; 
           debug:Tl_int32):Tl_ok;cdecl;external;
function pixUpDownDetect(pixs:PPIX; pconf:Pl_float32; mincount:Tl_int32; npixels:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
function pixMirrorDetect(pixs:PPIX; pconf:Pl_float32; mincount:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fmorphautogen(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fmorphautogen1(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fmorphautogen2(sela:PSELA; fileindex:Tl_int32; filename:Pchar):Tl_int32;cdecl;external;
function pixMorphDwa_1(pixd:PPIX; pixs:PPIX; operation:Tl_int32; selname:Pchar):PPIX;cdecl;external;
function pixFMorphopGen_1(pixd:PPIX; pixs:PPIX; operation:Tl_int32; selname:Pchar):PPIX;cdecl;external;
function fmorphopgen_low_1(datad:Pl_uint32; w:Tl_int32; h:Tl_int32; wpld:Tl_int32; datas:Pl_uint32; 
           wpls:Tl_int32; index:Tl_int32):Tl_int32;cdecl;external;
function fpixCreate(width:Tl_int32; height:Tl_int32):PFPIX;cdecl;external;
function fpixCreateTemplate(fpixs:PFPIX):PFPIX;cdecl;external;
function fpixClone(fpix:PFPIX):PFPIX;cdecl;external;
function fpixCopy(fpixs:PFPIX):PFPIX;cdecl;external;
procedure fpixDestroy(pfpix:PPFPIX);cdecl;external;
function fpixGetDimensions(fpix:PFPIX; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function fpixSetDimensions(fpix:PFPIX; w:Tl_int32; h:Tl_int32):Tl_ok;cdecl;external;
function fpixGetWpl(fpix:PFPIX):Tl_int32;cdecl;external;
function fpixSetWpl(fpix:PFPIX; wpl:Tl_int32):Tl_ok;cdecl;external;
function fpixGetRefcount(fpix:PFPIX):Tl_int32;cdecl;external;
function fpixChangeRefcount(fpix:PFPIX; delta:Tl_int32):Tl_ok;cdecl;external;
function fpixGetResolution(fpix:PFPIX; pxres:Pl_int32; pyres:Pl_int32):Tl_ok;cdecl;external;
function fpixSetResolution(fpix:PFPIX; xres:Tl_int32; yres:Tl_int32):Tl_ok;cdecl;external;
function fpixCopyResolution(fpixd:PFPIX; fpixs:PFPIX):Tl_ok;cdecl;external;
function fpixGetData(fpix:PFPIX):Pl_float32;cdecl;external;
function fpixSetData(fpix:PFPIX; data:Pl_float32):Tl_ok;cdecl;external;
function fpixGetPixel(fpix:PFPIX; x:Tl_int32; y:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function fpixSetPixel(fpix:PFPIX; x:Tl_int32; y:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function fpixaCreate(n:Tl_int32):PFPIXA;cdecl;external;
function fpixaCopy(fpixa:PFPIXA; copyflag:Tl_int32):PFPIXA;cdecl;external;
procedure fpixaDestroy(pfpixa:PPFPIXA);cdecl;external;
function fpixaAddFPix(fpixa:PFPIXA; fpix:PFPIX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function fpixaGetCount(fpixa:PFPIXA):Tl_int32;cdecl;external;
function fpixaChangeRefcount(fpixa:PFPIXA; delta:Tl_int32):Tl_ok;cdecl;external;
function fpixaGetFPix(fpixa:PFPIXA; index:Tl_int32; accesstype:Tl_int32):PFPIX;cdecl;external;
function fpixaGetFPixDimensions(fpixa:PFPIXA; index:Tl_int32; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function fpixaGetData(fpixa:PFPIXA; index:Tl_int32):Pl_float32;cdecl;external;
function fpixaGetPixel(fpixa:PFPIXA; index:Tl_int32; x:Tl_int32; y:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function fpixaSetPixel(fpixa:PFPIXA; index:Tl_int32; x:Tl_int32; y:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function dpixCreate(width:Tl_int32; height:Tl_int32):PDPIX;cdecl;external;
function dpixCreateTemplate(dpixs:PDPIX):PDPIX;cdecl;external;
function dpixClone(dpix:PDPIX):PDPIX;cdecl;external;
function dpixCopy(dpixs:PDPIX):PDPIX;cdecl;external;
procedure dpixDestroy(pdpix:PPDPIX);cdecl;external;
function dpixGetDimensions(dpix:PDPIX; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function dpixSetDimensions(dpix:PDPIX; w:Tl_int32; h:Tl_int32):Tl_ok;cdecl;external;
function dpixGetWpl(dpix:PDPIX):Tl_int32;cdecl;external;
function dpixSetWpl(dpix:PDPIX; wpl:Tl_int32):Tl_ok;cdecl;external;
function dpixGetRefcount(dpix:PDPIX):Tl_int32;cdecl;external;
function dpixChangeRefcount(dpix:PDPIX; delta:Tl_int32):Tl_ok;cdecl;external;
function dpixGetResolution(dpix:PDPIX; pxres:Pl_int32; pyres:Pl_int32):Tl_ok;cdecl;external;
function dpixSetResolution(dpix:PDPIX; xres:Tl_int32; yres:Tl_int32):Tl_ok;cdecl;external;
function dpixCopyResolution(dpixd:PDPIX; dpixs:PDPIX):Tl_ok;cdecl;external;
function dpixGetData(dpix:PDPIX):Pl_float64;cdecl;external;
function dpixSetData(dpix:PDPIX; data:Pl_float64):Tl_ok;cdecl;external;
function dpixGetPixel(dpix:PDPIX; x:Tl_int32; y:Tl_int32; pval:Pl_float64):Tl_ok;cdecl;external;
function dpixSetPixel(dpix:PDPIX; x:Tl_int32; y:Tl_int32; val:Tl_float64):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fpixRead(filename:Pchar):PFPIX;cdecl;external;
function fpixReadStream(fp:PFILE):PFPIX;cdecl;external;
(* Const before type ignored *)
function fpixReadMem(data:Pl_uint8; size:Tsize_t):PFPIX;cdecl;external;
(* Const before type ignored *)
function fpixWrite(filename:Pchar; fpix:PFPIX):Tl_ok;cdecl;external;
function fpixWriteStream(fp:PFILE; fpix:PFPIX):Tl_ok;cdecl;external;
function fpixWriteMem(pdata:PPl_uint8; psize:Psize_t; fpix:PFPIX):Tl_ok;cdecl;external;
function fpixEndianByteSwap(fpixd:PFPIX; fpixs:PFPIX):PFPIX;cdecl;external;
(* Const before type ignored *)
function dpixRead(filename:Pchar):PDPIX;cdecl;external;
function dpixReadStream(fp:PFILE):PDPIX;cdecl;external;
(* Const before type ignored *)
function dpixReadMem(data:Pl_uint8; size:Tsize_t):PDPIX;cdecl;external;
(* Const before type ignored *)
function dpixWrite(filename:Pchar; dpix:PDPIX):Tl_ok;cdecl;external;
function dpixWriteStream(fp:PFILE; dpix:PDPIX):Tl_ok;cdecl;external;
function dpixWriteMem(pdata:PPl_uint8; psize:Psize_t; dpix:PDPIX):Tl_ok;cdecl;external;
function dpixEndianByteSwap(dpixd:PDPIX; dpixs:PDPIX):PDPIX;cdecl;external;
function fpixPrintStream(fp:PFILE; fpix:PFPIX; factor:Tl_int32):Tl_ok;cdecl;external;
function pixConvertToFPix(pixs:PPIX; ncomps:Tl_int32):PFPIX;cdecl;external;
function pixConvertToDPix(pixs:PPIX; ncomps:Tl_int32):PDPIX;cdecl;external;
function fpixConvertToPix(fpixs:PFPIX; outdepth:Tl_int32; negvals:Tl_int32; errorflag:Tl_int32):PPIX;cdecl;external;
function fpixDisplayMaxDynamicRange(fpixs:PFPIX):PPIX;cdecl;external;
function fpixConvertToDPix(fpix:PFPIX):PDPIX;cdecl;external;
function dpixConvertToPix(dpixs:PDPIX; outdepth:Tl_int32; negvals:Tl_int32; errorflag:Tl_int32):PPIX;cdecl;external;
function dpixConvertToFPix(dpix:PDPIX):PFPIX;cdecl;external;
function fpixGetMin(fpix:PFPIX; pminval:Pl_float32; pxminloc:Pl_int32; pyminloc:Pl_int32):Tl_ok;cdecl;external;
function fpixGetMax(fpix:PFPIX; pmaxval:Pl_float32; pxmaxloc:Pl_int32; pymaxloc:Pl_int32):Tl_ok;cdecl;external;
function dpixGetMin(dpix:PDPIX; pminval:Pl_float64; pxminloc:Pl_int32; pyminloc:Pl_int32):Tl_ok;cdecl;external;
function dpixGetMax(dpix:PDPIX; pmaxval:Pl_float64; pxmaxloc:Pl_int32; pymaxloc:Pl_int32):Tl_ok;cdecl;external;
function fpixScaleByInteger(fpixs:PFPIX; factor:Tl_int32):PFPIX;cdecl;external;
function dpixScaleByInteger(dpixs:PDPIX; factor:Tl_int32):PDPIX;cdecl;external;
function fpixLinearCombination(fpixd:PFPIX; fpixs1:PFPIX; fpixs2:PFPIX; a:Tl_float32; b:Tl_float32):PFPIX;cdecl;external;
function fpixAddMultConstant(fpix:PFPIX; addc:Tl_float32; multc:Tl_float32):Tl_ok;cdecl;external;
function dpixLinearCombination(dpixd:PDPIX; dpixs1:PDPIX; dpixs2:PDPIX; a:Tl_float32; b:Tl_float32):PDPIX;cdecl;external;
function dpixAddMultConstant(dpix:PDPIX; addc:Tl_float64; multc:Tl_float64):Tl_ok;cdecl;external;
function fpixSetAllArbitrary(fpix:PFPIX; inval:Tl_float32):Tl_ok;cdecl;external;
function dpixSetAllArbitrary(dpix:PDPIX; inval:Tl_float64):Tl_ok;cdecl;external;
function fpixAddBorder(fpixs:PFPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PFPIX;cdecl;external;
function fpixRemoveBorder(fpixs:PFPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PFPIX;cdecl;external;
function fpixAddMirroredBorder(fpixs:PFPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PFPIX;cdecl;external;
function fpixAddContinuedBorder(fpixs:PFPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PFPIX;cdecl;external;
function fpixAddSlopeBorder(fpixs:PFPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PFPIX;cdecl;external;
function fpixRasterop(fpixd:PFPIX; dx:Tl_int32; dy:Tl_int32; dw:Tl_int32; dh:Tl_int32; 
           fpixs:PFPIX; sx:Tl_int32; sy:Tl_int32):Tl_ok;cdecl;external;
function fpixRotateOrth(fpixs:PFPIX; quads:Tl_int32):PFPIX;cdecl;external;
function fpixRotate180(fpixd:PFPIX; fpixs:PFPIX):PFPIX;cdecl;external;
function fpixRotate90(fpixs:PFPIX; direction:Tl_int32):PFPIX;cdecl;external;
function fpixFlipLR(fpixd:PFPIX; fpixs:PFPIX):PFPIX;cdecl;external;
function fpixFlipTB(fpixd:PFPIX; fpixs:PFPIX):PFPIX;cdecl;external;
function fpixAffinePta(fpixs:PFPIX; ptad:PPTA; ptas:PPTA; border:Tl_int32; inval:Tl_float32):PFPIX;cdecl;external;
function fpixAffine(fpixs:PFPIX; vc:Pl_float32; inval:Tl_float32):PFPIX;cdecl;external;
function fpixProjectivePta(fpixs:PFPIX; ptad:PPTA; ptas:PPTA; border:Tl_int32; inval:Tl_float32):PFPIX;cdecl;external;
function fpixProjective(fpixs:PFPIX; vc:Pl_float32; inval:Tl_float32):PFPIX;cdecl;external;
function linearInterpolatePixelFloat(datas:Pl_float32; w:Tl_int32; h:Tl_int32; x:Tl_float32; y:Tl_float32; 
           inval:Tl_float32; pval:Pl_float32):Tl_ok;cdecl;external;
function fpixThresholdToPix(fpix:PFPIX; thresh:Tl_float32):PPIX;cdecl;external;
function pixComponentFunction(pix:PPIX; rnum:Tl_float32; gnum:Tl_float32; bnum:Tl_float32; rdenom:Tl_float32; 
           gdenom:Tl_float32; bdenom:Tl_float32):PFPIX;cdecl;external;
function pixReadStreamGif(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadMemGif(cdata:Pl_uint8; size:Tsize_t):PPIX;cdecl;external;
function pixWriteStreamGif(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteMemGif(pdata:PPl_uint8; psize:Psize_t; pix:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gplotCreate(rootname:Pchar; outformat:Tl_int32; title:Pchar; xlabel:Pchar; ylabel:Pchar):PGPLOT;cdecl;external;
procedure gplotDestroy(pgplot:PPGPLOT);cdecl;external;
(* Const before type ignored *)
function gplotAddPlot(gplot:PGPLOT; nax:PNUMA; nay:PNUMA; plotstyle:Tl_int32; plotlabel:Pchar):Tl_ok;cdecl;external;
function gplotSetScaling(gplot:PGPLOT; scaling:Tl_int32):Tl_ok;cdecl;external;
function gplotMakeOutputPix(gplot:PGPLOT):PPIX;cdecl;external;
function gplotMakeOutput(gplot:PGPLOT):Tl_ok;cdecl;external;
function gplotGenCommandFile(gplot:PGPLOT):Tl_ok;cdecl;external;
function gplotGenDataFiles(gplot:PGPLOT):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimple1(na:PNUMA; outformat:Tl_int32; outroot:Pchar; title:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimple2(na1:PNUMA; na2:PNUMA; outformat:Tl_int32; outroot:Pchar; title:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimpleN(naa:PNUMAA; outformat:Tl_int32; outroot:Pchar; title:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function gplotSimplePix1(na:PNUMA; title:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
function gplotSimplePix2(na1:PNUMA; na2:PNUMA; title:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
function gplotSimplePixN(naa:PNUMAA; title:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimpleXY1(nax:PNUMA; nay:PNUMA; plotstyle:Tl_int32; outformat:Tl_int32; outroot:Pchar; 
           title:Pchar):PGPLOT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimpleXY2(nax:PNUMA; nay1:PNUMA; nay2:PNUMA; plotstyle:Tl_int32; outformat:Tl_int32; 
           outroot:Pchar; title:Pchar):PGPLOT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function gplotSimpleXYN(nax:PNUMA; naay:PNUMAA; plotstyle:Tl_int32; outformat:Tl_int32; outroot:Pchar; 
           title:Pchar):PGPLOT;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gplotGeneralPix1(na:PNUMA; plotstyle:Tl_int32; rootname:Pchar; title:Pchar; xlabel:Pchar; 
           ylabel:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gplotGeneralPix2(na1:PNUMA; na2:PNUMA; plotstyle:Tl_int32; rootname:Pchar; title:Pchar; 
           xlabel:Pchar; ylabel:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gplotGeneralPixN(nax:PNUMA; naay:PNUMAA; plotstyle:Tl_int32; rootname:Pchar; title:Pchar; 
           xlabel:Pchar; ylabel:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
function gplotRead(filename:Pchar):PGPLOT;cdecl;external;
(* Const before type ignored *)
function gplotWrite(filename:Pchar; gplot:PGPLOT):Tl_ok;cdecl;external;
function generatePtaLine(x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32):PPTA;cdecl;external;
function generatePtaWideLine(x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; width:Tl_int32):PPTA;cdecl;external;
function generatePtaBox(box:PBOX; width:Tl_int32):PPTA;cdecl;external;
function generatePtaBoxa(boxa:PBOXA; width:Tl_int32; removedups:Tl_int32):PPTA;cdecl;external;
function generatePtaHashBox(box:PBOX; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; outline:Tl_int32):PPTA;cdecl;external;
function generatePtaHashBoxa(boxa:PBOXA; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; outline:Tl_int32; 
           removedups:Tl_int32):PPTA;cdecl;external;
function generatePtaaBoxa(boxa:PBOXA):PPTAA;cdecl;external;
function generatePtaaHashBoxa(boxa:PBOXA; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; outline:Tl_int32):PPTAA;cdecl;external;
function generatePtaPolyline(ptas:PPTA; width:Tl_int32; closeflag:Tl_int32; removedups:Tl_int32):PPTA;cdecl;external;
function generatePtaGrid(w:Tl_int32; h:Tl_int32; nx:Tl_int32; ny:Tl_int32; width:Tl_int32):PPTA;cdecl;external;
function convertPtaLineTo4cc(ptas:PPTA):PPTA;cdecl;external;
function generatePtaFilledCircle(radius:Tl_int32):PPTA;cdecl;external;
function generatePtaFilledSquare(side:Tl_int32):PPTA;cdecl;external;
function generatePtaLineFromPt(x:Tl_int32; y:Tl_int32; length:Tl_float64; radang:Tl_float64):PPTA;cdecl;external;
function locatePtRadially(xr:Tl_int32; yr:Tl_int32; dist:Tl_float64; radang:Tl_float64; px:Pl_float64; 
           py:Pl_float64):Tl_ok;cdecl;external;
function pixRenderPlotFromNuma(ppix:PPPIX; na:PNUMA; plotloc:Tl_int32; linewidth:Tl_int32; max:Tl_int32; 
           color:Tl_uint32):Tl_ok;cdecl;external;
function makePlotPtaFromNuma(na:PNUMA; size:Tl_int32; plotloc:Tl_int32; linewidth:Tl_int32; max:Tl_int32):PPTA;cdecl;external;
function pixRenderPlotFromNumaGen(ppix:PPPIX; na:PNUMA; orient:Tl_int32; linewidth:Tl_int32; refpos:Tl_int32; 
           max:Tl_int32; drawref:Tl_int32; color:Tl_uint32):Tl_ok;cdecl;external;
function makePlotPtaFromNumaGen(na:PNUMA; orient:Tl_int32; linewidth:Tl_int32; refpos:Tl_int32; max:Tl_int32; 
           drawref:Tl_int32):PPTA;cdecl;external;
function pixRenderPta(pix:PPIX; pta:PPTA; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderPtaArb(pix:PPIX; pta:PPTA; rval:Tl_uint8; gval:Tl_uint8; bval:Tl_uint8):Tl_ok;cdecl;external;
function pixRenderPtaBlend(pix:PPIX; pta:PPTA; rval:Tl_uint8; gval:Tl_uint8; bval:Tl_uint8; 
           fract:Tl_float32):Tl_ok;cdecl;external;
function pixRenderLine(pix:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           width:Tl_int32; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderLineArb(pix:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; bval:Tl_uint8):Tl_ok;cdecl;external;
function pixRenderLineBlend(pix:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; bval:Tl_uint8; fract:Tl_float32):Tl_ok;cdecl;external;
function pixRenderBox(pix:PPIX; box:PBOX; width:Tl_int32; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderBoxArb(pix:PPIX; box:PBOX; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8):Tl_ok;cdecl;external;
function pixRenderBoxBlend(pix:PPIX; box:PBOX; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8; fract:Tl_float32):Tl_ok;cdecl;external;
function pixRenderBoxa(pix:PPIX; boxa:PBOXA; width:Tl_int32; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderBoxaArb(pix:PPIX; boxa:PBOXA; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8):Tl_ok;cdecl;external;
function pixRenderBoxaBlend(pix:PPIX; boxa:PBOXA; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8; fract:Tl_float32; removedups:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBox(pix:PPIX; box:PBOX; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBoxArb(pix:PPIX; box:PBOX; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBoxBlend(pix:PPIX; box:PBOX; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; fract:Tl_float32):Tl_ok;cdecl;external;
function pixRenderHashMaskArb(pix:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; spacing:Tl_int32; 
           width:Tl_int32; orient:Tl_int32; outline:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBoxa(pix:PPIX; boxa:PBOXA; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; op:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBoxaArb(pix:PPIX; boxa:PBOXA; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixRenderHashBoxaBlend(pix:PPIX; boxa:PBOXA; spacing:Tl_int32; width:Tl_int32; orient:Tl_int32; 
           outline:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; fract:Tl_float32):Tl_ok;cdecl;external;
function pixRenderPolyline(pix:PPIX; ptas:PPTA; width:Tl_int32; op:Tl_int32; closeflag:Tl_int32):Tl_ok;cdecl;external;
function pixRenderPolylineArb(pix:PPIX; ptas:PPTA; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8; closeflag:Tl_int32):Tl_ok;cdecl;external;
function pixRenderPolylineBlend(pix:PPIX; ptas:PPTA; width:Tl_int32; rval:Tl_uint8; gval:Tl_uint8; 
           bval:Tl_uint8; fract:Tl_float32; closeflag:Tl_int32; removedups:Tl_int32):Tl_ok;cdecl;external;
function pixRenderGridArb(pix:PPIX; nx:Tl_int32; ny:Tl_int32; width:Tl_int32; rval:Tl_uint8; 
           gval:Tl_uint8; bval:Tl_uint8):Tl_ok;cdecl;external;
function pixRenderRandomCmapPtaa(pix:PPIX; ptaa:PPTAA; polyflag:Tl_int32; width:Tl_int32; closeflag:Tl_int32):PPIX;cdecl;external;
function pixRenderPolygon(ptas:PPTA; width:Tl_int32; pxmin:Pl_int32; pymin:Pl_int32):PPIX;cdecl;external;
function pixFillPolygon(pixs:PPIX; pta:PPTA; xmin:Tl_int32; ymin:Tl_int32):PPIX;cdecl;external;
function pixRenderContours(pixs:PPIX; startval:Tl_int32; incr:Tl_int32; outdepth:Tl_int32):PPIX;cdecl;external;
function fpixAutoRenderContours(fpix:PFPIX; ncontours:Tl_int32):PPIX;cdecl;external;
function fpixRenderContours(fpixs:PFPIX; incr:Tl_float32; proxim:Tl_float32):PPIX;cdecl;external;
function pixGeneratePtaBoundary(pixs:PPIX; width:Tl_int32):PPTA;cdecl;external;
function pixErodeGray(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixDilateGray(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenGray(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseGray(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeGray3(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixDilateGray3(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenGray3(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseGray3(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixDitherToBinary(pixs:PPIX):PPIX;cdecl;external;
function pixDitherToBinarySpec(pixs:PPIX; lowerclip:Tl_int32; upperclip:Tl_int32):PPIX;cdecl;external;
procedure ditherToBinaryLineLow(lined:Pl_uint32; w:Tl_int32; bufs1:Pl_uint32; bufs2:Pl_uint32; lowerclip:Tl_int32; 
            upperclip:Tl_int32; lastlineflag:Tl_int32);cdecl;external;
function pixThresholdToBinary(pixs:PPIX; thresh:Tl_int32):PPIX;cdecl;external;
procedure thresholdToBinaryLineLow(lined:Pl_uint32; w:Tl_int32; lines:Pl_uint32; d:Tl_int32; thresh:Tl_int32);cdecl;external;
function pixVarThresholdToBinary(pixs:PPIX; pixg:PPIX):PPIX;cdecl;external;
function pixAdaptThresholdToBinary(pixs:PPIX; pixm:PPIX; gamma:Tl_float32):PPIX;cdecl;external;
function pixAdaptThresholdToBinaryGen(pixs:PPIX; pixm:PPIX; gamma:Tl_float32; blackval:Tl_int32; whiteval:Tl_int32; 
           thresh:Tl_int32):PPIX;cdecl;external;
function pixGenerateMaskByValue(pixs:PPIX; val:Tl_int32; usecmap:Tl_int32):PPIX;cdecl;external;
function pixGenerateMaskByBand(pixs:PPIX; lower:Tl_int32; upper:Tl_int32; inband:Tl_int32; usecmap:Tl_int32):PPIX;cdecl;external;
function pixDitherTo2bpp(pixs:PPIX; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixDitherTo2bppSpec(pixs:PPIX; lowerclip:Tl_int32; upperclip:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixThresholdTo2bpp(pixs:PPIX; nlevels:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixThresholdTo4bpp(pixs:PPIX; nlevels:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixThresholdOn8bpp(pixs:PPIX; nlevels:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixThresholdGrayArb(pixs:PPIX; edgevals:Pchar; outdepth:Tl_int32; use_average:Tl_int32; setblack:Tl_int32; 
           setwhite:Tl_int32):PPIX;cdecl;external;
function makeGrayQuantIndexTable(nlevels:Tl_int32):Pl_int32;cdecl;external;
function makeGrayQuantTableArb(na:PNUMA; outdepth:Tl_int32; ptab:PPl_int32; pcmap:PPPIXCMAP):Tl_ok;cdecl;external;
function pixGenerateMaskByBand32(pixs:PPIX; refval:Tl_uint32; delm:Tl_int32; delp:Tl_int32; fractm:Tl_float32; 
           fractp:Tl_float32):PPIX;cdecl;external;
function pixGenerateMaskByDiscr32(pixs:PPIX; refval1:Tl_uint32; refval2:Tl_uint32; distflag:Tl_int32):PPIX;cdecl;external;
function pixGrayQuantFromHisto(pixd:PPIX; pixs:PPIX; pixm:PPIX; minfract:Tl_float32; maxsize:Tl_int32):PPIX;cdecl;external;
function pixGrayQuantFromCmap(pixs:PPIX; cmap:PPIXCMAP; mindepth:Tl_int32):PPIX;cdecl;external;
function l_hmapCreate(ninit:Tl_int32; maxocc:Tl_int32):PL_HASHMAP;cdecl;external;
procedure l_hmapDestroy(phmap:PPL_HASHMAP);cdecl;external;
function l_hmapLookup(hmap:PL_HASHMAP; key:Tl_uint64; val:Tl_uint64; op:Tl_int32):PL_HASHITEM;cdecl;external;
function l_hmapRehash(hmap:PL_HASHMAP):Tl_ok;cdecl;external;
function lheapCreate(n:Tl_int32; direction:Tl_int32):PL_HEAP;cdecl;external;
procedure lheapDestroy(plh:PPL_HEAP; freeflag:Tl_int32);cdecl;external;
function lheapAdd(lh:PL_HEAP; item:pointer):Tl_ok;cdecl;external;
function lheapRemove(lh:PL_HEAP):pointer;cdecl;external;
function lheapGetCount(lh:PL_HEAP):Tl_int32;cdecl;external;
function lheapGetElement(lh:PL_HEAP; index:Tl_int32):pointer;cdecl;external;
function lheapSort(lh:PL_HEAP):Tl_ok;cdecl;external;
function lheapSortStrictOrder(lh:PL_HEAP):Tl_ok;cdecl;external;
function lheapPrint(fp:PFILE; lh:PL_HEAP):Tl_ok;cdecl;external;
function jbRankHausInit(components:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; size:Tl_int32; rank:Tl_float32):PJBCLASSER;cdecl;external;
function jbCorrelationInit(components:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; thresh:Tl_float32; weightfactor:Tl_float32):PJBCLASSER;cdecl;external;
function jbCorrelationInitWithoutComponents(components:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; thresh:Tl_float32; weightfactor:Tl_float32):PJBCLASSER;cdecl;external;
function jbAddPages(classer:PJBCLASSER; safiles:PSARRAY):Tl_ok;cdecl;external;
function jbAddPage(classer:PJBCLASSER; pixs:PPIX):Tl_ok;cdecl;external;
function jbAddPageComponents(classer:PJBCLASSER; pixs:PPIX; boxas:PBOXA; pixas:PPIXA):Tl_ok;cdecl;external;
function jbClassifyRankHaus(classer:PJBCLASSER; boxa:PBOXA; pixas:PPIXA):Tl_ok;cdecl;external;
function pixHaustest(pix1:PPIX; pix2:PPIX; pix3:PPIX; pix4:PPIX; delx:Tl_float32; 
           dely:Tl_float32; maxdiffw:Tl_int32; maxdiffh:Tl_int32):Tl_int32;cdecl;external;
function pixRankHaustest(pix1:PPIX; pix2:PPIX; pix3:PPIX; pix4:PPIX; delx:Tl_float32; 
           dely:Tl_float32; maxdiffw:Tl_int32; maxdiffh:Tl_int32; area1:Tl_int32; area3:Tl_int32; 
           rank:Tl_float32; tab8:Pl_int32):Tl_int32;cdecl;external;
function jbClassifyCorrelation(classer:PJBCLASSER; boxa:PBOXA; pixas:PPIXA):Tl_ok;cdecl;external;
function jbGetComponents(pixs:PPIX; components:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; pboxad:PPBOXA; 
           ppixad:PPPIXA):Tl_ok;cdecl;external;
function pixWordMaskByDilation(pixs:PPIX; ppixm:PPPIX; psize:Pl_int32; pixadb:PPIXA):Tl_ok;cdecl;external;
function pixWordBoxesByDilation(pixs:PPIX; minwidth:Tl_int32; minheight:Tl_int32; maxwidth:Tl_int32; maxheight:Tl_int32; 
           pboxa:PPBOXA; psize:Pl_int32; pixadb:PPIXA):Tl_ok;cdecl;external;
function jbAccumulateComposites(pixaa:PPIXAA; pna:PPNUMA; pptat:PPPTA):PPIXA;cdecl;external;
function jbTemplatesFromComposites(pixac:PPIXA; na:PNUMA):PPIXA;cdecl;external;
function jbClasserCreate(method:Tl_int32; components:Tl_int32):PJBCLASSER;cdecl;external;
procedure jbClasserDestroy(pclasser:PPJBCLASSER);cdecl;external;
function jbDataSave(classer:PJBCLASSER):PJBDATA;cdecl;external;
procedure jbDataDestroy(pdata:PPJBDATA);cdecl;external;
(* Const before type ignored *)
function jbDataWrite(rootout:Pchar; jbdata:PJBDATA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function jbDataRead(rootname:Pchar):PJBDATA;cdecl;external;
function jbDataRender(data:PJBDATA; debugflag:Tl_int32):PPIXA;cdecl;external;
function jbGetULCorners(classer:PJBCLASSER; pixs:PPIX; boxa:PBOXA):Tl_ok;cdecl;external;
function jbGetLLCorners(classer:PJBCLASSER):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderJp2k(filename:Pchar; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           pcodec:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderJp2k(fp:PFILE; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           pcodec:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderMemJp2k(data:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; pcodec:Pl_int32):Tl_ok;cdecl;external;
function fgetJp2kResolution(fp:PFILE; pxres:Pl_int32; pyres:Pl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixReadJp2k(filename:Pchar; reduction:Tl_uint32; box:PBOX; hint:Tl_int32; debug:Tl_int32):PPIX;cdecl;external;
function pixReadStreamJp2k(fp:PFILE; reduction:Tl_uint32; box:PBOX; hint:Tl_int32; debug:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixWriteJp2k(filename:Pchar; pix:PPIX; quality:Tl_int32; nlevels:Tl_int32; hint:Tl_int32; 
           debug:Tl_int32):Tl_ok;cdecl;external;
function pixWriteStreamJp2k(fp:PFILE; pix:PPIX; quality:Tl_int32; nlevels:Tl_int32; codec:Tl_int32; 
           hint:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadMemJp2k(data:Pl_uint8; size:Tsize_t; reduction:Tl_uint32; box:PBOX; hint:Tl_int32; 
           debug:Tl_int32):PPIX;cdecl;external;
function pixWriteMemJp2k(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; quality:Tl_int32; nlevels:Tl_int32; 
           hint:Tl_int32; debug:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadJpeg(filename:Pchar; cmapflag:Tl_int32; reduction:Tl_int32; pnwarn:Pl_int32; hint:Tl_int32):PPIX;cdecl;external;
function pixReadStreamJpeg(fp:PFILE; cmapflag:Tl_int32; reduction:Tl_int32; pnwarn:Pl_int32; hint:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderJpeg(filename:Pchar; pw:Pl_int32; ph:Pl_int32; pspp:Pl_int32; pycck:Pl_int32; 
           pcmyk:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderJpeg(fp:PFILE; pw:Pl_int32; ph:Pl_int32; pspp:Pl_int32; pycck:Pl_int32; 
           pcmyk:Pl_int32):Tl_ok;cdecl;external;
function fgetJpegResolution(fp:PFILE; pxres:Pl_int32; pyres:Pl_int32):Tl_int32;cdecl;external;
function fgetJpegComment(fp:PFILE; pcomment:PPl_uint8):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixWriteJpeg(filename:Pchar; pix:PPIX; quality:Tl_int32; progressive:Tl_int32):Tl_ok;cdecl;external;
function pixWriteStreamJpeg(fp:PFILE; pixs:PPIX; quality:Tl_int32; progressive:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadMemJpeg(data:Pl_uint8; size:Tsize_t; cmflag:Tl_int32; reduction:Tl_int32; pnwarn:Pl_int32; 
           hint:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderMemJpeg(data:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32; pspp:Pl_int32; 
           pycck:Pl_int32; pcmyk:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readResolutionMemJpeg(data:Pl_uint8; size:Tsize_t; pxres:Pl_int32; pyres:Pl_int32):Tl_ok;cdecl;external;
function pixWriteMemJpeg(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; quality:Tl_int32; progressive:Tl_int32):Tl_ok;cdecl;external;
function pixSetChromaSampling(pix:PPIX; sampling:Tl_int32):Tl_ok;cdecl;external;
function kernelCreate(height:Tl_int32; width:Tl_int32):PL_KERNEL;cdecl;external;
procedure kernelDestroy(pkel:PPL_KERNEL);cdecl;external;
function kernelCopy(kels:PL_KERNEL):PL_KERNEL;cdecl;external;
function kernelGetElement(kel:PL_KERNEL; row:Tl_int32; col:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function kernelSetElement(kel:PL_KERNEL; row:Tl_int32; col:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function kernelGetParameters(kel:PL_KERNEL; psy:Pl_int32; psx:Pl_int32; pcy:Pl_int32; pcx:Pl_int32):Tl_ok;cdecl;external;
function kernelSetOrigin(kel:PL_KERNEL; cy:Tl_int32; cx:Tl_int32):Tl_ok;cdecl;external;
function kernelGetSum(kel:PL_KERNEL; psum:Pl_float32):Tl_ok;cdecl;external;
function kernelGetMinMax(kel:PL_KERNEL; pmin:Pl_float32; pmax:Pl_float32):Tl_ok;cdecl;external;
function kernelNormalize(kels:PL_KERNEL; normsum:Tl_float32):PL_KERNEL;cdecl;external;
function kernelInvert(kels:PL_KERNEL):PL_KERNEL;cdecl;external;
function create2dFloatArray(sy:Tl_int32; sx:Tl_int32):^Pl_float32;cdecl;external;
(* Const before type ignored *)
function kernelRead(fname:Pchar):PL_KERNEL;cdecl;external;
function kernelReadStream(fp:PFILE):PL_KERNEL;cdecl;external;
(* Const before type ignored *)
function kernelWrite(fname:Pchar; kel:PL_KERNEL):Tl_ok;cdecl;external;
function kernelWriteStream(fp:PFILE; kel:PL_KERNEL):Tl_ok;cdecl;external;
(* Const before type ignored *)
function kernelCreateFromString(h:Tl_int32; w:Tl_int32; cy:Tl_int32; cx:Tl_int32; kdata:Pchar):PL_KERNEL;cdecl;external;
(* Const before type ignored *)
function kernelCreateFromFile(filename:Pchar):PL_KERNEL;cdecl;external;
function kernelCreateFromPix(pix:PPIX; cy:Tl_int32; cx:Tl_int32):PL_KERNEL;cdecl;external;
function kernelDisplayInPix(kel:PL_KERNEL; size:Tl_int32; gthick:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function parseStringForNumbers(str:Pchar; seps:Pchar):PNUMA;cdecl;external;
function makeFlatKernel(height:Tl_int32; width:Tl_int32; cy:Tl_int32; cx:Tl_int32):PL_KERNEL;cdecl;external;
function makeGaussianKernel(halfh:Tl_int32; halfw:Tl_int32; stdev:Tl_float32; max:Tl_float32):PL_KERNEL;cdecl;external;
function makeGaussianKernelSep(halfh:Tl_int32; halfw:Tl_int32; stdev:Tl_float32; max:Tl_float32; pkelx:PPL_KERNEL; 
           pkely:PPL_KERNEL):Tl_ok;cdecl;external;
function makeDoGKernel(halfh:Tl_int32; halfw:Tl_int32; stdev:Tl_float32; ratio:Tl_float32):PL_KERNEL;cdecl;external;
function getImagelibVersions:Pchar;cdecl;external;
procedure listDestroy(phead:PPDLLIST);cdecl;external;
function listAddToHead(phead:PPDLLIST; data:pointer):Tl_ok;cdecl;external;
function listAddToTail(phead:PPDLLIST; ptail:PPDLLIST; data:pointer):Tl_ok;cdecl;external;
function listInsertBefore(phead:PPDLLIST; elem:PDLLIST; data:pointer):Tl_ok;cdecl;external;
function listInsertAfter(phead:PPDLLIST; elem:PDLLIST; data:pointer):Tl_ok;cdecl;external;
function listRemoveElement(phead:PPDLLIST; elem:PDLLIST):pointer;cdecl;external;
function listRemoveFromHead(phead:PPDLLIST):pointer;cdecl;external;
function listRemoveFromTail(phead:PPDLLIST; ptail:PPDLLIST):pointer;cdecl;external;
function listFindElement(head:PDLLIST; data:pointer):PDLLIST;cdecl;external;
function listFindTail(head:PDLLIST):PDLLIST;cdecl;external;
function listGetCount(head:PDLLIST):Tl_int32;cdecl;external;
function listReverse(phead:PPDLLIST):Tl_ok;cdecl;external;
function listJoin(phead1:PPDLLIST; phead2:PPDLLIST):Tl_ok;cdecl;external;
function l_amapCreate(keytype:Tl_int32):PL_AMAP;cdecl;external;
function l_amapFind(m:PL_AMAP; key:TRB_TYPE):PRB_TYPE;cdecl;external;
procedure l_amapInsert(m:PL_AMAP; key:TRB_TYPE; value:TRB_TYPE);cdecl;external;
procedure l_amapDelete(m:PL_AMAP; key:TRB_TYPE);cdecl;external;
procedure l_amapDestroy(pm:PPL_AMAP);cdecl;external;
function l_amapGetFirst(m:PL_AMAP):PL_AMAP_NODE;cdecl;external;
function l_amapGetNext(n:PL_AMAP_NODE):PL_AMAP_NODE;cdecl;external;
function l_amapGetLast(m:PL_AMAP):PL_AMAP_NODE;cdecl;external;
function l_amapGetPrev(n:PL_AMAP_NODE):PL_AMAP_NODE;cdecl;external;
function l_amapSize(m:PL_AMAP):Tl_int32;cdecl;external;
function l_asetCreate(keytype:Tl_int32):PL_ASET;cdecl;external;
function l_asetFind(s:PL_ASET; key:TRB_TYPE):PRB_TYPE;cdecl;external;
procedure l_asetInsert(s:PL_ASET; key:TRB_TYPE);cdecl;external;
procedure l_asetDelete(s:PL_ASET; key:TRB_TYPE);cdecl;external;
procedure l_asetDestroy(ps:PPL_ASET);cdecl;external;
function l_asetGetFirst(s:PL_ASET):PL_ASET_NODE;cdecl;external;
function l_asetGetNext(n:PL_ASET_NODE):PL_ASET_NODE;cdecl;external;
function l_asetGetLast(s:PL_ASET):PL_ASET_NODE;cdecl;external;
function l_asetGetPrev(n:PL_ASET_NODE):PL_ASET_NODE;cdecl;external;
function l_asetSize(s:PL_ASET):Tl_int32;cdecl;external;
function generateBinaryMaze(w:Tl_int32; h:Tl_int32; xi:Tl_int32; yi:Tl_int32; wallps:Tl_float32; 
           ranis:Tl_float32):PPIX;cdecl;external;
function pixSearchBinaryMaze(pixs:PPIX; xi:Tl_int32; yi:Tl_int32; xf:Tl_int32; yf:Tl_int32; 
           ppixd:PPPIX):PPTA;cdecl;external;
function pixSearchGrayMaze(pixs:PPIX; xi:Tl_int32; yi:Tl_int32; xf:Tl_int32; yf:Tl_int32; 
           ppixd:PPPIX):PPTA;cdecl;external;
function pixDilate(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixErode(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixHMT(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixOpen(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixClose(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixCloseSafe(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixOpenGeneralized(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixCloseGeneralized(pixd:PPIX; pixs:PPIX; sel:PSEL):PPIX;cdecl;external;
function pixDilateBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseSafeBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function selectComposableSels(size:Tl_int32; direction:Tl_int32; psel1:PPSEL; psel2:PPSEL):Tl_int32;cdecl;external;
function selectComposableSizes(size:Tl_int32; pfactor1:Pl_int32; pfactor2:Pl_int32):Tl_ok;cdecl;external;
function pixDilateCompBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeCompBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenCompBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseCompBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseSafeCompBrick(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
procedure resetMorphBoundaryCondition(bc:Tl_int32);cdecl;external;
function getMorphBorderPixelColor(_type:Tl_int32; depth:Tl_int32):Tl_uint32;cdecl;external;
function pixExtractBoundary(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMorphSequenceMasked(pixs:PPIX; pixm:PPIX; sequence:Pchar; dispsep:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMorphSequenceByComponent(pixs:PPIX; sequence:Pchar; connectivity:Tl_int32; minw:Tl_int32; minh:Tl_int32; 
           pboxa:PPBOXA):PPIX;cdecl;external;
(* Const before type ignored *)
function pixaMorphSequenceByComponent(pixas:PPIXA; sequence:Pchar; minw:Tl_int32; minh:Tl_int32):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixMorphSequenceByRegion(pixs:PPIX; pixm:PPIX; sequence:Pchar; connectivity:Tl_int32; minw:Tl_int32; 
           minh:Tl_int32; pboxa:PPBOXA):PPIX;cdecl;external;
(* Const before type ignored *)
function pixaMorphSequenceByRegion(pixs:PPIX; pixam:PPIXA; sequence:Pchar; minw:Tl_int32; minh:Tl_int32):PPIXA;cdecl;external;
function pixUnionOfMorphOps(pixs:PPIX; sela:PSELA; _type:Tl_int32):PPIX;cdecl;external;
function pixIntersectionOfMorphOps(pixs:PPIX; sela:PSELA; _type:Tl_int32):PPIX;cdecl;external;
function pixSelectiveConnCompFill(pixs:PPIX; connectivity:Tl_int32; minw:Tl_int32; minh:Tl_int32):PPIX;cdecl;external;
function pixRemoveMatchedPattern(pixs:PPIX; pixp:PPIX; pixe:PPIX; x0:Tl_int32; y0:Tl_int32; 
           dsize:Tl_int32):Tl_ok;cdecl;external;
function pixDisplayMatchedPattern(pixs:PPIX; pixp:PPIX; pixe:PPIX; x0:Tl_int32; y0:Tl_int32; 
           color:Tl_uint32; scale:Tl_float32; nlevels:Tl_int32):PPIX;cdecl;external;
function pixaExtendByMorph(pixas:PPIXA; _type:Tl_int32; niters:Tl_int32; sel:PSEL; include:Tl_int32):PPIXA;cdecl;external;
function pixaExtendByScaling(pixas:PPIXA; nasc:PNUMA; _type:Tl_int32; include:Tl_int32):PPIXA;cdecl;external;
function pixSeedfillMorph(pixs:PPIX; pixm:PPIX; maxiters:Tl_int32; connectivity:Tl_int32):PPIX;cdecl;external;
function pixRunHistogramMorph(pixs:PPIX; runtype:Tl_int32; direction:Tl_int32; maxsize:Tl_int32):PNUMA;cdecl;external;
function pixTophat(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixHDome(pixs:PPIX; height:Tl_int32; connectivity:Tl_int32):PPIX;cdecl;external;
function pixFastTophat(pixs:PPIX; xsize:Tl_int32; ysize:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixMorphGradient(pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32; smoothing:Tl_int32):PPIX;cdecl;external;
function pixaCentroids(pixa:PPIXA):PPTA;cdecl;external;
function pixCentroid(pix:PPIX; centtab:Pl_int32; sumtab:Pl_int32; pxave:Pl_float32; pyave:Pl_float32):Tl_ok;cdecl;external;
function pixDilateBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixDilateCompBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeCompBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenCompBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseCompBrickDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixDilateCompBrickExtendDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixErodeCompBrickExtendDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixOpenCompBrickExtendDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function pixCloseCompBrickExtendDwa(pixd:PPIX; pixs:PPIX; hsize:Tl_int32; vsize:Tl_int32):PPIX;cdecl;external;
function getExtendedCompositeParameters(size:Tl_int32; pn:Pl_int32; pextra:Pl_int32; pactualsize:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixMorphSequence(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMorphCompSequence(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMorphSequenceDwa(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixMorphCompSequenceDwa(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32):PPIX;cdecl;external;
function morphSequenceVerify(sa:PSARRAY):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGrayMorphSequence(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32; dispy:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixColorMorphSequence(pixs:PPIX; sequence:Pchar; dispsep:Tl_int32; dispy:Tl_int32):PPIX;cdecl;external;
function numaCreate(n:Tl_int32):PNUMA;cdecl;external;
function numaCreateFromIArray(iarray:Pl_int32; size:Tl_int32):PNUMA;cdecl;external;
function numaCreateFromFArray(farray:Pl_float32; size:Tl_int32; copyflag:Tl_int32):PNUMA;cdecl;external;
(* Const before type ignored *)
function numaCreateFromString(str:Pchar):PNUMA;cdecl;external;
procedure numaDestroy(pna:PPNUMA);cdecl;external;
function numaCopy(na:PNUMA):PNUMA;cdecl;external;
function numaClone(na:PNUMA):PNUMA;cdecl;external;
function numaEmpty(na:PNUMA):Tl_ok;cdecl;external;
function numaAddNumber(na:PNUMA; val:Tl_float32):Tl_ok;cdecl;external;
function numaInsertNumber(na:PNUMA; index:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function numaRemoveNumber(na:PNUMA; index:Tl_int32):Tl_ok;cdecl;external;
function numaReplaceNumber(na:PNUMA; index:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function numaGetCount(na:PNUMA):Tl_int32;cdecl;external;
function numaSetCount(na:PNUMA; newcount:Tl_int32):Tl_ok;cdecl;external;
function numaGetFValue(na:PNUMA; index:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function numaGetIValue(na:PNUMA; index:Tl_int32; pival:Pl_int32):Tl_ok;cdecl;external;
function numaSetValue(na:PNUMA; index:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function numaShiftValue(na:PNUMA; index:Tl_int32; diff:Tl_float32):Tl_ok;cdecl;external;
function numaGetIArray(na:PNUMA):Pl_int32;cdecl;external;
function numaGetFArray(na:PNUMA; copyflag:Tl_int32):Pl_float32;cdecl;external;
function numaGetRefcount(na:PNUMA):Tl_int32;cdecl;external;
function numaChangeRefcount(na:PNUMA; delta:Tl_int32):Tl_ok;cdecl;external;
function numaGetParameters(na:PNUMA; pstartx:Pl_float32; pdelx:Pl_float32):Tl_ok;cdecl;external;
function numaSetParameters(na:PNUMA; startx:Tl_float32; delx:Tl_float32):Tl_ok;cdecl;external;
function numaCopyParameters(nad:PNUMA; nas:PNUMA):Tl_ok;cdecl;external;
function numaConvertToSarray(na:PNUMA; size1:Tl_int32; size2:Tl_int32; addzeros:Tl_int32; _type:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function numaRead(filename:Pchar):PNUMA;cdecl;external;
function numaReadStream(fp:PFILE):PNUMA;cdecl;external;
(* Const before type ignored *)
function numaReadMem(data:Pl_uint8; size:Tsize_t):PNUMA;cdecl;external;
(* Const before type ignored *)
function numaWriteDebug(filename:Pchar; na:PNUMA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function numaWrite(filename:Pchar; na:PNUMA):Tl_ok;cdecl;external;
function numaWriteStream(fp:PFILE; na:PNUMA):Tl_ok;cdecl;external;
function numaWriteStderr(na:PNUMA):Tl_ok;cdecl;external;
function numaWriteMem(pdata:PPl_uint8; psize:Psize_t; na:PNUMA):Tl_ok;cdecl;external;
function numaaCreate(n:Tl_int32):PNUMAA;cdecl;external;
function numaaCreateFull(nptr:Tl_int32; n:Tl_int32):PNUMAA;cdecl;external;
function numaaTruncate(naa:PNUMAA):Tl_ok;cdecl;external;
procedure numaaDestroy(pnaa:PPNUMAA);cdecl;external;
function numaaAddNuma(naa:PNUMAA; na:PNUMA; copyflag:Tl_int32):Tl_ok;cdecl;external;
function numaaGetCount(naa:PNUMAA):Tl_int32;cdecl;external;
function numaaGetNumaCount(naa:PNUMAA; index:Tl_int32):Tl_int32;cdecl;external;
function numaaGetNumberCount(naa:PNUMAA):Tl_int32;cdecl;external;
function numaaGetPtrArray(naa:PNUMAA):^PNUMA;cdecl;external;
function numaaGetNuma(naa:PNUMAA; index:Tl_int32; accessflag:Tl_int32):PNUMA;cdecl;external;
function numaaReplaceNuma(naa:PNUMAA; index:Tl_int32; na:PNUMA):Tl_ok;cdecl;external;
function numaaGetValue(naa:PNUMAA; i:Tl_int32; j:Tl_int32; pfval:Pl_float32; pival:Pl_int32):Tl_ok;cdecl;external;
function numaaAddNumber(naa:PNUMAA; index:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function numaaRead(filename:Pchar):PNUMAA;cdecl;external;
function numaaReadStream(fp:PFILE):PNUMAA;cdecl;external;
(* Const before type ignored *)
function numaaReadMem(data:Pl_uint8; size:Tsize_t):PNUMAA;cdecl;external;
(* Const before type ignored *)
function numaaWrite(filename:Pchar; naa:PNUMAA):Tl_ok;cdecl;external;
function numaaWriteStream(fp:PFILE; naa:PNUMAA):Tl_ok;cdecl;external;
function numaaWriteMem(pdata:PPl_uint8; psize:Psize_t; naa:PNUMAA):Tl_ok;cdecl;external;
function numaArithOp(nad:PNUMA; na1:PNUMA; na2:PNUMA; op:Tl_int32):PNUMA;cdecl;external;
function numaLogicalOp(nad:PNUMA; na1:PNUMA; na2:PNUMA; op:Tl_int32):PNUMA;cdecl;external;
function numaInvert(nad:PNUMA; nas:PNUMA):PNUMA;cdecl;external;
function numaSimilar(na1:PNUMA; na2:PNUMA; maxdiff:Tl_float32; psimilar:Pl_int32):Tl_int32;cdecl;external;
function numaAddToNumber(na:PNUMA; index:Tl_int32; val:Tl_float32):Tl_ok;cdecl;external;
function numaGetMin(na:PNUMA; pminval:Pl_float32; piminloc:Pl_int32):Tl_ok;cdecl;external;
function numaGetMax(na:PNUMA; pmaxval:Pl_float32; pimaxloc:Pl_int32):Tl_ok;cdecl;external;
function numaGetSum(na:PNUMA; psum:Pl_float32):Tl_ok;cdecl;external;
function numaGetPartialSums(na:PNUMA):PNUMA;cdecl;external;
function numaGetSumOnInterval(na:PNUMA; first:Tl_int32; last:Tl_int32; psum:Pl_float32):Tl_ok;cdecl;external;
function numaHasOnlyIntegers(na:PNUMA; pallints:Pl_int32):Tl_ok;cdecl;external;
function numaGetMean(na:PNUMA; pave:Pl_float32):Tl_ok;cdecl;external;
function numaGetMeanAbsval(na:PNUMA; paveabs:Pl_float32):Tl_ok;cdecl;external;
function numaSubsample(nas:PNUMA; subfactor:Tl_int32):PNUMA;cdecl;external;
function numaMakeDelta(nas:PNUMA):PNUMA;cdecl;external;
function numaMakeSequence(startval:Tl_float32; increment:Tl_float32; size:Tl_int32):PNUMA;cdecl;external;
function numaMakeConstant(val:Tl_float32; size:Tl_int32):PNUMA;cdecl;external;
function numaMakeAbsval(nad:PNUMA; nas:PNUMA):PNUMA;cdecl;external;
function numaAddBorder(nas:PNUMA; left:Tl_int32; right:Tl_int32; val:Tl_float32):PNUMA;cdecl;external;
function numaAddSpecifiedBorder(nas:PNUMA; left:Tl_int32; right:Tl_int32; _type:Tl_int32):PNUMA;cdecl;external;
function numaRemoveBorder(nas:PNUMA; left:Tl_int32; right:Tl_int32):PNUMA;cdecl;external;
function numaCountNonzeroRuns(na:PNUMA; pcount:Pl_int32):Tl_ok;cdecl;external;
function numaGetNonzeroRange(na:PNUMA; eps:Tl_float32; pfirst:Pl_int32; plast:Pl_int32):Tl_ok;cdecl;external;
function numaGetCountRelativeToZero(na:PNUMA; _type:Tl_int32; pcount:Pl_int32):Tl_ok;cdecl;external;
function numaClipToInterval(nas:PNUMA; first:Tl_int32; last:Tl_int32):PNUMA;cdecl;external;
function numaMakeThresholdIndicator(nas:PNUMA; thresh:Tl_float32; _type:Tl_int32):PNUMA;cdecl;external;
function numaUniformSampling(nas:PNUMA; nsamp:Tl_int32):PNUMA;cdecl;external;
function numaReverse(nad:PNUMA; nas:PNUMA):PNUMA;cdecl;external;
function numaLowPassIntervals(nas:PNUMA; thresh:Tl_float32; maxn:Tl_float32):PNUMA;cdecl;external;
function numaThresholdEdges(nas:PNUMA; thresh1:Tl_float32; thresh2:Tl_float32; maxn:Tl_float32):PNUMA;cdecl;external;
function numaGetSpanValues(na:PNUMA; span:Tl_int32; pstart:Pl_int32; pend:Pl_int32):Tl_int32;cdecl;external;
function numaGetEdgeValues(na:PNUMA; edge:Tl_int32; pstart:Pl_int32; pend:Pl_int32; psign:Pl_int32):Tl_int32;cdecl;external;
function numaInterpolateEqxVal(startx:Tl_float32; deltax:Tl_float32; nay:PNUMA; _type:Tl_int32; xval:Tl_float32; 
           pyval:Pl_float32):Tl_ok;cdecl;external;
function numaInterpolateArbxVal(nax:PNUMA; nay:PNUMA; _type:Tl_int32; xval:Tl_float32; pyval:Pl_float32):Tl_ok;cdecl;external;
function numaInterpolateEqxInterval(startx:Tl_float32; deltax:Tl_float32; nasy:PNUMA; _type:Tl_int32; x0:Tl_float32; 
           x1:Tl_float32; npts:Tl_int32; pnax:PPNUMA; pnay:PPNUMA):Tl_ok;cdecl;external;
function numaInterpolateArbxInterval(nax:PNUMA; nay:PNUMA; _type:Tl_int32; x0:Tl_float32; x1:Tl_float32; 
           npts:Tl_int32; pnadx:PPNUMA; pnady:PPNUMA):Tl_ok;cdecl;external;
function numaFitMax(na:PNUMA; pmaxval:Pl_float32; naloc:PNUMA; pmaxloc:Pl_float32):Tl_ok;cdecl;external;
function numaDifferentiateInterval(nax:PNUMA; nay:PNUMA; x0:Tl_float32; x1:Tl_float32; npts:Tl_int32; 
           pnadx:PPNUMA; pnady:PPNUMA):Tl_ok;cdecl;external;
function numaIntegrateInterval(nax:PNUMA; nay:PNUMA; x0:Tl_float32; x1:Tl_float32; npts:Tl_int32; 
           psum:Pl_float32):Tl_ok;cdecl;external;
function numaSortGeneral(na:PNUMA; pnasort:PPNUMA; pnaindex:PPNUMA; pnainvert:PPNUMA; sortorder:Tl_int32; 
           sorttype:Tl_int32):Tl_ok;cdecl;external;
function numaSortAutoSelect(nas:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaSortIndexAutoSelect(nas:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaChooseSortType(nas:PNUMA):Tl_int32;cdecl;external;
function numaSort(naout:PNUMA; nain:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaBinSort(nas:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaGetSortIndex(na:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaGetBinSortIndex(nas:PNUMA; sortorder:Tl_int32):PNUMA;cdecl;external;
function numaSortByIndex(nas:PNUMA; naindex:PNUMA):PNUMA;cdecl;external;
function numaIsSorted(nas:PNUMA; sortorder:Tl_int32; psorted:Pl_int32):Tl_int32;cdecl;external;
function numaSortPair(nax:PNUMA; nay:PNUMA; sortorder:Tl_int32; pnasx:PPNUMA; pnasy:PPNUMA):Tl_ok;cdecl;external;
function numaInvertMap(nas:PNUMA):PNUMA;cdecl;external;
function numaAddSorted(na:PNUMA; val:Tl_float32):Tl_ok;cdecl;external;
function numaFindSortedLoc(na:PNUMA; val:Tl_float32; pindex:Pl_int32):Tl_ok;cdecl;external;
function numaPseudorandomSequence(size:Tl_int32; seed:Tl_int32):PNUMA;cdecl;external;
function numaRandomPermutation(nas:PNUMA; seed:Tl_int32):PNUMA;cdecl;external;
function numaGetRankValue(na:PNUMA; fract:Tl_float32; nasort:PNUMA; usebins:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function numaGetMedian(na:PNUMA; pval:Pl_float32):Tl_ok;cdecl;external;
function numaGetBinnedMedian(na:PNUMA; pval:Pl_int32):Tl_ok;cdecl;external;
function numaGetMeanDevFromMedian(na:PNUMA; med:Tl_float32; pdev:Pl_float32):Tl_ok;cdecl;external;
function numaGetMedianDevFromMedian(na:PNUMA; pmed:Pl_float32; pdev:Pl_float32):Tl_ok;cdecl;external;
function numaGetMode(na:PNUMA; pval:Pl_float32; pcount:Pl_int32):Tl_ok;cdecl;external;
function numaJoin(nad:PNUMA; nas:PNUMA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function numaaJoin(naad:PNUMAA; naas:PNUMAA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function numaaFlattenToNuma(naa:PNUMAA):PNUMA;cdecl;external;
function numaErode(nas:PNUMA; size:Tl_int32):PNUMA;cdecl;external;
function numaDilate(nas:PNUMA; size:Tl_int32):PNUMA;cdecl;external;
function numaOpen(nas:PNUMA; size:Tl_int32):PNUMA;cdecl;external;
function numaClose(nas:PNUMA; size:Tl_int32):PNUMA;cdecl;external;
function numaTransform(nas:PNUMA; shift:Tl_float32; scale:Tl_float32):PNUMA;cdecl;external;
function numaSimpleStats(na:PNUMA; first:Tl_int32; last:Tl_int32; pmean:Pl_float32; pvar:Pl_float32; 
           prvar:Pl_float32):Tl_ok;cdecl;external;
function numaWindowedStats(nas:PNUMA; wc:Tl_int32; pnam:PPNUMA; pnams:PPNUMA; pnav:PPNUMA; 
           pnarv:PPNUMA):Tl_ok;cdecl;external;
function numaWindowedMean(nas:PNUMA; wc:Tl_int32):PNUMA;cdecl;external;
function numaWindowedMeanSquare(nas:PNUMA; wc:Tl_int32):PNUMA;cdecl;external;
function numaWindowedVariance(nam:PNUMA; nams:PNUMA; pnav:PPNUMA; pnarv:PPNUMA):Tl_ok;cdecl;external;
function numaWindowedMedian(nas:PNUMA; halfwin:Tl_int32):PNUMA;cdecl;external;
function numaConvertToInt(nas:PNUMA):PNUMA;cdecl;external;
function numaMakeHistogram(na:PNUMA; maxbins:Tl_int32; pbinsize:Pl_int32; pbinstart:Pl_int32):PNUMA;cdecl;external;
function numaMakeHistogramAuto(na:PNUMA; maxbins:Tl_int32):PNUMA;cdecl;external;
function numaMakeHistogramClipped(na:PNUMA; binsize:Tl_float32; maxsize:Tl_float32):PNUMA;cdecl;external;
function numaRebinHistogram(nas:PNUMA; newsize:Tl_int32):PNUMA;cdecl;external;
function numaNormalizeHistogram(nas:PNUMA; tsum:Tl_float32):PNUMA;cdecl;external;
function numaGetStatsUsingHistogram(na:PNUMA; maxbins:Tl_int32; pmin:Pl_float32; pmax:Pl_float32; pmean:Pl_float32; 
           pvariance:Pl_float32; pmedian:Pl_float32; rank:Tl_float32; prval:Pl_float32; phisto:PPNUMA):Tl_ok;cdecl;external;
function numaGetHistogramStats(nahisto:PNUMA; startx:Tl_float32; deltax:Tl_float32; pxmean:Pl_float32; pxmedian:Pl_float32; 
           pxmode:Pl_float32; pxvariance:Pl_float32):Tl_ok;cdecl;external;
function numaGetHistogramStatsOnInterval(nahisto:PNUMA; startx:Tl_float32; deltax:Tl_float32; ifirst:Tl_int32; ilast:Tl_int32; 
           pxmean:Pl_float32; pxmedian:Pl_float32; pxmode:Pl_float32; pxvariance:Pl_float32):Tl_ok;cdecl;external;
function numaMakeRankFromHistogram(startx:Tl_float32; deltax:Tl_float32; nasy:PNUMA; npts:Tl_int32; pnax:PPNUMA; 
           pnay:PPNUMA):Tl_ok;cdecl;external;
function numaHistogramGetRankFromVal(na:PNUMA; rval:Tl_float32; prank:Pl_float32):Tl_ok;cdecl;external;
function numaHistogramGetValFromRank(na:PNUMA; rank:Tl_float32; prval:Pl_float32):Tl_ok;cdecl;external;
function numaDiscretizeSortedInBins(na:PNUMA; nbins:Tl_int32; pnabinval:PPNUMA):Tl_ok;cdecl;external;
function numaDiscretizeHistoInBins(na:PNUMA; nbins:Tl_int32; pnabinval:PPNUMA; pnarank:PPNUMA):Tl_ok;cdecl;external;
function numaGetRankBinValues(na:PNUMA; nbins:Tl_int32; pnam:PPNUMA):Tl_ok;cdecl;external;
function numaGetUniformBinSizes(ntotal:Tl_int32; nbins:Tl_int32):PNUMA;cdecl;external;
function numaSplitDistribution(na:PNUMA; scorefract:Tl_float32; psplitindex:Pl_int32; pave1:Pl_float32; pave2:Pl_float32; 
           pnum1:Pl_float32; pnum2:Pl_float32; pnascore:PPNUMA):Tl_ok;cdecl;external;
function grayHistogramsToEMD(naa1:PNUMAA; naa2:PNUMAA; pnad:PPNUMA):Tl_ok;cdecl;external;
function numaEarthMoverDistance(na1:PNUMA; na2:PNUMA; pdist:Pl_float32):Tl_ok;cdecl;external;
function grayInterHistogramStats(naa:PNUMAA; wc:Tl_int32; pnam:PPNUMA; pnams:PPNUMA; pnav:PPNUMA; 
           pnarv:PPNUMA):Tl_ok;cdecl;external;
function numaFindPeaks(nas:PNUMA; nmax:Tl_int32; fract1:Tl_float32; fract2:Tl_float32):PNUMA;cdecl;external;
function numaFindExtrema(nas:PNUMA; delta:Tl_float32; pnav:PPNUMA):PNUMA;cdecl;external;
function numaFindLocForThreshold(na:PNUMA; skip:Tl_int32; pthresh:Pl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function numaCountReversals(nas:PNUMA; minreversal:Tl_float32; pnr:Pl_int32; prd:Pl_float32):Tl_ok;cdecl;external;
function numaSelectCrossingThreshold(nax:PNUMA; nay:PNUMA; estthresh:Tl_float32; pbestthresh:Pl_float32):Tl_ok;cdecl;external;
function numaCrossingsByThreshold(nax:PNUMA; nay:PNUMA; thresh:Tl_float32):PNUMA;cdecl;external;
function numaCrossingsByPeaks(nax:PNUMA; nay:PNUMA; delta:Tl_float32):PNUMA;cdecl;external;
function numaEvalBestHaarParameters(nas:PNUMA; relweight:Tl_float32; nwidth:Tl_int32; nshift:Tl_int32; minwidth:Tl_float32; 
           maxwidth:Tl_float32; pbestwidth:Pl_float32; pbestshift:Pl_float32; pbestscore:Pl_float32):Tl_ok;cdecl;external;
function numaEvalHaarSum(nas:PNUMA; width:Tl_float32; shift:Tl_float32; relweight:Tl_float32; pscore:Pl_float32):Tl_ok;cdecl;external;
function genConstrainedNumaInRange(first:Tl_int32; last:Tl_int32; nmax:Tl_int32; use_pairs:Tl_int32):PNUMA;cdecl;external;
function pixGetRegionsBinary(pixs:PPIX; ppixhm:PPPIX; ppixtm:PPPIX; ppixtb:PPPIX; pixadb:PPIXA):Tl_ok;cdecl;external;
function pixGenHalftoneMask(pixs:PPIX; ppixtext:PPPIX; phtfound:Pl_int32; debug:Tl_int32):PPIX;cdecl;external;
function pixGenerateHalftoneMask(pixs:PPIX; ppixtext:PPPIX; phtfound:Pl_int32; pixadb:PPIXA):PPIX;cdecl;external;
function pixGenTextlineMask(pixs:PPIX; ppixvws:PPPIX; ptlfound:Pl_int32; pixadb:PPIXA):PPIX;cdecl;external;
function pixGenTextblockMask(pixs:PPIX; pixvws:PPIX; pixadb:PPIXA):PPIX;cdecl;external;
function pixFindPageForeground(pixs:PPIX; threshold:Tl_int32; mindist:Tl_int32; erasedist:Tl_int32; showmorph:Tl_int32; 
           pixac:PPIXAC):PBOX;cdecl;external;
function pixSplitIntoCharacters(pixs:PPIX; minw:Tl_int32; minh:Tl_int32; pboxa:PPBOXA; ppixa:PPPIXA; 
           ppixdebug:PPPIX):Tl_ok;cdecl;external;
function pixSplitComponentWithProfile(pixs:PPIX; delta:Tl_int32; mindel:Tl_int32; ppixdebug:PPPIX):PBOXA;cdecl;external;
function pixExtractTextlines(pixs:PPIX; maxw:Tl_int32; maxh:Tl_int32; minw:Tl_int32; minh:Tl_int32; 
           adjw:Tl_int32; adjh:Tl_int32; pixadb:PPIXA):PPIXA;cdecl;external;
function pixExtractRawTextlines(pixs:PPIX; maxw:Tl_int32; maxh:Tl_int32; adjw:Tl_int32; adjh:Tl_int32; 
           pixadb:PPIXA):PPIXA;cdecl;external;
function pixCountTextColumns(pixs:PPIX; deltafract:Tl_float32; peakfract:Tl_float32; clipfract:Tl_float32; pncols:Pl_int32; 
           pixadb:PPIXA):Tl_ok;cdecl;external;
function pixDecideIfText(pixs:PPIX; box:PBOX; pistext:Pl_int32; pixadb:PPIXA):Tl_ok;cdecl;external;
function pixFindThreshFgExtent(pixs:PPIX; thresh:Tl_int32; ptop:Pl_int32; pbot:Pl_int32):Tl_ok;cdecl;external;
function pixDecideIfTable(pixs:PPIX; box:PBOX; orient:Tl_int32; pscore:Pl_int32; pixadb:PPIXA):Tl_ok;cdecl;external;
function pixPrepare1bpp(pixs:PPIX; box:PBOX; cropfract:Tl_float32; outres:Tl_int32):PPIX;cdecl;external;
function pixEstimateBackground(pixs:PPIX; darkthresh:Tl_int32; edgecrop:Tl_float32; pbg:Pl_int32):Tl_ok;cdecl;external;
function pixFindLargeRectangles(pixs:PPIX; polarity:Tl_int32; nrect:Tl_int32; pboxa:PPBOXA; ppixdb:PPPIX):Tl_ok;cdecl;external;
function pixFindLargestRectangle(pixs:PPIX; polarity:Tl_int32; pbox:PPBOX; ppixdb:PPPIX):Tl_ok;cdecl;external;
function pixFindRectangleInCC(pixs:PPIX; boxs:PBOX; fract:Tl_float32; dir:Tl_int32; select:Tl_int32; 
           debug:Tl_int32):PBOX;cdecl;external;
function pixAutoPhotoinvert(pixs:PPIX; thresh:Tl_int32; ppixm:PPPIX; pixadb:PPIXA):PPIX;cdecl;external;
function pixSetSelectCmap(pixs:PPIX; box:PBOX; sindex:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixColorGrayRegionsCmap(pixs:PPIX; boxa:PBOXA; _type:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixColorGrayCmap(pixs:PPIX; box:PBOX; _type:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixColorGrayMaskedCmap(pixs:PPIX; pixm:PPIX; _type:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function addColorizedGrayToCmap(cmap:PPIXCMAP; _type:Tl_int32; rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; 
           pna:PPNUMA):Tl_ok;cdecl;external;
function pixSetSelectMaskedCmap(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; sindex:Tl_int32; 
           rval:Tl_int32; gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
function pixSetMaskedCmap(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; rval:Tl_int32; 
           gval:Tl_int32; bval:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function parseForProtos(filein:Pchar; prestring:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function partifyFiles(dirname:Pchar; substr:Pchar; nparts:Tl_int32; outroot:Pchar; debugfile:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function partifyPixac(pixac:PPIXAC; nparts:Tl_int32; outroot:Pchar; pixadb:PPIXA):Tl_ok;cdecl;external;
function boxaGetWhiteblocks(boxas:PBOXA; box:PBOX; sortflag:Tl_int32; maxboxes:Tl_int32; maxoverlap:Tl_float32; 
           maxperim:Tl_int32; fract:Tl_float32; maxpops:Tl_int32):PBOXA;cdecl;external;
function boxaPruneSortedOnOverlap(boxas:PBOXA; maxoverlap:Tl_float32):PBOXA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertFilesToPdf(dirname:Pchar; substr:Pchar; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; 
           quality:Tl_int32; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function saConvertFilesToPdf(sa:PSARRAY; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function saConvertFilesToPdfData(sa:PSARRAY; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
function selectDefaultPdfEncoding(pix:PPIX; ptype:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertUnscaledFilesToPdf(dirname:Pchar; substr:Pchar; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function saConvertUnscaledFilesToPdf(sa:PSARRAY; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function saConvertUnscaledFilesToPdfData(sa:PSARRAY; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertUnscaledToPdfData(fname:Pchar; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixaConvertToPdf(pixa:PPIXA; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaConvertToPdfData(pixa:PPIXA; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertToPdf(filein:Pchar; _type:Tl_int32; quality:Tl_int32; fileout:Pchar; x:Tl_int32; 
           y:Tl_int32; res:Tl_int32; title:Pchar; plpd:PPL_PDF_DATA; position:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertImageDataToPdf(imdata:Pl_uint8; size:Tsize_t; _type:Tl_int32; quality:Tl_int32; fileout:Pchar; 
           x:Tl_int32; y:Tl_int32; res:Tl_int32; title:Pchar; plpd:PPL_PDF_DATA; 
           position:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertToPdfData(filein:Pchar; _type:Tl_int32; quality:Tl_int32; pdata:PPl_uint8; pnbytes:Psize_t; 
           x:Tl_int32; y:Tl_int32; res:Tl_int32; title:Pchar; plpd:PPL_PDF_DATA; 
           position:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function convertImageDataToPdfData(imdata:Pl_uint8; size:Tsize_t; _type:Tl_int32; quality:Tl_int32; pdata:PPl_uint8; 
           pnbytes:Psize_t; x:Tl_int32; y:Tl_int32; res:Tl_int32; title:Pchar; 
           plpd:PPL_PDF_DATA; position:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixConvertToPdf(pix:PPIX; _type:Tl_int32; quality:Tl_int32; fileout:Pchar; x:Tl_int32; 
           y:Tl_int32; res:Tl_int32; title:Pchar; plpd:PPL_PDF_DATA; position:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteStreamPdf(fp:PFILE; pix:PPIX; res:Tl_int32; title:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteMemPdf(pdata:PPl_uint8; pnbytes:Psize_t; pix:PPIX; res:Tl_int32; title:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertSegmentedFilesToPdf(dirname:Pchar; substr:Pchar; res:Tl_int32; _type:Tl_int32; thresh:Tl_int32; 
           baa:PBOXAA; quality:Tl_int32; scalefactor:Tl_float32; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertNumberedMasksToBoxaa(dirname:Pchar; substr:Pchar; numpre:Tl_int32; numpost:Tl_int32):PBOXAA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertToPdfSegmented(filein:Pchar; res:Tl_int32; _type:Tl_int32; thresh:Tl_int32; boxa:PBOXA; 
           quality:Tl_int32; scalefactor:Tl_float32; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixConvertToPdfSegmented(pixs:PPIX; res:Tl_int32; _type:Tl_int32; thresh:Tl_int32; boxa:PBOXA; 
           quality:Tl_int32; scalefactor:Tl_float32; title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertToPdfDataSegmented(filein:Pchar; res:Tl_int32; _type:Tl_int32; thresh:Tl_int32; boxa:PBOXA; 
           quality:Tl_int32; scalefactor:Tl_float32; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixConvertToPdfDataSegmented(pixs:PPIX; res:Tl_int32; _type:Tl_int32; thresh:Tl_int32; boxa:PBOXA; 
           quality:Tl_int32; scalefactor:Tl_float32; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function concatenatePdf(dirname:Pchar; substr:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function saConcatenatePdf(sa:PSARRAY; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ptraConcatenatePdf(pa:PL_PTRA; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function concatenatePdfToData(dirname:Pchar; substr:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
function saConcatenatePdfToData(sa:PSARRAY; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixConvertToPdfData(pix:PPIX; _type:Tl_int32; quality:Tl_int32; pdata:PPl_uint8; pnbytes:Psize_t; 
           x:Tl_int32; y:Tl_int32; res:Tl_int32; title:Pchar; plpd:PPL_PDF_DATA; 
           position:Tl_int32):Tl_ok;cdecl;external;
function ptraConcatenatePdfToData(pa_data:PL_PTRA; sa:PSARRAY; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertTiffMultipageToPdf(filein:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_generateCIDataForPdf(fname:Pchar; pix:PPIX; quality:Tl_int32; pcid:PPL_COMP_DATA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_generateCIData(fname:Pchar; _type:Tl_int32; quality:Tl_int32; ascii85:Tl_int32; pcid:PPL_COMP_DATA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_generateFlateDataPdf(fname:Pchar; pixs:PPIX):PL_COMP_DATA;cdecl;external;
(* Const before type ignored *)
function l_generateJpegData(fname:Pchar; ascii85flag:Tl_int32):PL_COMP_DATA;cdecl;external;
function l_generateJpegDataMem(data:Pl_uint8; nbytes:Tsize_t; ascii85flag:Tl_int32):PL_COMP_DATA;cdecl;external;
(* Const before type ignored *)
function l_generateG4Data(fname:Pchar; ascii85flag:Tl_int32):PL_COMP_DATA;cdecl;external;
function pixGenerateCIData(pixs:PPIX; _type:Tl_int32; quality:Tl_int32; ascii85:Tl_int32; pcid:PPL_COMP_DATA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_generateFlateData(fname:Pchar; ascii85flag:Tl_int32):PL_COMP_DATA;cdecl;external;
(* Const before type ignored *)
function cidConvertToPdfData(cid:PL_COMP_DATA; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
procedure l_CIDataDestroy(pcid:PPL_COMP_DATA);cdecl;external;
procedure l_pdfSetG4ImageMask(flag:Tl_int32);cdecl;external;
procedure l_pdfSetDateAndVersion(flag:Tl_int32);cdecl;external;
procedure setPixMemoryManager(allocator:Talloc_fn; deallocator:Tdealloc_fn);cdecl;external;
function pixCreate(width:Tl_int32; height:Tl_int32; depth:Tl_int32):PPIX;cdecl;external;
function pixCreateNoInit(width:Tl_int32; height:Tl_int32; depth:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixCreateTemplate(pixs:PPIX):PPIX;cdecl;external;
(* Const before type ignored *)
function pixCreateTemplateNoInit(pixs:PPIX):PPIX;cdecl;external;
function pixCreateWithCmap(width:Tl_int32; height:Tl_int32; depth:Tl_int32; initcolor:Tl_int32):PPIX;cdecl;external;
function pixCreateHeader(width:Tl_int32; height:Tl_int32; depth:Tl_int32):PPIX;cdecl;external;
function pixClone(pixs:PPIX):PPIX;cdecl;external;
procedure pixDestroy(ppix:PPPIX);cdecl;external;
(* Const before type ignored *)
function pixCopy(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
(* Const before type ignored *)
function pixResizeImageData(pixd:PPIX; pixs:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixCopyColormap(pixd:PPIX; pixs:PPIX):Tl_ok;cdecl;external;
function pixTransferAllData(pixd:PPIX; ppixs:PPPIX; copytext:Tl_int32; copyformat:Tl_int32):Tl_ok;cdecl;external;
function pixSwapAndDestroy(ppixd:PPPIX; ppixs:PPPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixGetWidth(pix:PPIX):Tl_int32;cdecl;external;
function pixSetWidth(pix:PPIX; width:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetHeight(pix:PPIX):Tl_int32;cdecl;external;
function pixSetHeight(pix:PPIX; height:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetDepth(pix:PPIX):Tl_int32;cdecl;external;
function pixSetDepth(pix:PPIX; depth:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetDimensions(pix:PPIX; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32):Tl_ok;cdecl;external;
function pixSetDimensions(pix:PPIX; w:Tl_int32; h:Tl_int32; d:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixCopyDimensions(pixd:PPIX; pixs:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixGetSpp(pix:PPIX):Tl_int32;cdecl;external;
function pixSetSpp(pix:PPIX; spp:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixCopySpp(pixd:PPIX; pixs:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixGetWpl(pix:PPIX):Tl_int32;cdecl;external;
function pixSetWpl(pix:PPIX; wpl:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetRefcount(pix:PPIX):Tl_int32;cdecl;external;
function pixChangeRefcount(pix:PPIX; delta:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetXRes(pix:PPIX):Tl_int32;cdecl;external;
function pixSetXRes(pix:PPIX; res:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetYRes(pix:PPIX):Tl_int32;cdecl;external;
function pixSetYRes(pix:PPIX; res:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetResolution(pix:PPIX; pxres:Pl_int32; pyres:Pl_int32):Tl_ok;cdecl;external;
function pixSetResolution(pix:PPIX; xres:Tl_int32; yres:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixCopyResolution(pixd:PPIX; pixs:PPIX):Tl_int32;cdecl;external;
function pixScaleResolution(pix:PPIX; xscale:Tl_float32; yscale:Tl_float32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixGetInputFormat(pix:PPIX):Tl_int32;cdecl;external;
function pixSetInputFormat(pix:PPIX; informat:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixCopyInputFormat(pixd:PPIX; pixs:PPIX):Tl_int32;cdecl;external;
function pixSetSpecial(pix:PPIX; special:Tl_int32):Tl_int32;cdecl;external;
function pixGetText(pix:PPIX):Pchar;cdecl;external;
(* Const before type ignored *)
function pixSetText(pix:PPIX; textstring:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixAddText(pix:PPIX; textstring:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixCopyText(pixd:PPIX; pixs:PPIX):Tl_int32;cdecl;external;
function pixGetTextCompNew(pix:PPIX; psize:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function pixSetTextCompNew(pix:PPIX; data:Pl_uint8; size:Tsize_t):Tl_ok;cdecl;external;
function pixGetColormap(pix:PPIX):PPIXCMAP;cdecl;external;
function pixSetColormap(pix:PPIX; colormap:PPIXCMAP):Tl_ok;cdecl;external;
function pixDestroyColormap(pix:PPIX):Tl_ok;cdecl;external;
function pixGetData(pix:PPIX):Pl_uint32;cdecl;external;
function pixSetData(pix:PPIX; data:Pl_uint32):Tl_int32;cdecl;external;
function pixExtractData(pixs:PPIX):Pl_uint32;cdecl;external;
function pixFreeData(pix:PPIX):Tl_int32;cdecl;external;
function pixGetLinePtrs(pix:PPIX; psize:Pl_int32):^pointer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixSizesEqual(pix1:PPIX; pix2:PPIX):Tl_int32;cdecl;external;
function pixMaxAspectRatio(pixs:PPIX; pratio:Pl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixPrintStreamInfo(fp:PFILE; pix:PPIX; text:Pchar):Tl_ok;cdecl;external;
function pixGetPixel(pix:PPIX; x:Tl_int32; y:Tl_int32; pval:Pl_uint32):Tl_ok;cdecl;external;
function pixSetPixel(pix:PPIX; x:Tl_int32; y:Tl_int32; val:Tl_uint32):Tl_ok;cdecl;external;
function pixGetRGBPixel(pix:PPIX; x:Tl_int32; y:Tl_int32; prval:Pl_int32; pgval:Pl_int32; 
           pbval:Pl_int32):Tl_ok;cdecl;external;
function pixSetRGBPixel(pix:PPIX; x:Tl_int32; y:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixSetCmapPixel(pix:PPIX; x:Tl_int32; y:Tl_int32; rval:Tl_int32; gval:Tl_int32; 
           bval:Tl_int32):Tl_ok;cdecl;external;
function pixGetRandomPixel(pix:PPIX; pval:Pl_uint32; px:Pl_int32; py:Pl_int32):Tl_ok;cdecl;external;
function pixClearPixel(pix:PPIX; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function pixFlipPixel(pix:PPIX; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
procedure setPixelLow(line:Pl_uint32; x:Tl_int32; depth:Tl_int32; val:Tl_uint32);cdecl;external;
function pixGetBlackOrWhiteVal(pixs:PPIX; op:Tl_int32; pval:Pl_uint32):Tl_ok;cdecl;external;
function pixClearAll(pix:PPIX):Tl_ok;cdecl;external;
function pixSetAll(pix:PPIX):Tl_ok;cdecl;external;
function pixSetAllGray(pix:PPIX; grayval:Tl_int32):Tl_ok;cdecl;external;
function pixSetAllArbitrary(pix:PPIX; val:Tl_uint32):Tl_ok;cdecl;external;
function pixSetBlackOrWhite(pixs:PPIX; op:Tl_int32):Tl_ok;cdecl;external;
function pixSetComponentArbitrary(pix:PPIX; comp:Tl_int32; val:Tl_int32):Tl_ok;cdecl;external;
function pixClearInRect(pix:PPIX; box:PBOX):Tl_ok;cdecl;external;
function pixSetInRect(pix:PPIX; box:PBOX):Tl_ok;cdecl;external;
function pixSetInRectArbitrary(pix:PPIX; box:PBOX; val:Tl_uint32):Tl_ok;cdecl;external;
function pixBlendInRect(pixs:PPIX; box:PBOX; val:Tl_uint32; fract:Tl_float32):Tl_ok;cdecl;external;
function pixSetPadBits(pix:PPIX; val:Tl_int32):Tl_ok;cdecl;external;
function pixSetPadBitsBand(pix:PPIX; by:Tl_int32; bh:Tl_int32; val:Tl_int32):Tl_ok;cdecl;external;
function pixSetOrClearBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32; 
           op:Tl_int32):Tl_ok;cdecl;external;
function pixSetBorderVal(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32; 
           val:Tl_uint32):Tl_ok;cdecl;external;
function pixSetBorderRingVal(pixs:PPIX; dist:Tl_int32; val:Tl_uint32):Tl_ok;cdecl;external;
function pixSetMirroredBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):Tl_ok;cdecl;external;
function pixCopyBorder(pixd:PPIX; pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; 
           bot:Tl_int32):PPIX;cdecl;external;
function pixAddBorder(pixs:PPIX; npix:Tl_int32; val:Tl_uint32):PPIX;cdecl;external;
function pixAddBlackOrWhiteBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32; 
           op:Tl_int32):PPIX;cdecl;external;
function pixAddBorderGeneral(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32; 
           val:Tl_uint32):PPIX;cdecl;external;
function pixRemoveBorder(pixs:PPIX; npix:Tl_int32):PPIX;cdecl;external;
function pixRemoveBorderGeneral(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PPIX;cdecl;external;
function pixRemoveBorderToSize(pixs:PPIX; wd:Tl_int32; hd:Tl_int32):PPIX;cdecl;external;
function pixAddMirroredBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PPIX;cdecl;external;
function pixAddRepeatedBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PPIX;cdecl;external;
function pixAddMixedBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PPIX;cdecl;external;
function pixAddContinuedBorder(pixs:PPIX; left:Tl_int32; right:Tl_int32; top:Tl_int32; bot:Tl_int32):PPIX;cdecl;external;
function pixShiftAndTransferAlpha(pixd:PPIX; pixs:PPIX; shiftx:Tl_float32; shifty:Tl_float32):Tl_ok;cdecl;external;
function pixDisplayLayersRGBA(pixs:PPIX; val:Tl_uint32; maxw:Tl_int32):PPIX;cdecl;external;
function pixCreateRGBImage(pixr:PPIX; pixg:PPIX; pixb:PPIX):PPIX;cdecl;external;
function pixGetRGBComponent(pixs:PPIX; comp:Tl_int32):PPIX;cdecl;external;
function pixSetRGBComponent(pixd:PPIX; pixs:PPIX; comp:Tl_int32):Tl_ok;cdecl;external;
function pixGetRGBComponentCmap(pixs:PPIX; comp:Tl_int32):PPIX;cdecl;external;
function pixCopyRGBComponent(pixd:PPIX; pixs:PPIX; comp:Tl_int32):Tl_ok;cdecl;external;
function composeRGBPixel(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; ppixel:Pl_uint32):Tl_ok;cdecl;external;
function composeRGBAPixel(rval:Tl_int32; gval:Tl_int32; bval:Tl_int32; aval:Tl_int32; ppixel:Pl_uint32):Tl_ok;cdecl;external;
procedure extractRGBValues(pixel:Tl_uint32; prval:Pl_int32; pgval:Pl_int32; pbval:Pl_int32);cdecl;external;
procedure extractRGBAValues(pixel:Tl_uint32; prval:Pl_int32; pgval:Pl_int32; pbval:Pl_int32; paval:Pl_int32);cdecl;external;
function extractMinMaxComponent(pixel:Tl_uint32; _type:Tl_int32):Tl_int32;cdecl;external;
function pixGetRGBLine(pixs:PPIX; row:Tl_int32; bufr:Pl_uint8; bufg:Pl_uint8; bufb:Pl_uint8):Tl_ok;cdecl;external;
function setLineDataVal(line:Pl_uint32; j:Tl_int32; d:Tl_int32; val:Tl_uint32):Tl_ok;cdecl;external;
function pixEndianByteSwapNew(pixs:PPIX):PPIX;cdecl;external;
function pixEndianByteSwap(pixs:PPIX):Tl_ok;cdecl;external;
function lineEndianByteSwap(datad:Pl_uint32; datas:Pl_uint32; wpl:Tl_int32):Tl_int32;cdecl;external;
function pixEndianTwoByteSwapNew(pixs:PPIX):PPIX;cdecl;external;
function pixEndianTwoByteSwap(pixs:PPIX):Tl_ok;cdecl;external;
function pixGetRasterData(pixs:PPIX; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
function pixInferResolution(pix:PPIX; longside:Tl_float32; pres:Pl_int32):Tl_ok;cdecl;external;
function pixAlphaIsOpaque(pix:PPIX; popaque:Pl_int32):Tl_ok;cdecl;external;
function pixSetupByteProcessing(pix:PPIX; pw:Pl_int32; ph:Pl_int32):^Pl_uint8;cdecl;external;
function pixCleanupByteProcessing(pix:PPIX; lineptrs:PPl_uint8):Tl_ok;cdecl;external;
procedure l_setAlphaMaskBorder(val1:Tl_float32; val2:Tl_float32);cdecl;external;
function pixSetMasked(pixd:PPIX; pixm:PPIX; val:Tl_uint32):Tl_ok;cdecl;external;
function pixSetMaskedGeneral(pixd:PPIX; pixm:PPIX; val:Tl_uint32; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function pixCombineMasked(pixd:PPIX; pixs:PPIX; pixm:PPIX):Tl_ok;cdecl;external;
function pixCombineMaskedGeneral(pixd:PPIX; pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function pixPaintThroughMask(pixd:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; val:Tl_uint32):Tl_ok;cdecl;external;
function pixCopyWithBoxa(pixs:PPIX; boxa:PBOXA; background:Tl_int32):PPIX;cdecl;external;
function pixPaintSelfThroughMask(pixd:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; searchdir:Tl_int32; 
           mindist:Tl_int32; tilesize:Tl_int32; ntiles:Tl_int32; distblend:Tl_int32):Tl_ok;cdecl;external;
function pixMakeMaskFromVal(pixs:PPIX; val:Tl_int32):PPIX;cdecl;external;
function pixMakeMaskFromLUT(pixs:PPIX; tab:Pl_int32):PPIX;cdecl;external;
function pixMakeArbMaskFromRGB(pixs:PPIX; rc:Tl_float32; gc:Tl_float32; bc:Tl_float32; thresh:Tl_float32):PPIX;cdecl;external;
function pixSetUnderTransparency(pixs:PPIX; val:Tl_uint32; debug:Tl_int32):PPIX;cdecl;external;
function pixMakeAlphaFromMask(pixs:PPIX; dist:Tl_int32; pbox:PPBOX):PPIX;cdecl;external;
function pixGetColorNearMaskBoundary(pixs:PPIX; pixm:PPIX; box:PBOX; dist:Tl_int32; pval:Pl_uint32; 
           debug:Tl_int32):Tl_ok;cdecl;external;
function pixDisplaySelectedPixels(pixs:PPIX; pixm:PPIX; sel:PSEL; val:Tl_uint32):PPIX;cdecl;external;
function pixInvert(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixOr(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixAnd(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixXor(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixSubtract(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixZero(pix:PPIX; pempty:Pl_int32):Tl_ok;cdecl;external;
function pixForegroundFraction(pix:PPIX; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixaCountPixels(pixa:PPIXA):PNUMA;cdecl;external;
function pixCountPixels(pixs:PPIX; pcount:Pl_int32; tab8:Pl_int32):Tl_ok;cdecl;external;
function pixCountPixelsInRect(pixs:PPIX; box:PBOX; pcount:Pl_int32; tab8:Pl_int32):Tl_ok;cdecl;external;
function pixCountByRow(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixCountByColumn(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixCountPixelsByRow(pix:PPIX; tab8:Pl_int32):PNUMA;cdecl;external;
function pixCountPixelsByColumn(pix:PPIX):PNUMA;cdecl;external;
function pixCountPixelsInRow(pix:PPIX; row:Tl_int32; pcount:Pl_int32; tab8:Pl_int32):Tl_ok;cdecl;external;
function pixGetMomentByColumn(pix:PPIX; order:Tl_int32):PNUMA;cdecl;external;
function pixThresholdPixelSum(pix:PPIX; thresh:Tl_int32; pabove:Pl_int32; tab8:Pl_int32):Tl_ok;cdecl;external;
function makePixelSumTab8:Pl_int32;cdecl;external;
function makePixelCentroidTab8:Pl_int32;cdecl;external;
function pixAverageByRow(pix:PPIX; box:PBOX; _type:Tl_int32):PNUMA;cdecl;external;
function pixAverageByColumn(pix:PPIX; box:PBOX; _type:Tl_int32):PNUMA;cdecl;external;
function pixAverageInRect(pixs:PPIX; pixm:PPIX; box:PBOX; minval:Tl_int32; maxval:Tl_int32; 
           subsamp:Tl_int32; pave:Pl_float32):Tl_ok;cdecl;external;
function pixAverageInRectRGB(pixs:PPIX; pixm:PPIX; box:PBOX; subsamp:Tl_int32; pave:Pl_uint32):Tl_ok;cdecl;external;
function pixVarianceByRow(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixVarianceByColumn(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixVarianceInRect(pix:PPIX; box:PBOX; prootvar:Pl_float32):Tl_ok;cdecl;external;
function pixAbsDiffByRow(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixAbsDiffByColumn(pix:PPIX; box:PBOX):PNUMA;cdecl;external;
function pixAbsDiffInRect(pix:PPIX; box:PBOX; dir:Tl_int32; pabsdiff:Pl_float32):Tl_ok;cdecl;external;
function pixAbsDiffOnLine(pix:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           pabsdiff:Pl_float32):Tl_ok;cdecl;external;
function pixCountArbInRect(pixs:PPIX; box:PBOX; val:Tl_int32; factor:Tl_int32; pcount:Pl_int32):Tl_int32;cdecl;external;
function pixMirroredTiling(pixs:PPIX; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixFindRepCloseTile(pixs:PPIX; box:PBOX; searchdir:Tl_int32; mindist:Tl_int32; tsize:Tl_int32; 
           ntiles:Tl_int32; pboxtile:PPBOX; debug:Tl_int32):Tl_ok;cdecl;external;
function pixGetGrayHistogram(pixs:PPIX; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetGrayHistogramMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetGrayHistogramInRect(pixs:PPIX; box:PBOX; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetGrayHistogramTiled(pixs:PPIX; factor:Tl_int32; nx:Tl_int32; ny:Tl_int32):PNUMAA;cdecl;external;
function pixGetColorHistogram(pixs:PPIX; factor:Tl_int32; pnar:PPNUMA; pnag:PPNUMA; pnab:PPNUMA):Tl_ok;cdecl;external;
function pixGetColorHistogramMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           pnar:PPNUMA; pnag:PPNUMA; pnab:PPNUMA):Tl_ok;cdecl;external;
function pixGetCmapHistogram(pixs:PPIX; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetCmapHistogramMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32):PNUMA;cdecl;external;
function pixGetCmapHistogramInRect(pixs:PPIX; box:PBOX; factor:Tl_int32):PNUMA;cdecl;external;
function pixCountRGBColorsByHash(pixs:PPIX; pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixCountRGBColors(pixs:PPIX; factor:Tl_int32; pncolors:Pl_int32):Tl_ok;cdecl;external;
function pixGetColorAmapHistogram(pixs:PPIX; factor:Tl_int32):PL_AMAP;cdecl;external;
function amapGetCountForColor(amap:PL_AMAP; val:Tl_uint32):Tl_int32;cdecl;external;
function pixGetRankValue(pixs:PPIX; factor:Tl_int32; rank:Tl_float32; pvalue:Pl_uint32):Tl_ok;cdecl;external;
function pixGetRankValueMaskedRGB(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           rank:Tl_float32; prval:Pl_float32; pgval:Pl_float32; pbval:Pl_float32):Tl_ok;cdecl;external;
function pixGetRankValueMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           rank:Tl_float32; pval:Pl_float32; pna:PPNUMA):Tl_ok;cdecl;external;
function pixGetPixelAverage(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           pval:Pl_uint32):Tl_ok;cdecl;external;
function pixGetPixelStats(pixs:PPIX; factor:Tl_int32; _type:Tl_int32; pvalue:Pl_uint32):Tl_ok;cdecl;external;
function pixGetAverageMaskedRGB(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           _type:Tl_int32; prval:Pl_float32; pgval:Pl_float32; pbval:Pl_float32):Tl_ok;cdecl;external;
function pixGetAverageMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; factor:Tl_int32; 
           _type:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function pixGetAverageTiledRGB(pixs:PPIX; sx:Tl_int32; sy:Tl_int32; _type:Tl_int32; ppixr:PPPIX; 
           ppixg:PPPIX; ppixb:PPPIX):Tl_ok;cdecl;external;
function pixGetAverageTiled(pixs:PPIX; sx:Tl_int32; sy:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixRowStats(pixs:PPIX; box:PBOX; pnamean:PPNUMA; pnamedian:PPNUMA; pnamode:PPNUMA; 
           pnamodecount:PPNUMA; pnavar:PPNUMA; pnarootvar:PPNUMA):Tl_int32;cdecl;external;
function pixColumnStats(pixs:PPIX; box:PBOX; pnamean:PPNUMA; pnamedian:PPNUMA; pnamode:PPNUMA; 
           pnamodecount:PPNUMA; pnavar:PPNUMA; pnarootvar:PPNUMA):Tl_int32;cdecl;external;
function pixGetRangeValues(pixs:PPIX; factor:Tl_int32; color:Tl_int32; pminval:Pl_int32; pmaxval:Pl_int32):Tl_ok;cdecl;external;
function pixGetExtremeValue(pixs:PPIX; factor:Tl_int32; _type:Tl_int32; prval:Pl_int32; pgval:Pl_int32; 
           pbval:Pl_int32; pgrayval:Pl_int32):Tl_ok;cdecl;external;
function pixGetMaxValueInRect(pixs:PPIX; box:PBOX; pmaxval:Pl_uint32; pxmax:Pl_int32; pymax:Pl_int32):Tl_ok;cdecl;external;
function pixGetMaxColorIndex(pixs:PPIX; pmaxindex:Pl_int32):Tl_ok;cdecl;external;
function pixGetBinnedComponentRange(pixs:PPIX; nbins:Tl_int32; factor:Tl_int32; color:Tl_int32; pminval:Pl_int32; 
           pmaxval:Pl_int32; pcarray:PPl_uint32; fontsize:Tl_int32):Tl_ok;cdecl;external;
function pixGetRankColorArray(pixs:PPIX; nbins:Tl_int32; _type:Tl_int32; factor:Tl_int32; pcarray:PPl_uint32; 
           pixadb:PPIXA; fontsize:Tl_int32):Tl_ok;cdecl;external;
function pixGetBinnedColor(pixs:PPIX; pixg:PPIX; factor:Tl_int32; nbins:Tl_int32; pcarray:PPl_uint32; 
           pixadb:PPIXA):Tl_ok;cdecl;external;
function pixDisplayColorArray(carray:Pl_uint32; ncolors:Tl_int32; side:Tl_int32; ncols:Tl_int32; fontsize:Tl_int32):PPIX;cdecl;external;
function pixRankBinByStrip(pixs:PPIX; direction:Tl_int32; size:Tl_int32; nbins:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixaGetAlignedStats(pixa:PPIXA; _type:Tl_int32; nbins:Tl_int32; thresh:Tl_int32):PPIX;cdecl;external;
function pixaExtractColumnFromEachPix(pixa:PPIXA; col:Tl_int32; pixd:PPIX):Tl_ok;cdecl;external;
function pixGetRowStats(pixs:PPIX; _type:Tl_int32; nbins:Tl_int32; thresh:Tl_int32; colvect:Pl_float32):Tl_ok;cdecl;external;
function pixGetColumnStats(pixs:PPIX; _type:Tl_int32; nbins:Tl_int32; thresh:Tl_int32; rowvect:Pl_float32):Tl_ok;cdecl;external;
function pixSetPixelColumn(pix:PPIX; col:Tl_int32; colvect:Pl_float32):Tl_ok;cdecl;external;
function pixThresholdForFgBg(pixs:PPIX; factor:Tl_int32; thresh:Tl_int32; pfgval:Pl_int32; pbgval:Pl_int32):Tl_ok;cdecl;external;
function pixSplitDistributionFgBg(pixs:PPIX; scorefract:Tl_float32; factor:Tl_int32; pthresh:Pl_int32; pfgval:Pl_int32; 
           pbgval:Pl_int32; ppixdb:PPPIX):Tl_ok;cdecl;external;
function pixaFindDimensions(pixa:PPIXA; pnaw:PPNUMA; pnah:PPNUMA):Tl_ok;cdecl;external;
function pixFindAreaPerimRatio(pixs:PPIX; tab:Pl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixaFindPerimToAreaRatio(pixa:PPIXA):PNUMA;cdecl;external;
function pixFindPerimToAreaRatio(pixs:PPIX; tab:Pl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixaFindPerimSizeRatio(pixa:PPIXA):PNUMA;cdecl;external;
function pixFindPerimSizeRatio(pixs:PPIX; tab:Pl_int32; pratio:Pl_float32):Tl_ok;cdecl;external;
function pixaFindAreaFraction(pixa:PPIXA):PNUMA;cdecl;external;
function pixFindAreaFraction(pixs:PPIX; tab:Pl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixaFindAreaFractionMasked(pixa:PPIXA; pixm:PPIX; debug:Tl_int32):PNUMA;cdecl;external;
function pixFindAreaFractionMasked(pixs:PPIX; box:PBOX; pixm:PPIX; tab:Pl_int32; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixaFindWidthHeightRatio(pixa:PPIXA):PNUMA;cdecl;external;
function pixaFindWidthHeightProduct(pixa:PPIXA):PNUMA;cdecl;external;
function pixFindOverlapFraction(pixs1:PPIX; pixs2:PPIX; x2:Tl_int32; y2:Tl_int32; tab:Pl_int32; 
           pratio:Pl_float32; pnoverlap:Pl_int32):Tl_ok;cdecl;external;
function pixFindRectangleComps(pixs:PPIX; dist:Tl_int32; minw:Tl_int32; minh:Tl_int32):PBOXA;cdecl;external;
function pixConformsToRectangle(pixs:PPIX; box:PBOX; dist:Tl_int32; pconforms:Pl_int32):Tl_ok;cdecl;external;
function pixClipRectangles(pixs:PPIX; boxa:PBOXA):PPIXA;cdecl;external;
function pixClipRectangle(pixs:PPIX; box:PBOX; pboxc:PPBOX):PPIX;cdecl;external;
function pixClipRectangleWithBorder(pixs:PPIX; box:PBOX; maxbord:Tl_int32; pboxn:PPBOX):PPIX;cdecl;external;
function pixClipMasked(pixs:PPIX; pixm:PPIX; x:Tl_int32; y:Tl_int32; outval:Tl_uint32):PPIX;cdecl;external;
function pixCropToMatch(pixs1:PPIX; pixs2:PPIX; ppixd1:PPPIX; ppixd2:PPPIX):Tl_ok;cdecl;external;
function pixCropToSize(pixs:PPIX; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixResizeToMatch(pixs:PPIX; pixt:PPIX; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixSelectComponentBySize(pixs:PPIX; rankorder:Tl_int32; _type:Tl_int32; connectivity:Tl_int32; pbox:PPBOX):PPIX;cdecl;external;
function pixFilterComponentBySize(pixs:PPIX; rankorder:Tl_int32; _type:Tl_int32; connectivity:Tl_int32; pbox:PPBOX):PPIX;cdecl;external;
function pixMakeSymmetricMask(w:Tl_int32; h:Tl_int32; hf:Tl_float32; vf:Tl_float32; _type:Tl_int32):PPIX;cdecl;external;
function pixMakeFrameMask(w:Tl_int32; h:Tl_int32; hf1:Tl_float32; hf2:Tl_float32; vf1:Tl_float32; 
           vf2:Tl_float32):PPIX;cdecl;external;
function pixMakeCoveringOfRectangles(pixs:PPIX; maxiters:Tl_int32):PPIX;cdecl;external;
function pixFractionFgInMask(pix1:PPIX; pix2:PPIX; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixClipToForeground(pixs:PPIX; ppixd:PPPIX; pbox:PPBOX):Tl_ok;cdecl;external;
function pixTestClipToForeground(pixs:PPIX; pcanclip:Pl_int32):Tl_ok;cdecl;external;
function pixClipBoxToForeground(pixs:PPIX; boxs:PBOX; ppixd:PPPIX; pboxd:PPBOX):Tl_ok;cdecl;external;
function pixScanForForeground(pixs:PPIX; box:PBOX; scanflag:Tl_int32; ploc:Pl_int32):Tl_ok;cdecl;external;
function pixClipBoxToEdges(pixs:PPIX; boxs:PBOX; lowthresh:Tl_int32; highthresh:Tl_int32; maxwidth:Tl_int32; 
           factor:Tl_int32; ppixd:PPPIX; pboxd:PPBOX):Tl_ok;cdecl;external;
function pixScanForEdge(pixs:PPIX; box:PBOX; lowthresh:Tl_int32; highthresh:Tl_int32; maxwidth:Tl_int32; 
           factor:Tl_int32; scanflag:Tl_int32; ploc:Pl_int32):Tl_ok;cdecl;external;
function pixExtractOnLine(pixs:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           factor:Tl_int32):PNUMA;cdecl;external;
function pixAverageOnLine(pixs:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           factor:Tl_int32):Tl_float32;cdecl;external;
function pixAverageIntensityProfile(pixs:PPIX; fract:Tl_float32; dir:Tl_int32; first:Tl_int32; last:Tl_int32; 
           factor1:Tl_int32; factor2:Tl_int32):PNUMA;cdecl;external;
function pixReversalProfile(pixs:PPIX; fract:Tl_float32; dir:Tl_int32; first:Tl_int32; last:Tl_int32; 
           minreversal:Tl_int32; factor1:Tl_int32; factor2:Tl_int32):PNUMA;cdecl;external;
function pixWindowedVarianceOnLine(pixs:PPIX; dir:Tl_int32; loc:Tl_int32; c1:Tl_int32; c2:Tl_int32; 
           size:Tl_int32; pnad:PPNUMA):Tl_ok;cdecl;external;
function pixMinMaxNearLine(pixs:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32; 
           dist:Tl_int32; direction:Tl_int32; pnamin:PPNUMA; pnamax:PPNUMA; pminave:Pl_float32; 
           pmaxave:Pl_float32):Tl_ok;cdecl;external;
function pixRankRowTransform(pixs:PPIX):PPIX;cdecl;external;
function pixRankColumnTransform(pixs:PPIX):PPIX;cdecl;external;
function pixaCreate(n:Tl_int32):PPIXA;cdecl;external;
function pixaCreateFromPix(pixs:PPIX; n:Tl_int32; cellw:Tl_int32; cellh:Tl_int32):PPIXA;cdecl;external;
function pixaCreateFromBoxa(pixs:PPIX; boxa:PBOXA; start:Tl_int32; num:Tl_int32; pcropwarn:Pl_int32):PPIXA;cdecl;external;
function pixaSplitPix(pixs:PPIX; nx:Tl_int32; ny:Tl_int32; borderwidth:Tl_int32; bordercolor:Tl_uint32):PPIXA;cdecl;external;
procedure pixaDestroy(ppixa:PPPIXA);cdecl;external;
function pixaCopy(pixa:PPIXA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaAddPix(pixa:PPIXA; pix:PPIX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixaAddBox(pixa:PPIXA; box:PBOX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixaExtendArrayToSize(pixa:PPIXA; size:Tsize_t):Tl_ok;cdecl;external;
function pixaGetCount(pixa:PPIXA):Tl_int32;cdecl;external;
function pixaChangeRefcount(pixa:PPIXA; delta:Tl_int32):Tl_ok;cdecl;external;
function pixaGetPix(pixa:PPIXA; index:Tl_int32; accesstype:Tl_int32):PPIX;cdecl;external;
function pixaGetPixDimensions(pixa:PPIXA; index:Tl_int32; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32):Tl_ok;cdecl;external;
function pixaGetBoxa(pixa:PPIXA; accesstype:Tl_int32):PBOXA;cdecl;external;
function pixaGetBoxaCount(pixa:PPIXA):Tl_int32;cdecl;external;
function pixaGetBox(pixa:PPIXA; index:Tl_int32; accesstype:Tl_int32):PBOX;cdecl;external;
function pixaGetBoxGeometry(pixa:PPIXA; index:Tl_int32; px:Pl_int32; py:Pl_int32; pw:Pl_int32; 
           ph:Pl_int32):Tl_ok;cdecl;external;
function pixaSetBoxa(pixa:PPIXA; boxa:PBOXA; accesstype:Tl_int32):Tl_ok;cdecl;external;
function pixaGetPixArray(pixa:PPIXA):^PPIX;cdecl;external;
function pixaVerifyDepth(pixa:PPIXA; psame:Pl_int32; pmaxd:Pl_int32):Tl_ok;cdecl;external;
function pixaVerifyDimensions(pixa:PPIXA; psame:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function pixaIsFull(pixa:PPIXA; pfullpa:Pl_int32; pfullba:Pl_int32):Tl_ok;cdecl;external;
function pixaCountText(pixa:PPIXA; pntext:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaSetText(pixa:PPIXA; text:Pchar; sa:PSARRAY):Tl_ok;cdecl;external;
function pixaGetLinePtrs(pixa:PPIXA; psize:Pl_int32):^^pointer;cdecl;external;
function pixaWriteStreamInfo(fp:PFILE; pixa:PPIXA):Tl_ok;cdecl;external;
function pixaReplacePix(pixa:PPIXA; index:Tl_int32; pix:PPIX; box:PBOX):Tl_ok;cdecl;external;
function pixaInsertPix(pixa:PPIXA; index:Tl_int32; pixs:PPIX; box:PBOX):Tl_ok;cdecl;external;
function pixaRemovePix(pixa:PPIXA; index:Tl_int32):Tl_ok;cdecl;external;
function pixaRemovePixAndSave(pixa:PPIXA; index:Tl_int32; ppix:PPPIX; pbox:PPBOX):Tl_ok;cdecl;external;
function pixaRemoveSelected(pixa:PPIXA; naindex:PNUMA):Tl_ok;cdecl;external;
function pixaInitFull(pixa:PPIXA; pix:PPIX; box:PBOX):Tl_ok;cdecl;external;
function pixaClear(pixa:PPIXA):Tl_ok;cdecl;external;
function pixaJoin(pixad:PPIXA; pixas:PPIXA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function pixaInterleave(pixa1:PPIXA; pixa2:PPIXA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaaJoin(paad:PPIXAA; paas:PPIXAA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function pixaaCreate(n:Tl_int32):PPIXAA;cdecl;external;
function pixaaCreateFromPixa(pixa:PPIXA; n:Tl_int32; _type:Tl_int32; copyflag:Tl_int32):PPIXAA;cdecl;external;
procedure pixaaDestroy(ppaa:PPPIXAA);cdecl;external;
function pixaaAddPixa(paa:PPIXAA; pixa:PPIXA; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixaaAddPix(paa:PPIXAA; index:Tl_int32; pix:PPIX; box:PBOX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixaaAddBox(paa:PPIXAA; box:PBOX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixaaGetCount(paa:PPIXAA; pna:PPNUMA):Tl_int32;cdecl;external;
function pixaaGetPixa(paa:PPIXAA; index:Tl_int32; accesstype:Tl_int32):PPIXA;cdecl;external;
function pixaaGetBoxa(paa:PPIXAA; accesstype:Tl_int32):PBOXA;cdecl;external;
function pixaaGetPix(paa:PPIXAA; index:Tl_int32; ipix:Tl_int32; accessflag:Tl_int32):PPIX;cdecl;external;
function pixaaVerifyDepth(paa:PPIXAA; psame:Pl_int32; pmaxd:Pl_int32):Tl_ok;cdecl;external;
function pixaaVerifyDimensions(paa:PPIXAA; psame:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function pixaaIsFull(paa:PPIXAA; pfull:Pl_int32):Tl_int32;cdecl;external;
function pixaaInitFull(paa:PPIXAA; pixa:PPIXA):Tl_ok;cdecl;external;
function pixaaReplacePixa(paa:PPIXAA; index:Tl_int32; pixa:PPIXA):Tl_ok;cdecl;external;
function pixaaClear(paa:PPIXAA):Tl_ok;cdecl;external;
function pixaaTruncate(paa:PPIXAA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaRead(filename:Pchar):PPIXA;cdecl;external;
function pixaReadStream(fp:PFILE):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaReadMem(data:Pl_uint8; size:Tsize_t):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaWriteDebug(fname:Pchar; pixa:PPIXA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaWrite(filename:Pchar; pixa:PPIXA):Tl_ok;cdecl;external;
function pixaWriteStream(fp:PFILE; pixa:PPIXA):Tl_ok;cdecl;external;
function pixaWriteMem(pdata:PPl_uint8; psize:Psize_t; pixa:PPIXA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaReadBoth(filename:Pchar):PPIXA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixaaReadFromFiles(dirname:Pchar; substr:Pchar; first:Tl_int32; nfiles:Tl_int32):PPIXAA;cdecl;external;
(* Const before type ignored *)
function pixaaRead(filename:Pchar):PPIXAA;cdecl;external;
function pixaaReadStream(fp:PFILE):PPIXAA;cdecl;external;
(* Const before type ignored *)
function pixaaReadMem(data:Pl_uint8; size:Tsize_t):PPIXAA;cdecl;external;
(* Const before type ignored *)
function pixaaWrite(filename:Pchar; paa:PPIXAA):Tl_ok;cdecl;external;
function pixaaWriteStream(fp:PFILE; paa:PPIXAA):Tl_ok;cdecl;external;
function pixaaWriteMem(pdata:PPl_uint8; psize:Psize_t; paa:PPIXAA):Tl_ok;cdecl;external;
function pixaccCreate(w:Tl_int32; h:Tl_int32; negflag:Tl_int32):PPIXACC;cdecl;external;
function pixaccCreateFromPix(pix:PPIX; negflag:Tl_int32):PPIXACC;cdecl;external;
procedure pixaccDestroy(ppixacc:PPPIXACC);cdecl;external;
function pixaccFinal(pixacc:PPIXACC; outdepth:Tl_int32):PPIX;cdecl;external;
function pixaccGetPix(pixacc:PPIXACC):PPIX;cdecl;external;
function pixaccGetOffset(pixacc:PPIXACC):Tl_int32;cdecl;external;
function pixaccAdd(pixacc:PPIXACC; pix:PPIX):Tl_ok;cdecl;external;
function pixaccSubtract(pixacc:PPIXACC; pix:PPIX):Tl_ok;cdecl;external;
function pixaccMultConst(pixacc:PPIXACC; factor:Tl_float32):Tl_ok;cdecl;external;
function pixaccMultConstAccumulate(pixacc:PPIXACC; pix:PPIX; factor:Tl_float32):Tl_ok;cdecl;external;
function pixSelectBySize(pixs:PPIX; width:Tl_int32; height:Tl_int32; connectivity:Tl_int32; _type:Tl_int32; 
           relation:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectBySize(pixas:PPIXA; width:Tl_int32; height:Tl_int32; _type:Tl_int32; relation:Tl_int32; 
           pchanged:Pl_int32):PPIXA;cdecl;external;
function pixaMakeSizeIndicator(pixa:PPIXA; width:Tl_int32; height:Tl_int32; _type:Tl_int32; relation:Tl_int32):PNUMA;cdecl;external;
function pixSelectByPerimToAreaRatio(pixs:PPIX; thresh:Tl_float32; connectivity:Tl_int32; _type:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectByPerimToAreaRatio(pixas:PPIXA; thresh:Tl_float32; _type:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixSelectByPerimSizeRatio(pixs:PPIX; thresh:Tl_float32; connectivity:Tl_int32; _type:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectByPerimSizeRatio(pixas:PPIXA; thresh:Tl_float32; _type:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixSelectByAreaFraction(pixs:PPIX; thresh:Tl_float32; connectivity:Tl_int32; _type:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectByAreaFraction(pixas:PPIXA; thresh:Tl_float32; _type:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixSelectByArea(pixs:PPIX; thresh:Tl_float32; connectivity:Tl_int32; _type:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectByArea(pixas:PPIXA; thresh:Tl_float32; _type:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixSelectByWidthHeightRatio(pixs:PPIX; thresh:Tl_float32; connectivity:Tl_int32; _type:Tl_int32; pchanged:Pl_int32):PPIX;cdecl;external;
function pixaSelectByWidthHeightRatio(pixas:PPIXA; thresh:Tl_float32; _type:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixaSelectByNumConnComp(pixas:PPIXA; nmin:Tl_int32; nmax:Tl_int32; connectivity:Tl_int32; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixaSelectWithIndicator(pixas:PPIXA; na:PNUMA; pchanged:Pl_int32):PPIXA;cdecl;external;
function pixRemoveWithIndicator(pixs:PPIX; pixa:PPIXA; na:PNUMA):Tl_ok;cdecl;external;
function pixAddWithIndicator(pixs:PPIX; pixa:PPIXA; na:PNUMA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaSelectWithString(pixas:PPIXA; str:Pchar; perror:Pl_int32):PPIXA;cdecl;external;
function pixaRenderComponent(pixs:PPIX; pixa:PPIXA; index:Tl_int32):PPIX;cdecl;external;
function pixaSort(pixas:PPIXA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaBinSort(pixas:PPIXA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaSortByIndex(pixas:PPIXA; naindex:PNUMA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaSort2dByIndex(pixas:PPIXA; naa:PNUMAA; copyflag:Tl_int32):PPIXAA;cdecl;external;
function pixaSelectRange(pixas:PPIXA; first:Tl_int32; last:Tl_int32; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaaSelectRange(paas:PPIXAA; first:Tl_int32; last:Tl_int32; copyflag:Tl_int32):PPIXAA;cdecl;external;
function pixaaScaleToSize(paas:PPIXAA; wd:Tl_int32; hd:Tl_int32):PPIXAA;cdecl;external;
function pixaaScaleToSizeVar(paas:PPIXAA; nawd:PNUMA; nahd:PNUMA):PPIXAA;cdecl;external;
function pixaScaleToSize(pixas:PPIXA; wd:Tl_int32; hd:Tl_int32):PPIXA;cdecl;external;
function pixaScaleToSizeRel(pixas:PPIXA; delw:Tl_int32; delh:Tl_int32):PPIXA;cdecl;external;
function pixaScale(pixas:PPIXA; scalex:Tl_float32; scaley:Tl_float32):PPIXA;cdecl;external;
function pixaScaleBySampling(pixas:PPIXA; scalex:Tl_float32; scaley:Tl_float32):PPIXA;cdecl;external;
function pixaRotate(pixas:PPIXA; angle:Tl_float32; _type:Tl_int32; incolor:Tl_int32; width:Tl_int32; 
           height:Tl_int32):PPIXA;cdecl;external;
function pixaRotateOrth(pixas:PPIXA; rotation:Tl_int32):PPIXA;cdecl;external;
function pixaTranslate(pixas:PPIXA; hshift:Tl_int32; vshift:Tl_int32; incolor:Tl_int32):PPIXA;cdecl;external;
function pixaAddBorderGeneral(pixad:PPIXA; pixas:PPIXA; left:Tl_int32; right:Tl_int32; top:Tl_int32; 
           bot:Tl_int32; val:Tl_uint32):PPIXA;cdecl;external;
function pixaaFlattenToPixa(paa:PPIXAA; pnaindex:PPNUMA; copyflag:Tl_int32):PPIXA;cdecl;external;
function pixaaSizeRange(paa:PPIXAA; pminw:Pl_int32; pminh:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function pixaSizeRange(pixa:PPIXA; pminw:Pl_int32; pminh:Pl_int32; pmaxw:Pl_int32; pmaxh:Pl_int32):Tl_ok;cdecl;external;
function pixaClipToPix(pixas:PPIXA; pixs:PPIX):PPIXA;cdecl;external;
function pixaClipToForeground(pixas:PPIXA; ppixad:PPPIXA; pboxa:PPBOXA):Tl_ok;cdecl;external;
function pixaGetRenderingDepth(pixa:PPIXA; pdepth:Pl_int32):Tl_ok;cdecl;external;
function pixaHasColor(pixa:PPIXA; phascolor:Pl_int32):Tl_ok;cdecl;external;
function pixaAnyColormaps(pixa:PPIXA; phascmap:Pl_int32):Tl_ok;cdecl;external;
function pixaGetDepthInfo(pixa:PPIXA; pmaxdepth:Pl_int32; psame:Pl_int32):Tl_ok;cdecl;external;
function pixaConvertToSameDepth(pixas:PPIXA):PPIXA;cdecl;external;
function pixaConvertToGivenDepth(pixas:PPIXA; depth:Tl_int32):PPIXA;cdecl;external;
function pixaEqual(pixa1:PPIXA; pixa2:PPIXA; maxdist:Tl_int32; pnaindex:PPNUMA; psame:Pl_int32):Tl_ok;cdecl;external;
function pixaSetFullSizeBoxa(pixa:PPIXA):Tl_ok;cdecl;external;
function pixaDisplay(pixa:PPIXA; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixaDisplayRandomCmap(pixa:PPIXA; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixaDisplayLinearly(pixas:PPIXA; direction:Tl_int32; scalefactor:Tl_float32; background:Tl_int32; spacing:Tl_int32; 
           border:Tl_int32; pboxa:PPBOXA):PPIX;cdecl;external;
function pixaDisplayOnLattice(pixa:PPIXA; cellw:Tl_int32; cellh:Tl_int32; pncols:Pl_int32; pboxa:PPBOXA):PPIX;cdecl;external;
function pixaDisplayUnsplit(pixa:PPIXA; nx:Tl_int32; ny:Tl_int32; borderwidth:Tl_int32; bordercolor:Tl_uint32):PPIX;cdecl;external;
function pixaDisplayTiled(pixa:PPIXA; maxwidth:Tl_int32; background:Tl_int32; spacing:Tl_int32):PPIX;cdecl;external;
function pixaDisplayTiledInRows(pixa:PPIXA; outdepth:Tl_int32; maxwidth:Tl_int32; scalefactor:Tl_float32; background:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32):PPIX;cdecl;external;
function pixaDisplayTiledInColumns(pixas:PPIXA; nx:Tl_int32; scalefactor:Tl_float32; spacing:Tl_int32; border:Tl_int32):PPIX;cdecl;external;
function pixaDisplayTiledAndScaled(pixa:PPIXA; outdepth:Tl_int32; tilewidth:Tl_int32; ncols:Tl_int32; background:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32):PPIX;cdecl;external;
function pixaDisplayTiledWithText(pixa:PPIXA; maxwidth:Tl_int32; scalefactor:Tl_float32; spacing:Tl_int32; border:Tl_int32; 
           fontsize:Tl_int32; textcolor:Tl_uint32):PPIX;cdecl;external;
function pixaDisplayTiledByIndex(pixa:PPIXA; na:PNUMA; width:Tl_int32; spacing:Tl_int32; border:Tl_int32; 
           fontsize:Tl_int32; textcolor:Tl_uint32):PPIX;cdecl;external;
function pixaDisplayPairTiledInColumns(pixas1:PPIXA; pixas2:PPIXA; nx:Tl_int32; scalefactor:Tl_float32; spacing1:Tl_int32; 
           spacing2:Tl_int32; border1:Tl_int32; border2:Tl_int32; fontsize:Tl_int32; startindex:Tl_int32; 
           sa:PSARRAY):PPIX;cdecl;external;
function pixaaDisplay(paa:PPIXAA; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function pixaaDisplayByPixa(paa:PPIXAA; maxnx:Tl_int32; scalefactor:Tl_float32; hspacing:Tl_int32; vspacing:Tl_int32; 
           border:Tl_int32):PPIX;cdecl;external;
function pixaaDisplayTiledAndScaled(paa:PPIXAA; outdepth:Tl_int32; tilewidth:Tl_int32; ncols:Tl_int32; background:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32):PPIXA;cdecl;external;
function pixaConvertTo1(pixas:PPIXA; thresh:Tl_int32):PPIXA;cdecl;external;
function pixaConvertTo8(pixas:PPIXA; cmapflag:Tl_int32):PPIXA;cdecl;external;
function pixaConvertTo8Colormap(pixas:PPIXA; dither:Tl_int32):PPIXA;cdecl;external;
function pixaConvertTo32(pixas:PPIXA):PPIXA;cdecl;external;
function pixaConstrainedSelect(pixas:PPIXA; first:Tl_int32; last:Tl_int32; nmax:Tl_int32; use_pairs:Tl_int32; 
           copyflag:Tl_int32):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaSelectToPdf(pixas:PPIXA; first:Tl_int32; last:Tl_int32; res:Tl_int32; scalefactor:Tl_float32; 
           _type:Tl_int32; quality:Tl_int32; color:Tl_uint32; fontsize:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
function pixaMakeFromTiledPixa(pixas:PPIXA; w:Tl_int32; h:Tl_int32; nsamp:Tl_int32):PPIXA;cdecl;external;
function pixaMakeFromTiledPix(pixs:PPIX; w:Tl_int32; h:Tl_int32; start:Tl_int32; num:Tl_int32; 
           boxa:PBOXA):PPIXA;cdecl;external;
function pixGetTileCount(pix:PPIX; pn:Pl_int32):Tl_ok;cdecl;external;
function pixaDisplayMultiTiled(pixas:PPIXA; nx:Tl_int32; ny:Tl_int32; maxw:Tl_int32; maxh:Tl_int32; 
           scalefactor:Tl_float32; spacing:Tl_int32; border:Tl_int32):PPIXA;cdecl;external;
function pixaSplitIntoFiles(pixas:PPIXA; nsplit:Tl_int32; scale:Tl_float32; outwidth:Tl_int32; write_pixa:Tl_int32; 
           write_pix:Tl_int32; write_pdf:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertToNUpFiles(dir:Pchar; substr:Pchar; nx:Tl_int32; ny:Tl_int32; tw:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32; fontsize:Tl_int32; outdir:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertToNUpPixa(dir:Pchar; substr:Pchar; nx:Tl_int32; ny:Tl_int32; tw:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32; fontsize:Tl_int32):PPIXA;cdecl;external;
function pixaConvertToNUpPixa(pixas:PPIXA; sa:PSARRAY; nx:Tl_int32; ny:Tl_int32; tw:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32; fontsize:Tl_int32):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaCompareInPdf(pixa1:PPIXA; pixa2:PPIXA; nx:Tl_int32; ny:Tl_int32; tw:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32; fontsize:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pmsCreate(minsize:Tsize_t; smallest:Tsize_t; numalloc:PNUMA; logfile:Pchar):Tl_ok;cdecl;external;
procedure pmsDestroy;cdecl;external;
function pmsCustomAlloc(nbytes:Tsize_t):pointer;cdecl;external;
procedure pmsCustomDealloc(data:pointer);cdecl;external;
function pmsGetAlloc(nbytes:Tsize_t):pointer;cdecl;external;
function pmsGetLevelForAlloc(nbytes:Tsize_t; plevel:Pl_int32):Tl_ok;cdecl;external;
function pmsGetLevelForDealloc(data:pointer; plevel:Pl_int32):Tl_ok;cdecl;external;
procedure pmsLogInfo;cdecl;external;
function pixAddConstantGray(pixs:PPIX; val:Tl_int32):Tl_ok;cdecl;external;
function pixMultConstantGray(pixs:PPIX; val:Tl_float32):Tl_ok;cdecl;external;
function pixAddGray(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixSubtractGray(pixd:PPIX; pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixMultiplyGray(pixs:PPIX; pixg:PPIX; norm:Tl_float32):PPIX;cdecl;external;
function pixThresholdToValue(pixd:PPIX; pixs:PPIX; threshval:Tl_int32; setval:Tl_int32):PPIX;cdecl;external;
function pixInitAccumulate(w:Tl_int32; h:Tl_int32; offset:Tl_uint32):PPIX;cdecl;external;
function pixFinalAccumulate(pixs:PPIX; offset:Tl_uint32; depth:Tl_int32):PPIX;cdecl;external;
function pixFinalAccumulateThreshold(pixs:PPIX; offset:Tl_uint32; threshold:Tl_uint32):PPIX;cdecl;external;
function pixAccumulate(pixd:PPIX; pixs:PPIX; op:Tl_int32):Tl_ok;cdecl;external;
function pixMultConstAccumulate(pixs:PPIX; factor:Tl_float32; offset:Tl_uint32):Tl_ok;cdecl;external;
function pixAbsDifference(pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixAddRGB(pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixMinOrMax(pixd:PPIX; pixs1:PPIX; pixs2:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixMaxDynamicRange(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixMaxDynamicRangeRGB(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function linearScaleRGBVal(sval:Tl_uint32; factor:Tl_float32):Tl_uint32;cdecl;external;
function logScaleRGBVal(sval:Tl_uint32; tab:Pl_float32; factor:Tl_float32):Tl_uint32;cdecl;external;
function makeLogBase2Tab:Pl_float32;cdecl;external;
function getLogBase2(val:Tl_int32; logtab:Pl_float32):Tl_float32;cdecl;external;
function pixcompCreateFromPix(pix:PPIX; comptype:Tl_int32):PPIXC;cdecl;external;
function pixcompCreateFromString(data:Pl_uint8; size:Tsize_t; copyflag:Tl_int32):PPIXC;cdecl;external;
(* Const before type ignored *)
function pixcompCreateFromFile(filename:Pchar; comptype:Tl_int32):PPIXC;cdecl;external;
procedure pixcompDestroy(ppixc:PPPIXC);cdecl;external;
function pixcompCopy(pixcs:PPIXC):PPIXC;cdecl;external;
function pixcompGetDimensions(pixc:PPIXC; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32):Tl_ok;cdecl;external;
function pixcompGetParameters(pixc:PPIXC; pxres:Pl_int32; pyres:Pl_int32; pcomptype:Pl_int32; pcmapflag:Pl_int32):Tl_ok;cdecl;external;
function pixcompDetermineFormat(comptype:Tl_int32; d:Tl_int32; cmapflag:Tl_int32; pformat:Pl_int32):Tl_ok;cdecl;external;
function pixCreateFromPixcomp(pixc:PPIXC):PPIX;cdecl;external;
function pixacompCreate(n:Tl_int32):PPIXAC;cdecl;external;
function pixacompCreateWithInit(n:Tl_int32; offset:Tl_int32; pix:PPIX; comptype:Tl_int32):PPIXAC;cdecl;external;
function pixacompCreateFromPixa(pixa:PPIXA; comptype:Tl_int32; accesstype:Tl_int32):PPIXAC;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixacompCreateFromFiles(dirname:Pchar; substr:Pchar; comptype:Tl_int32):PPIXAC;cdecl;external;
function pixacompCreateFromSA(sa:PSARRAY; comptype:Tl_int32):PPIXAC;cdecl;external;
procedure pixacompDestroy(ppixac:PPPIXAC);cdecl;external;
function pixacompAddPix(pixac:PPIXAC; pix:PPIX; comptype:Tl_int32):Tl_ok;cdecl;external;
function pixacompAddPixcomp(pixac:PPIXAC; pixc:PPIXC; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixacompReplacePix(pixac:PPIXAC; index:Tl_int32; pix:PPIX; comptype:Tl_int32):Tl_ok;cdecl;external;
function pixacompReplacePixcomp(pixac:PPIXAC; index:Tl_int32; pixc:PPIXC):Tl_ok;cdecl;external;
function pixacompAddBox(pixac:PPIXAC; box:PBOX; copyflag:Tl_int32):Tl_ok;cdecl;external;
function pixacompGetCount(pixac:PPIXAC):Tl_int32;cdecl;external;
function pixacompGetPixcomp(pixac:PPIXAC; index:Tl_int32; copyflag:Tl_int32):PPIXC;cdecl;external;
function pixacompGetPix(pixac:PPIXAC; index:Tl_int32):PPIX;cdecl;external;
function pixacompGetPixDimensions(pixac:PPIXAC; index:Tl_int32; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32):Tl_ok;cdecl;external;
function pixacompGetBoxa(pixac:PPIXAC; accesstype:Tl_int32):PBOXA;cdecl;external;
function pixacompGetBoxaCount(pixac:PPIXAC):Tl_int32;cdecl;external;
function pixacompGetBox(pixac:PPIXAC; index:Tl_int32; accesstype:Tl_int32):PBOX;cdecl;external;
function pixacompGetBoxGeometry(pixac:PPIXAC; index:Tl_int32; px:Pl_int32; py:Pl_int32; pw:Pl_int32; 
           ph:Pl_int32):Tl_ok;cdecl;external;
function pixacompGetOffset(pixac:PPIXAC):Tl_int32;cdecl;external;
function pixacompSetOffset(pixac:PPIXAC; offset:Tl_int32):Tl_ok;cdecl;external;
function pixaCreateFromPixacomp(pixac:PPIXAC; accesstype:Tl_int32):PPIXA;cdecl;external;
function pixacompJoin(pixacd:PPIXAC; pixacs:PPIXAC; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function pixacompInterleave(pixac1:PPIXAC; pixac2:PPIXAC):PPIXAC;cdecl;external;
(* Const before type ignored *)
function pixacompRead(filename:Pchar):PPIXAC;cdecl;external;
function pixacompReadStream(fp:PFILE):PPIXAC;cdecl;external;
(* Const before type ignored *)
function pixacompReadMem(data:Pl_uint8; size:Tsize_t):PPIXAC;cdecl;external;
(* Const before type ignored *)
function pixacompWrite(filename:Pchar; pixac:PPIXAC):Tl_ok;cdecl;external;
function pixacompWriteStream(fp:PFILE; pixac:PPIXAC):Tl_ok;cdecl;external;
function pixacompWriteMem(pdata:PPl_uint8; psize:Psize_t; pixac:PPIXAC):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixacompConvertToPdf(pixac:PPIXAC; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixacompConvertToPdfData(pixac:PPIXAC; res:Tl_int32; scalefactor:Tl_float32; _type:Tl_int32; quality:Tl_int32; 
           title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixacompFastConvertToPdfData(pixac:PPIXAC; title:Pchar; pdata:PPl_uint8; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixacompWriteStreamInfo(fp:PFILE; pixac:PPIXAC; text:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcompWriteStreamInfo(fp:PFILE; pixc:PPIXC; text:Pchar):Tl_ok;cdecl;external;
function pixacompDisplayTiledAndScaled(pixac:PPIXAC; outdepth:Tl_int32; tilewidth:Tl_int32; ncols:Tl_int32; background:Tl_int32; 
           spacing:Tl_int32; border:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixacompWriteFiles(pixac:PPIXAC; subdir:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixcompWriteFile(rootname:Pchar; pixc:PPIXC):Tl_ok;cdecl;external;
function pixThreshold8(pixs:PPIX; d:Tl_int32; nlevels:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixRemoveColormapGeneral(pixs:PPIX; _type:Tl_int32; ifnocmap:Tl_int32):PPIX;cdecl;external;
function pixRemoveColormap(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixAddGrayColormap8(pixs:PPIX):Tl_ok;cdecl;external;
function pixAddMinimalGrayColormap8(pixs:PPIX):PPIX;cdecl;external;
function pixConvertRGBToLuminance(pixs:PPIX):PPIX;cdecl;external;
function pixConvertRGBToGrayGeneral(pixs:PPIX; _type:Tl_int32; rwt:Tl_float32; gwt:Tl_float32; bwt:Tl_float32):PPIX;cdecl;external;
function pixConvertRGBToGray(pixs:PPIX; rwt:Tl_float32; gwt:Tl_float32; bwt:Tl_float32):PPIX;cdecl;external;
function pixConvertRGBToGrayFast(pixs:PPIX):PPIX;cdecl;external;
function pixConvertRGBToGrayMinMax(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixConvertRGBToGraySatBoost(pixs:PPIX; refval:Tl_int32):PPIX;cdecl;external;
function pixConvertRGBToGrayArb(pixs:PPIX; rc:Tl_float32; gc:Tl_float32; bc:Tl_float32):PPIX;cdecl;external;
function pixConvertRGBToBinaryArb(pixs:PPIX; rc:Tl_float32; gc:Tl_float32; bc:Tl_float32; thresh:Tl_int32; 
           relation:Tl_int32):PPIX;cdecl;external;
function pixConvertGrayToColormap(pixs:PPIX):PPIX;cdecl;external;
function pixConvertGrayToColormap8(pixs:PPIX; mindepth:Tl_int32):PPIX;cdecl;external;
function pixColorizeGray(pixs:PPIX; color:Tl_uint32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixConvertRGBToColormap(pixs:PPIX; ditherflag:Tl_int32):PPIX;cdecl;external;
function pixConvertCmapTo1(pixs:PPIX):PPIX;cdecl;external;
function pixQuantizeIfFewColors(pixs:PPIX; maxcolors:Tl_int32; mingraycolors:Tl_int32; octlevel:Tl_int32; ppixd:PPPIX):Tl_ok;cdecl;external;
function pixConvert16To8(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixConvertGrayToFalseColor(pixs:PPIX; gamma:Tl_float32):PPIX;cdecl;external;
function pixUnpackBinary(pixs:PPIX; depth:Tl_int32; invert:Tl_int32):PPIX;cdecl;external;
function pixConvert1To16(pixd:PPIX; pixs:PPIX; val0:Tl_uint16; val1:Tl_uint16):PPIX;cdecl;external;
function pixConvert1To32(pixd:PPIX; pixs:PPIX; val0:Tl_uint32; val1:Tl_uint32):PPIX;cdecl;external;
function pixConvert1To2Cmap(pixs:PPIX):PPIX;cdecl;external;
function pixConvert1To2(pixd:PPIX; pixs:PPIX; val0:Tl_int32; val1:Tl_int32):PPIX;cdecl;external;
function pixConvert1To4Cmap(pixs:PPIX):PPIX;cdecl;external;
function pixConvert1To4(pixd:PPIX; pixs:PPIX; val0:Tl_int32; val1:Tl_int32):PPIX;cdecl;external;
function pixConvert1To8Cmap(pixs:PPIX):PPIX;cdecl;external;
function pixConvert1To8(pixd:PPIX; pixs:PPIX; val0:Tl_uint8; val1:Tl_uint8):PPIX;cdecl;external;
function pixConvert2To8(pixs:PPIX; val0:Tl_uint8; val1:Tl_uint8; val2:Tl_uint8; val3:Tl_uint8; 
           cmapflag:Tl_int32):PPIX;cdecl;external;
function pixConvert4To8(pixs:PPIX; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixConvert8To16(pixs:PPIX; leftshift:Tl_int32):PPIX;cdecl;external;
function pixConvertTo2(pixs:PPIX):PPIX;cdecl;external;
function pixConvert8To2(pix:PPIX):PPIX;cdecl;external;
function pixConvertTo4(pixs:PPIX):PPIX;cdecl;external;
function pixConvert8To4(pix:PPIX):PPIX;cdecl;external;
function pixConvertTo1Adaptive(pixs:PPIX):PPIX;cdecl;external;
function pixConvertTo1(pixs:PPIX; threshold:Tl_int32):PPIX;cdecl;external;
function pixConvertTo1BySampling(pixs:PPIX; factor:Tl_int32; threshold:Tl_int32):PPIX;cdecl;external;
function pixConvertTo8(pixs:PPIX; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixConvertTo8BySampling(pixs:PPIX; factor:Tl_int32; cmapflag:Tl_int32):PPIX;cdecl;external;
function pixConvertTo8Colormap(pixs:PPIX; dither:Tl_int32):PPIX;cdecl;external;
function pixConvertTo16(pixs:PPIX):PPIX;cdecl;external;
function pixConvertTo32(pixs:PPIX):PPIX;cdecl;external;
function pixConvertTo32BySampling(pixs:PPIX; factor:Tl_int32):PPIX;cdecl;external;
function pixConvert8To32(pixs:PPIX):PPIX;cdecl;external;
function pixConvertTo8Or32(pixs:PPIX; copyflag:Tl_int32; warnflag:Tl_int32):PPIX;cdecl;external;
function pixConvert24To32(pixs:PPIX):PPIX;cdecl;external;
function pixConvert32To24(pixs:PPIX):PPIX;cdecl;external;
function pixConvert32To16(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixConvert32To8(pixs:PPIX; type16:Tl_int32; type8:Tl_int32):PPIX;cdecl;external;
function pixRemoveAlpha(pixs:PPIX):PPIX;cdecl;external;
function pixAddAlphaTo1bpp(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixConvertLossless(pixs:PPIX; d:Tl_int32):PPIX;cdecl;external;
function pixConvertForPSWrap(pixs:PPIX):PPIX;cdecl;external;
function pixConvertToSubpixelRGB(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32; order:Tl_int32):PPIX;cdecl;external;
function pixConvertGrayToSubpixelRGB(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32; order:Tl_int32):PPIX;cdecl;external;
function pixConvertColorToSubpixelRGB(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32; order:Tl_int32):PPIX;cdecl;external;
procedure l_setNeutralBoostVal(val:Tl_int32);cdecl;external;
function pixConnCompTransform(pixs:PPIX; connect:Tl_int32; depth:Tl_int32):PPIX;cdecl;external;
function pixConnCompAreaTransform(pixs:PPIX; connect:Tl_int32):PPIX;cdecl;external;
function pixConnCompIncrInit(pixs:PPIX; conn:Tl_int32; ppixd:PPPIX; pptaa:PPPTAA; pncc:Pl_int32):Tl_ok;cdecl;external;
function pixConnCompIncrAdd(pixs:PPIX; ptaa:PPTAA; pncc:Pl_int32; x:Tl_float32; y:Tl_float32; 
           debug:Tl_int32):Tl_int32;cdecl;external;
function pixGetSortedNeighborValues(pixs:PPIX; x:Tl_int32; y:Tl_int32; conn:Tl_int32; pneigh:PPl_int32; 
           pnvals:Pl_int32):Tl_ok;cdecl;external;
function pixLocToColorTransform(pixs:PPIX):PPIX;cdecl;external;
function pixTilingCreate(pixs:PPIX; nx:Tl_int32; ny:Tl_int32; w:Tl_int32; h:Tl_int32; 
           xoverlap:Tl_int32; yoverlap:Tl_int32):PPIXTILING;cdecl;external;
procedure pixTilingDestroy(ppt:PPPIXTILING);cdecl;external;
function pixTilingGetCount(pt:PPIXTILING; pnx:Pl_int32; pny:Pl_int32):Tl_ok;cdecl;external;
function pixTilingGetSize(pt:PPIXTILING; pw:Pl_int32; ph:Pl_int32):Tl_ok;cdecl;external;
function pixTilingGetTile(pt:PPIXTILING; i:Tl_int32; j:Tl_int32):PPIX;cdecl;external;
function pixTilingNoStripOnPaint(pt:PPIXTILING):Tl_ok;cdecl;external;
function pixTilingPaintTile(pixd:PPIX; i:Tl_int32; j:Tl_int32; pixs:PPIX; pt:PPIXTILING):Tl_ok;cdecl;external;
function pixReadStreamPng(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderPng(filename:Pchar; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           piscmap:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderPng(fp:PFILE; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           piscmap:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderMemPng(data:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; piscmap:Pl_int32):Tl_ok;cdecl;external;
function fgetPngResolution(fp:PFILE; pxres:Pl_int32; pyres:Pl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function isPngInterlaced(filename:Pchar; pinterlaced:Pl_int32):Tl_ok;cdecl;external;
function fgetPngColormapInfo(fp:PFILE; pcmap:PPPIXCMAP; ptransparency:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWritePng(filename:Pchar; pix:PPIX; gamma:Tl_float32):Tl_ok;cdecl;external;
function pixWriteStreamPng(fp:PFILE; pix:PPIX; gamma:Tl_float32):Tl_ok;cdecl;external;
function pixSetZlibCompression(pix:PPIX; compval:Tl_int32):Tl_ok;cdecl;external;
procedure l_pngSetReadStrip16To8(flag:Tl_int32);cdecl;external;
(* Const before type ignored *)
function pixReadMemPng(filedata:Pl_uint8; filesize:Tsize_t):PPIX;cdecl;external;
function pixWriteMemPng(pfiledata:PPl_uint8; pfilesize:Psize_t; pix:PPIX; gamma:Tl_float32):Tl_ok;cdecl;external;
function pixReadStreamPnm(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderPnm(filename:Pchar; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32; ptype:Pl_int32; 
           pbps:Pl_int32; pspp:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderPnm(fp:PFILE; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32; ptype:Pl_int32; 
           pbps:Pl_int32; pspp:Pl_int32):Tl_ok;cdecl;external;
function pixWriteStreamPnm(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteStreamAsciiPnm(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteStreamPam(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadMemPnm(data:Pl_uint8; size:Tsize_t):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderMemPnm(data:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32; pd:Pl_int32; 
           ptype:Pl_int32; pbps:Pl_int32; pspp:Pl_int32):Tl_ok;cdecl;external;
function pixWriteMemPnm(pdata:PPl_uint8; psize:Psize_t; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteMemPam(pdata:PPl_uint8; psize:Psize_t; pix:PPIX):Tl_ok;cdecl;external;
function pixProjectiveSampledPta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixProjectiveSampled(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixProjectivePta(pixs:PPIX; ptad:PPTA; ptas:PPTA; incolor:Tl_int32):PPIX;cdecl;external;
function pixProjective(pixs:PPIX; vc:Pl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixProjectivePtaColor(pixs:PPIX; ptad:PPTA; ptas:PPTA; colorval:Tl_uint32):PPIX;cdecl;external;
function pixProjectiveColor(pixs:PPIX; vc:Pl_float32; colorval:Tl_uint32):PPIX;cdecl;external;
function pixProjectivePtaGray(pixs:PPIX; ptad:PPTA; ptas:PPTA; grayval:Tl_uint8):PPIX;cdecl;external;
function pixProjectiveGray(pixs:PPIX; vc:Pl_float32; grayval:Tl_uint8):PPIX;cdecl;external;
function pixProjectivePtaWithAlpha(pixs:PPIX; ptad:PPTA; ptas:PPTA; pixg:PPIX; fract:Tl_float32; 
           border:Tl_int32):PPIX;cdecl;external;
function getProjectiveXformCoeffs(ptas:PPTA; ptad:PPTA; pvc:PPl_float32):Tl_ok;cdecl;external;
function projectiveXformSampledPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_int32; pyp:Pl_int32):Tl_ok;cdecl;external;
function projectiveXformPt(vc:Pl_float32; x:Tl_int32; y:Tl_int32; pxp:Pl_float32; pyp:Pl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertFilesToPS(dirin:Pchar; substr:Pchar; res:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function sarrayConvertFilesToPS(sa:PSARRAY; res:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertFilesFittedToPS(dirin:Pchar; substr:Pchar; xpts:Tl_float32; ypts:Tl_float32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function sarrayConvertFilesFittedToPS(sa:PSARRAY; xpts:Tl_float32; ypts:Tl_float32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function writeImageCompressedToPSFile(filein:Pchar; fileout:Pchar; res:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertSegmentedPagesToPS(pagedir:Pchar; pagestr:Pchar; page_numpre:Tl_int32; maskdir:Pchar; maskstr:Pchar; 
           mask_numpre:Tl_int32; numpost:Tl_int32; maxnum:Tl_int32; textscale:Tl_float32; imagescale:Tl_float32; 
           threshold:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteSegmentedPageToPS(pixs:PPIX; pixm:PPIX; textscale:Tl_float32; imagescale:Tl_float32; threshold:Tl_int32; 
           pageno:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteMixedToPS(pixb:PPIX; pixc:PPIX; scale:Tl_float32; pageno:Tl_int32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertToPSEmbed(filein:Pchar; fileout:Pchar; level:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixaWriteCompressedToPS(pixa:PPIXA; fileout:Pchar; res:Tl_int32; level:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteCompressedToPS(pix:PPIX; fileout:Pchar; res:Tl_int32; level:Tl_int32; pindex:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixWritePSEmbed(filein:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
function pixWriteStreamPS(fp:PFILE; pix:PPIX; box:PBOX; res:Tl_int32; scale:Tl_float32):Tl_ok;cdecl;external;
function pixWriteStringPS(pixs:PPIX; box:PBOX; res:Tl_int32; scale:Tl_float32):Pchar;cdecl;external;
function generateUncompressedPS(hexdata:Pchar; w:Tl_int32; h:Tl_int32; d:Tl_int32; psbpl:Tl_int32; 
           bps:Tl_int32; xpt:Tl_float32; ypt:Tl_float32; wpt:Tl_float32; hpt:Tl_float32; 
           boxflag:Tl_int32):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertJpegToPSEmbed(filein:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertJpegToPS(filein:Pchar; fileout:Pchar; operation:Pchar; x:Tl_int32; y:Tl_int32; 
           res:Tl_int32; scale:Tl_float32; pageno:Tl_int32; endpage:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertG4ToPSEmbed(filein:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertG4ToPS(filein:Pchar; fileout:Pchar; operation:Pchar; x:Tl_int32; y:Tl_int32; 
           res:Tl_int32; scale:Tl_float32; pageno:Tl_int32; maskflag:Tl_int32; endpage:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertTiffMultipageToPS(filein:Pchar; fileout:Pchar; fillfract:Tl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function convertFlateToPSEmbed(filein:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function convertFlateToPS(filein:Pchar; fileout:Pchar; operation:Pchar; x:Tl_int32; y:Tl_int32; 
           res:Tl_int32; scale:Tl_float32; pageno:Tl_int32; endpage:Tl_int32):Tl_ok;cdecl;external;
function pixWriteMemPS(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; box:PBOX; res:Tl_int32; 
           scale:Tl_float32):Tl_ok;cdecl;external;
function getResLetterPage(w:Tl_int32; h:Tl_int32; fillfract:Tl_float32):Tl_int32;cdecl;external;
function getResA4Page(w:Tl_int32; h:Tl_int32; fillfract:Tl_float32):Tl_int32;cdecl;external;
procedure l_psWriteBoundingBox(flag:Tl_int32);cdecl;external;
function ptaCreate(n:Tl_int32):PPTA;cdecl;external;
function ptaCreateFromNuma(nax:PNUMA; nay:PNUMA):PPTA;cdecl;external;
procedure ptaDestroy(ppta:PPPTA);cdecl;external;
function ptaCopy(pta:PPTA):PPTA;cdecl;external;
function ptaCopyRange(ptas:PPTA; istart:Tl_int32; iend:Tl_int32):PPTA;cdecl;external;
function ptaClone(pta:PPTA):PPTA;cdecl;external;
function ptaEmpty(pta:PPTA):Tl_ok;cdecl;external;
function ptaAddPt(pta:PPTA; x:Tl_float32; y:Tl_float32):Tl_ok;cdecl;external;
function ptaInsertPt(pta:PPTA; index:Tl_int32; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
function ptaRemovePt(pta:PPTA; index:Tl_int32):Tl_ok;cdecl;external;
function ptaGetRefcount(pta:PPTA):Tl_int32;cdecl;external;
function ptaChangeRefcount(pta:PPTA; delta:Tl_int32):Tl_int32;cdecl;external;
function ptaGetCount(pta:PPTA):Tl_int32;cdecl;external;
function ptaGetPt(pta:PPTA; index:Tl_int32; px:Pl_float32; py:Pl_float32):Tl_ok;cdecl;external;
function ptaGetIPt(pta:PPTA; index:Tl_int32; px:Pl_int32; py:Pl_int32):Tl_ok;cdecl;external;
function ptaSetPt(pta:PPTA; index:Tl_int32; x:Tl_float32; y:Tl_float32):Tl_ok;cdecl;external;
function ptaGetArrays(pta:PPTA; pnax:PPNUMA; pnay:PPNUMA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ptaRead(filename:Pchar):PPTA;cdecl;external;
function ptaReadStream(fp:PFILE):PPTA;cdecl;external;
(* Const before type ignored *)
function ptaReadMem(data:Pl_uint8; size:Tsize_t):PPTA;cdecl;external;
(* Const before type ignored *)
function ptaWriteDebug(filename:Pchar; pta:PPTA; _type:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ptaWrite(filename:Pchar; pta:PPTA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaWriteStream(fp:PFILE; pta:PPTA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaWriteMem(pdata:PPl_uint8; psize:Psize_t; pta:PPTA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaaCreate(n:Tl_int32):PPTAA;cdecl;external;
procedure ptaaDestroy(pptaa:PPPTAA);cdecl;external;
function ptaaAddPta(ptaa:PPTAA; pta:PPTA; copyflag:Tl_int32):Tl_ok;cdecl;external;
function ptaaGetCount(ptaa:PPTAA):Tl_int32;cdecl;external;
function ptaaGetPta(ptaa:PPTAA; index:Tl_int32; accessflag:Tl_int32):PPTA;cdecl;external;
function ptaaGetPt(ptaa:PPTAA; ipta:Tl_int32; jpt:Tl_int32; px:Pl_float32; py:Pl_float32):Tl_ok;cdecl;external;
function ptaaInitFull(ptaa:PPTAA; pta:PPTA):Tl_ok;cdecl;external;
function ptaaReplacePta(ptaa:PPTAA; index:Tl_int32; pta:PPTA):Tl_ok;cdecl;external;
function ptaaAddPt(ptaa:PPTAA; ipta:Tl_int32; x:Tl_float32; y:Tl_float32):Tl_ok;cdecl;external;
function ptaaTruncate(ptaa:PPTAA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ptaaRead(filename:Pchar):PPTAA;cdecl;external;
function ptaaReadStream(fp:PFILE):PPTAA;cdecl;external;
(* Const before type ignored *)
function ptaaReadMem(data:Pl_uint8; size:Tsize_t):PPTAA;cdecl;external;
(* Const before type ignored *)
function ptaaWriteDebug(filename:Pchar; ptaa:PPTAA; _type:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ptaaWrite(filename:Pchar; ptaa:PPTAA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaaWriteStream(fp:PFILE; ptaa:PPTAA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaaWriteMem(pdata:PPl_uint8; psize:Psize_t; ptaa:PPTAA; _type:Tl_int32):Tl_ok;cdecl;external;
function ptaSubsample(ptas:PPTA; subfactor:Tl_int32):PPTA;cdecl;external;
function ptaJoin(ptad:PPTA; ptas:PPTA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function ptaaJoin(ptaad:PPTAA; ptaas:PPTAA; istart:Tl_int32; iend:Tl_int32):Tl_ok;cdecl;external;
function ptaReverse(ptas:PPTA; _type:Tl_int32):PPTA;cdecl;external;
function ptaTranspose(ptas:PPTA):PPTA;cdecl;external;
function ptaCyclicPerm(ptas:PPTA; xs:Tl_int32; ys:Tl_int32):PPTA;cdecl;external;
function ptaSelectRange(ptas:PPTA; first:Tl_int32; last:Tl_int32):PPTA;cdecl;external;
function ptaGetBoundingRegion(pta:PPTA):PBOX;cdecl;external;
function ptaGetRange(pta:PPTA; pminx:Pl_float32; pmaxx:Pl_float32; pminy:Pl_float32; pmaxy:Pl_float32):Tl_ok;cdecl;external;
function ptaGetInsideBox(ptas:PPTA; box:PBOX):PPTA;cdecl;external;
function pixFindCornerPixels(pixs:PPIX):PPTA;cdecl;external;
function ptaContainsPt(pta:PPTA; x:Tl_int32; y:Tl_int32):Tl_int32;cdecl;external;
function ptaTestIntersection(pta1:PPTA; pta2:PPTA):Tl_int32;cdecl;external;
function ptaTransform(ptas:PPTA; shiftx:Tl_int32; shifty:Tl_int32; scalex:Tl_float32; scaley:Tl_float32):PPTA;cdecl;external;
function ptaPtInsidePolygon(pta:PPTA; x:Tl_float32; y:Tl_float32; pinside:Pl_int32):Tl_int32;cdecl;external;
function l_angleBetweenVectors(x1:Tl_float32; y1:Tl_float32; x2:Tl_float32; y2:Tl_float32):Tl_float32;cdecl;external;
function ptaPolygonIsConvex(pta:PPTA; pisconvex:Pl_int32):Tl_int32;cdecl;external;
function ptaGetMinMax(pta:PPTA; pxmin:Pl_float32; pymin:Pl_float32; pxmax:Pl_float32; pymax:Pl_float32):Tl_ok;cdecl;external;
function ptaSelectByValue(ptas:PPTA; xth:Tl_float32; yth:Tl_float32; _type:Tl_int32; relation:Tl_int32):PPTA;cdecl;external;
function ptaCropToMask(ptas:PPTA; pixm:PPIX):PPTA;cdecl;external;
function ptaGetLinearLSF(pta:PPTA; pa:Pl_float32; pb:Pl_float32; pnafit:PPNUMA):Tl_ok;cdecl;external;
function ptaGetQuadraticLSF(pta:PPTA; pa:Pl_float32; pb:Pl_float32; pc:Pl_float32; pnafit:PPNUMA):Tl_ok;cdecl;external;
function ptaGetCubicLSF(pta:PPTA; pa:Pl_float32; pb:Pl_float32; pc:Pl_float32; pd:Pl_float32; 
           pnafit:PPNUMA):Tl_ok;cdecl;external;
function ptaGetQuarticLSF(pta:PPTA; pa:Pl_float32; pb:Pl_float32; pc:Pl_float32; pd:Pl_float32; 
           pe:Pl_float32; pnafit:PPNUMA):Tl_ok;cdecl;external;
function ptaNoisyLinearLSF(pta:PPTA; factor:Tl_float32; pptad:PPPTA; pa:Pl_float32; pb:Pl_float32; 
           pmederr:Pl_float32; pnafit:PPNUMA):Tl_ok;cdecl;external;
function ptaNoisyQuadraticLSF(pta:PPTA; factor:Tl_float32; pptad:PPPTA; pa:Pl_float32; pb:Pl_float32; 
           pc:Pl_float32; pmederr:Pl_float32; pnafit:PPNUMA):Tl_ok;cdecl;external;
function applyLinearFit(a:Tl_float32; b:Tl_float32; x:Tl_float32; py:Pl_float32):Tl_ok;cdecl;external;
function applyQuadraticFit(a:Tl_float32; b:Tl_float32; c:Tl_float32; x:Tl_float32; py:Pl_float32):Tl_ok;cdecl;external;
function applyCubicFit(a:Tl_float32; b:Tl_float32; c:Tl_float32; d:Tl_float32; x:Tl_float32; 
           py:Pl_float32):Tl_ok;cdecl;external;
function applyQuarticFit(a:Tl_float32; b:Tl_float32; c:Tl_float32; d:Tl_float32; e:Tl_float32; 
           x:Tl_float32; py:Pl_float32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixPlotAlongPta(pixs:PPIX; pta:PPTA; outformat:Tl_int32; title:Pchar):Tl_ok;cdecl;external;
function ptaGetPixelsFromPix(pixs:PPIX; box:PBOX):PPTA;cdecl;external;
function pixGenerateFromPta(pta:PPTA; w:Tl_int32; h:Tl_int32):PPIX;cdecl;external;
function ptaGetBoundaryPixels(pixs:PPIX; _type:Tl_int32):PPTA;cdecl;external;
function ptaaGetBoundaryPixels(pixs:PPIX; _type:Tl_int32; connectivity:Tl_int32; pboxa:PPBOXA; ppixa:PPPIXA):PPTAA;cdecl;external;
function ptaaIndexLabeledPixels(pixs:PPIX; pncc:Pl_int32):PPTAA;cdecl;external;
function ptaGetNeighborPixLocs(pixs:PPIX; x:Tl_int32; y:Tl_int32; conn:Tl_int32):PPTA;cdecl;external;
function numaConvertToPta1(na:PNUMA):PPTA;cdecl;external;
function numaConvertToPta2(nax:PNUMA; nay:PNUMA):PPTA;cdecl;external;
function ptaConvertToNuma(pta:PPTA; pnax:PPNUMA; pnay:PPNUMA):Tl_ok;cdecl;external;
function pixDisplayPta(pixd:PPIX; pixs:PPIX; pta:PPTA):PPIX;cdecl;external;
function pixDisplayPtaaPattern(pixd:PPIX; pixs:PPIX; ptaa:PPTAA; pixp:PPIX; cx:Tl_int32; 
           cy:Tl_int32):PPIX;cdecl;external;
function pixDisplayPtaPattern(pixd:PPIX; pixs:PPIX; pta:PPTA; pixp:PPIX; cx:Tl_int32; 
           cy:Tl_int32; color:Tl_uint32):PPIX;cdecl;external;
function ptaReplicatePattern(ptas:PPTA; pixp:PPIX; ptap:PPTA; cx:Tl_int32; cy:Tl_int32; 
           w:Tl_int32; h:Tl_int32):PPTA;cdecl;external;
function pixDisplayPtaa(pixs:PPIX; ptaa:PPTAA):PPIX;cdecl;external;
function ptaSort(ptas:PPTA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA):PPTA;cdecl;external;
function ptaGetSortIndex(ptas:PPTA; sorttype:Tl_int32; sortorder:Tl_int32; pnaindex:PPNUMA):Tl_ok;cdecl;external;
function ptaSortByIndex(ptas:PPTA; naindex:PNUMA):PPTA;cdecl;external;
function ptaaSortByIndex(ptaas:PPTAA; naindex:PNUMA):PPTAA;cdecl;external;
function ptaGetRankValue(pta:PPTA; fract:Tl_float32; ptasort:PPTA; sorttype:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function ptaSort2d(pta:PPTA):PPTA;cdecl;external;
function ptaEqual(pta1:PPTA; pta2:PPTA; psame:Pl_int32):Tl_ok;cdecl;external;
function l_asetCreateFromPta(pta:PPTA):PL_ASET;cdecl;external;
function ptaRemoveDupsByAset(ptas:PPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function ptaUnionByAset(pta1:PPTA; pta2:PPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function ptaIntersectionByAset(pta1:PPTA; pta2:PPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function l_hmapCreateFromPta(pta:PPTA):PL_HASHMAP;cdecl;external;
function ptaRemoveDupsByHmap(ptas:PPTA; pptad:PPPTA; phmap:PPL_HASHMAP):Tl_ok;cdecl;external;
function ptaUnionByHmap(pta1:PPTA; pta2:PPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function ptaIntersectionByHmap(pta1:PPTA; pta2:PPTA; pptad:PPPTA):Tl_ok;cdecl;external;
function ptraCreate(n:Tl_int32):PL_PTRA;cdecl;external;
procedure ptraDestroy(ppa:PPL_PTRA; freeflag:Tl_int32; warnflag:Tl_int32);cdecl;external;
function ptraAdd(pa:PL_PTRA; item:pointer):Tl_ok;cdecl;external;
function ptraInsert(pa:PL_PTRA; index:Tl_int32; item:pointer; shiftflag:Tl_int32):Tl_ok;cdecl;external;
function ptraRemove(pa:PL_PTRA; index:Tl_int32; flag:Tl_int32):pointer;cdecl;external;
function ptraRemoveLast(pa:PL_PTRA):pointer;cdecl;external;
function ptraReplace(pa:PL_PTRA; index:Tl_int32; item:pointer; freeflag:Tl_int32):pointer;cdecl;external;
function ptraSwap(pa:PL_PTRA; index1:Tl_int32; index2:Tl_int32):Tl_ok;cdecl;external;
function ptraCompactArray(pa:PL_PTRA):Tl_ok;cdecl;external;
function ptraReverse(pa:PL_PTRA):Tl_ok;cdecl;external;
function ptraJoin(pa1:PL_PTRA; pa2:PL_PTRA):Tl_ok;cdecl;external;
function ptraGetMaxIndex(pa:PL_PTRA; pmaxindex:Pl_int32):Tl_ok;cdecl;external;
function ptraGetActualCount(pa:PL_PTRA; pcount:Pl_int32):Tl_ok;cdecl;external;
function ptraGetPtrToItem(pa:PL_PTRA; index:Tl_int32):pointer;cdecl;external;
function ptraaCreate(n:Tl_int32):PL_PTRAA;cdecl;external;
procedure ptraaDestroy(ppaa:PPL_PTRAA; freeflag:Tl_int32; warnflag:Tl_int32);cdecl;external;
function ptraaGetSize(paa:PL_PTRAA; psize:Pl_int32):Tl_ok;cdecl;external;
function ptraaInsertPtra(paa:PL_PTRAA; index:Tl_int32; pa:PL_PTRA):Tl_ok;cdecl;external;
function ptraaGetPtra(paa:PL_PTRAA; index:Tl_int32; accessflag:Tl_int32):PL_PTRA;cdecl;external;
function ptraaFlattenToPtra(paa:PL_PTRAA):PL_PTRA;cdecl;external;
function pixQuadtreeMean(pixs:PPIX; nlevels:Tl_int32; pix_ma:PPIX; pfpixa:PPFPIXA):Tl_ok;cdecl;external;
function pixQuadtreeVariance(pixs:PPIX; nlevels:Tl_int32; pix_ma:PPIX; dpix_msa:PDPIX; pfpixa_v:PPFPIXA; 
           pfpixa_rv:PPFPIXA):Tl_ok;cdecl;external;
function pixMeanInRectangle(pixs:PPIX; box:PBOX; pixma:PPIX; pval:Pl_float32):Tl_ok;cdecl;external;
function pixVarianceInRectangle(pixs:PPIX; box:PBOX; pix_ma:PPIX; dpix_msa:PDPIX; pvar:Pl_float32; 
           prvar:Pl_float32):Tl_ok;cdecl;external;
function boxaaQuadtreeRegions(w:Tl_int32; h:Tl_int32; nlevels:Tl_int32):PBOXAA;cdecl;external;
function quadtreeGetParent(fpixa:PFPIXA; level:Tl_int32; x:Tl_int32; y:Tl_int32; pval:Pl_float32):Tl_ok;cdecl;external;
function quadtreeGetChildren(fpixa:PFPIXA; level:Tl_int32; x:Tl_int32; y:Tl_int32; pval00:Pl_float32; 
           pval10:Pl_float32; pval01:Pl_float32; pval11:Pl_float32):Tl_ok;cdecl;external;
function quadtreeMaxLevels(w:Tl_int32; h:Tl_int32):Tl_int32;cdecl;external;
function fpixaDisplayQuadtree(fpixa:PFPIXA; factor:Tl_int32; fontsize:Tl_int32):PPIX;cdecl;external;
function lqueueCreate(nalloc:Tl_int32):PL_QUEUE;cdecl;external;
procedure lqueueDestroy(plq:PPL_QUEUE; freeflag:Tl_int32);cdecl;external;
function lqueueAdd(lq:PL_QUEUE; item:pointer):Tl_ok;cdecl;external;
function lqueueRemove(lq:PL_QUEUE):pointer;cdecl;external;
function lqueueGetCount(lq:PL_QUEUE):Tl_int32;cdecl;external;
function lqueuePrint(fp:PFILE; lq:PL_QUEUE):Tl_ok;cdecl;external;
function pixRankFilter(pixs:PPIX; wf:Tl_int32; hf:Tl_int32; rank:Tl_float32):PPIX;cdecl;external;
function pixRankFilterRGB(pixs:PPIX; wf:Tl_int32; hf:Tl_int32; rank:Tl_float32):PPIX;cdecl;external;
function pixRankFilterGray(pixs:PPIX; wf:Tl_int32; hf:Tl_int32; rank:Tl_float32):PPIX;cdecl;external;
function pixMedianFilter(pixs:PPIX; wf:Tl_int32; hf:Tl_int32):PPIX;cdecl;external;
function pixRankFilterWithScaling(pixs:PPIX; wf:Tl_int32; hf:Tl_int32; rank:Tl_float32; scalefactor:Tl_float32):PPIX;cdecl;external;
function l_rbtreeCreate(keytype:Tl_int32):PL_RBTREE;cdecl;external;
function l_rbtreeLookup(t:PL_RBTREE; key:TRB_TYPE):PRB_TYPE;cdecl;external;
procedure l_rbtreeInsert(t:PL_RBTREE; key:TRB_TYPE; value:TRB_TYPE);cdecl;external;
procedure l_rbtreeDelete(t:PL_RBTREE; key:TRB_TYPE);cdecl;external;
procedure l_rbtreeDestroy(pt:PPL_RBTREE);cdecl;external;
function l_rbtreeGetFirst(t:PL_RBTREE):PL_RBTREE_NODE;cdecl;external;
function l_rbtreeGetNext(n:PL_RBTREE_NODE):PL_RBTREE_NODE;cdecl;external;
function l_rbtreeGetLast(t:PL_RBTREE):PL_RBTREE_NODE;cdecl;external;
function l_rbtreeGetPrev(n:PL_RBTREE_NODE):PL_RBTREE_NODE;cdecl;external;
function l_rbtreeGetCount(t:PL_RBTREE):Tl_int32;cdecl;external;
procedure l_rbtreePrint(fp:PFILE; t:PL_RBTREE);cdecl;external;
function pixProcessBarcodes(pixs:PPIX; format:Tl_int32; method:Tl_int32; psaw:PPSARRAY; debugflag:Tl_int32):PSARRAY;cdecl;external;
function pixExtractBarcodes(pixs:PPIX; debugflag:Tl_int32):PPIXA;cdecl;external;
function pixReadBarcodes(pixa:PPIXA; format:Tl_int32; method:Tl_int32; psaw:PPSARRAY; debugflag:Tl_int32):PSARRAY;cdecl;external;
function pixReadBarcodeWidths(pixs:PPIX; method:Tl_int32; debugflag:Tl_int32):PNUMA;cdecl;external;
function pixLocateBarcodes(pixs:PPIX; thresh:Tl_int32; ppixb:PPPIX; ppixm:PPPIX):PBOXA;cdecl;external;
function pixDeskewBarcode(pixs:PPIX; pixb:PPIX; box:PBOX; margin:Tl_int32; threshold:Tl_int32; 
           pangle:Pl_float32; pconf:Pl_float32):PPIX;cdecl;external;
function pixExtractBarcodeWidths1(pixs:PPIX; thresh:Tl_float32; binfract:Tl_float32; pnaehist:PPNUMA; pnaohist:PPNUMA; 
           debugflag:Tl_int32):PNUMA;cdecl;external;
function pixExtractBarcodeWidths2(pixs:PPIX; thresh:Tl_float32; pwidth:Pl_float32; pnac:PPNUMA; debugflag:Tl_int32):PNUMA;cdecl;external;
function pixExtractBarcodeCrossings(pixs:PPIX; thresh:Tl_float32; debugflag:Tl_int32):PNUMA;cdecl;external;
function numaQuantizeCrossingsByWidth(nas:PNUMA; binfract:Tl_float32; pnaehist:PPNUMA; pnaohist:PPNUMA; debugflag:Tl_int32):PNUMA;cdecl;external;
function numaQuantizeCrossingsByWindow(nas:PNUMA; ratio:Tl_float32; pwidth:Pl_float32; pfirstloc:Pl_float32; pnac:PPNUMA; 
           debugflag:Tl_int32):PNUMA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixaReadFiles(dirname:Pchar; substr:Pchar):PPIXA;cdecl;external;
function pixaReadFilesSA(sa:PSARRAY):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixRead(filename:Pchar):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadWithHint(filename:Pchar; hint:Tl_int32):PPIX;cdecl;external;
function pixReadIndexed(sa:PSARRAY; index:Tl_int32):PPIX;cdecl;external;
function pixReadStream(fp:PFILE; hint:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadHeader(filename:Pchar; pformat:Pl_int32; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; piscmap:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function findFileFormat(filename:Pchar; pformat:Pl_int32):Tl_ok;cdecl;external;
function findFileFormatStream(fp:PFILE; pformat:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function findFileFormatBuffer(buf:Pl_uint8; pformat:Pl_int32):Tl_ok;cdecl;external;
function fileFormatIsTiff(fp:PFILE):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixReadMem(data:Pl_uint8; size:Tsize_t):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadHeaderMem(data:Pl_uint8; size:Tsize_t; pformat:Pl_int32; pw:Pl_int32; ph:Pl_int32; 
           pbps:Pl_int32; pspp:Pl_int32; piscmap:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function writeImageFileInfo(filename:Pchar; fpout:PFILE; headeronly:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function ioFormatTest(filename:Pchar):Tl_ok;cdecl;external;
function recogCreateFromRecog(recs:PL_RECOG; scalew:Tl_int32; scaleh:Tl_int32; linew:Tl_int32; threshold:Tl_int32; 
           maxyshift:Tl_int32):PL_RECOG;cdecl;external;
function recogCreateFromPixa(pixa:PPIXA; scalew:Tl_int32; scaleh:Tl_int32; linew:Tl_int32; threshold:Tl_int32; 
           maxyshift:Tl_int32):PL_RECOG;cdecl;external;
function recogCreateFromPixaNoFinish(pixa:PPIXA; scalew:Tl_int32; scaleh:Tl_int32; linew:Tl_int32; threshold:Tl_int32; 
           maxyshift:Tl_int32):PL_RECOG;cdecl;external;
function recogCreate(scalew:Tl_int32; scaleh:Tl_int32; linew:Tl_int32; threshold:Tl_int32; maxyshift:Tl_int32):PL_RECOG;cdecl;external;
procedure recogDestroy(precog:PPL_RECOG);cdecl;external;
function recogGetCount(recog:PL_RECOG):Tl_int32;cdecl;external;
function recogSetParams(recog:PL_RECOG; _type:Tl_int32; min_nopad:Tl_int32; max_wh_ratio:Tl_float32; max_ht_ratio:Tl_float32):Tl_ok;cdecl;external;
function recogGetClassIndex(recog:PL_RECOG; val:Tl_int32; text:Pchar; pindex:Pl_int32):Tl_int32;cdecl;external;
function recogStringToIndex(recog:PL_RECOG; text:Pchar; pindex:Pl_int32):Tl_ok;cdecl;external;
function recogGetClassString(recog:PL_RECOG; index:Tl_int32; pcharstr:PPchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function l_convertCharstrToInt(str:Pchar; pval:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function recogRead(filename:Pchar):PL_RECOG;cdecl;external;
function recogReadStream(fp:PFILE):PL_RECOG;cdecl;external;
(* Const before type ignored *)
function recogReadMem(data:Pl_uint8; size:Tsize_t):PL_RECOG;cdecl;external;
(* Const before type ignored *)
function recogWrite(filename:Pchar; recog:PL_RECOG):Tl_ok;cdecl;external;
function recogWriteStream(fp:PFILE; recog:PL_RECOG):Tl_ok;cdecl;external;
function recogWriteMem(pdata:PPl_uint8; psize:Psize_t; recog:PL_RECOG):Tl_ok;cdecl;external;
function recogExtractPixa(recog:PL_RECOG):PPIXA;cdecl;external;
function recogDecode(recog:PL_RECOG; pixs:PPIX; nlevels:Tl_int32; ppixdb:PPPIX):PBOXA;cdecl;external;
function recogCreateDid(recog:PL_RECOG; pixs:PPIX):Tl_ok;cdecl;external;
function recogDestroyDid(recog:PL_RECOG):Tl_ok;cdecl;external;
function recogDidExists(recog:PL_RECOG):Tl_int32;cdecl;external;
function recogGetDid(recog:PL_RECOG):PL_RDID;cdecl;external;
function recogSetChannelParams(recog:PL_RECOG; nlevels:Tl_int32):Tl_ok;cdecl;external;
function recogIdentifyMultiple(recog:PL_RECOG; pixs:PPIX; minh:Tl_int32; skipsplit:Tl_int32; pboxa:PPBOXA; 
           ppixa:PPPIXA; ppixdb:PPPIX; debugsplit:Tl_int32):Tl_ok;cdecl;external;
function recogSplitIntoCharacters(recog:PL_RECOG; pixs:PPIX; minh:Tl_int32; skipsplit:Tl_int32; pboxa:PPBOXA; 
           ppixa:PPPIXA; debug:Tl_int32):Tl_ok;cdecl;external;
function recogCorrelationBestRow(recog:PL_RECOG; pixs:PPIX; pboxa:PPBOXA; pnascore:PPNUMA; pnaindex:PPNUMA; 
           psachar:PPSARRAY; debug:Tl_int32):Tl_ok;cdecl;external;
function recogCorrelationBestChar(recog:PL_RECOG; pixs:PPIX; pbox:PPBOX; pscore:Pl_float32; pindex:Pl_int32; 
           pcharstr:PPchar; ppixdb:PPPIX):Tl_ok;cdecl;external;
function recogIdentifyPixa(recog:PL_RECOG; pixa:PPIXA; ppixdb:PPPIX):Tl_ok;cdecl;external;
function recogIdentifyPix(recog:PL_RECOG; pixs:PPIX; ppixdb:PPPIX):Tl_ok;cdecl;external;
function recogSkipIdentify(recog:PL_RECOG):Tl_ok;cdecl;external;
procedure rchaDestroy(prcha:PPL_RCHA);cdecl;external;
procedure rchDestroy(prch:PPL_RCH);cdecl;external;
function rchaExtract(rcha:PL_RCHA; pnaindex:PPNUMA; pnascore:PPNUMA; psatext:PPSARRAY; pnasample:PPNUMA; 
           pnaxloc:PPNUMA; pnayloc:PPNUMA; pnawidth:PPNUMA):Tl_ok;cdecl;external;
function rchExtract(rch:PL_RCH; pindex:Pl_int32; pscore:Pl_float32; ptext:PPchar; psample:Pl_int32; 
           pxloc:Pl_int32; pyloc:Pl_int32; pwidth:Pl_int32):Tl_ok;cdecl;external;
function recogProcessToIdentify(recog:PL_RECOG; pixs:PPIX; pad:Tl_int32):PPIX;cdecl;external;
function recogExtractNumbers(recog:PL_RECOG; boxas:PBOXA; scorethresh:Tl_float32; spacethresh:Tl_int32; pbaa:PPBOXAA; 
           pnaa:PPNUMAA):PSARRAY;cdecl;external;
function showExtractNumbers(pixs:PPIX; sa:PSARRAY; baa:PBOXAA; naa:PNUMAA; ppixdb:PPPIX):PPIXA;cdecl;external;
function recogTrainLabeled(recog:PL_RECOG; pixs:PPIX; box:PBOX; text:Pchar; debug:Tl_int32):Tl_ok;cdecl;external;
function recogProcessLabeled(recog:PL_RECOG; pixs:PPIX; box:PBOX; text:Pchar; ppix:PPPIX):Tl_ok;cdecl;external;
function recogAddSample(recog:PL_RECOG; pix:PPIX; debug:Tl_int32):Tl_ok;cdecl;external;
function recogModifyTemplate(recog:PL_RECOG; pixs:PPIX):PPIX;cdecl;external;
function recogAverageSamples(precog:PPL_RECOG; debug:Tl_int32):Tl_int32;cdecl;external;
function pixaAccumulateSamples(pixa:PPIXA; pta:PPTA; ppixd:PPPIX; px:Pl_float32; py:Pl_float32):Tl_int32;cdecl;external;
function recogTrainingFinished(precog:PPL_RECOG; modifyflag:Tl_int32; minsize:Tl_int32; minfract:Tl_float32):Tl_ok;cdecl;external;
function recogFilterPixaBySize(pixas:PPIXA; setsize:Tl_int32; maxkeep:Tl_int32; max_ht_ratio:Tl_float32; pna:PPNUMA):PPIXA;cdecl;external;
function recogSortPixaByClass(pixa:PPIXA; setsize:Tl_int32):PPIXAA;cdecl;external;
function recogRemoveOutliers1(precog:PPL_RECOG; minscore:Tl_float32; mintarget:Tl_int32; minsize:Tl_int32; ppixsave:PPPIX; 
           ppixrem:PPPIX):Tl_ok;cdecl;external;
function pixaRemoveOutliers1(pixas:PPIXA; minscore:Tl_float32; mintarget:Tl_int32; minsize:Tl_int32; ppixsave:PPPIX; 
           ppixrem:PPPIX):PPIXA;cdecl;external;
function recogRemoveOutliers2(precog:PPL_RECOG; minscore:Tl_float32; minsize:Tl_int32; ppixsave:PPPIX; ppixrem:PPPIX):Tl_ok;cdecl;external;
function pixaRemoveOutliers2(pixas:PPIXA; minscore:Tl_float32; minsize:Tl_int32; ppixsave:PPPIX; ppixrem:PPPIX):PPIXA;cdecl;external;
function recogTrainFromBoot(recogboot:PL_RECOG; pixas:PPIXA; minscore:Tl_float32; threshold:Tl_int32; debug:Tl_int32):PPIXA;cdecl;external;
function recogPadDigitTrainingSet(precog:PPL_RECOG; scaleh:Tl_int32; linew:Tl_int32):Tl_ok;cdecl;external;
function recogIsPaddingNeeded(recog:PL_RECOG; psa:PPSARRAY):Tl_int32;cdecl;external;
function recogAddDigitPadTemplates(recog:PL_RECOG; sa:PSARRAY):PPIXA;cdecl;external;
function recogMakeBootDigitRecog(nsamp:Tl_int32; scaleh:Tl_int32; linew:Tl_int32; maxyshift:Tl_int32; debug:Tl_int32):PL_RECOG;cdecl;external;
function recogMakeBootDigitTemplates(nsamp:Tl_int32; debug:Tl_int32):PPIXA;cdecl;external;
function recogShowContent(fp:PFILE; recog:PL_RECOG; index:Tl_int32; display:Tl_int32):Tl_ok;cdecl;external;
function recogDebugAverages(precog:PPL_RECOG; debug:Tl_int32):Tl_ok;cdecl;external;
function recogShowAverageTemplates(recog:PL_RECOG):Tl_int32;cdecl;external;
function recogShowMatchesInRange(recog:PL_RECOG; pixa:PPIXA; minscore:Tl_float32; maxscore:Tl_float32; display:Tl_int32):Tl_ok;cdecl;external;
function recogShowMatch(recog:PL_RECOG; pix1:PPIX; pix2:PPIX; box:PBOX; index:Tl_int32; 
           score:Tl_float32):PPIX;cdecl;external;
function regTestSetup(argc:Tl_int32; argv:PPchar; prp:PPL_REGPARAMS):Tl_ok;cdecl;external;
function regTestCleanup(rp:PL_REGPARAMS):Tl_ok;cdecl;external;
function regTestCompareValues(rp:PL_REGPARAMS; val1:Tl_float32; val2:Tl_float32; delta:Tl_float32):Tl_ok;cdecl;external;
function regTestCompareStrings(rp:PL_REGPARAMS; string1:Pl_uint8; bytes1:Tsize_t; string2:Pl_uint8; bytes2:Tsize_t):Tl_ok;cdecl;external;
function regTestComparePix(rp:PL_REGPARAMS; pix1:PPIX; pix2:PPIX):Tl_ok;cdecl;external;
function regTestCompareSimilarPix(rp:PL_REGPARAMS; pix1:PPIX; pix2:PPIX; mindiff:Tl_int32; maxfract:Tl_float32; 
           printstats:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function regTestCheckFile(rp:PL_REGPARAMS; localname:Pchar):Tl_ok;cdecl;external;
function regTestCompareFiles(rp:PL_REGPARAMS; index1:Tl_int32; index2:Tl_int32):Tl_ok;cdecl;external;
function regTestWritePixAndCheck(rp:PL_REGPARAMS; pix:PPIX; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function regTestWriteDataAndCheck(rp:PL_REGPARAMS; data:pointer; nbytes:Tsize_t; ext:Pchar):Tl_ok;cdecl;external;
function regTestGenLocalFilename(rp:PL_REGPARAMS; index:Tl_int32; format:Tl_int32):Pchar;cdecl;external;
function pixRasterop(pixd:PPIX; dx:Tl_int32; dy:Tl_int32; dw:Tl_int32; dh:Tl_int32; 
           op:Tl_int32; pixs:PPIX; sx:Tl_int32; sy:Tl_int32):Tl_ok;cdecl;external;
function pixRasteropVip(pixd:PPIX; bx:Tl_int32; bw:Tl_int32; vshift:Tl_int32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixRasteropHip(pixd:PPIX; by:Tl_int32; bh:Tl_int32; hshift:Tl_int32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixTranslate(pixd:PPIX; pixs:PPIX; hshift:Tl_int32; vshift:Tl_int32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRasteropIP(pixd:PPIX; hshift:Tl_int32; vshift:Tl_int32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixRasteropFullImage(pixd:PPIX; pixs:PPIX; op:Tl_int32):Tl_ok;cdecl;external;
procedure rasteropUniLow(datad:Pl_uint32; dpixw:Tl_int32; dpixh:Tl_int32; depth:Tl_int32; dwpl:Tl_int32; 
            dx:Tl_int32; dy:Tl_int32; dw:Tl_int32; dh:Tl_int32; op:Tl_int32);cdecl;external;
procedure rasteropLow(datad:Pl_uint32; dpixw:Tl_int32; dpixh:Tl_int32; depth:Tl_int32; dwpl:Tl_int32; 
            dx:Tl_int32; dy:Tl_int32; dw:Tl_int32; dh:Tl_int32; op:Tl_int32; 
            datas:Pl_uint32; spixw:Tl_int32; spixh:Tl_int32; swpl:Tl_int32; sx:Tl_int32; 
            sy:Tl_int32);cdecl;external;
procedure rasteropVipLow(data:Pl_uint32; pixw:Tl_int32; pixh:Tl_int32; depth:Tl_int32; wpl:Tl_int32; 
            x:Tl_int32; w:Tl_int32; shift:Tl_int32);cdecl;external;
procedure rasteropHipLow(data:Pl_uint32; pixh:Tl_int32; depth:Tl_int32; wpl:Tl_int32; y:Tl_int32; 
            h:Tl_int32; shift:Tl_int32);cdecl;external;
function pixRotate(pixs:PPIX; angle:Tl_float32; _type:Tl_int32; incolor:Tl_int32; width:Tl_int32; 
           height:Tl_int32):PPIX;cdecl;external;
function pixEmbedForRotation(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32; width:Tl_int32; height:Tl_int32):PPIX;cdecl;external;
function pixRotateBySampling(pixs:PPIX; xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateBinaryNice(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateWithAlpha(pixs:PPIX; angle:Tl_float32; pixg:PPIX; fract:Tl_float32):PPIX;cdecl;external;
function pixRotateAM(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateAMColor(pixs:PPIX; angle:Tl_float32; colorval:Tl_uint32):PPIX;cdecl;external;
function pixRotateAMGray(pixs:PPIX; angle:Tl_float32; grayval:Tl_uint8):PPIX;cdecl;external;
function pixRotateAMCorner(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateAMColorCorner(pixs:PPIX; angle:Tl_float32; fillval:Tl_uint32):PPIX;cdecl;external;
function pixRotateAMGrayCorner(pixs:PPIX; angle:Tl_float32; grayval:Tl_uint8):PPIX;cdecl;external;
function pixRotateAMColorFast(pixs:PPIX; angle:Tl_float32; colorval:Tl_uint32):PPIX;cdecl;external;
function pixRotateOrth(pixs:PPIX; quads:Tl_int32):PPIX;cdecl;external;
function pixRotate180(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixRotate90(pixs:PPIX; direction:Tl_int32):PPIX;cdecl;external;
function pixFlipLR(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixFlipTB(pixd:PPIX; pixs:PPIX):PPIX;cdecl;external;
function pixRotateShear(pixs:PPIX; xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotate2Shear(pixs:PPIX; xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotate3Shear(pixs:PPIX; xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateShearIP(pixs:PPIX; xcen:Tl_int32; ycen:Tl_int32; angle:Tl_float32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixRotateShearCenter(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixRotateShearCenterIP(pixs:PPIX; angle:Tl_float32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixStrokeWidthTransform(pixs:PPIX; color:Tl_int32; depth:Tl_int32; nangles:Tl_int32):PPIX;cdecl;external;
function pixRunlengthTransform(pixs:PPIX; color:Tl_int32; direction:Tl_int32; depth:Tl_int32):PPIX;cdecl;external;
function pixFindHorizontalRuns(pix:PPIX; y:Tl_int32; xstart:Pl_int32; xend:Pl_int32; pn:Pl_int32):Tl_ok;cdecl;external;
function pixFindVerticalRuns(pix:PPIX; x:Tl_int32; ystart:Pl_int32; yend:Pl_int32; pn:Pl_int32):Tl_ok;cdecl;external;
function pixFindMaxRuns(pix:PPIX; direction:Tl_int32; pnastart:PPNUMA):PNUMA;cdecl;external;
function pixFindMaxHorizontalRunOnLine(pix:PPIX; y:Tl_int32; pxstart:Pl_int32; psize:Pl_int32):Tl_ok;cdecl;external;
function pixFindMaxVerticalRunOnLine(pix:PPIX; x:Tl_int32; pystart:Pl_int32; psize:Pl_int32):Tl_ok;cdecl;external;
function runlengthMembershipOnLine(buffer:Pl_int32; size:Tl_int32; depth:Tl_int32; start:Pl_int32; end:Pl_int32; 
           n:Tl_int32):Tl_ok;cdecl;external;
function makeMSBitLocTab(bitval:Tl_int32):Pl_int32;cdecl;external;
function sarrayCreate(n:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayCreateInitialized(n:Tl_int32; initstr:Pchar):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayCreateWordsFromString(_string:Pchar):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayCreateLinesFromString(_string:Pchar; blankflag:Tl_int32):PSARRAY;cdecl;external;
procedure sarrayDestroy(psa:PPSARRAY);cdecl;external;
function sarrayCopy(sa:PSARRAY):PSARRAY;cdecl;external;
function sarrayClone(sa:PSARRAY):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayAddString(sa:PSARRAY; _string:Pchar; copyflag:Tl_int32):Tl_ok;cdecl;external;
function sarrayRemoveString(sa:PSARRAY; index:Tl_int32):Pchar;cdecl;external;
function sarrayReplaceString(sa:PSARRAY; index:Tl_int32; newstr:Pchar; copyflag:Tl_int32):Tl_ok;cdecl;external;
function sarrayClear(sa:PSARRAY):Tl_ok;cdecl;external;
function sarrayGetCount(sa:PSARRAY):Tl_int32;cdecl;external;
function sarrayGetArray(sa:PSARRAY; pnalloc:Pl_int32; pn:Pl_int32):^Pchar;cdecl;external;
function sarrayGetString(sa:PSARRAY; index:Tl_int32; copyflag:Tl_int32):Pchar;cdecl;external;
function sarrayGetRefcount(sa:PSARRAY):Tl_int32;cdecl;external;
function sarrayChangeRefcount(sa:PSARRAY; delta:Tl_int32):Tl_ok;cdecl;external;
function sarrayToString(sa:PSARRAY; addnlflag:Tl_int32):Pchar;cdecl;external;
function sarrayToStringRange(sa:PSARRAY; first:Tl_int32; nstrings:Tl_int32; addnlflag:Tl_int32):Pchar;cdecl;external;
function sarrayConcatUniformly(sa:PSARRAY; n:Tl_int32; addnlflag:Tl_int32):PSARRAY;cdecl;external;
function sarrayJoin(sa1:PSARRAY; sa2:PSARRAY):Tl_ok;cdecl;external;
function sarrayAppendRange(sa1:PSARRAY; sa2:PSARRAY; start:Tl_int32; end:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function sarrayPadToSameSize(sa1:PSARRAY; sa2:PSARRAY; padstring:Pchar):Tl_ok;cdecl;external;
function sarrayConvertWordsToLines(sa:PSARRAY; linesize:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function sarraySplitString(sa:PSARRAY; str:Pchar; separators:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function sarraySelectBySubstring(sain:PSARRAY; substr:Pchar):PSARRAY;cdecl;external;
function sarraySelectRange(sain:PSARRAY; first:Tl_int32; last:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayParseRange(sa:PSARRAY; start:Tl_int32; pactualstart:Pl_int32; pend:Pl_int32; pnewstart:Pl_int32; 
           substr:Pchar; loc:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function sarrayRead(filename:Pchar):PSARRAY;cdecl;external;
function sarrayReadStream(fp:PFILE):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayReadMem(data:Pl_uint8; size:Tsize_t):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayWrite(filename:Pchar; sa:PSARRAY):Tl_ok;cdecl;external;
function sarrayWriteStream(fp:PFILE; sa:PSARRAY):Tl_ok;cdecl;external;
function sarrayWriteStderr(sa:PSARRAY):Tl_ok;cdecl;external;
function sarrayWriteMem(pdata:PPl_uint8; psize:Psize_t; sa:PSARRAY):Tl_ok;cdecl;external;
(* Const before type ignored *)
function sarrayAppend(filename:Pchar; sa:PSARRAY):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function getNumberedPathnamesInDirectory(dirname:Pchar; substr:Pchar; numpre:Tl_int32; numpost:Tl_int32; maxnum:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function getSortedPathnamesInDirectory(dirname:Pchar; substr:Pchar; first:Tl_int32; nfiles:Tl_int32):PSARRAY;cdecl;external;
function convertSortedToNumberedPathnames(sa:PSARRAY; numpre:Tl_int32; numpost:Tl_int32; maxnum:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function getFilenamesInDirectory(dirname:Pchar):PSARRAY;cdecl;external;
function sarraySort(saout:PSARRAY; sain:PSARRAY; sortorder:Tl_int32):PSARRAY;cdecl;external;
function sarraySortByIndex(sain:PSARRAY; naindex:PNUMA):PSARRAY;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringCompareLexical(str1:Pchar; str2:Pchar):Tl_int32;cdecl;external;
function l_asetCreateFromSarray(sa:PSARRAY):PL_ASET;cdecl;external;
function sarrayRemoveDupsByAset(sas:PSARRAY; psad:PPSARRAY):Tl_ok;cdecl;external;
function sarrayUnionByAset(sa1:PSARRAY; sa2:PSARRAY; psad:PPSARRAY):Tl_ok;cdecl;external;
function sarrayIntersectionByAset(sa1:PSARRAY; sa2:PSARRAY; psad:PPSARRAY):Tl_ok;cdecl;external;
function l_hmapCreateFromSarray(sa:PSARRAY):PL_HASHMAP;cdecl;external;
function sarrayRemoveDupsByHmap(sas:PSARRAY; psad:PPSARRAY; phmap:PPL_HASHMAP):Tl_ok;cdecl;external;
function sarrayUnionByHmap(sa1:PSARRAY; sa2:PSARRAY; psad:PPSARRAY):Tl_ok;cdecl;external;
function sarrayIntersectionByHmap(sa1:PSARRAY; sa2:PSARRAY; psad:PPSARRAY):Tl_ok;cdecl;external;
function sarrayGenerateIntegers(n:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function sarrayLookupCSKV(sa:PSARRAY; keystring:Pchar; pvalstring:PPchar):Tl_ok;cdecl;external;
function pixScale(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleToSizeRel(pixs:PPIX; delw:Tl_int32; delh:Tl_int32):PPIX;cdecl;external;
function pixScaleToSize(pixs:PPIX; wd:Tl_int32; hd:Tl_int32):PPIX;cdecl;external;
function pixScaleToResolution(pixs:PPIX; target:Tl_float32; assumed:Tl_float32; pscalefact:Pl_float32):PPIX;cdecl;external;
function pixScaleGeneral(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32; sharpfract:Tl_float32; sharpwidth:Tl_int32):PPIX;cdecl;external;
function pixScaleLI(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleColorLI(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleColor2xLI(pixs:PPIX):PPIX;cdecl;external;
function pixScaleColor4xLI(pixs:PPIX):PPIX;cdecl;external;
function pixScaleGrayLI(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleGray2xLI(pixs:PPIX):PPIX;cdecl;external;
function pixScaleGray4xLI(pixs:PPIX):PPIX;cdecl;external;
function pixScaleGray2xLIThresh(pixs:PPIX; thresh:Tl_int32):PPIX;cdecl;external;
function pixScaleGray2xLIDither(pixs:PPIX):PPIX;cdecl;external;
function pixScaleGray4xLIThresh(pixs:PPIX; thresh:Tl_int32):PPIX;cdecl;external;
function pixScaleGray4xLIDither(pixs:PPIX):PPIX;cdecl;external;
function pixScaleBySampling(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleBySamplingToSize(pixs:PPIX; wd:Tl_int32; hd:Tl_int32):PPIX;cdecl;external;
function pixScaleByIntSampling(pixs:PPIX; factor:Tl_int32):PPIX;cdecl;external;
function pixScaleRGBToGrayFast(pixs:PPIX; factor:Tl_int32; color:Tl_int32):PPIX;cdecl;external;
function pixScaleRGBToBinaryFast(pixs:PPIX; factor:Tl_int32; thresh:Tl_int32):PPIX;cdecl;external;
function pixScaleGrayToBinaryFast(pixs:PPIX; factor:Tl_int32; thresh:Tl_int32):PPIX;cdecl;external;
function pixScaleSmooth(pix:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleSmoothToSize(pixs:PPIX; wd:Tl_int32; hd:Tl_int32):PPIX;cdecl;external;
function pixScaleRGBToGray2(pixs:PPIX; rwt:Tl_float32; gwt:Tl_float32; bwt:Tl_float32):PPIX;cdecl;external;
function pixScaleAreaMap(pix:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleAreaMap2(pix:PPIX):PPIX;cdecl;external;
function pixScaleAreaMapToSize(pixs:PPIX; wd:Tl_int32; hd:Tl_int32):PPIX;cdecl;external;
function pixScaleBinary(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):PPIX;cdecl;external;
function pixScaleToGray(pixs:PPIX; scalefactor:Tl_float32):PPIX;cdecl;external;
function pixScaleToGrayFast(pixs:PPIX; scalefactor:Tl_float32):PPIX;cdecl;external;
function pixScaleToGray2(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGray3(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGray4(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGray6(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGray8(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGray16(pixs:PPIX):PPIX;cdecl;external;
function pixScaleToGrayMipmap(pixs:PPIX; scalefactor:Tl_float32):PPIX;cdecl;external;
function pixScaleMipmap(pixs1:PPIX; pixs2:PPIX; scale:Tl_float32):PPIX;cdecl;external;
function pixExpandReplicate(pixs:PPIX; factor:Tl_int32):PPIX;cdecl;external;
function pixScaleGrayMinMax(pixs:PPIX; xfact:Tl_int32; yfact:Tl_int32; _type:Tl_int32):PPIX;cdecl;external;
function pixScaleGrayMinMax2(pixs:PPIX; _type:Tl_int32):PPIX;cdecl;external;
function pixScaleGrayRankCascade(pixs:PPIX; level1:Tl_int32; level2:Tl_int32; level3:Tl_int32; level4:Tl_int32):PPIX;cdecl;external;
function pixScaleGrayRank2(pixs:PPIX; rank:Tl_int32):PPIX;cdecl;external;
function pixScaleAndTransferAlpha(pixd:PPIX; pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32):Tl_ok;cdecl;external;
function pixScaleWithAlpha(pixs:PPIX; scalex:Tl_float32; scaley:Tl_float32; pixg:PPIX; fract:Tl_float32):PPIX;cdecl;external;
function pixSeedfillBinary(pixd:PPIX; pixs:PPIX; pixm:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixSeedfillBinaryRestricted(pixd:PPIX; pixs:PPIX; pixm:PPIX; connectivity:Tl_int32; xmax:Tl_int32; 
           ymax:Tl_int32):PPIX;cdecl;external;
function pixHolesByFilling(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixFillClosedBorders(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixExtractBorderConnComps(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixRemoveBorderConnComps(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixFillBgFromBorder(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixFillHolesToBoundingRect(pixs:PPIX; minsize:Tl_int32; maxhfract:Tl_float32; minfgfract:Tl_float32):PPIX;cdecl;external;
function pixSeedfillGray(pixs:PPIX; pixm:PPIX; connectivity:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfillGrayInv(pixs:PPIX; pixm:PPIX; connectivity:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfillGraySimple(pixs:PPIX; pixm:PPIX; connectivity:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfillGrayInvSimple(pixs:PPIX; pixm:PPIX; connectivity:Tl_int32):Tl_ok;cdecl;external;
function pixSeedfillGrayBasin(pixb:PPIX; pixm:PPIX; delta:Tl_int32; connectivity:Tl_int32):PPIX;cdecl;external;
function pixDistanceFunction(pixs:PPIX; connectivity:Tl_int32; outdepth:Tl_int32; boundcond:Tl_int32):PPIX;cdecl;external;
function pixSeedspread(pixs:PPIX; connectivity:Tl_int32):PPIX;cdecl;external;
function pixLocalExtrema(pixs:PPIX; maxmin:Tl_int32; minmax:Tl_int32; ppixmin:PPPIX; ppixmax:PPPIX):Tl_ok;cdecl;external;
function pixSelectedLocalExtrema(pixs:PPIX; mindist:Tl_int32; ppixmin:PPPIX; ppixmax:PPPIX):Tl_ok;cdecl;external;
function pixFindEqualValues(pixs1:PPIX; pixs2:PPIX):PPIX;cdecl;external;
function pixSelectMinInConnComp(pixs:PPIX; pixm:PPIX; ppta:PPPTA; pnav:PPNUMA):Tl_ok;cdecl;external;
function pixRemoveSeededComponents(pixd:PPIX; pixs:PPIX; pixm:PPIX; connectivity:Tl_int32; bordersize:Tl_int32):PPIX;cdecl;external;
function selaCreate(n:Tl_int32):PSELA;cdecl;external;
procedure selaDestroy(psela:PPSELA);cdecl;external;
(* Const before type ignored *)
function selCreate(height:Tl_int32; width:Tl_int32; name:Pchar):PSEL;cdecl;external;
procedure selDestroy(psel:PPSEL);cdecl;external;
function selCopy(sel:PSEL):PSEL;cdecl;external;
function selCreateBrick(h:Tl_int32; w:Tl_int32; cy:Tl_int32; cx:Tl_int32; _type:Tl_int32):PSEL;cdecl;external;
function selCreateComb(factor1:Tl_int32; factor2:Tl_int32; direction:Tl_int32):PSEL;cdecl;external;
function create2dIntArray(sy:Tl_int32; sx:Tl_int32):^Pl_int32;cdecl;external;
(* Const before type ignored *)
function selaAddSel(sela:PSELA; sel:PSEL; selname:Pchar; copyflag:Tl_int32):Tl_ok;cdecl;external;
function selaGetCount(sela:PSELA):Tl_int32;cdecl;external;
function selaGetSel(sela:PSELA; i:Tl_int32):PSEL;cdecl;external;
function selGetName(sel:PSEL):Pchar;cdecl;external;
(* Const before type ignored *)
function selSetName(sel:PSEL; name:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function selaFindSelByName(sela:PSELA; name:Pchar; pindex:Pl_int32; psel:PPSEL):Tl_ok;cdecl;external;
function selGetElement(sel:PSEL; row:Tl_int32; col:Tl_int32; ptype:Pl_int32):Tl_ok;cdecl;external;
function selSetElement(sel:PSEL; row:Tl_int32; col:Tl_int32; _type:Tl_int32):Tl_ok;cdecl;external;
function selGetParameters(sel:PSEL; psy:Pl_int32; psx:Pl_int32; pcy:Pl_int32; pcx:Pl_int32):Tl_ok;cdecl;external;
function selSetOrigin(sel:PSEL; cy:Tl_int32; cx:Tl_int32):Tl_ok;cdecl;external;
function selGetTypeAtOrigin(sel:PSEL; ptype:Pl_int32):Tl_ok;cdecl;external;
function selaGetBrickName(sela:PSELA; hsize:Tl_int32; vsize:Tl_int32):Pchar;cdecl;external;
function selaGetCombName(sela:PSELA; size:Tl_int32; direction:Tl_int32):Pchar;cdecl;external;
function getCompositeParameters(size:Tl_int32; psize1:Pl_int32; psize2:Pl_int32; pnameh1:PPchar; pnameh2:PPchar; 
           pnamev1:PPchar; pnamev2:PPchar):Tl_ok;cdecl;external;
function selaGetSelnames(sela:PSELA):PSARRAY;cdecl;external;
function selFindMaxTranslations(sel:PSEL; pxp:Pl_int32; pyp:Pl_int32; pxn:Pl_int32; pyn:Pl_int32):Tl_ok;cdecl;external;
function selRotateOrth(sel:PSEL; quads:Tl_int32):PSEL;cdecl;external;
(* Const before type ignored *)
function selaRead(fname:Pchar):PSELA;cdecl;external;
function selaReadStream(fp:PFILE):PSELA;cdecl;external;
(* Const before type ignored *)
function selRead(fname:Pchar):PSEL;cdecl;external;
function selReadStream(fp:PFILE):PSEL;cdecl;external;
(* Const before type ignored *)
function selaWrite(fname:Pchar; sela:PSELA):Tl_ok;cdecl;external;
function selaWriteStream(fp:PFILE; sela:PSELA):Tl_ok;cdecl;external;
(* Const before type ignored *)
function selWrite(fname:Pchar; sel:PSEL):Tl_ok;cdecl;external;
function selWriteStream(fp:PFILE; sel:PSEL):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function selCreateFromString(text:Pchar; h:Tl_int32; w:Tl_int32; name:Pchar):PSEL;cdecl;external;
function selPrintToString(sel:PSEL):Pchar;cdecl;external;
(* Const before type ignored *)
function selaCreateFromFile(filename:Pchar):PSELA;cdecl;external;
(* Const before type ignored *)
function selCreateFromPta(pta:PPTA; cy:Tl_int32; cx:Tl_int32; name:Pchar):PSEL;cdecl;external;
(* Const before type ignored *)
function selCreateFromPix(pix:PPIX; cy:Tl_int32; cx:Tl_int32; name:Pchar):PSEL;cdecl;external;
(* Const before type ignored *)
function selReadFromColorImage(pathname:Pchar):PSEL;cdecl;external;
(* Const before type ignored *)
function selCreateFromColorPix(pixs:PPIX; selname:Pchar):PSEL;cdecl;external;
function selaCreateFromColorPixa(pixa:PPIXA; sa:PSARRAY):PSELA;cdecl;external;
function selDisplayInPix(sel:PSEL; size:Tl_int32; gthick:Tl_int32):PPIX;cdecl;external;
function selaDisplayInPix(sela:PSELA; size:Tl_int32; gthick:Tl_int32; spacing:Tl_int32; ncols:Tl_int32):PPIX;cdecl;external;
function selaAddBasic(sela:PSELA):PSELA;cdecl;external;
function selaAddHitMiss(sela:PSELA):PSELA;cdecl;external;
function selaAddDwaLinear(sela:PSELA):PSELA;cdecl;external;
function selaAddDwaCombs(sela:PSELA):PSELA;cdecl;external;
function selaAddCrossJunctions(sela:PSELA; hlsize:Tl_float32; mdist:Tl_float32; norient:Tl_int32; debugflag:Tl_int32):PSELA;cdecl;external;
function selaAddTJunctions(sela:PSELA; hlsize:Tl_float32; mdist:Tl_float32; norient:Tl_int32; debugflag:Tl_int32):PSELA;cdecl;external;
function sela4ccThin(sela:PSELA):PSELA;cdecl;external;
function sela8ccThin(sela:PSELA):PSELA;cdecl;external;
function sela4and8ccThin(sela:PSELA):PSELA;cdecl;external;
function selMakePlusSign(size:Tl_int32; linewidth:Tl_int32):PSEL;cdecl;external;
function pixGenerateSelWithRuns(pixs:PPIX; nhlines:Tl_int32; nvlines:Tl_int32; distance:Tl_int32; minlength:Tl_int32; 
           toppix:Tl_int32; botpix:Tl_int32; leftpix:Tl_int32; rightpix:Tl_int32; ppixe:PPPIX):PSEL;cdecl;external;
function pixGenerateSelRandom(pixs:PPIX; hitfract:Tl_float32; missfract:Tl_float32; distance:Tl_int32; toppix:Tl_int32; 
           botpix:Tl_int32; leftpix:Tl_int32; rightpix:Tl_int32; ppixe:PPPIX):PSEL;cdecl;external;
function pixGenerateSelBoundary(pixs:PPIX; hitdist:Tl_int32; missdist:Tl_int32; hitskip:Tl_int32; missskip:Tl_int32; 
           topflag:Tl_int32; botflag:Tl_int32; leftflag:Tl_int32; rightflag:Tl_int32; ppixe:PPPIX):PSEL;cdecl;external;
function pixGetRunCentersOnLine(pixs:PPIX; x:Tl_int32; y:Tl_int32; minlength:Tl_int32):PNUMA;cdecl;external;
function pixGetRunsOnLine(pixs:PPIX; x1:Tl_int32; y1:Tl_int32; x2:Tl_int32; y2:Tl_int32):PNUMA;cdecl;external;
function pixSubsampleBoundaryPixels(pixs:PPIX; skip:Tl_int32):PPTA;cdecl;external;
function adjacentOnPixelInRaster(pixs:PPIX; x:Tl_int32; y:Tl_int32; pxa:Pl_int32; pya:Pl_int32):Tl_int32;cdecl;external;
function pixDisplayHitMissSel(pixs:PPIX; sel:PSEL; scalefactor:Tl_int32; hitcolor:Tl_uint32; misscolor:Tl_uint32):PPIX;cdecl;external;
function pixHShear(pixd:PPIX; pixs:PPIX; yloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixVShear(pixd:PPIX; pixs:PPIX; xloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixHShearCorner(pixd:PPIX; pixs:PPIX; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixVShearCorner(pixd:PPIX; pixs:PPIX; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixHShearCenter(pixd:PPIX; pixs:PPIX; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixVShearCenter(pixd:PPIX; pixs:PPIX; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixHShearIP(pixs:PPIX; yloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixVShearIP(pixs:PPIX; xloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):Tl_ok;cdecl;external;
function pixHShearLI(pixs:PPIX; yloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixVShearLI(pixs:PPIX; xloc:Tl_int32; radang:Tl_float32; incolor:Tl_int32):PPIX;cdecl;external;
function pixDeskewBoth(pixs:PPIX; redsearch:Tl_int32):PPIX;cdecl;external;
function pixDeskew(pixs:PPIX; redsearch:Tl_int32):PPIX;cdecl;external;
function pixFindSkewAndDeskew(pixs:PPIX; redsearch:Tl_int32; pangle:Pl_float32; pconf:Pl_float32):PPIX;cdecl;external;
function pixDeskewGeneral(pixs:PPIX; redsweep:Tl_int32; sweeprange:Tl_float32; sweepdelta:Tl_float32; redsearch:Tl_int32; 
           thresh:Tl_int32; pangle:Pl_float32; pconf:Pl_float32):PPIX;cdecl;external;
function pixFindSkew(pixs:PPIX; pangle:Pl_float32; pconf:Pl_float32):Tl_ok;cdecl;external;
function pixFindSkewSweep(pixs:PPIX; pangle:Pl_float32; reduction:Tl_int32; sweeprange:Tl_float32; sweepdelta:Tl_float32):Tl_ok;cdecl;external;
function pixFindSkewSweepAndSearch(pixs:PPIX; pangle:Pl_float32; pconf:Pl_float32; redsweep:Tl_int32; redsearch:Tl_int32; 
           sweeprange:Tl_float32; sweepdelta:Tl_float32; minbsdelta:Tl_float32):Tl_ok;cdecl;external;
function pixFindSkewSweepAndSearchScore(pixs:PPIX; pangle:Pl_float32; pconf:Pl_float32; pendscore:Pl_float32; redsweep:Tl_int32; 
           redsearch:Tl_int32; sweepcenter:Tl_float32; sweeprange:Tl_float32; sweepdelta:Tl_float32; minbsdelta:Tl_float32):Tl_ok;cdecl;external;
function pixFindSkewSweepAndSearchScorePivot(pixs:PPIX; pangle:Pl_float32; pconf:Pl_float32; pendscore:Pl_float32; redsweep:Tl_int32; 
           redsearch:Tl_int32; sweepcenter:Tl_float32; sweeprange:Tl_float32; sweepdelta:Tl_float32; minbsdelta:Tl_float32; 
           pivot:Tl_int32):Tl_ok;cdecl;external;
function pixFindSkewOrthogonalRange(pixs:PPIX; pangle:Pl_float32; pconf:Pl_float32; redsweep:Tl_int32; redsearch:Tl_int32; 
           sweeprange:Tl_float32; sweepdelta:Tl_float32; minbsdelta:Tl_float32; confprior:Tl_float32):Tl_int32;cdecl;external;
function pixFindDifferentialSquareSum(pixs:PPIX; psum:Pl_float32):Tl_ok;cdecl;external;
function pixFindNormalizedSquareSum(pixs:PPIX; phratio:Pl_float32; pvratio:Pl_float32; pfract:Pl_float32):Tl_ok;cdecl;external;
function pixReadStreamSpix(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderSpix(filename:Pchar; pwidth:Pl_int32; pheight:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           piscmap:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderSpix(fp:PFILE; pwidth:Pl_int32; pheight:Pl_int32; pbps:Pl_int32; pspp:Pl_int32; 
           piscmap:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function sreadHeaderSpix(data:Pl_uint32; size:Tsize_t; pwidth:Pl_int32; pheight:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; piscmap:Pl_int32):Tl_ok;cdecl;external;
function pixWriteStreamSpix(fp:PFILE; pix:PPIX):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadMemSpix(data:Pl_uint8; size:Tsize_t):PPIX;cdecl;external;
function pixWriteMemSpix(pdata:PPl_uint8; psize:Psize_t; pix:PPIX):Tl_ok;cdecl;external;
function pixSerializeToMemory(pixs:PPIX; pdata:PPl_uint32; pnbytes:Psize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixDeserializeFromMemory(data:Pl_uint32; nbytes:Tsize_t):PPIX;cdecl;external;
function lstackCreate(n:Tl_int32):PL_STACK;cdecl;external;
procedure lstackDestroy(plstack:PPL_STACK; freeflag:Tl_int32);cdecl;external;
function lstackAdd(lstack:PL_STACK; item:pointer):Tl_ok;cdecl;external;
function lstackRemove(lstack:PL_STACK):pointer;cdecl;external;
function lstackGetCount(lstack:PL_STACK):Tl_int32;cdecl;external;
function lstackPrint(fp:PFILE; lstack:PL_STACK):Tl_ok;cdecl;external;
function strcodeCreate(fileno:Tl_int32):PL_STRCODE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function strcodeCreateFromFile(filein:Pchar; fileno:Tl_int32; outdir:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function strcodeGenerate(strcode:PL_STRCODE; filein:Pchar; _type:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function strcodeFinalize(pstrcode:PPL_STRCODE; outdir:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function l_getStructStrFromFile(filename:Pchar; field:Tl_int32; pstr:PPchar):Tl_int32;cdecl;external;
function pixFindStrokeLength(pixs:PPIX; tab8:Pl_int32; plength:Pl_int32):Tl_ok;cdecl;external;
function pixFindStrokeWidth(pixs:PPIX; thresh:Tl_float32; tab8:Pl_int32; pwidth:Pl_float32; pnahisto:PPNUMA):Tl_ok;cdecl;external;
function pixaFindStrokeWidth(pixa:PPIXA; thresh:Tl_float32; tab8:Pl_int32; debug:Tl_int32):PNUMA;cdecl;external;
function pixaModifyStrokeWidth(pixas:PPIXA; targetw:Tl_float32):PPIXA;cdecl;external;
function pixModifyStrokeWidth(pixs:PPIX; width:Tl_float32; targetw:Tl_float32):PPIX;cdecl;external;
function pixaSetStrokeWidth(pixas:PPIXA; width:Tl_int32; thinfirst:Tl_int32; connectivity:Tl_int32):PPIXA;cdecl;external;
function pixSetStrokeWidth(pixs:PPIX; width:Tl_int32; thinfirst:Tl_int32; connectivity:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function sudokuReadFile(filename:Pchar):Pl_int32;cdecl;external;
(* Const before type ignored *)
function sudokuReadString(str:Pchar):Pl_int32;cdecl;external;
function sudokuCreate(array:Pl_int32):PL_SUDOKU;cdecl;external;
procedure sudokuDestroy(psud:PPL_SUDOKU);cdecl;external;
function sudokuSolve(sud:PL_SUDOKU):Tl_int32;cdecl;external;
function sudokuTestUniqueness(array:Pl_int32; punique:Pl_int32):Tl_ok;cdecl;external;
function sudokuGenerate(array:Pl_int32; seed:Tl_int32; minelems:Tl_int32; maxtries:Tl_int32):PL_SUDOKU;cdecl;external;
function sudokuOutput(sud:PL_SUDOKU; arraytype:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function pixAddSingleTextblock(pixs:PPIX; bmf:PL_BMF; textstr:Pchar; val:Tl_uint32; location:Tl_int32; 
           poverflow:Pl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixAddTextlines(pixs:PPIX; bmf:PL_BMF; textstr:Pchar; val:Tl_uint32; location:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixSetTextblock(pixs:PPIX; bmf:PL_BMF; textstr:Pchar; val:Tl_uint32; x0:Tl_int32; 
           y0:Tl_int32; wtext:Tl_int32; firstindent:Tl_int32; poverflow:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixSetTextline(pixs:PPIX; bmf:PL_BMF; textstr:Pchar; val:Tl_uint32; x0:Tl_int32; 
           y0:Tl_int32; pwidth:Pl_int32; poverflow:Pl_int32):Tl_ok;cdecl;external;
function pixaAddTextNumber(pixas:PPIXA; bmf:PL_BMF; na:PNUMA; val:Tl_uint32; location:Tl_int32):PPIXA;cdecl;external;
function pixaAddTextlines(pixas:PPIXA; bmf:PL_BMF; sa:PSARRAY; val:Tl_uint32; location:Tl_int32):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaAddPixWithText(pixa:PPIXA; pixs:PPIX; reduction:Tl_int32; bmf:PL_BMF; textstr:Pchar; 
           val:Tl_uint32; location:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function bmfGetLineStrings(bmf:PL_BMF; textstr:Pchar; maxw:Tl_int32; firstindent:Tl_int32; ph:Pl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function bmfGetWordWidths(bmf:PL_BMF; textstr:Pchar; sa:PSARRAY):PNUMA;cdecl;external;
(* Const before type ignored *)
function bmfGetStringWidth(bmf:PL_BMF; textstr:Pchar; pw:Pl_int32):Tl_ok;cdecl;external;
function splitStringToParagraphs(textstr:Pchar; splitflag:Tl_int32):PSARRAY;cdecl;external;
(* Const before type ignored *)
function pixReadTiff(filename:Pchar; n:Tl_int32):PPIX;cdecl;external;
function pixReadStreamTiff(fp:PFILE; n:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixWriteTiff(filename:Pchar; pix:PPIX; comptype:Tl_int32; modestr:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pixWriteTiffCustom(filename:Pchar; pix:PPIX; comptype:Tl_int32; modestr:Pchar; natags:PNUMA; 
           savals:PSARRAY; satypes:PSARRAY; nasizes:PNUMA):Tl_ok;cdecl;external;
function pixWriteStreamTiff(fp:PFILE; pix:PPIX; comptype:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteStreamTiffWA(fp:PFILE; pix:PPIX; comptype:Tl_int32; modestr:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadFromMultipageTiff(fname:Pchar; poffset:Psize_t):PPIX;cdecl;external;
(* Const before type ignored *)
function pixaReadMultipageTiff(filename:Pchar):PPIXA;cdecl;external;
(* Const before type ignored *)
function pixaWriteMultipageTiff(fname:Pchar; pixa:PPIXA):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function writeMultipageTiff(dirin:Pchar; substr:Pchar; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function writeMultipageTiffSA(sa:PSARRAY; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fprintTiffInfo(fpout:PFILE; tiffile:Pchar):Tl_ok;cdecl;external;
function tiffGetCount(fp:PFILE; pn:Pl_int32):Tl_ok;cdecl;external;
function getTiffResolution(fp:PFILE; pxres:Pl_int32; pyres:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderTiff(filename:Pchar; n:Tl_int32; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; pres:Pl_int32; pcmap:Pl_int32; pformat:Pl_int32):Tl_ok;cdecl;external;
function freadHeaderTiff(fp:PFILE; n:Tl_int32; pw:Pl_int32; ph:Pl_int32; pbps:Pl_int32; 
           pspp:Pl_int32; pres:Pl_int32; pcmap:Pl_int32; pformat:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderMemTiff(cdata:Pl_uint8; size:Tsize_t; n:Tl_int32; pw:Pl_int32; ph:Pl_int32; 
           pbps:Pl_int32; pspp:Pl_int32; pres:Pl_int32; pcmap:Pl_int32; pformat:Pl_int32):Tl_ok;cdecl;external;
function findTiffCompression(fp:PFILE; pcomptype:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function extractG4DataFromFile(filein:Pchar; pdata:PPl_uint8; pnbytes:Psize_t; pw:Pl_int32; ph:Pl_int32; 
           pminisblack:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixReadMemTiff(cdata:Pl_uint8; size:Tsize_t; n:Tl_int32):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadMemFromMultipageTiff(cdata:Pl_uint8; size:Tsize_t; poffset:Psize_t):PPIX;cdecl;external;
(* Const before type ignored *)
function pixaReadMemMultipageTiff(data:Pl_uint8; size:Tsize_t):PPIXA;cdecl;external;
function pixaWriteMemMultipageTiff(pdata:PPl_uint8; psize:Psize_t; pixa:PPIXA):Tl_ok;cdecl;external;
function pixWriteMemTiff(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; comptype:Tl_int32):Tl_ok;cdecl;external;
function pixWriteMemTiffCustom(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; comptype:Tl_int32; natags:PNUMA; 
           savals:PSARRAY; satypes:PSARRAY; nasizes:PNUMA):Tl_ok;cdecl;external;
function setMsgSeverity(newsev:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function returnErrorInt(msg:Pchar; procname:Pchar; ival:Tl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function returnErrorFloat(msg:Pchar; procname:Pchar; fval:Tl_float32):Tl_float32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function returnErrorPtr(msg:Pchar; procname:Pchar; pval:pointer):pointer;cdecl;external;
(* Const before type ignored *)
procedure leptSetStderrHandler(handler:procedure (para1:Pchar));cdecl;external;
(* Const before type ignored *)
procedure lept_stderr(fmt:Pchar; args:array of const);cdecl;external;
procedure lept_stderr(fmt:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function filesAreIdentical(fname1:Pchar; fname2:Pchar; psame:Pl_int32):Tl_ok;cdecl;external;
function convertOnLittleEnd16(shortin:Tl_uint16):Tl_uint16;cdecl;external;
function convertOnBigEnd16(shortin:Tl_uint16):Tl_uint16;cdecl;external;
function convertOnLittleEnd32(wordin:Tl_uint32):Tl_uint32;cdecl;external;
function convertOnBigEnd32(wordin:Tl_uint32):Tl_uint32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileCorruptByDeletion(filein:Pchar; loc:Tl_float32; size:Tl_float32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileCorruptByMutation(filein:Pchar; loc:Tl_float32; size:Tl_float32; fileout:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileReplaceBytes(filein:Pchar; start:Tl_int32; nbytes:Tl_int32; newdata:Pl_uint8; newsize:Tsize_t; 
           fileout:Pchar):Tl_ok;cdecl;external;
function genRandomIntOnInterval(start:Tl_int32; end:Tl_int32; seed:Tl_int32; pval:Pl_int32):Tl_ok;cdecl;external;
function lept_roundftoi(fval:Tl_float32):Tl_int32;cdecl;external;
(* Const before type ignored *)
function l_hashStringToUint64(str:Pchar; phash:Pl_uint64):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_hashStringToUint64Fast(str:Pchar; phash:Pl_uint64):Tl_ok;cdecl;external;
function l_hashPtToUint64(x:Tl_int32; y:Tl_int32; phash:Pl_uint64):Tl_ok;cdecl;external;
function l_hashFloat64ToUint64(val:Tl_float64; phash:Pl_uint64):Tl_ok;cdecl;external;
function findNextLargerPrime(start:Tl_int32; pprime:Pl_uint32):Tl_ok;cdecl;external;
function lept_isPrime(n:Tl_uint64; pis_prime:Pl_int32; pfactor:Pl_uint32):Tl_ok;cdecl;external;
function convertIntToGrayCode(val:Tl_uint32):Tl_uint32;cdecl;external;
function convertGrayCodeToInt(val:Tl_uint32):Tl_uint32;cdecl;external;
function getLeptonicaVersion:Pchar;cdecl;external;
procedure startTimer;cdecl;external;
function stopTimer:Tl_float32;cdecl;external;
function startTimerNested:TL_TIMER;cdecl;external;
function stopTimerNested(rusage_start:TL_TIMER):Tl_float32;cdecl;external;
procedure l_getCurrentTime(sec:Pl_int32; usec:Pl_int32);cdecl;external;
function startWallTimer:PL_WALLTIMER;cdecl;external;
function stopWallTimer(ptimer:PPL_WALLTIMER):Tl_float32;cdecl;external;
function l_getFormattedDate:Pchar;cdecl;external;
(* Const before type ignored *)
function stringNew(src:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function stringCopy(dest:Pchar; src:Pchar; n:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function stringCopySegment(src:Pchar; start:Tl_int32; nbytes:Tl_int32):Pchar;cdecl;external;
(* Const before type ignored *)
function stringReplace(pdest:PPchar; src:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function stringLength(src:Pchar; size:Tsize_t):Tl_int32;cdecl;external;
(* Const before type ignored *)
function stringCat(dest:Pchar; size:Tsize_t; src:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function stringConcatNew(first:Pchar; args:array of const):Pchar;cdecl;external;
function stringConcatNew(first:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringJoin(src1:Pchar; src2:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function stringJoinIP(psrc1:PPchar; src2:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function stringReverse(src:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function strtokSafe(cstr:Pchar; seps:Pchar; psaveptr:PPchar):Pchar;cdecl;external;
(* Const before type ignored *)
function stringSplitOnToken(cstr:Pchar; seps:Pchar; phead:PPchar; ptail:PPchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringCheckForChars(src:Pchar; chars:Pchar; pfound:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringRemoveChars(src:Pchar; remchars:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function stringReplaceEachSubstr(src:Pchar; sub1:Pchar; sub2:Pchar; pcount:Pl_int32):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function stringReplaceSubstr(src:Pchar; sub1:Pchar; sub2:Pchar; ploc:Pl_int32; pfound:Pl_int32):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringFindEachSubstr(src:Pchar; sub:Pchar):PL_DNA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function stringFindSubstr(src:Pchar; sub:Pchar; ploc:Pl_int32):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function arrayReplaceEachSequence(datas:Pl_uint8; dataslen:Tsize_t; seq:Pl_uint8; seqlen:Tsize_t; newseq:Pl_uint8; 
           newseqlen:Tsize_t; pdatadlen:Psize_t; pcount:Pl_int32):Pl_uint8;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arrayFindEachSequence(data:Pl_uint8; datalen:Tsize_t; sequence:Pl_uint8; seqlen:Tsize_t):PL_DNA;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function arrayFindSequence(data:Pl_uint8; datalen:Tsize_t; sequence:Pl_uint8; seqlen:Tsize_t; poffset:Pl_int32; 
           pfound:Pl_int32):Tl_ok;cdecl;external;
function reallocNew(pindata:Ppointer; oldsize:Tsize_t; newsize:Tsize_t):pointer;cdecl;external;
(* Const before type ignored *)
function l_binaryRead(filename:Pchar; pnbytes:Psize_t):Pl_uint8;cdecl;external;
function l_binaryReadStream(fp:PFILE; pnbytes:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function l_binaryReadSelect(filename:Pchar; start:Tsize_t; nbytes:Tsize_t; pnread:Psize_t):Pl_uint8;cdecl;external;
function l_binaryReadSelectStream(fp:PFILE; start:Tsize_t; nbytes:Tsize_t; pnread:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function l_binaryWrite(filename:Pchar; operation:Pchar; data:pointer; nbytes:Tsize_t):Tl_ok;cdecl;external;
(* Const before type ignored *)
function nbytesInFile(filename:Pchar):Tsize_t;cdecl;external;
function fnbytesInFile(fp:PFILE):Tsize_t;cdecl;external;
(* Const before type ignored *)
function l_binaryCopy(datas:Pl_uint8; size:Tsize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function l_binaryCompare(data1:Pl_uint8; size1:Tsize_t; data2:Pl_uint8; size2:Tsize_t; psame:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileCopy(srcfile:Pchar; newfile:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileConcatenate(srcfile:Pchar; destfile:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fileAppendString(filename:Pchar; str:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function fileSplitLinesUniform(filename:Pchar; n:Tl_int32; save_empty:Tl_int32; rootpath:Pchar; ext:Pchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function fopenReadStream(filename:Pchar):PFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function fopenWriteStream(filename:Pchar; modestring:Pchar):PFILE;cdecl;external;
(* Const before type ignored *)
function fopenReadFromMemory(data:Pl_uint8; size:Tsize_t):PFILE;cdecl;external;
function fopenWriteWinTempfile:PFILE;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lept_fopen(filename:Pchar; mode:Pchar):PFILE;cdecl;external;
function lept_fclose(fp:PFILE):Tl_ok;cdecl;external;
function lept_calloc(nmemb:Tsize_t; size:Tsize_t):pointer;cdecl;external;
procedure lept_free(ptr:pointer);cdecl;external;
(* Const before type ignored *)
function lept_mkdir(subdir:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function lept_rmdir(subdir:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
procedure lept_direxists(dir:Pchar; pexists:Pl_int32);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lept_rm_match(subdir:Pchar; substr:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function lept_rm(subdir:Pchar; tail:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
function lept_rmfile(filepath:Pchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function lept_mv(srcfile:Pchar; newdir:Pchar; newtail:Pchar; pnewpath:PPchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function lept_cp(srcfile:Pchar; newdir:Pchar; newtail:Pchar; pnewpath:PPchar):Tl_int32;cdecl;external;
(* Const before type ignored *)
procedure callSystemDebug(cmd:Pchar);cdecl;external;
(* Const before type ignored *)
function splitPathAtDirectory(pathname:Pchar; pdir:PPchar; ptail:PPchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
function splitPathAtExtension(pathname:Pchar; pbasename:PPchar; pextension:PPchar):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pathJoin(dir:Pchar; fname:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function appendSubdirs(basedir:Pchar; subdirs:Pchar):Pchar;cdecl;external;
function convertSepCharsInPath(path:Pchar; _type:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function genPathname(dir:Pchar; fname:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
function makeTempDirname(result:Pchar; nbytes:Tsize_t; subdir:Pchar):Tl_ok;cdecl;external;
function modifyTrailingSlash(path:Pchar; nbytes:Tsize_t; flag:Tl_int32):Tl_ok;cdecl;external;
function l_makeTempFilename:Pchar;cdecl;external;
(* Const before type ignored *)
function extractNumberFromFilename(fname:Pchar; numpre:Tl_int32; numpost:Tl_int32):Tl_int32;cdecl;external;
function pixSimpleCaptcha(pixs:PPIX; border:Tl_int32; nterms:Tl_int32; seed:Tl_uint32; color:Tl_uint32; 
           cmapflag:Tl_int32):PPIX;cdecl;external;
function pixRandomHarmonicWarp(pixs:PPIX; xmag:Tl_float32; ymag:Tl_float32; xfreq:Tl_float32; yfreq:Tl_float32; 
           nx:Tl_int32; ny:Tl_int32; seed:Tl_uint32; grayval:Tl_int32):PPIX;cdecl;external;
function pixWarpStereoscopic(pixs:PPIX; zbend:Tl_int32; zshiftt:Tl_int32; zshiftb:Tl_int32; ybendt:Tl_int32; 
           ybendb:Tl_int32; redleft:Tl_int32):PPIX;cdecl;external;
function pixStretchHorizontal(pixs:PPIX; dir:Tl_int32; _type:Tl_int32; hmax:Tl_int32; operation:Tl_int32; 
           incolor:Tl_int32):PPIX;cdecl;external;
function pixStretchHorizontalSampled(pixs:PPIX; dir:Tl_int32; _type:Tl_int32; hmax:Tl_int32; incolor:Tl_int32):PPIX;cdecl;external;
function pixStretchHorizontalLI(pixs:PPIX; dir:Tl_int32; _type:Tl_int32; hmax:Tl_int32; incolor:Tl_int32):PPIX;cdecl;external;
function pixQuadraticVShear(pixs:PPIX; dir:Tl_int32; vmaxt:Tl_int32; vmaxb:Tl_int32; operation:Tl_int32; 
           incolor:Tl_int32):PPIX;cdecl;external;
function pixQuadraticVShearSampled(pixs:PPIX; dir:Tl_int32; vmaxt:Tl_int32; vmaxb:Tl_int32; incolor:Tl_int32):PPIX;cdecl;external;
function pixQuadraticVShearLI(pixs:PPIX; dir:Tl_int32; vmaxt:Tl_int32; vmaxb:Tl_int32; incolor:Tl_int32):PPIX;cdecl;external;
function pixStereoFromPair(pix1:PPIX; pix2:PPIX; rwt:Tl_float32; gwt:Tl_float32; bwt:Tl_float32):PPIX;cdecl;external;
function wshedCreate(pixs:PPIX; pixm:PPIX; mindepth:Tl_int32; debugflag:Tl_int32):PL_WSHED;cdecl;external;
procedure wshedDestroy(pwshed:PPL_WSHED);cdecl;external;
function wshedApply(wshed:PL_WSHED):Tl_ok;cdecl;external;
function wshedBasins(wshed:PL_WSHED; ppixa:PPPIXA; pnalevels:PPNUMA):Tl_ok;cdecl;external;
function wshedRenderFill(wshed:PL_WSHED):PPIX;cdecl;external;
function wshedRenderColors(wshed:PL_WSHED):PPIX;cdecl;external;
(* Const before type ignored *)
function pixaWriteWebPAnim(filename:Pchar; pixa:PPIXA; loopcount:Tl_int32; duration:Tl_int32; quality:Tl_int32; 
           lossless:Tl_int32):Tl_ok;cdecl;external;
function pixaWriteStreamWebPAnim(fp:PFILE; pixa:PPIXA; loopcount:Tl_int32; duration:Tl_int32; quality:Tl_int32; 
           lossless:Tl_int32):Tl_ok;cdecl;external;
function pixaWriteMemWebPAnim(pencdata:PPl_uint8; pencsize:Psize_t; pixa:PPIXA; loopcount:Tl_int32; duration:Tl_int32; 
           quality:Tl_int32; lossless:Tl_int32):Tl_ok;cdecl;external;
function pixReadStreamWebP(fp:PFILE):PPIX;cdecl;external;
(* Const before type ignored *)
function pixReadMemWebP(filedata:Pl_uint8; filesize:Tsize_t):PPIX;cdecl;external;
(* Const before type ignored *)
function readHeaderWebP(filename:Pchar; pw:Pl_int32; ph:Pl_int32; pspp:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function readHeaderMemWebP(data:Pl_uint8; size:Tsize_t; pw:Pl_int32; ph:Pl_int32; pspp:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteWebP(filename:Pchar; pixs:PPIX; quality:Tl_int32; lossless:Tl_int32):Tl_ok;cdecl;external;
function pixWriteStreamWebP(fp:PFILE; pixs:PPIX; quality:Tl_int32; lossless:Tl_int32):Tl_ok;cdecl;external;
function pixWriteMemWebP(pencdata:PPl_uint8; pencsize:Psize_t; pixs:PPIX; quality:Tl_int32; lossless:Tl_int32):Tl_ok;cdecl;external;
function l_jpegSetQuality(new_quality:Tl_int32):Tl_int32;cdecl;external;
procedure setLeptDebugOK(allow:Tl_int32);cdecl;external;
(* Const before type ignored *)
function pixaWriteFiles(rootname:Pchar; pixa:PPIXA; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteDebug(fname:Pchar; pix:PPIX; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWrite(fname:Pchar; pix:PPIX; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteAutoFormat(filename:Pchar; pix:PPIX):Tl_ok;cdecl;external;
function pixWriteStream(fp:PFILE; pix:PPIX; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixWriteImpliedFormat(filename:Pchar; pix:PPIX; quality:Tl_int32; progressive:Tl_int32):Tl_ok;cdecl;external;
function pixChooseOutputFormat(pix:PPIX):Tl_int32;cdecl;external;
(* Const before type ignored *)
function getImpliedFileFormat(filename:Pchar):Tl_int32;cdecl;external;
function pixGetAutoFormat(pix:PPIX; pformat:Pl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function getFormatExtension(format:Tl_int32):Pchar;cdecl;external;
function pixWriteMem(pdata:PPl_uint8; psize:Psize_t; pix:PPIX; format:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function l_fileDisplay(fname:Pchar; x:Tl_int32; y:Tl_int32; scale:Tl_float32):Tl_ok;cdecl;external;
function pixDisplay(pixs:PPIX; x:Tl_int32; y:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function pixDisplayWithTitle(pixs:PPIX; x:Tl_int32; y:Tl_int32; title:Pchar; dispflag:Tl_int32):Tl_ok;cdecl;external;
function pixMakeColorSquare(color:Tl_uint32; size:Tl_int32; addlabel:Tl_int32; location:Tl_int32; textcolor:Tl_uint32):PPIX;cdecl;external;
procedure l_chooseDisplayProg(selection:Tl_int32);cdecl;external;
procedure changeFormatForMissingLib(pformat:Pl_int32);cdecl;external;
function pixDisplayWrite(pixs:PPIX; reduction:Tl_int32):Tl_ok;cdecl;external;
(* Const before type ignored *)
function zlibCompress(datain:Pl_uint8; nin:Tsize_t; pnout:Psize_t):Pl_uint8;cdecl;external;
(* Const before type ignored *)
function zlibUncompress(datain:Pl_uint8; nin:Tsize_t; pnout:Psize_t):Pl_uint8;cdecl;external;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ NO_PROTOS  }
{$endif}
{ LEPTONICA_ALLHEADERS_H  }

implementation


end.
