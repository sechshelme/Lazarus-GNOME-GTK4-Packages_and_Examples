unit hpdf_u3d;

interface

uses
  fp_hpdf;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * << Haru Free PDF Library >> -- hpdf_u3d.h
 *
 * URL: http://libharu.org
 *
 * Copyright (c) 1999-2006 Takeshi Kanno <takeshi_kanno@est.hi-ho.ne.jp>
 * Copyright (c) 2007-2009 Antony Dovgal <tony@daylessday.org>
 *
 * Permission to use, copy, modify, distribute and sell this software
 * and its documentation for any purpose is hereby granted without fee,
 * provided that the above copyright notice appear in all copies and
 * that both that copyright notice and this permission notice appear
 * in supporting documentation.
 * It is provided "as is" without express or implied warranty.
 *
  }
{$ifndef _HPDF_U3D_H}
{$define _HPDF_U3D_H}
{$include "hpdf_objects.h"}
{ C++ extern C conditionnal removed }

function HPDF_CreateJavaScript(pdf:THPDF_Doc; code:Pchar):THPDF_JavaScript;cdecl;external libhpdf;
function HPDF_LoadJSFromFile(pdf:THPDF_Doc; filename:Pchar):THPDF_JavaScript;cdecl;external libhpdf;
function HPDF_LoadU3DFromFile(pdf:THPDF_Doc; filename:Pchar):THPDF_U3D;cdecl;external libhpdf;
function HPDF_LoadU3DFromMem(pdf:THPDF_Doc; buffer:PHPDF_BYTE; size:THPDF_UINT):THPDF_Image;cdecl;external libhpdf;
function HPDF_Create3DView(mmgr:THPDF_MMgr; name:Pchar):THPDF_Dict;cdecl;external libhpdf;
function HPDF_U3D_Add3DView(u3d:THPDF_U3D; view:THPDF_Dict):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_U3D_SetDefault3DView(u3d:THPDF_U3D; name:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_U3D_AddOnInstanciate(u3d:THPDF_U3D; javaScript:THPDF_JavaScript):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_CreateNode(view:THPDF_Dict; name:Pchar):THPDF_Dict;cdecl;external libhpdf;
function HPDF_3DViewNode_SetOpacity(node:THPDF_Dict; opacity:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DViewNode_SetVisibility(node:THPDF_Dict; visible:THPDF_BOOL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DViewNode_SetMatrix(node:THPDF_Dict; Mat3D:THPDF_3DMatrix):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_AddNode(view:THPDF_Dict; node:THPDF_Dict):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetLighting(view:THPDF_Dict; scheme:Pchar):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetBackgroundColor(view:THPDF_Dict; r:THPDF_REAL; g:THPDF_REAL; b:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetPerspectiveProjection(view:THPDF_Dict; fov:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetOrthogonalProjection(view:THPDF_Dict; mag:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetCamera(view:THPDF_Dict; coox:THPDF_REAL; cooy:THPDF_REAL; cooz:THPDF_REAL; c2cx:THPDF_REAL; 
           c2cy:THPDF_REAL; c2cz:THPDF_REAL; roo:THPDF_REAL; roll:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetCameraByMatrix(view:THPDF_Dict; Mat3D:THPDF_3DMatrix; co:THPDF_REAL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetCrossSectionOn(view:THPDF_Dict; center:THPDF_Point3D; Roll:THPDF_REAL; Pitch:THPDF_REAL; opacity:THPDF_REAL; 
           showintersection:THPDF_BOOL):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_SetCrossSectionOff(view:THPDF_Dict):THPDF_STATUS;cdecl;external libhpdf;
function HPDF_3DView_New(mmgr:THPDF_MMgr; xref:THPDF_Xref; u3d:THPDF_U3D; name:Pchar):THPDF_Dict;cdecl;external libhpdf;
{ C++ end of extern C conditionnal removed }
{ __cplusplus  }
{$endif}
{ _HPDF_U3D_H  }

// === Konventiert am: 28-1-26 14:09:50 ===


implementation



end.
