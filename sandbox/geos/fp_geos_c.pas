unit fp_geos_c;

interface

const
  {$IFDEF Linux}
  libgeos_c = 'geos_c';
  {$ENDIF}

  {$IFDEF Windows}
  libgeos_c = 'libgeos_c.dll'; // ?????
  {$ENDIF}

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  GEOS_VERSION_MAJOR = 3;  
  GEOS_VERSION_MINOR = 12;
  GEOS_VERSION_PATCH = 1;
  GEOS_VERSION = '3.12.1';
  GEOS_JTS_PORT = '1.18.0';

  GEOS_CAPI_VERSION_MAJOR = 1;
  GEOS_CAPI_VERSION_MINOR = 18;  
  GEOS_CAPI_VERSION_PATCH = 1;  
  GEOS_CAPI_VERSION = '3.12.1-CAPI-1.18.1';  
  GEOS_CAPI_FIRST_INTERFACE = GEOS_CAPI_VERSION_MAJOR;  
  GEOS_CAPI_LAST_INTERFACE = GEOS_CAPI_VERSION_MAJOR+GEOS_CAPI_VERSION_MINOR;  

type
  PGEOSContextHandle_t = ^TGEOSContextHandle_t;
  TGEOSContextHandle_t = Pointer;

  TGEOSMessageHandler = procedure (fmt:Pchar; args:array of const);cdecl;
  TGEOSMessageHandler_r = procedure (message:Pchar; userdata:pointer);cdecl;
type
       PGEOSGeometry=type Pointer;
       PPGEOSGeometry=^PGEOSGeometry;
           PGEOSPreparedGeometry=type Pointer;
           PGEOSCoordSequence=type Pointer;
          PGEOSSTRtree=type Pointer;
            PGEOSBufferParams=type Pointer;
                  PGEOSMakeValidParams=type Pointer;
type
  PGEOSGeom = ^TGEOSGeom;
  TGEOSGeom = PGEOSGeometry;

  PGEOSCoordSeq = ^TGEOSCoordSeq;
  TGEOSCoordSeq = PGEOSCoordSequence;
type  TGEOSGeomTypes =  Longint;
  Const
    GEOS_POINT = 0;
    GEOS_LINESTRING = 1;
    GEOS_LINEARRING = 2;
    GEOS_POLYGON = 3;
    GEOS_MULTIPOINT = 4;
    GEOS_MULTILINESTRING = 5;
    GEOS_MULTIPOLYGON = 6;
    GEOS_GEOMETRYCOLLECTION = 7;

type
  TGEOSWKBByteOrders =  Longint;
  Const
    GEOS_WKB_XDR = 0;
    GEOS_WKB_NDR = 1;

type
  TGEOSWKBFlavors =  Longint;
  Const
    GEOS_WKB_EXTENDED = 1;
    GEOS_WKB_ISO = 2;

type
  TGEOSQueryCallback = procedure (item:pointer; userdata:pointer);cdecl;
  TGEOSDistanceCallback = function (item1:pointer; item2:pointer; distance:Pdouble; userdata:pointer):longint;cdecl;
  TGEOSTransformXYCallback = function (x:Pdouble; y:Pdouble; userdata:pointer):longint;cdecl;
  TGEOSInterruptCallback = procedure ;cdecl;

function GEOS_interruptRegisterCallback(cb:TGEOSInterruptCallback):TGEOSInterruptCallback;cdecl;external libgeos_c;
procedure GEOS_interruptRequest;cdecl;external libgeos_c;
procedure GEOS_interruptCancel;cdecl;external libgeos_c;
function GEOS_init_r:TGEOSContextHandle_t;cdecl;external libgeos_c;
procedure GEOS_finish_r(handle:TGEOSContextHandle_t);cdecl;external libgeos_c;
function GEOSContext_setNoticeHandler_r(extHandle:TGEOSContextHandle_t; nf:TGEOSMessageHandler):TGEOSMessageHandler;cdecl;external libgeos_c;
function GEOSContext_setErrorHandler_r(extHandle:TGEOSContextHandle_t; ef:TGEOSMessageHandler):TGEOSMessageHandler;cdecl;external libgeos_c;
function GEOSContext_setNoticeMessageHandler_r(extHandle:TGEOSContextHandle_t; nf:TGEOSMessageHandler_r; userData:pointer):TGEOSMessageHandler_r;cdecl;external libgeos_c;
function GEOSContext_setErrorMessageHandler_r(extHandle:TGEOSContextHandle_t; ef:TGEOSMessageHandler_r; userData:pointer):TGEOSMessageHandler_r;cdecl;external libgeos_c;

function GEOSCoordSeq_create_r(handle:TGEOSContextHandle_t; size:dword; dims:dword):PGEOSCoordSequence;cdecl;external libgeos_c;
function GEOSCoordSeq_copyFromBuffer_r(handle:TGEOSContextHandle_t; buf:Pdouble; size:dword; hasZ:longint; hasM:longint):PGEOSCoordSequence;cdecl;external libgeos_c;
function GEOSCoordSeq_copyFromArrays_r(handle:TGEOSContextHandle_t; x:Pdouble; y:Pdouble; z:Pdouble; m:Pdouble;           size:dword):PGEOSCoordSequence;cdecl;external libgeos_c;
function GEOSCoordSeq_copyToBuffer_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; buf:Pdouble; hasZ:longint; hasM:longint):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_copyToArrays_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; x:Pdouble; y:Pdouble; z:Pdouble;           m:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_clone_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence):PGEOSCoordSequence;cdecl;external libgeos_c;
procedure GEOSCoordSeq_destroy_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence);cdecl;external libgeos_c;
function GEOSCoordSeq_setX_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_setY_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_setZ_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_setXY_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; x:double; y:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_setXYZ_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; x:double; y:double;           z:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_setOrdinate_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; dim:dword; val:double):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getX_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getY_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getZ_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getXY_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; x:Pdouble; y:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getXYZ_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; x:Pdouble; y:Pdouble;           z:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getOrdinate_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; idx:dword; dim:dword; val:Pdouble):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getSize_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; size:Pdword):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_getDimensions_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; dims:Pdword):longint;cdecl;external libgeos_c;
function GEOSCoordSeq_isCCW_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence; is_ccw:Pchar):longint;cdecl;external libgeos_c;

function GEOSProject_r(handle:TGEOSContextHandle_t; line:PGEOSGeometry; point:PGEOSGeometry):double;cdecl;external libgeos_c;
function GEOSInterpolate_r(handle:TGEOSContextHandle_t; line:PGEOSGeometry; d:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSProjectNormalized_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; p:PGEOSGeometry):double;cdecl;external libgeos_c;
function GEOSInterpolateNormalized_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; d:double):PGEOSGeometry;cdecl;external libgeos_c;

function GEOSBuffer_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; width:double; quadsegs:longint):PGEOSGeometry;cdecl;external libgeos_c;
type
  TGEOSBufCapStyles =  Longint;
  Const
    GEOSBUF_CAP_ROUND = 1;
    GEOSBUF_CAP_FLAT = 2;
    GEOSBUF_CAP_SQUARE = 3;

type
  TGEOSBufJoinStyles =  Longint;
  Const
    GEOSBUF_JOIN_ROUND = 1;
    GEOSBUF_JOIN_MITRE = 2;
    GEOSBUF_JOIN_BEVEL = 3;

function GEOSBufferParams_create_r(handle:TGEOSContextHandle_t):PGEOSBufferParams;cdecl;external libgeos_c;
procedure GEOSBufferParams_destroy_r(handle:TGEOSContextHandle_t; parms:PGEOSBufferParams);cdecl;external libgeos_c;
function GEOSBufferParams_setEndCapStyle_r(handle:TGEOSContextHandle_t; p:PGEOSBufferParams; style:longint):longint;cdecl;external libgeos_c;
function GEOSBufferParams_setJoinStyle_r(handle:TGEOSContextHandle_t; p:PGEOSBufferParams; joinStyle:longint):longint;cdecl;external libgeos_c;
function GEOSBufferParams_setMitreLimit_r(handle:TGEOSContextHandle_t; p:PGEOSBufferParams; mitreLimit:double):longint;cdecl;external libgeos_c;
function GEOSBufferParams_setQuadrantSegments_r(handle:TGEOSContextHandle_t; p:PGEOSBufferParams; quadSegs:longint):longint;cdecl;external libgeos_c;
function GEOSBufferParams_setSingleSided_r(handle:TGEOSContextHandle_t; p:PGEOSBufferParams; singleSided:longint):longint;cdecl;external libgeos_c;
function GEOSBufferWithParams_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; p:PGEOSBufferParams; width:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSBufferWithStyle_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; width:double; quadsegs:longint; endCapStyle:longint;           joinStyle:longint; mitreLimit:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSDensify_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSOffsetCurve_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; width:double; quadsegs:longint; joinStyle:longint;           mitreLimit:double):PGEOSGeometry;cdecl;external libgeos_c;

function GEOSGeom_createPoint_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createPointFromXY_r(handle:TGEOSContextHandle_t; x:double; y:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createEmptyPoint_r(handle:TGEOSContextHandle_t):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createLinearRing_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createLineString_r(handle:TGEOSContextHandle_t; s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createEmptyLineString_r(handle:TGEOSContextHandle_t):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createEmptyPolygon_r(handle:TGEOSContextHandle_t):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createPolygon_r(handle:TGEOSContextHandle_t; shell:PGEOSGeometry; holes:PPGEOSGeometry; nholes:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createCollection_r(handle:TGEOSContextHandle_t; _type:longint; geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_releaseCollection_r(handle:TGEOSContextHandle_t; collection:PGEOSGeometry; ngeoms:Pdword):PPGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createEmptyCollection_r(handle:TGEOSContextHandle_t; _type:longint):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_createRectangle_r(handle:TGEOSContextHandle_t; xmin:double; ymin:double; xmax:double; ymax:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_clone_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;

procedure GEOSGeom_destroy_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry);cdecl;external libgeos_c;

function GEOSCoverageUnion_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSCoverageIsValid_r(extHandle:TGEOSContextHandle_t; input:PGEOSGeometry; gapWidth:double; output:PPGEOSGeometry):longint;cdecl;external libgeos_c;
function GEOSCoverageSimplifyVW_r(extHandle:TGEOSContextHandle_t; input:PGEOSGeometry; tolerance:double; preserveBoundary:longint):PGEOSGeometry;cdecl;external libgeos_c;

function GEOSEnvelope_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSIntersection_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSIntersectionPrec_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSConvexHull_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSConcaveHull_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; ratio:double; allowHoles:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSConcaveHullByLength_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; ratio:double; allowHoles:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonHullSimplify_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; isOuter:dword; vertexNumFraction:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonHullSimplifyMode_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; isOuter:dword; parameterMode:dword; parameter:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSConcaveHullOfPolygons_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; lengthRatio:double; isTight:dword; isHolesAllowed:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMinimumRotatedRectangle_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMaximumInscribedCircle_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSLargestEmptyCircle_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; boundary:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMinimumWidth_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMinimumClearanceLine_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMinimumClearance_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; distance:Pdouble):longint;cdecl;external libgeos_c;
function GEOSDifference_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSDifferencePrec_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSymDifference_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSymDifferencePrec_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSBoundary_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSUnion_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSUnionPrec_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSUnaryUnion_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSUnaryUnionPrec_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSDisjointSubsetUnion_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPointOnSurface_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGetCentroid_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSMinimumBoundingCircle_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; radius:Pdouble; center:PPGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSNode_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSClipByRect_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; xmin:double; ymin:double; xmax:double;           ymax:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonize_r(handle:TGEOSContextHandle_t; geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonize_valid_r(handle:TGEOSContextHandle_t; geoms:PPGEOSGeometry; ngems:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonizer_getCutEdges_r(handle:TGEOSContextHandle_t; geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSPolygonize_full_r(handle:TGEOSContextHandle_t; input:PGEOSGeometry; cuts:PPGEOSGeometry; dangles:PPGEOSGeometry; invalidRings:PPGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSBuildArea_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSLineMerge_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSLineMergeDirected_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSLineSubstring_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; start_fraction:double; end_fdraction:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSReverse_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSimplify_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSTopologyPreserveSimplify_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSGeom_extractUniquePoints_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSharedPaths_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSnap_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSDelaunayTriangulation_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double; onlyEdges:longint):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSConstrainedDelaunayTriangulation_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSVoronoiDiagram_r(extHandle:TGEOSContextHandle_t; g:PGEOSGeometry; env:PGEOSGeometry; tolerance:double; flags:longint):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSegmentIntersection_r(extHandle:TGEOSContextHandle_t; ax0:double; ay0:double; ax1:double; ay1:double;
           bx0:double; by0:double; bx1:double; by1:double; cx:Pdouble; 
           cy:Pdouble):longint;cdecl;external libgeos_c;

function GEOSDisjoint_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSTouches_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSIntersects_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSCrosses_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSWithin_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSContains_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSOverlaps_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSEquals_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSEqualsExact_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; tolerance:double):char;cdecl;external libgeos_c;
function GEOSEqualsIdentical_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSCovers_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSCoveredBy_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;

function GEOSPrepare_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSPreparedGeometry;cdecl;external libgeos_c;
procedure GEOSPreparedGeom_destroy_r(handle:TGEOSContextHandle_t; g:PGEOSPreparedGeometry);cdecl;external libgeos_c;
function GEOSPreparedContains_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedContainsXY_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; x:double; y:double):char;cdecl;external libgeos_c;
function GEOSPreparedContainsProperly_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedCoveredBy_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedCovers_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedCrosses_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedDisjoint_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedIntersects_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedIntersectsXY_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; x:double; y:double):char;cdecl;external libgeos_c;
function GEOSPreparedOverlaps_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedTouches_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedWithin_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSPreparedNearestPoints_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
function GEOSPreparedDistance_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
function GEOSPreparedDistanceWithin_r(handle:TGEOSContextHandle_t; pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry; dist:double):char;cdecl;external libgeos_c;

function GEOSSTRtree_create_r(handle:TGEOSContextHandle_t; nodeCapacity:Tsize_t):PGEOSSTRtree;cdecl;external libgeos_c;
function GEOSSTRtree_build_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree):longint;cdecl;external libgeos_c;
procedure GEOSSTRtree_insert_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; g:PGEOSGeometry; item:pointer);cdecl;external libgeos_c;
procedure GEOSSTRtree_query_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; g:PGEOSGeometry; callback:TGEOSQueryCallback; userdata:pointer);cdecl;external libgeos_c;
function GEOSSTRtree_nearest_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; geom:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
function GEOSSTRtree_nearest_generic_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; item:pointer; itemEnvelope:PGEOSGeometry; distancefn:TGEOSDistanceCallback;           userdata:pointer):pointer;cdecl;external libgeos_c;
procedure GEOSSTRtree_iterate_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; callback:TGEOSQueryCallback; userdata:pointer);cdecl;external libgeos_c;
function GEOSSTRtree_remove_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree; g:PGEOSGeometry; item:pointer):char;cdecl;external libgeos_c;
procedure GEOSSTRtree_destroy_r(handle:TGEOSContextHandle_t; tree:PGEOSSTRtree);cdecl;external libgeos_c;

function GEOSisEmpty_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSisSimple_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSisRing_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSHasZ_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSHasM_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSisClosed_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
type
  TGEOSRelateBoundaryNodeRules =  Longint;
  Const
    GEOSRELATE_BNR_MOD2 = 1;
    GEOSRELATE_BNR_OGC = 1;
    GEOSRELATE_BNR_ENDPOINT = 2;
    GEOSRELATE_BNR_MULTIVALENT_ENDPOINT = 3;
    GEOSRELATE_BNR_MONOVALENT_ENDPOINT = 4;

function GEOSRelatePattern_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; pat:Pchar):char;cdecl;external libgeos_c;
function GEOSRelate_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
function GEOSRelatePatternMatch_r(handle:TGEOSContextHandle_t; mat:Pchar; pat:Pchar):char;cdecl;external libgeos_c;
function GEOSRelateBoundaryNodeRule_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; bnr:longint):Pchar;cdecl;external libgeos_c;

type
  TGEOSValidFlags =  Longint;
  Const
    GEOSVALID_ALLOW_SELFTOUCHING_RING_FORMING_HOLE = 1;

function GEOSisValid_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):char;cdecl;external libgeos_c;
function GEOSisValidReason_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
function GEOSisValidDetail_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; flags:longint; reason:PPchar; location:PPGEOSGeometry):char;cdecl;external libgeos_c;
type
  TGEOSMakeValidMethods =  Longint;
  Const
    GEOS_MAKE_VALID_LINEWORK = 0;
    GEOS_MAKE_VALID_STRUCTURE = 1;

{* \see GEOSMakeValidParams_create  }

function GEOSMakeValidParams_create_r(extHandle:TGEOSContextHandle_t):PGEOSMakeValidParams;cdecl;external libgeos_c;
{* \see GEOSMakeValidParams_destroy  }
procedure GEOSMakeValidParams_destroy_r(handle:TGEOSContextHandle_t; parms:PGEOSMakeValidParams);cdecl;external libgeos_c;
{* \see GEOSMakeValidParams_setKeepCollapsed  }
function GEOSMakeValidParams_setKeepCollapsed_r(handle:TGEOSContextHandle_t; p:PGEOSMakeValidParams; style:longint):longint;cdecl;external libgeos_c;
{* \see GEOSMakeValidParams_setMethod  }
function GEOSMakeValidParams_setMethod_r(handle:TGEOSContextHandle_t; p:PGEOSMakeValidParams; method:TGEOSMakeValidMethods):longint;cdecl;external libgeos_c;
{* \see GEOSMakeValid  }
function GEOSMakeValid_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSMakeValidWithParams  }
function GEOSMakeValidWithParams_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; makeValidParams:PGEOSMakeValidParams):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSRemoveRepeatedPoints  }
function GEOSRemoveRepeatedPoints_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{ ========== Geometry info ==========  }
{* \see GEOSGeomType  }
{ Return NULL on exception, result must be freed by caller.  }
function GEOSGeomType_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{* \see GEOSGeomTypeId  }
function GEOSGeomTypeId_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGetSRID  }
function GEOSGetSRID_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSSetSRID  }
procedure GEOSSetSRID_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; SRID:longint);cdecl;external libgeos_c;
{* \see GEOSGeom_getUserData  }
function GEOSGeom_getUserData_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):pointer;cdecl;external libgeos_c;
{* \see GEOSGeom_setUserData  }
procedure GEOSGeom_setUserData_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; userData:pointer);cdecl;external libgeos_c;
{* \see GEOSGetNumGeometries  }
function GEOSGetNumGeometries_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGetGeometryN  }
function GEOSGetGeometryN_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSNormalize  }
function GEOSNormalize_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSOrientPolygons  }
function GEOSOrientPolygons_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; exteriorCW:longint):longint;cdecl;external libgeos_c;
{*
* Controls the behavior of GEOSGeom_setPrecision()
* when altering the precision of a geometry.
 }
{* The output is always valid. Collapsed geometry elements (including both polygons and lines) are removed.  }
{* Precision reduction is performed pointwise. Output geometry may be invalid due to collapse or self-intersection. (This might be better called "GEOS_PREC_POINTWISE" - the current name is historical.)  }
{* Like the default mode, except that collapsed linear geometry elements are preserved. Collapsed polygonal input elements are removed.  }
type
  TGEOSPrecisionRules =  Longint;
  Const
    GEOS_PREC_VALID_OUTPUT = 0;
    GEOS_PREC_NO_TOPO = 1;
    GEOS_PREC_KEEP_COLLAPSED = 2;

{* \see GEOSGeom_setPrecision  }

function GEOSGeom_setPrecision_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; gridSize:double; flags:longint):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSGeom_getPrecision  }
function GEOSGeom_getPrecision_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):double;cdecl;external libgeos_c;
{* \see GEOSGetNumInteriorRings  }
function GEOSGetNumInteriorRings_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetNumPoints  }
function GEOSGeomGetNumPoints_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetX  }
function GEOSGeomGetX_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; x:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetY  }
function GEOSGeomGetY_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; y:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetZ  }
function GEOSGeomGetZ_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; z:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetM  }
function GEOSGeomGetM_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; m:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGetInteriorRingN  }
function GEOSGetInteriorRingN_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSGetExteriorRing  }
function GEOSGetExteriorRing_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSGetNumCoordinates  }
function GEOSGetNumCoordinates_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getCoordSeq  }
function GEOSGeom_getCoordSeq_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
{* \see GEOSGeom_getDimensions  }
function GEOSGeom_getDimensions_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getCoordinateDimension  }
function GEOSGeom_getCoordinateDimension_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getXMin  }
function GEOSGeom_getXMin_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getYMin  }
function GEOSGeom_getYMin_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getXMax  }
function GEOSGeom_getXMax_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getYMax  }
function GEOSGeom_getYMax_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeom_getExtent  }
function GEOSGeom_getExtent_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; xmin:Pdouble; ymin:Pdouble; xmax:Pdouble; 
           ymax:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetPointN  }
function GEOSGeomGetPointN_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSGeomGetStartPoint  }
function GEOSGeomGetStartPoint_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSGeomGetEndPoint  }
function GEOSGeomGetEndPoint_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{ ========= Misc functions =========  }
{* \see GEOSArea  }
function GEOSArea_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; area:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSLength  }
function GEOSLength_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; length:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSDistance  }
function GEOSDistance_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSDistanceWithin  }
function GEOSDistanceWithin_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; dist:double):char;cdecl;external libgeos_c;
{* \see GEOSDistanceIndexed  }
function GEOSDistanceIndexed_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSHausdorffDistance  }
function GEOSHausdorffDistance_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSHausdorffDistanceDensify  }
function GEOSHausdorffDistanceDensify_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; densifyFrac:double; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSFrechetDistance  }
function GEOSFrechetDistance_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSFrechetDistanceDensify  }
function GEOSFrechetDistanceDensify_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry; densifyFrac:double; dist:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSHilbertCode  }
function GEOSHilbertCode_r(handle:TGEOSContextHandle_t; geom:PGEOSGeometry; extent:PGEOSGeometry; level:dword; code:Pdword):longint;cdecl;external libgeos_c;
{* \see GEOSGeomGetLength  }
function GEOSGeomGetLength_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; length:Pdouble):longint;cdecl;external libgeos_c;
{* \see GEOSNearestPoints  }
function GEOSNearestPoints_r(handle:TGEOSContextHandle_t; g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
{* \see GEOSGeom_transformXY  }
function GEOSGeom_transformXY_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; callback:TGEOSTransformXYCallback; userdata:pointer):PGEOSGeometry;cdecl;external libgeos_c;
{ ========= Algorithms =========  }
{* \see GEOSOrientationIndex  }
function GEOSOrientationIndex_r(handle:TGEOSContextHandle_t; Ax:double; Ay:double; Bx:double; By:double; 
           Px:double; Py:double):longint;cdecl;external libgeos_c;
{ ========== Reader and Writer APIs ==========  }
{$ifndef GEOSWKTReader}
{*
* Reader object to read Well-Known Text (WKT) format and construct Geometry.
* \see GEOSWKTReader_create
* \see GEOSWKTReader_create_r
 }
type
  TGEOSWKTReader_t = TGEOSWKTReader;
{*
* Writer object to turn Geometry into Well-Known Text (WKT).
* \see GEOSWKTWriter_create
* \see GEOSWKTWriter_create_r
 }
  TGEOSWKTWriter_t = TGEOSWKTWriter;
{*
* Reader object to read Well-Known Binary (WKB) format and construct Geometry.
* \see GEOSWKBReader_create
* \see GEOSWKBReader_create_r
 }
  TGEOSWKBReader_t = TGEOSWKBReader;
{*
* Writer object to turn Geometry into Well-Known Binary (WKB).
* \see GEOSWKBWriter_create
* \see GEOSWKBWriter_create_r
 }
  TGEOSWKBWriter_t = TGEOSWKBWriter;
{*
* Reader object to read GeoJSON format and construct a Geometry.
* \see GEOSGeoJSONReader_create
* \see GEOSGeoJSONReader_create_r
 }
  TGEOSGeoJSONReader_t = TGEOSGeoJSONReader;
{*
* Writer object to turn a Geometry into GeoJSON.
* \see GEOSGeoJSONReader_create
* \see GEOSGeoJSONReader_create_r
 }
  TGEOSGeoJSONWriter_t = TGEOSGeoJSONWriter;
{$endif}
{ ========== WKT Reader ==========  }
{* \see GEOSWKTReader_create  }

function GEOSWKTReader_create_r(handle:TGEOSContextHandle_t):PGEOSWKTReader;cdecl;external libgeos_c;
{* \see GEOSWKTReader_destroy  }
procedure GEOSWKTReader_destroy_r(handle:TGEOSContextHandle_t; reader:PGEOSWKTReader);cdecl;external libgeos_c;
{* \see GEOSWKTReader_read  }
function GEOSWKTReader_read_r(handle:TGEOSContextHandle_t; reader:PGEOSWKTReader; wkt:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSWKTReader_setFixStructure  }
procedure GEOSWKTReader_setFixStructure_r(handle:TGEOSContextHandle_t; reader:PGEOSWKTReader; doFix:char);cdecl;external libgeos_c;
{ ========== WKT Writer ==========  }
{* \see GEOSWKTReader_create  }
function GEOSWKTWriter_create_r(handle:TGEOSContextHandle_t):PGEOSWKTWriter;cdecl;external libgeos_c;
{* \see GEOSWKTWriter_destroy  }
procedure GEOSWKTWriter_destroy_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter);cdecl;external libgeos_c;
{* \see GEOSWKTWriter_write  }
function GEOSWKTWriter_write_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter; g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{* \see GEOSWKTWriter_setTrim  }
procedure GEOSWKTWriter_setTrim_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter; trim:char);cdecl;external libgeos_c;
{* \see GEOSWKTWriter_setRoundingPrecision  }
procedure GEOSWKTWriter_setRoundingPrecision_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter; precision:longint);cdecl;external libgeos_c;
{* \see GEOSWKTWriter_setOutputDimension  }
procedure GEOSWKTWriter_setOutputDimension_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter; dim:longint);cdecl;external libgeos_c;
{* \see GEOSWKTWriter_getOutputDimension  }
function GEOSWKTWriter_getOutputDimension_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter):longint;cdecl;external libgeos_c;
{* \see GEOSWKTWriter_setOld3D  }
procedure GEOSWKTWriter_setOld3D_r(handle:TGEOSContextHandle_t; writer:PGEOSWKTWriter; useOld3D:longint);cdecl;external libgeos_c;
{ ========== WKB Reader ==========  }
{* \see GEOSWKBReader_create  }
function GEOSWKBReader_create_r(handle:TGEOSContextHandle_t):PGEOSWKBReader;cdecl;external libgeos_c;
{* \see GEOSWKBReader_destroy  }
procedure GEOSWKBReader_destroy_r(handle:TGEOSContextHandle_t; reader:PGEOSWKBReader);cdecl;external libgeos_c;
{* \see GEOSWKBReader_setFixStructure  }
procedure GEOSWKBReader_setFixStructure_r(handle:TGEOSContextHandle_t; reader:PGEOSWKBReader; doFix:char);cdecl;external libgeos_c;
{* \see GEOSWKBReader_read  }
function GEOSWKBReader_read_r(handle:TGEOSContextHandle_t; reader:PGEOSWKBReader; wkb:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{* \see GEOSWKBReader_readHEX  }
function GEOSWKBReader_readHEX_r(handle:TGEOSContextHandle_t; reader:PGEOSWKBReader; hex:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{ ========== WKB Writer ==========  }
{* \see GEOSWKBWriter_create  }
function GEOSWKBWriter_create_r(handle:TGEOSContextHandle_t):PGEOSWKBWriter;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_destroy  }
procedure GEOSWKBWriter_destroy_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter);cdecl;external libgeos_c;
{* \see GEOSWKBWriter_write  }
function GEOSWKBWriter_write_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_writeHEX  }
function GEOSWKBWriter_writeHEX_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_getOutputDimension  }
function GEOSWKBWriter_getOutputDimension_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_setOutputDimension  }
procedure GEOSWKBWriter_setOutputDimension_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; newDimension:longint);cdecl;external libgeos_c;
{* \see GEOSWKBWriter_getByteOrder  }
function GEOSWKBWriter_getByteOrder_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_setByteOrder  }
procedure GEOSWKBWriter_setByteOrder_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; byteOrder:longint);cdecl;external libgeos_c;
{* \see GEOSWKBWriter_getFlavor  }
function GEOSWKBWriter_getFlavor_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_setFlavor  }
procedure GEOSWKBWriter_setFlavor_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; flavor:longint);cdecl;external libgeos_c;
{* \see GEOSWKBWriter_getIncludeSRID  }
function GEOSWKBWriter_getIncludeSRID_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter):char;cdecl;external libgeos_c;
{* \see GEOSWKBWriter_setIncludeSRID  }
procedure GEOSWKBWriter_setIncludeSRID_r(handle:TGEOSContextHandle_t; writer:PGEOSWKBWriter; writeSRID:char);cdecl;external libgeos_c;
{ ========== GeoJSON Reader ==========  }
{* \see GEOSGeoJSONReader_create  }
function GEOSGeoJSONReader_create_r(handle:TGEOSContextHandle_t):PGEOSGeoJSONReader;cdecl;external libgeos_c;
{* \see GEOSGeoJSONReader_destroy  }
procedure GEOSGeoJSONReader_destroy_r(handle:TGEOSContextHandle_t; reader:PGEOSGeoJSONReader);cdecl;external libgeos_c;
{* \see GEOSGeoJSONReader_read  }
function GEOSGeoJSONReader_readGeometry_r(handle:TGEOSContextHandle_t; reader:PGEOSGeoJSONReader; geojson:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{ ========== GeoJSON Writer ==========  }
{* \see GEOSGeoJSONWriter_create  }
function GEOSGeoJSONWriter_create_r(handle:TGEOSContextHandle_t):PGEOSGeoJSONWriter;cdecl;external libgeos_c;
{* \see GEOSGeoJSONWriter_destroy  }
procedure GEOSGeoJSONWriter_destroy_r(handle:TGEOSContextHandle_t; writer:PGEOSGeoJSONWriter);cdecl;external libgeos_c;
{* \see GEOSGeoJSONWriter_writeGeometry  }
function GEOSGeoJSONWriter_writeGeometry_r(handle:TGEOSContextHandle_t; writer:PGEOSGeoJSONWriter; g:PGEOSGeometry; indent:longint):Pchar;cdecl;external libgeos_c;
{* \see GEOSFree  }
procedure GEOSFree_r(handle:TGEOSContextHandle_t; buffer:pointer);cdecl;external libgeos_c;
{*
* Returns the current GEOS version string. eg: "3.10.0"
* This function does not have a reentrant variant and is
* available if `GEOS_USE_ONLY_R_API` is defined.
* \return version string
* \since 2.2
 }
function GEOSversion:Pchar;cdecl;external libgeos_c;
{
* External code to GEOS can define GEOS_USE_ONLY_R_API
* to strip the non-reentrant API functions from this header,
* leaving only the "_r" compatible variants.
 }
{$ifndef GEOS_USE_ONLY_R_API}
{ ========== Initialization, cleanup =================================  }
{* @name Library and Memory Management
* Functions to initialize and tear down the library,
* and deallocate memory.
 }
{/@ }
{*
* For non-reentrant code, set up an execution contact, and associate
* \ref GEOSMessageHandler functions with it, to pass error and notice
* messages back to the calling application.
* <pre>
* typedef void (*GEOSMessageHandler)(const char *fmt, ...);
* </pre>
*
* \param notice_function Handle notice messages
* \param error_function Handle error messages
* \since 2.2
 }

procedure initGEOS(notice_function:TGEOSMessageHandler; error_function:TGEOSMessageHandler);cdecl;external libgeos_c;
{*
* For non-reentrant code, call when all GEOS operations are complete,
* cleans up global resources.
* \since 3.1
 }
procedure finishGEOS;cdecl;external libgeos_c;
{*
* Free strings and byte buffers returned by functions such
* as GEOSWKBWriter_write(),
* GEOSWKBWriter_writeHEX() and GEOSWKTWriter_write(), etc.
* \param buffer The memory to free
* \since 3.1
 }
procedure GEOSFree(buffer:pointer);cdecl;external libgeos_c;
{/@ }
{ ========= Coordinate Sequence functions =========  }
{* @name Coordinate Sequences
* A GEOSCoordSequence is an ordered list of coordinates.
* Coordinates are 2 (XY), 3 (XYZ or XYM), or 4 (XYZM) dimensional.
 }
{/@ }
{*
* Create a coordinate sequence.
* \param size number of coordinates in the sequence
* \param dims dimensionality of the coordinates (2, 3 or 4)
* \return the sequence or NULL on exception
* \since 2.2
 }
function GEOSCoordSeq_create(size:dword; dims:dword):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Create a coordinate sequence by copying from an interleaved buffer of doubles (e.g., XYXY or XYZXYZ)
* \param buf pointer to buffer
* \param size number of coordinates in the sequence
* \param hasZ does buffer have Z values?
* \param hasM does buffer have M values?
* \return the sequence or NULL on exception
*
* \since 3.10
 }
function GEOSCoordSeq_copyFromBuffer(buf:Pdouble; size:dword; hasZ:longint; hasM:longint):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Create a coordinate sequence by copying from arrays of doubles
* \param x array of x coordinates
* \param y array of y coordinates
* \param z array of z coordinates, or NULL
* \param m array of m coordinates, or NULL
* \param size length of each array
* \return the sequence or NULL on exception
*
* \since 3.10
 }
function GEOSCoordSeq_copyFromArrays(x:Pdouble; y:Pdouble; z:Pdouble; m:Pdouble; size:dword):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Copy the contents of a coordinate sequence to an interleaved buffer of doubles (e.g., XYXY or XYZXYZ)
* \param s sequence to copy
* \param buf buffer to which coordinates should be copied
* \param hasZ copy Z values to buffer?
* \param hasM copy M values to buffer?
* \return 1 on success, 0 on error
*
* \since 3.10
 }
function GEOSCoordSeq_copyToBuffer(s:PGEOSCoordSequence; buf:Pdouble; hasZ:longint; hasM:longint):longint;cdecl;external libgeos_c;
{*
* Copy the contents of a coordinate sequence to arrays of doubles
* \param s sequence to copy
* \param x array to which x values should be copied
* \param y array to which y values should be copied
* \param z array to which z values should be copied, or NULL
* \param m array to which m values should be copied, or NULL
* \return 1 on success, 0 on error
*
* \since 3.10
 }
function GEOSCoordSeq_copyToArrays(s:PGEOSCoordSequence; x:Pdouble; y:Pdouble; z:Pdouble; m:Pdouble):longint;cdecl;external libgeos_c;
{*
* Clone a coordinate sequence.
* \param s the coordinate sequence to clone
* \return a copy of the coordinate sequence or NULL on exception
* \since 2.2
 }
function GEOSCoordSeq_clone(s:PGEOSCoordSequence):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Destroy a coordinate sequence, freeing all memory.
* \param s the coordinate sequence to destroy
* \since 2.2
 }
procedure GEOSCoordSeq_destroy(s:PGEOSCoordSequence);cdecl;external libgeos_c;
{*
* Set X ordinate values in a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val the value to set the ordinate to
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_setX(s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
{*
* Set Y ordinate values in a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val the value to set the ordinate to
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_setY(s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
{*
* Set Z ordinate values in a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val the value to set the ordinate to
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_setZ(s:PGEOSCoordSequence; idx:dword; val:double):longint;cdecl;external libgeos_c;
{*
* Set X and Y ordinate values in a coordinate sequence simultaneously.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param x the value to set the X ordinate to
* \param y the value to set the Y ordinate to
* \return 0 on exception
*
* \since 3.8
 }
function GEOSCoordSeq_setXY(s:PGEOSCoordSequence; idx:dword; x:double; y:double):longint;cdecl;external libgeos_c;
{*
* Set X, Y and Z ordinate values in a coordinate sequence simultaneously.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param x the value to set the X ordinate to
* \param y the value to set the Y ordinate to
* \param z the value to set the Z ordinate to
* \return 0 on exception
*
* \since 3.8
 }
function GEOSCoordSeq_setXYZ(s:PGEOSCoordSequence; idx:dword; x:double; y:double; z:double):longint;cdecl;external libgeos_c;
{*
* Set Nth ordinate value in a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param dim the dimension number of the ordinate to alter, zero based
* \param val the value to set the ordinate to
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_setOrdinate(s:PGEOSCoordSequence; idx:dword; dim:dword; val:double):longint;cdecl;external libgeos_c;
{*
* Read X ordinate values from a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val pointer where ordinate value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getX(s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
{*
* Read Y ordinate values from a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val pointer where ordinate value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getY(s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
{*
* Read Z ordinate values from a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param val pointer where ordinate value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getZ(s:PGEOSCoordSequence; idx:dword; val:Pdouble):longint;cdecl;external libgeos_c;
{*
* Read X and Y ordinate values from a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param x pointer where ordinate X value will be placed
* \param y pointer where ordinate Y value will be placed
* \return 0 on exception
*
* \since 3.8
 }
function GEOSCoordSeq_getXY(s:PGEOSCoordSequence; idx:dword; x:Pdouble; y:Pdouble):longint;cdecl;external libgeos_c;
{*
* Read X and Y ordinate values from a coordinate sequence.
* \param s the coordinate sequence
* \param idx the index of the coordinate to alter, zero based
* \param x pointer where ordinate X value will be placed
* \param y pointer where ordinate Y value will be placed
* \param z pointer where ordinate Z value will be placed
* \return 0 on exception
*
* \since 3.8
 }
function GEOSCoordSeq_getXYZ(s:PGEOSCoordSequence; idx:dword; x:Pdouble; y:Pdouble; z:Pdouble):longint;cdecl;external libgeos_c;
{*
* Read Nth ordinate value from a coordinate sequence.
* \param[in] s the coordinate sequence
* \param[in] idx the index of the coordinate to alter, zero based
* \param[in] dim the dimension number of the ordinate to read, zero based
* \param[out] val pointer where ordinate value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getOrdinate(s:PGEOSCoordSequence; idx:dword; dim:dword; val:Pdouble):longint;cdecl;external libgeos_c;
{*
* Get size info from a coordinate sequence.
* \param[in] s the coordinate sequence
* \param[out] size pointer where size value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getSize(s:PGEOSCoordSequence; size:Pdword):longint;cdecl;external libgeos_c;
{*
* Get dimension info from a coordinate sequence.
* \param[in] s the coordinate sequence
* \param[out] dims pointer where dimension value will be placed
* \return 0 on exception
* \since 2.2
 }
function GEOSCoordSeq_getDimensions(s:PGEOSCoordSequence; dims:Pdword):longint;cdecl;external libgeos_c;
{*
* Check orientation of a coordinate sequence. Closure of the sequence is
* assumed. Invalid (collapsed) or short (fewer than 4 points) sequences return false.
* \param s the coordinate sequence
* \param is_ccw pointer for ccw value, 1 if counter-clockwise orientation, 0 otherwise
* \return 0 on exception, 1 on success
*
* \since 3.7
 }
function GEOSCoordSeq_isCCW(s:PGEOSCoordSequence; is_ccw:Pchar):longint;cdecl;external libgeos_c;
{/@ }
{ ========= Geometry Constructors =========  }
{* @name Geometry Constructors
* Functions for creating and destroying geometries.
* Created geometries must be freed with GEOSGeom_destroy().
 }
{/@ }
{*
* Creates a point geometry from a coordinate sequence.
* \param s Input coordinate sequence, ownership passes to the geometry
* \return A newly allocated point geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSGeom_createPoint(s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates a point geometry from a pair of coordinates.
* \param x The X coordinate
* \param y The Y coordinate
* \return A newly allocated point geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.8
 }
function GEOSGeom_createPointFromXY(x:double; y:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates an empty point.
* \return A newly allocated empty point geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSGeom_createEmptyPoint:PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates a linear ring geometry, for use in a polygon.
* \param s Input coordinate sequence, ownership passes to the geometry
* \return A newly allocated linear ring geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSGeom_createLinearRing(s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates a linestring geometry.
* \param s Input coordinate sequence, ownership passes to the geometry
* \return A newly allocated linestring geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSGeom_createLineString(s:PGEOSCoordSequence):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates an emptylinestring geometry.
* \return A newly allocated linestring geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSGeom_createEmptyLineString:PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates an empty polygon geometry.
* \return A newly allocated empty polygon geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSGeom_createEmptyPolygon:PGEOSGeometry;cdecl;external libgeos_c;
{*
* Creates a polygon geometry from linear ring geometries.
* \param shell A linear ring that is the exterior ring of the polygon.
* \param holes An array of linear rings that are the holes.
* \param nholes The number of rings in the holes array.
* \return A newly allocated geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \note The holes argument is an array of GEOSGeometry* objects.
*       The caller **retains ownership** of the containing array,
*       but the ownership of the pointed-to objects is transferred
*       to the returned \ref GEOSGeometry.
* \since 2.2
 }
function GEOSGeom_createPolygon(shell:PGEOSGeometry; holes:PPGEOSGeometry; nholes:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create a geometry collection.
* \param type The geometry type, enumerated by \ref GEOSGeomTypes
* \param geoms A list of geometries that will form the collection
* \param ngeoms The number of geometries in the geoms list
* \return A newly allocated geometry collection. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \note The geoms argument is an array of GEOSGeometry* objects.
*       The caller **retains ownership** of the containing array,
*       but the ownership of the pointed-to objects is transferred
*       to the returned \ref GEOSGeometry.
* \since 2.2
 }
function GEOSGeom_createCollection(_type:longint; geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Release the sub-geometries of a collection for management.
* by the caller. The input collection remains as an empty collection,
* that the caller is responsible for destroying. The output geometries
* are also the responsibility of the caller, as is the containing array,
* which must be freed with GEOSFree().
* \param collection The collection that will have its components released.
* \param ngeoms A pointer to a variable that will be filled with the
*        size of the output array.
* \return A newly allocated array of GEOSGeometry pointers.
* \note The caller is responsible for freeing the returned array
*       with GEOSFree() and all the elements with GEOSGeom_destroy().
*       If called with an empty collection, null will be returned
*       and ngeoms set to zero.
* \since 3.4
 }
function GEOSGeom_releaseCollection(collection:PGEOSGeometry; ngeoms:Pdword):^PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create an empty geometry collection.
* \param type The geometry type, enumerated by \ref GEOSGeomTypes
* \return A newly allocated empty geometry collection. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSGeom_createEmptyCollection(_type:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create a rectangular polygon from bounding coordinates.
* Will return a point geometry if width and height are 0.
* \param xmin Left bound of envelope
* \param ymin Lower bound of envelope
* \param xmax Right bound of envelope
* \param ymax Upper bound of envelope
*
* \since 3.11
 }
function GEOSGeom_createRectangle(xmin:double; ymin:double; xmax:double; ymax:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create a new copy of the input geometry.
* \param g The geometry to copy
* \return A newly allocated geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSGeom_clone(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Release the memory associated with a geometry.
* \param g The geometry to be destroyed.
* \since 2.2
 }
procedure GEOSGeom_destroy(g:PGEOSGeometry);cdecl;external libgeos_c;
{/@ }
{ ========== Geometry info ==========  }
{* @name Geometry Accessors
* Functions to provide information about geometries.
 }
{/@ }
{*
* Returns the geometry type string for this geometry.
* eg: "GeometryCollection", "LineString"
* \param g Input geometry
* \return A string with the geometry type.
* Caller must free with GEOSFree().
* NULL on exception.
* \since 2.2
 }
function GEOSGeomType(g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* Returns the \ref GEOSGeomTypeId number for this geometry.
* \param g Input geometry
* \return The geometry type number, or -1 on exception.
* \since 2.2
 }
function GEOSGeomTypeId(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Returns the "spatial reference id" (SRID) for this geometry.
* \param g Input geometry
* \return SRID number or 0 if unknown / not set.
* \since 2.2
 }
function GEOSGetSRID(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Return the anonymous "user data" for this geometry.
* User data must be managed by the caller, and is not freed when
* the geometry is destoryed.
* \param g Input geometry
* \return A void* to the user data, caller is responsible for
*         casting to the appropriate type.
*
* \since 3.6
 }
function GEOSGeom_getUserData(g:PGEOSGeometry):pointer;cdecl;external libgeos_c;
{*
* Returns the number of sub-geometries immediately under a
* multi-geometry or collection or 1 for a simple geometry.
* For nested collections, remember to check if returned
* sub-geometries are **themselves** also collections.
* \param g Input geometry
* \return Number of direct children in this collection
* \warning For GEOS < 3.2 this function may crash when fed simple geometries
* \since 2.2
 }
function GEOSGetNumGeometries(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Returns the specified sub-geometry of a collection. For
* a simple geometry, returns a pointer to the input.
* Returned object is a pointer to internal storage:
* it must NOT be destroyed directly.
* \param g Input geometry
* \param n Sub-geometry index, zero-based
* \return A const \ref GEOSGeometry, do not free!
          It will be freed when the parent is freed.
          Returns NULL on exception.
* \note Up to GEOS 3.2.0 the input geometry must be a Collection, in
*       later versions it doesn't matter (getGeometryN(0) for a single will
*       return the input).
* \since 2.2
 }
function GEOSGetGeometryN(g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Read the currently set precision value from the
* geometry and returns the grid size if it is a fixed
* precision or 0.0 if it is full floating point precision.
* \param g Input geometry
* \return The grid size, or -1 on exception
*
* \since 3.6
 }
function GEOSGeom_getPrecision(g:PGEOSGeometry):double;cdecl;external libgeos_c;
{*
* Returns the number of interior rings, for a Polygon input, or
* an exception otherwise.
* \param g Input Polygon geometry
* \return Number of interior rings, -1 on exception
* \since 2.2
 }
function GEOSGetNumInteriorRings(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Returns the number of points, for a LineString input, or
* an exception otherwise.
* \param g Input LineString geometry
* \return Number of points, -1 on exception
* \since 2.2
 }
function GEOSGeomGetNumPoints(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Returns the X coordinate, for a Point input, or an
* exception otherwise.
* \param[in] g Input Point geometry
* \param[out] x Pointer to hold return value
* \returns 1 on success, 0 on exception
* \since 2.2
 }
function GEOSGeomGetX(g:PGEOSGeometry; x:Pdouble):longint;cdecl;external libgeos_c;
{*
* Returns the Y coordinate, for a Point input, or an
* exception otherwise.
* \param[in] g Input Point geometry
* \param[out] y Pointer to hold return value
* \returns 1 on success, 0 on exception
* \since 2.2
 }
function GEOSGeomGetY(g:PGEOSGeometry; y:Pdouble):longint;cdecl;external libgeos_c;
{*
* Returns the Z coordinate, for a Point input, or an
* exception otherwise.
* \param[in] g Input Point geometry
* \param[out] z Pointer to hold return value
* \returns 1 on success, 0 on exception
*
* \since 3.7
 }
function GEOSGeomGetZ(g:PGEOSGeometry; z:Pdouble):longint;cdecl;external libgeos_c;
{*
* Returns the M coordinate, for a Point input, or an
* exception otherwise.
* \param[in] g Input Point geometry
* \param[out] m Pointer to hold return value
* \returns 1 on success, 0 on exception
*
* \since 3.12
 }
function GEOSGeomGetM(g:PGEOSGeometry; m:Pdouble):longint;cdecl;external libgeos_c;
{*
* Returns the N'th ring for a Polygon input.
* \note Returned object is a pointer to internal storage:
*       it must NOT be destroyed directly.
* \param g Input Polygon geometry
* \param n Index of the desired ring
* \return LinearRing geometry. Owned by parent geometry, do not free. NULL on exception.
* \since 2.2
 }
function GEOSGetInteriorRingN(g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Get the external ring of a Polygon.
* \note Returned object is a pointer to internal storage:
*       it must NOT be destroyed directly.
* \param g Input Polygon geometry
* \return LinearRing geometry. Owned by parent geometry, do not free. NULL on exception.
* \since 2.2
 }
function GEOSGetExteriorRing(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Get the total number of points in a geometry,
* of any type.
* \param g Input geometry
* \return Number of points in the geometry. -1 on exception.
* \since 2.2
 }
function GEOSGetNumCoordinates(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Return the coordinate sequence underlying the
* given geometry (Must be a LineString, LinearRing or Point).
* Do not directly free the coordinate sequence, it is owned by
* the parent geometry.
* \param g Input geometry
* \return Coordinate sequence or NULL on exception.
* \since 2.2
 }
function GEOSGeom_getCoordSeq(g:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Return the planar dimensionality of the geometry.
*
* - 0 for point, multipoint
* - 1 for linestring, multilinestring
* - 2 for polygon, multipolygon
*
* \see geos::geom::Dimension::DimensionType
* \param g Input geometry
* \return The dimensionality
* \since 2.2
 }
function GEOSGeom_getDimensions(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Return the cartesian dimension of the geometry.
*
* - 2 for XY data
* - 3 for XYZ data
*
* \param g Input geometry
* \return The dimension
*
* \since 3.3
 }
function GEOSGeom_getCoordinateDimension(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Finds the minimum X value in the geometry.
* \param[in] g Input geometry
* \param[out] value Pointer to place result
* \return 0 on exception
*
* \since 3.7
 }
function GEOSGeom_getXMin(g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{*
* Finds the minimum Y value in the geometry.
* \param[in] g Input geometry
* \param[out] value Pointer to place result
* \return 0 on exception
*
* \since 3.7
 }
function GEOSGeom_getYMin(g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{*
* Finds the maximum X value in the geometry.
* \param[in] g Input geometry
* \param[out] value Pointer to place result
* \return 0 on exception
*
* \since 3.7
 }
function GEOSGeom_getXMax(g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{*
* Finds the maximum Y value in the geometry.
* \param[in] g Input geometry
* \param[out] value Pointer to place result
* \return 0 on exception
*
* \since 3.7
 }
function GEOSGeom_getYMax(g:PGEOSGeometry; value:Pdouble):longint;cdecl;external libgeos_c;
{*
* Finds the extent (minimum and maximum X and Y value) of the geometry.
* Raises an exception for empty geometry input.
*
* \param[in] g Input geometry
* \param[out] xmin Pointer to place result for minimum X value
* \param[out] ymin Pointer to place result for minimum Y value
* \param[out] xmax Pointer to place result for maximum X value
* \param[out] ymax Pointer to place result for maximum Y value
* \return 1 on success, 0 on exception
*
* \since 3.11
 }
function GEOSGeom_getExtent(g:PGEOSGeometry; xmin:Pdouble; ymin:Pdouble; xmax:Pdouble; ymax:Pdouble):longint;cdecl;external libgeos_c;
{*
* Return the N'th point of a LineString
* \param g Input geometry, must be a LineString
* \param n Index of desired point (zero based)
* \return A Point geometry.
*         Caller must free with GEOSGeom_destroy()
*         NULL on exception.
* \since 3.3
 }
function GEOSGeomGetPointN(g:PGEOSGeometry; n:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Return the first point of a LineString
* \param g Input geometry, must be a LineString
* \return A Point geometry.
*         Caller must free with GEOSGeom_destroy()
*         NULL on exception.
* \since 3.3
 }
function GEOSGeomGetStartPoint(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Return the last point of a LineString
* \param g Input geometry, must be a LineString
* \return A Point geometry.
*         Caller must free with GEOSGeom_destroy()
*         NULL on exception.
* \since 3.3
 }
function GEOSGeomGetEndPoint(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Tests whether the input geometry is empty. If the geometry or any
* component is non-empty, the geometry is non-empty. An empty geometry
* has no boundary or interior.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \since 2.2
 }
function GEOSisEmpty(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Tests whether the input geometry is a ring. Rings are
* linestrings, without self-intersections,
* with start and end point being identical.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \since 2.2
 }
function GEOSisRing(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Tests whether the input geometry has Z coordinates.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \since 2.2
 }
function GEOSHasZ(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Tests whether the input geometry has M coordinates.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
*
* \since 3.12
 }
function GEOSHasM(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Tests whether the input geometry is closed.
* A closed geometry is a linestring or multilinestring
* with the start and end points being the same.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \since 3.3
 }
function GEOSisClosed(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{/@ }
{ ====================================================================================  }
{* @name Geometry Mutators
* Functions to change geometry information or content.
 }
{/@ }
{*
* Set the "spatial reference id" (SRID) for this geometry.
* \param g Input geometry
* \param SRID SRID number or 0 for unknown SRID.
* \since 2.2
 }
procedure GEOSSetSRID(g:PGEOSGeometry; SRID:longint);cdecl;external libgeos_c;
{*
* Set the anonymous "user data" for this geometry.
* \param g Input geometry
* \param userData Void pointer to user data
*
* \since 3.6
 }
procedure GEOSGeom_setUserData(g:PGEOSGeometry; userData:pointer);cdecl;external libgeos_c;
{*
* Organize the elements, rings, and coordinate order
* of geometries in a consistent way,
* so that geometries that represent the same
* object can be easily compared.
* Modifies the geometry in-place.
*
* Normalization ensures the following:
* - Lines are oriented to have smallest coordinate first (apart from duplicate endpoints)
* - Rings start with their smallest coordinate
*   (using XY ordering)
* - Polygon shell rings are oriented CW, and holes CCW
* - Collection elements are sorted by their first coordinate
*
* Use before calling \ref GEOSEqualsExact to avoid false "not equal" results.
* \param g Input geometry
* \return 0 on success or -1 on exception
* \since 3.0
 }
function GEOSNormalize(g:PGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Enforce a ring orientation on all polygonal elements in the input geometry.
* Non-polygonal geometries will not be modified.
*
* \param g Input geometry
* \param exteriorCW if 1, exterior rings will be clockwise and interior rings
*                         will be counter-clockwise
* \return 0 on success or -1 on exception
 }
function GEOSOrientPolygons(g:PGEOSGeometry; exteriorCW:longint):longint;cdecl;external libgeos_c;
{/@ }
{ ========== Validity checking ============================================================  }
{* @name Validation
* Functions to check and create topological validity, simplicity
and geometric quality.
 }
{/@ }
{*
* Tests whether the input geometry is "simple". Mostly relevant for
* linestrings. A "simple" linestring has no self-intersections.
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \since 2.2
 }
function GEOSisSimple(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Check the validity of the provided geometry.
* - All points are valid.
* - All non-zero-length linestrings are valid.
* - Polygon rings must be non-self-intersecting, and interior rings
*   contained within exterior rings.
* - Multi-polygon components may not touch or overlap.
*
* \param g The geometry to test
* \return 1 on true, 0 on false, 2 on exception
* \see geos::operation::valid::isValidOp
* \since 2.2
 }
function GEOSisValid(g:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Return the human readable reason a geometry is invalid,
* "Valid Geometry" string otherwise, or NULL on exception.
* \param g The geometry to test
* \return A string with the reason, NULL on exception.
*         Caller must GEOSFree() their result.
*
* \since 3.1
 }
function GEOSisValidReason(g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* In one step, calculate and return the validity, the
* human readable validity reason and a point at which validity
* rules are broken.
* Caller has the responsibility to destroy 'reason' with GEOSFree()
* and 'location' with GEOSGeom_destroy()
* \param g The geometry to test
* \param flags A value from the \ref GEOSValidFlags enum
* \param reason A pointer in which the reason string will be places
* \param location A pointer in which the location GEOSGeometry will be placed
* \return 1 when valid, 0 when invalid, 2 on exception
*
* \since 3.3
 }
function GEOSisValidDetail(g:PGEOSGeometry; flags:longint; reason:PPchar; location:PPGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Repair an invalid geometry, returning a valid output.
* \param g The geometry to repair
* \return The repaired geometry. Caller must free with GEOSGeom_destroy().
*
* \since 3.8
 }
function GEOSMakeValid(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Repair an invalid geometry, returning a valid output, using the
* indicated GEOSMakeValidMethods algorithm and options.
* \param g is the geometry to test.
* \param makeValidParams is a GEOSMakeValidParams with the desired parameters set on it.
* \return A repaired geometry. Caller must free with GEOSGeom_destroy().
* \see GEOSMakeValidParams_create
* \see GEOSMakeValidParams_destroy
* \see GEOSMakeValidParams_setMethod
* \see GEOSMakeValidParams_setKeepCollapsed
*
* \since 3.10
 }
function GEOSMakeValidWithParams(g:PGEOSGeometry; makeValidParams:PGEOSMakeValidParams):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create a GEOSMakeValidParams to hold the desired parameters
* to control the algorithm and behavior of the validation process.
* \return a parameter object
* \see GEOSMakeValidWithParams
*
* \since 3.10
 }
function GEOSMakeValidParams_create:PGEOSMakeValidParams;cdecl;external libgeos_c;
{*
* Destroy a GEOSMakeValidParams.
* \param parms the object to destroy
* \see GEOSMakeValidWithParams
*
* \since 3.10
 }
procedure GEOSMakeValidParams_destroy(parms:PGEOSMakeValidParams);cdecl;external libgeos_c;
{*
* Set the GEOSMakeValidMethods to use in making the geometry
* valid.
* \return 0 on exception, 1 on success.
* \see GEOSMakeValidWithParams
*
* \since 3.10
 }
function GEOSMakeValidParams_setMethod(p:PGEOSMakeValidParams; method:TGEOSMakeValidMethods):longint;cdecl;external libgeos_c;
{*
* When this parameter is nn-zero, the GEOS_MAKE_VALID_STRUCTURE method will keep
* components that have collapsed into a lower dimensionality.
* For example, a ring collapsing to a line, or a line collapsing
* to a point.
* \return 0 on exception, 1 on success.
* \see GEOSMakeValidWithParams
*
* \since 3.10
 }
function GEOSMakeValidParams_setKeepCollapsed(p:PGEOSMakeValidParams; keepCollapsed:longint):longint;cdecl;external libgeos_c;
{*
* Computes the minimum clearance of a geometry.  The minimum clearance is the smallest amount by which
* a vertex could be move to produce an invalid polygon, a non-simple linestring, or a multipoint with
* repeated points.  If a geometry has a minimum clearance of 'eps', it can be said that:
*
* -  No two distinct vertices in the geometry are separated by less than 'eps'
* -  No vertex is closer than 'eps' to a line segment of which it is not an endpoint.
*
* If the minimum clearance cannot be defined for a geometry (such as with a single point, or a multipoint
* whose points are identical, a value of Infinity will be calculated.
*
* \param g the input geometry
* \param d a double to which the result can be stored
* \return 0 if no exception occurred.
*         2 if an exception occurred.
* \see geos::precision::MinimumClearance
*
* \since 3.6
 }
function GEOSMinimumClearance(g:PGEOSGeometry; d:Pdouble):longint;cdecl;external libgeos_c;
{*
* Returns a LineString whose endpoints define the minimum clearance of a geometry.
* If the geometry has no minimum clearance, an empty LineString will be returned.
*
* \param g the input geometry
* \return a linestring geometry, or NULL if an exception occurred.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::precision::MinimumClearance
*
* \since 3.6
 }
function GEOSMinimumClearanceLine(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Works from start of each coordinate sequence in the
* geometry, retaining points that are further away from the
* previous retained point than the tolerance value.
*
* Removing repeated points with a non-zero tolerance may
* result in an invalid geometry being returned. Be sure
* to check and repair validity.
*
* \return A geometry with all points within the tolerance of each other removed.
* \param g The geometry to filter
* \param tolerance Remove all points within this distance of each other. Use 0.0 to remove only exactly repeated points.
*
* \see GEOSMakeValidWithParams
*
* \since 3.11
 }
function GEOSRemoveRepeatedPoints(g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ========= Metric functions ==================================================  }
{* @name Geometry Metrics
* Functions to compute geometry metrics.
 }
{/@ }
{*
* Calculate the area of a geometry.
* \param[in] g Input geometry
* \param[out] area Pointer to be filled in with area result
* \return 1 on success, 0 on exception.
* \since 2.2
 }
function GEOSArea(g:PGEOSGeometry; area:Pdouble):longint;cdecl;external libgeos_c;
{*
* Calculate the length of a geometry.
* \param[in] g Input geometry
* \param[out] length Pointer to be filled in with length result
* \return 1 on success, 0 on exception.
* \since 2.2
 }
function GEOSLength(g:PGEOSGeometry; length:Pdouble):longint;cdecl;external libgeos_c;
{*
* Calculate the length of a LineString.
* Only works for LineString inputs, returns exception otherwise.
*
* \param[in] g Input geometry
* \param[out] length Pointer to be filled in with length result
* \return 1 on success, 0 on exception.
* \since 3.3
 }
function GEOSGeomGetLength(g:PGEOSGeometry; length:Pdouble):longint;cdecl;external libgeos_c;
{/@ }
{ ========== Distance functions ================================================  }
{* @name Distance
* Functions to compute distances between geometries
* using various distance metrics.
 }
{/@ }
{*
* Calculate the distance between two geometries.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \since 2.2
 }
function GEOSDistance(g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* Test whether the distance between two geometries is
* within the given dist.
* \param g1 Input geometry
* \param g2 Input geometry
* \param dist The max distance
* \returns 1 on true, 0 on false, 2 on exception
*
* \since 3.10
 }
function GEOSDistanceWithin(g1:PGEOSGeometry; g2:PGEOSGeometry; dist:double):char;cdecl;external libgeos_c;
{*
* Calculate the distance between two geometries, using the
* indexed facet distance, which first indexes the geometries
* internally, then calculates the distance. Useful when one
* or both geometries is very large.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \see geos::operation::distance:;IndexedFacetDistance
*
* \since 3.7
 }
function GEOSDistanceIndexed(g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* The closest points of the two geometries.
* The first point comes from g1 geometry and the second point comes from g2.
*
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \return A coordinate sequence with the two points, or NULL on exception.
* Caller must free with GEOSCoordSeq_destroy().
*
* \since 3.5
 }
function GEOSNearestPoints(g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Calculate the Hausdorff distance between two geometries.
* [Hausdorff distance](https://en.wikipedia.org/wiki/Hausdorff_distance)
* is the largest distance between two geometries.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \see geos::algorithm::distance::DiscreteHausdorffDistance
* \since 3.2
 }
function GEOSHausdorffDistance(g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* Calculate a more precise Hausdorff distance between two geometries,
* by densifying the inputs before computation.
* [Hausdorff distance](https://en.wikipedia.org/wiki/Hausdorff_distance)
* is the largest distance between two geometries.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[in] densifyFrac The largest % of the overall line length that
*            any given two-point segment should be
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \see geos::algorithm::distance::DiscreteHausdorffDistance
* \since 3.2
 }
function GEOSHausdorffDistanceDensify(g1:PGEOSGeometry; g2:PGEOSGeometry; densifyFrac:double; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* Calculate the
* [Frechet distance](https://en.wikipedia.org/wiki/Fr%C3%A9chet_distance)
* between two geometries,
* a similarity measure for linear features.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \see geos::algorithm::distance::DiscreteFrechetDistance
*
* \since 3.7
 }
function GEOSFrechetDistance(g1:PGEOSGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* Calculate the
* [Frechet distance](https://en.wikipedia.org/wiki/Fr%C3%A9chet_distance)
* between two geometries,
* a similarity measure for linear features.
* The inputs can be densified to provide a more accurate result.
* \param[in] g1 Input geometry
* \param[in] g2 Input geometry
* \param[in] densifyFrac The largest % of the overall line length that
*            any given two-point segment should be
* \param[out] dist Pointer to be filled in with distance result
* \return 1 on success, 0 on exception.
* \see geos::algorithm::distance::DiscreteFrechetDistance
*
* \since 3.7
 }
function GEOSFrechetDistanceDensify(g1:PGEOSGeometry; g2:PGEOSGeometry; densifyFrac:double; dist:Pdouble):longint;cdecl;external libgeos_c;
{/@ }
{ ========== Linear referencing functions  }
{* @name Linear Referencing
* Functions to operate on LineStrings using locations
* specified by distance along the line.
 }
{/@ }
{*
* Distance of point projected onto line from the start of the line.
* \param line linear target of projection
* \param point point to be projected onto 'g'
* \return distance along line that point projects to, -1 on exception
*
* \note Line parameter must be a LineString.
* \since 3.2
 }
function GEOSProject(line:PGEOSGeometry; point:PGEOSGeometry):double;cdecl;external libgeos_c;
{*
* Measuring from start of line, return point that is distance
* the start. Line parameter must be a LineString.
* The returned point is not guaranteed to intersect the line due to limitations
* of floating point calculations.
* \param line linear target of projection
* \param d distance from start of line to created point
* \return The point \ref GEOSGeometry that is distance from the start of line.
* Caller takes ownership of returned geometry.
* \since 3.2
 }
function GEOSInterpolate(line:PGEOSGeometry; d:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Project point to line and calculate the **proportion** of
* the line the point is from the start. For example, a point that
* projects to the middle of a line would be return 0.5.
* \param line linear target of projection
* \param point the point to project
* \return The proportion of the overall line length that the projected
* point falls at.
* \since 3.2
 }
function GEOSProjectNormalized(line:PGEOSGeometry; point:PGEOSGeometry):double;cdecl;external libgeos_c;
{*
* Measuring from start of line, return point that is a proportion
* the start. Line parameter must be a LineString.
* \param line linear target of projection
* \param proportion The proportion from the start of line to created point
* \return The point \ref GEOSGeometry that is distance from the start of line.
* Caller takes ownership of returned geometry.
* \since 3.2
 }
function GEOSInterpolateNormalized(line:PGEOSGeometry; proportion:double):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ========== Overlay functions ==========  }
{* @name Overlay
* Functions for computing boolean set-theoretic
* values from overlay pairs of geometries.
 }
{/@ }
{*
* Returns the intersection of two geometries: the set of points
* that fall within **both** geometries.
* \param g1 one of the geometries
* \param g2 the other geometry
* \return A newly allocated geometry of the intersection. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
* \since 2.2
 }
function GEOSIntersection(g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the intersection of two geometries: the set of points
* that fall within **both** geometries. All the vertices of the output
* geometry must fall on the grid defined by the gridSize, and the
* output will be a valid geometry.
* \param g1 one of the geometries
* \param g2 the other geometry
* \param gridSize the cell size of the precision grid
* \return A newly allocated geometry of the intersection. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.9
 }
function GEOSIntersectionPrec(g1:PGEOSGeometry; g2:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the difference of two geometries A and B: the set of points
* that fall within A but **not** within B.
* \param ga the base geometry
* \param gb the geometry to subtract from it
* \return A newly allocated geometry of the difference. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
* \since 2.2
 }
function GEOSDifference(ga:PGEOSGeometry; gb:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the difference of two geometries A and B: the set of points
* that fall within A but **not** within B.
* All the vertices of the output
* geometry must fall on the grid defined by the gridSize, and the
* output will be a valid geometry.
* \param ga one of the geometries
* \param gb the other geometry
* \param gridSize the cell size of the precision grid
* \return A newly allocated geometry of the difference. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.9
 }
function GEOSDifferencePrec(ga:PGEOSGeometry; gb:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the symmetric difference of two geometries A and B: the set of points
* that fall in A but **not** within B and the set of points that fall in B but
* **not** in A.
* \param ga geometry A
* \param gb geometry B
* \return A newly allocated geometry of the symmetric difference. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
* \since 2.2
 }
function GEOSSymDifference(ga:PGEOSGeometry; gb:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the symmetric difference of two geometries A and B: the set of points
* that fall in A but **not** within B and the set of points that fall in B but
* **not** in A.
* All the vertices of the output
* geometry must fall on the grid defined by the gridSize, and the
* output will be a valid geometry.
* \param ga one of the geometries
* \param gb the other geometry
* \param gridSize the cell size of the precision grid
* \return A newly allocated geometry of the symmetric difference. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.9
 }
function GEOSSymDifferencePrec(ga:PGEOSGeometry; gb:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the union of two geometries A and B: the set of points
* that fall in A **or** within B.
* \param ga geometry A
* \param gb geometry B
* \return A newly allocated geometry of the union. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
* \since 2.2
 }
function GEOSUnion(ga:PGEOSGeometry; gb:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the union of two geometries A and B: the set of points
* that fall in A **or** within B.
* All the vertices of the output
* geometry must fall on the grid defined by the gridSize, and the
* output will be a valid geometry.
* \param ga one of the geometries
* \param gb the other geometry
* \param gridSize the cell size of the precision grid
* \return A newly allocated geometry of the union. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.9
 }
function GEOSUnionPrec(ga:PGEOSGeometry; gb:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the union of all components of a single geometry. Usually
* used to convert a collection into the smallest set of polygons
* that cover the same area.
* \param g The input geometry
* \return A newly allocated geometry of the union. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.3
 }
function GEOSUnaryUnion(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the union of all components of a single geometry. Usually
* used to convert a collection into the smallest set of polygons
* that cover the same area.
* All the vertices of the output
* geometry must fall on the grid defined by the gridSize, and the
* output will be a valid geometry.
* \param g input geometry
* \param gridSize the cell size of the precision grid
* \return A newly allocated geometry of the union. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
*
* \since 3.9
 }
function GEOSUnaryUnionPrec(g:PGEOSGeometry; gridSize:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Optimized union algorithm for inputs that can be divided into subsets
* that do not intersect. If there is only one such subset, performance
* can be expected to be worse than GEOSUnionaryUnion.
* \param g The input geometry
* \return A newly allocated geometry of the union, or NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.12
 }
function GEOSDisjointSubsetUnion(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Intersection optimized for a rectangular clipping polygon.
* Supposed to be faster than using GEOSIntersection(). Not
* guaranteed to return valid results.
* \param g The input geometry to be clipped
* \param xmin Left bound of clipping rectangle
* \param ymin Lower bound of clipping rectangle
* \param xmax Right bound of clipping rectangle
* \param ymax Upper bound of clipping rectangle
* \return The clipped geometry or NULL on exception
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::intersection::RectangleIntersection
*
* \since 3.5
 }
function GEOSClipByRect(g:PGEOSGeometry; xmin:double; ymin:double; xmax:double; ymax:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Find paths shared between the two given lineal geometries.
*
* Returns a GeometryCollection having two elements:
*
* - first element is a MultiLineString containing shared paths
*   having the _same_ direction on both inputs
* - second element is a MultiLineString containing shared paths
*   having the _opposite_ direction on the two inputs
*
* \param g1 An input geometry
* \param g2 An input geometry
* \return The shared paths
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::sharedpaths::SharedPathsOp
*
* \since 3.3
 }
function GEOSSharedPaths(g1:PGEOSGeometry; g2:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ========== Buffer related functions ==========  }
{* @name Buffer and Offset Curves
* Functions for creating distance-based buffers and offset curves.
 }
{/@ }
{*
* Buffer a geometry.
* \param g The input geometry to be buffered.
* \param width The distance by which to expand the geometry (or contract)
*        if the value is negative.
* \param quadsegs The number of segments per quadrant to generate. More
*        segments provides a more "precise" buffer at the expense of size.
* \return A \ref GEOSGeometry of the buffered result.
* NULL on exception. Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSBuffer(g:PGEOSGeometry; width:double; quadsegs:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Create a default GEOSBufferParams object for controlling the shape
* of buffered generated by \ref GEOSBuffer.
* \return A newly allocated GEOSBufferParams. NULL on exception.
* Caller is responsible for freeing with GEOSBufferParams_destroy().
*
* \since 3.3
 }
function GEOSBufferParams_create:PGEOSBufferParams;cdecl;external libgeos_c;
{*
* Destroy a GEOSBufferParams and free all associated memory.
* \param parms The object to destroy.
*
* \since 3.3
 }
procedure GEOSBufferParams_destroy(parms:PGEOSBufferParams);cdecl;external libgeos_c;
{*
* Set the end cap type of a GEOSBufferParams to the desired style,
* which must be one enumerated in \ref GEOSBufCapStyles.
* \return 0 on exception, 1 on success.
*
* \since 3.3
 }
function GEOSBufferParams_setEndCapStyle(p:PGEOSBufferParams; style:longint):longint;cdecl;external libgeos_c;
{*
* Set the join type of a GEOSBufferParams to the desired style,
* which must be one enumerated in \ref GEOSBufJoinStyles.
* \return 0 on exception, 1 on success.
*
* \since 3.3
 }
function GEOSBufferParams_setJoinStyle(p:PGEOSBufferParams; joinStyle:longint):longint;cdecl;external libgeos_c;
{*
* Set the mitre limit of a GEOSBufferParams to the desired size.
* For acute angles, a mitre join can extend very very far from
* the input geometry, which is probably not desired. The
* mitre limit places an upper bound on that.
* \param p The GEOSBufferParams to operate on
* \param mitreLimit The limit to set
* \return 0 on exception, 1 on success.
*
* \since 3.3
 }
function GEOSBufferParams_setMitreLimit(p:PGEOSBufferParams; mitreLimit:double):longint;cdecl;external libgeos_c;
{*
* Set the number of segments to use to stroke each quadrant
* of circular arcs generated by the buffering process. More
* segments means a smoother output, but with larger size.
* \param p The GEOSBufferParams to operate on
* \param quadSegs Number of segments per quadrant
* \return 0 on exception, 1 on success.
*
* \since 3.3
 }
function GEOSBufferParams_setQuadrantSegments(p:PGEOSBufferParams; quadSegs:longint):longint;cdecl;external libgeos_c;
{*
* Sets whether the computed buffer should be single-sided.
* A single-sided buffer is constructed on only one side of each input line.
* \see geos::operation::buffer::BufferParameters::setSingleSided
* \param p The GEOSBufferParams to operate on
* \param singleSided Set to 1 for single-sided output 0 otherwise
* \return 0 on exception, 1 on success.
*
* \since 3.3
 }
function GEOSBufferParams_setSingleSided(p:PGEOSBufferParams; singleSided:longint):longint;cdecl;external libgeos_c;
{*
* Generates a buffer using the special parameters in the GEOSBufferParams
* \param g The geometry to buffer
* \param p The parameters to apply to the buffer process
* \param width The buffer distance
* \return The buffered geometry, or NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSBufferWithParams(g:PGEOSGeometry; p:PGEOSBufferParams; width:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Generate a buffer using the provided style parameters.
* \param g The geometry to buffer
* \param width Width of the buffer
* \param quadsegs Number of segments per quadrant
* \param endCapStyle See \ref GEOSBufCapStyles
* \param joinStyle See \ref GEOSBufJoinStyles
* \param mitreLimit See GEOSBufferParams_setMitreLimit
* \return The buffered geometry, or NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.2
 }
function GEOSBufferWithStyle(g:PGEOSGeometry; width:double; quadsegs:longint; endCapStyle:longint; joinStyle:longint; 
           mitreLimit:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Generates offset curve line(s) for a geometry.
* Handles all geometry types as input.
*
* - For a LineString the result is a LineString.
* - For a Point the result is an empty LineString.
* - For a Polygon the result is the boundary lines(s) of the polygon buffered to the offset distance
*   (which may be a MultiLineString).
* - For a collection the result is a collection of the element offset curves.
* \param g The linear geometry to offset from
* \param width Distance to offset from the curve.
*        Negative for a right-side offset.
*        Positive for a left-side offset.
* \param quadsegs Number of segments per quadrant
* \param joinStyle See \ref GEOSBufJoinStyles
* \param mitreLimit See GEOSBufferParams_setMitreLimit
* \return The offset geometry. Returns NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::buffer::BufferBuilder::bufferLineSingleSided
*
* \since 3.3
 }
function GEOSOffsetCurve(g:PGEOSGeometry; width:double; quadsegs:longint; joinStyle:longint; mitreLimit:double):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ======================================================================  }
{* @name Coverages
* Functions to work with coverages represented by lists of polygons
* that exactly share edge geometry.
 }
{/@ }
{*
* Optimized union algorithm for polygonal inputs that are correctly
* noded and do not overlap. It may generate an error (return NULL)
* for inputs that do not satisfy this constraint, however this is not
* guaranteed.
* \param g The input geometry
* \return A geometry that covers all the points of the input geometry.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.8
 }
function GEOSCoverageUnion(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Analyze a coverage (represented as a collection of polygonal geometry
* with exactly matching edge geometry) to find places where the
* assumption of exactly matching edges is not met.
*
* \param input The polygonal coverage to access,
*        stored in a geometry collection. All members must be POLYGON
*        or MULTIPOLYGON.
* \param gapWidth The maximum width of gaps to detect.
* \param invalidEdges When there are invalidities in the coverage,
*        this pointer
*        will be set with a geometry collection of the same length as
*        the input, with a MULTILINESTRING of the error edges for each
*        invalid polygon, or an EMPTY where the polygon is a valid
*        participant in the coverage. Pass NULL if you do not want
*        the invalid edges returned.
* \return A value of 1 for a valid coverage, 0 for invalid and 2 for
*         an exception or error. Invalidity includes polygons that overlap,
*         that have gaps smaller than the gapWidth, or non-polygonal
*         entries in the input collection.
*
* \since 3.12
 }
function GEOSCoverageIsValid(input:PGEOSGeometry; gapWidth:double; invalidEdges:PPGEOSGeometry):longint;cdecl;external libgeos_c;
{*
* Operates on a coverage (represented as a list of polygonal geometry
* with exactly matching edge geometry) to apply a Visvalingam–Whyatt
* simplification to the edges, reducing complexity in proportion with
* the provided tolerance, while retaining a valid coverage (no edges
* will cross or touch after the simplification).
* Geometries never disappear, but they may be simplified down to just
* a triangle. Also, some invalid geoms (such as Polygons which have too
* few non-repeated points) will be returned unchanged.
* If the input dataset is not a valid coverage due to overlaps,
* it will still be simplified, but invalid topology such as crossing
* edges will still be invalid.
*
* \param input The polygonal coverage to access,
*        stored in a geometry collection. All members must be POLYGON
*        or MULTIPOLYGON.
* \param tolerance A tolerance parameter in linear units.
* \param preserveBoundary Use 1 to preserve the outside edges
*        of the coverage without simplification,
*        0 to allow them to be simplified.
* \return A collection containing the simplified geometries, or null
*         on error.
*
* \since 3.12
 }
function GEOSCoverageSimplifyVW(input:PGEOSGeometry; tolerance:double; preserveBoundary:longint):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ========== Construction Operations ==========  }
{* @name Geometric Constructions
* Functions for computing geometric constructions.
 }
{/@ }
{*
* Returns minimum rectangular polygon or point that contains the geometry,
* or an empty point for empty inputs.
* \param g The geometry to calculate an envelope for
* \return A newly allocated polygonal envelope or point. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSEnvelope(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the "boundary" of a geometry, as defined by the DE9IM:
*
* - the boundary of a polygon is the linear rings dividing the exterior
*   from the interior
* - the boundary of a linestring is the end points
* - the boundary of a point is the point
*
* \param g The input geometry
* \return A newly allocated geometry of the boundary. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \since 2.2
 }
function GEOSBoundary(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns convex hull of a geometry. The smallest convex Geometry
* that contains all the points in the input Geometry
* \param g The input geometry
* \return A newly allocated geometry of the convex hull. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::overlayng::OverlayNG
* \since 2.2
 }
function GEOSConvexHull(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a "concave hull" of a geometry. A concave hull is
* a polygon which contains all the
* points of the input, but is a better approximation than the convex hull
* to the area occupied by the input.
* Frequently used to convert a multi-point into a polygonal area.
* that contains all the points in the input Geometry.
*
* A set of points has a sequence of hulls of increasing concaveness,
* determined by a numeric target parameter.
* The concave hull is constructed by removing the longest outer edges
* of the Delaunay Triangulation of the space between the polygons,
* until the target criterion parameter is reached.
* This can be expressed as a ratio between the lengths of the longest and shortest edges.
* 1 produces the convex hull; 0 produces a hull with maximum concaveness
*
* \param g The input geometry
* \param ratio The edge length ratio value, between 0 and 1.
* \param allowHoles When non-zero, the polygonal output may contain holes.
* \return A newly allocated geometry of the concave hull. NULL on exception.
*
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \see geos::algorithm::hull::ConcaveHull
* \see GEOSConcaveHullByLength
* \see GEOSConcaveHullOfPolygons
* \see GEOSConvexHull
*
* \since 3.11
 }
function GEOSConcaveHull(g:PGEOSGeometry; ratio:double; allowHoles:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a "concave hull" of a geometry. A concave hull is
* a polygon which contains all the
* points of the input, but is a better approximation than the convex hull
* to the area occupied by the input.
* Frequently used to convert a multi-point into a polygonal area.
* that contains all the points in the input Geometry.
*
* A set of points has a sequence of hulls of increasing concaveness,
* determined by a numeric target parameter.
* The concave hull is constructed by removing the longest outer edges
* of the Delaunay Triangulation of the space between the polygons,
* until the specified maximm edge length is reached.
* A large value produces the convex hull, 0 produces the hull of maximim concaveness.
*
* \param g The input geometry
* \param length The maximum edge length (0 or greater)
* \param allowHoles When non-zero, the polygonal output may contain holes.
* \return A newly allocated geometry of the concave hull. NULL on exception.
*
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \see geos::algorithm::hull::ConcaveHull
* \see GEOSConcaveHull
* \see GEOSConcaveHullOfPolygons
* \see GEOSConvexHull
*
* \since 3.12
 }
function GEOSConcaveHullByLength(g:PGEOSGeometry; length:double; allowHoles:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Constructs a concave hull of a set of polygons, respecting
* the polygons as constraints.
*
* A concave hull is a (possibly) non-convex polygon containing all the input polygons.
* The computed hull "fills the gap" between the polygons,
* and does not intersect their interior.
* A set of polygons has a sequence of hulls of increasing concaveness,
* determined by a numeric target parameter.
*
* The concave hull is constructed by removing the longest outer edges
* of the Delaunay Triangulation of the space between the polygons,
* until the target criterion parameter is reached.
* The "Maximum Edge Length" parameter limits the length of the longest edge between polygons to be no larger than this value.
* This can be expressed as a ratio between the lengths of the longest and shortest edges.
*
* The input polygons *must* be a *valid* MultiPolygon
* (i.e. they must be non-overlapping).
*
* \param g the valid MultiPolygon geometry to process
* \param lengthRatio specifies the Maximum Edge Length as a
*        fraction of the difference between the longest and
*        shortest edge lengths between the polygons.
*        This normalizes the Maximum Edge Length to be scale-free.
*        A value of 1 produces the convex hull; a value of 0 produces
*        the original polygons.
* \param isHolesAllowed is the concave hull allowed to contain holes?
* \param isTight does the hull follow the outer boundaries of the input polygons.
* \return A newly allocated geometry of the concave hull. NULL on exception.
*
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \see geos::algorithm::hull::ConcaveHullOfPolygons
* \see GEOSConcaveHull
* \see GEOSConvexHull
*
* \since 3.11
 }
function GEOSConcaveHullOfPolygons(g:PGEOSGeometry; lengthRatio:double; isTight:dword; isHolesAllowed:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Computes a boundary-respecting hull of a polygonal geometry,
* with hull shape determined by a target parameter
* specifying the fraction of the input vertices retained in the result.
* Larger values produce less concave results.
* A value of 1 produces the convex hull; a value of 0 produces the original geometry.
* An outer hull is computed if the parameter is positive,
* an inner hull is computed if it is negative.
*
* \param g the polygonal geometry to process
* \param isOuter indicates whether to compute an outer or inner hull (1 for outer hull, 0 for inner)
* \param vertexNumFraction the target fraction of the count of input vertices to retain in result
* \return A newly allocated geometry of the concave hull. NULL on exception.
*
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::simplify::PolygonHullSimplifier
*
* \since 3.11
 }
function GEOSPolygonHullSimplify(g:PGEOSGeometry; isOuter:dword; vertexNumFraction:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Controls the behavior of the GEOSPolygonHullSimplify parameter.
 }
{* Fraction of input vertices retained  }
{* Ratio of simplified hull area to input area  }
type
  TGEOSPolygonHullParameterModes =  Longint;
  Const
    GEOSHULL_PARAM_VERTEX_RATIO = 1;
    GEOSHULL_PARAM_AREA_RATIO = 2;

{*
* Computes a topology-preserving simplified hull of a polygonal geometry,
* with hull shape determined by the parameter, controlled by a parameter
* mode, which is one defined in \ref GEOSPolygonHullParameterModes.
* Larger values compute less concave results and a value of 0
* produces the original geometry.
* Either outer or inner hulls can be computed.
*
* \param g the polygonal geometry to process
* \param isOuter indicates whether to compute an outer or inner hull (1 for outer hull, 0 for inner)
* \param parameterMode the interpretation to apply to the parameter argument; see \ref GEOSPolygonHullParameterModes
* \param parameter the target ratio of area difference to original area
* \return A newly allocated geometry of the concave hull. NULL on exception.
*
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::simplify::PolygonHullSimplifier
* \see GEOSPolygonHullParameterModes
* \see GEOSPolygonHullSimplify
*
* \since 3.11
 }

function GEOSPolygonHullSimplifyMode(g:PGEOSGeometry; isOuter:dword; parameterMode:dword; parameter:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the minimum rotated rectangular POLYGON which encloses
* the input geometry. The rectangle has width equal to the
* minimum diameter, and a longer length. If the convex hill of
* the input is degenerate (a line or point) a linestring or point
* is returned. The minimum rotated rectangle can be used as an
* extremely generalized representation for the given geometry.
* \param g The input geometry
* \return A newly allocated geometry of the rotated envelope. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.6
 }
function GEOSMinimumRotatedRectangle(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Constructs the "maximum inscribed circle" (MIC) for a polygonal geometry,
* up to a specified tolerance.
* The MIC is determined by a point in the interior of the area
* which has the farthest distance from the area boundary, along with a boundary point at that distance.
* In the context of geography the center of the MIC is known as the
* "pole of inaccessibility". A cartographic use case is to determine a suitable point
* to place a map label within a polygon.
* The radius length of the MIC is a  measure of how "narrow" a polygon is. It is the
* distance at which the negative buffer becomes empty.
* The class supports polygons with holes and multipolygons.
* The implementation uses a successive-approximation technique over a grid of square cells covering the area geometry.
* The grid is refined using a branch-and-bound algorithm. Point containment and distance are computed in a performant
* way by using spatial indexes.
* Returns a two-point linestring, with one point at the center of the inscribed circle and the other
* on the boundary of the inscribed circle.
* \param g Input geometry
* \param tolerance Stop the algorithm when the search area is smaller than this tolerance
* \return A newly allocated geometry of the MIC. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::construct::MaximumInscribedCircle
*
* \since 3.9
 }
function GEOSMaximumInscribedCircle(g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Constructs the "largest empty circle" (LEC) for a set of obstacle geometries
* and within a polygonal boundary,
* with accuracy to to a specified distance tolerance.
* The obstacles are point and line geometries.
* Polygonal obstacles are treated as linear features.
* The LEC is the largest circle whose interior does not intersect with any obstacle.
* and which has its **center** inside the given boundary.
* If no boundary is provided, the
* convex hull of the obstacles is used.
* The LEC center is the point in the interior of the boundary which has the farthest distance from
* the obstacles (up to the given distance tolerance).
* The LEC is determined by the center point and a point indicating the circle radius
* (which will lie on an obstacle).
* The implementation uses a successive-approximation technique over a grid of square cells covering the obstacles and boundary.
* The grid is refined using a branch-and-bound algorithm.  Point containment and distance are computed in a performant
* way by using spatial indexes.
* Returns the LEC radius as a two-point linestring, with the start point at the center of the inscribed circle and the end
* on the boundary of the circle.
* \param obstacles The geometries that the LEC must not cross
* \param boundary The area to contain the LEC center (may be null or empty)
* \param tolerance Stop the algorithm when the search area is smaller than this tolerance
* \return A newly allocated geometry of the LEC radius. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::construct::LargestEmptyCircle
*
* \since 3.9
 }
function GEOSLargestEmptyCircle(obstacles:PGEOSGeometry; boundary:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a linestring geometry which represents the minimum diameter of the geometry.
* The minimum diameter is defined to be the width of the smallest band that
* contains the geometry, where a band is a strip of the plane defined
* by two parallel lines. This can be thought of as the smallest hole that the geometry
* can be moved through, with a single rotation.
* \param g The input geometry
* \return A newly allocated geometry of the LEC. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::MinimumDiameter
*
* \since 3.6
 }
function GEOSMinimumWidth(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a point that is inside the boundary of a polygonal geometry.
* \param g The input geometry
* \return A point that is inside the input
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::InteriorPointArea
*
* \since 2.2
 }
function GEOSPointOnSurface(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a point at the center of mass of the input.
* \param g The input geometry
* \return A point at the center of mass of the input
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::Centroid
*
* \since 2.2
 }
function GEOSGetCentroid(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns a geometry which represents the "minimum bounding circle",
* the smallest circle that contains the input.
* \param[in] g The input geometry
* \param[out] radius Pointer will be filled with output radius.
* \param[out] center Pointer will be filled with output circle center. Caller must free.
* \return The circle geometry or NULL on exception
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::algorithm::MinimumBoundingCircle::getCircle
*
* \since 3.8
 }
function GEOSMinimumBoundingCircle(g:PGEOSGeometry; radius:Pdouble; center:PPGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Return a Delaunay triangulation of the vertices of the given geometry.
*
* \param g the input geometry whose vertices will be used as "sites"
* \param tolerance optional snapping tolerance to use for improved robustness
* \param onlyEdges if non-zero will return a MultiLineString, otherwise it will
*                  return a GeometryCollection containing triangular Polygons.
*
* \return A newly allocated geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.4
 }
function GEOSDelaunayTriangulation(g:PGEOSGeometry; tolerance:double; onlyEdges:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Return a constrained Delaunay triangulation of the vertices of the
* given polygon(s).
* For non-polygonal inputs, returns an empty geometry collection.
*
* \param g the input geometry whose rings will be used as input
* \return A newly allocated geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.10
 }
function GEOSConstrainedDelaunayTriangulation(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{* Change behaviour of \ref GEOSVoronoiDiagram  }
{* Return only edges of the Voronoi cells, as a MultiLineString * }
{* Preserve order of inputs, such that the nth cell in the result corresponds
     *  to the nth vertex in the input. If this cannot be done, such as for inputs
     *  that contain repeated points, \ref GEOSVoronoiDiagram will return NULL. * }
type
  TGEOSVoronoiFlags =  Longint;
  Const
    GEOS_VORONOI_ONLY_EDGES = 1;
    GEOS_VORONOI_PRESERVE_ORDER = 2;

{*
* Returns the Voronoi polygons or edges of the vertices of the given geometry.
*
* \param g the input geometry whose vertices will be used as sites.
* \param tolerance snapping tolerance to use for improved robustness. A
                   tolerance of 0.0 specifies that no snapping will take
                   place. This argument can be finicky and is known to cause
                   the algorithm to fail in several cases. If you're using
                   tolerance and getting a failure, try setting it to 0.0.
* \param flags A value from the \ref GEOSVoronoiFlags enum
* \param env clipping envelope for the returned diagram, automatically
*            determined if env is NULL.
*            The diagram will be clipped to the larger
*            of this envelope or an envelope surrounding the sites.
*
* \return A newly allocated geometry. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.5
 }

function GEOSVoronoiDiagram(g:PGEOSGeometry; env:PGEOSGeometry; tolerance:double; flags:longint):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ==============================================================  }
{* @name Noding and Polygonization
* Functions computing noding of lines, and forming noded lines into polygons.
 }
{/@ }
{*
* For linear inputs, returns a new geometry in which no lines cross
* each other, and all touching occurs at end points.
* \param g The input geometry
* \return The noded geometry or NULL on exception
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::noding::GeometryNoder::node
*
* \since 3.4
 }
function GEOSNode(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Polygonizes a set of Geometries which contain linework that
* represents the edges of a planar graph.
*
* All types of Geometry are accepted as input; the constituent
* linework is extracted as the edges to be polygonized.
*
* The edges must be correctly noded; that is, they must only meet
* at their endpoints and not overlap anywhere. If your edges are not
* already noded, run them through GEOSUnaryUnion() first.
* Polygonization will accept incorrectly noded
* input but will not form polygons from non-noded edges, and reports
* them as errors.
*
* The Polygonizer reports the following kinds of errors:
*
* - Dangles - edges which have one or both ends which are
*   not incident on another edge endpoint
* - Cut Edges - edges which are connected at both ends but
*   which do not form part of a polygon
* - Invalid Ring Lines - edges which form rings which are invalid
*   (e.g. the component lines contain a self-intersection)
*
* Errors are reported to output parameters "cuts", "dangles" and
* "invalid" (if not-null). Formed polygons are returned as a
* collection. NULL is returned on exception. All returned
* geometries must be destroyed by caller.
*
* The GEOSPolygonize_valid() variant allows extracting only polygons
* which form a valid polygonal result. The set of extracted polygons
* is guaranteed to be edge-disjoint. This is useful when it is known
* that the input lines form a valid polygonal geometry (which may
* include holes or nested polygons).
*
* \param geoms Array of linear geometries to polygons. Caller retains ownersihp of both array container and objects.
* \param ngeoms Size of the geoms array.
* \return The polygonal output geometry.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::polygonize::Polygonizer
*
* \since 2.2
 }
function GEOSPolygonize(geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Has the same polygonizing behavior as GEOSPolygonize(), 
* but returns a result which is a valid polygonal geometry.
* The result will not contain any edge-adjacent elements. 
*
* \param geoms Array of linear geometries to polygons. Caller retains ownersihp of both array container and objects.
* \param ngeoms Size of the geoms array.
* \return The polygonal output geometry.
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::polygonize::Polygonizer
* \see GEOSBuildArea()
*
* \since 3.8
 }
function GEOSPolygonize_valid(geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Perform the polygonization as GEOSPolygonize() but return only the
* "cut edges", the linear features that are connected at both ends,
* do *not* participate in the final polygon.
*
* \param geoms Array of linear geometries to polygons. Caller retains ownersihp of both array container and objects.
* \param ngeoms Size of the geoms array.
* \return The "cut edges"
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::polygonize::Polygonizer
*
* \since 3.1
 }
function GEOSPolygonizer_getCutEdges(geoms:PPGEOSGeometry; ngeoms:dword):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Perform the polygonization as GEOSPolygonize() and return the
* polygonal result as well as all extra ouputs.
*
* \param[in] input A single geometry with all the input lines to polygonize.
* \param[out] cuts Pointer to hold "cut edges", connected on both ends but not part of output. Caller must free.
* \param[out] dangles Pointer to hold "dangles", connected one end but not part of output. Caller must free.
* \param[out] invalid Pointer to hold invalid outputs, polygons formed but not valid. Caller must free.
* \return The polygonal valid output
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::polygonize::Polygonizer
*
* \since 3.3
 }
function GEOSPolygonize_full(input:PGEOSGeometry; cuts:PPGEOSGeometry; dangles:PPGEOSGeometry; invalid:PPGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Perform a polygonization using all the linework, assuming that
* rings contained within rings are empty holes, rather then
* extra polygons.
* \param g The input linework
* \return The polygonal output
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::polygonize::BuildArea
*
* \since 3.8
 }
function GEOSBuildArea(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ==============================================================  }
{* @name Processing
* Functions performing various geometric processes.
 }
{/@ }
{*
* Densifies a geometry using a given distance tolerance.
* Additional vertices will be added to every line segment
* that is greater this tolerance; these vertices will
* evenly subdivide that segment.
* Only linear components of input geometry are densified.
* \param g The geometry to densify
* \param tolerance the distance tolerance to densify
* \return The densified geometry, or NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.10
 }
function GEOSDensify(g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Sews together a set of fully noded LineStrings
* removing any cardinality 2 nodes in the linework.
* \param g The input linework
* \return The merged linework
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::linemerge::LineMerger
* \since 2.2
 }
function GEOSLineMerge(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Sews together a set of fully noded LineStrings
* removing any cardinality 2 nodes in the linework
* only if possible without changing order of points.
* \param g The input linework
* \return The merged linework
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::operation::linemerge::LineMerger
*
* \since 3.11
 }
function GEOSLineMergeDirected(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
 *  Computes the line which is the section of the input LineString starting and
 *  ending at the given length fractions.
 *  \param g The input LineString
 *  \param start_fraction start fraction (0-1) along the length of g
 *  \param end_fraction end fraction (0-1) along the length of g
 *  \return selected substring.
 *  Caller is responsible for freeing with GEOSGeom_destroy()
 *
 *  \since 3.12
  }
function GEOSLineSubstring(g:PGEOSGeometry; start_fraction:double; end_fraction:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* For geometries with coordinate sequences, reverses the order
* of the sequences. Converts CCW rings to CW. Reverses direction
* of LineStrings.
* \param g The input geometry
* \return The reversed geometry
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.7
 }
function GEOSReverse(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Apply the
* [Douglas/Peucker algorithm](https://en.wikipedia.org/wiki/Ramer–Douglas–Peucker_algorithm)
* to the coordinate sequences of the input geometry.
* Removes "unnecessary" vertices, vertices
* that are co-linear within the tolerance distance.
* \param g The input geometry
* \param tolerance The tolerance to apply. Larger tolerance leads to simpler output.
* \return The simplified geometry
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::simplify::DouglasPeuckerSimplifier
*
* \since 3.0
 }
function GEOSSimplify(g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Apply the
* [Douglas/Peucker algorithm](https://en.wikipedia.org/wiki/Ramer–Douglas–Peucker_algorithm)
* to the coordinate sequences of the input geometry.
* Removes "unnecessary" vertices, vertices
* that are co-linear within the tolerance distance.
* Returns a valid output geometry, checking for collapses, ring-intersections, etc
* and attempting to avoid. More computationally expensive than GEOSSimplify()
* \param g The input geometry
* \param tolerance The tolerance to apply. Larger tolerance leads to simpler output.
* \return The simplified geometry
* Caller is responsible for freeing with GEOSGeom_destroy().
* \see geos::simplify::DouglasPeuckerSimplifier
*
* \since 3.0
 }
function GEOSTopologyPreserveSimplify(g:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Return all distinct vertices of input geometry as a MultiPoint.
* Note that only 2 dimensions of the vertices are considered when
* testing for equality.
* \param g The input geometry
* \return The distinct points
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSGeom_extractUniquePoints(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Calculate the
* [Hilbert code](https://en.wikipedia.org/wiki/Hilbert_curve)
* of the centroid of a geometry relative to an extent.
* This allows sorting geometries in a deterministic way, such that similar Hilbert codes are
* likely to be near each other in two-dimensional space.
* The caller must ensure that the geometry is contained within the extent.
* \param[in] geom Input geometry, must be non-empty
* \param[in] extent Extent within which to calculate the Hilbert code for geom
* \param[in] level The level of precision of the Hilbert curve, up to 16
* \param[out] code Pointer to be filled in with Hilbert code result
* \return 1 on success, 0 on exception.
*
* \since 3.11
 }
function GEOSHilbertCode(geom:PGEOSGeometry; extent:PGEOSGeometry; level:dword; code:Pdword):longint;cdecl;external libgeos_c;
{*
* Apply XY coordinate transform callback to all coordinates in a copy of
* input geometry.  If the callback returns an error, returned geometry will be
* NULL.  Z values, if present, are not modified by this function.
* \param[in] g Input geometry
* \param[in] callback a function to be executed for each coordinate in the
                geometry.  The callback takes 3 parameters: x and y coordinate
                values to be updated and a void userdata pointer.
* \param userdata an optional pointer to pe passed to 'callback' as an argument
* \return a copy of the input geometry with transformed coordinates.
* Caller must free with GEOSGeom_destroy().
*
* \since 3.11
 }
function GEOSGeom_transformXY(g:PGEOSGeometry; callback:TGEOSTransformXYCallback; userdata:pointer):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Snaps the vertices and segments of the first geometry to vertices of the
* second geometry within the given tolerance.
*
* Where possible, this operation tries to avoid creating invalid geometries;
* however, it does not guarantee that output geometries will be valid.  It is
* the responsibility of the caller to check for and handle invalid geometries.
*
* Because too much snapping can result in invalid
* topology being created, heuristics are used to determine the number and
* location of snapped vertices that are likely safe to snap. These heuristics
* may omit some potential snaps that are otherwise within the tolerance.
*
* \param input An input geometry
* \param snap_target A geometry to snap the input to
* \param tolerance Snapping tolerance
* \return The snapped verion of the input. NULL on exception.
* Caller is responsible for freeing with GEOSGeom_destroy().
*
* \since 3.3
 }
function GEOSSnap(input:PGEOSGeometry; snap_target:PGEOSGeometry; tolerance:double):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Change the coordinate precision of a geometry. This will
* affect the precision of the existing geometry as well as
* any geometries derived from this geometry using overlay
* functions. The output will be a valid \ref GEOSGeometry.
*
* Note that operations will always be performed in the precision
* of the geometry with higher precision (smaller "gridSize").
* That same precision will be attached to the operation outputs.
*
* In the Default and GEOS_PREC_KEEP_COLLAPSED modes invalid input
* may cause an error to occur, unless the invalidity is below
* the scale of the requested precision
*
* There are only 3 modes. The GEOS_PREC_NO_TOPO mode
* takes precedence over GEOS_PREC_KEEP_COLLAPSED.
* So the combination GEOS_PREC_NO_TOPO || GEOS_PREC_KEEP_COLLAPSED
* has the same semantics as GEOS_PREC_NO_TOPO
*
* \param g Input geometry
* \param gridSize cell size of grid to round coordinates to,
*        or 0 for FLOATING precision
* \param flags The bitwise OR of members of the \ref GEOSPrecisionRules enum
* \return The precision reduced result.
*         Caller must free with GEOSGeom_destroy()
*         NULL on exception.
*
* \since 3.6
 }
function GEOSGeom_setPrecision(g:PGEOSGeometry; gridSize:double; flags:longint):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ==============================================================  }
{* @name Spatial Predicates
* Functions computing binary spatial predicates using the DE-9IM topology model.
 }
{/@ }
{*
* True if no point of either geometry touchess or is within the other.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::disjoint
* \since 2.2
 }
function GEOSDisjoint(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometries share boundaries at one or more points, but do
* not have interior overlaps.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::touches
* \since 2.2
 }
function GEOSTouches(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometries are not disjoint.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::intersects
* \since 2.2
 }
function GEOSIntersects(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometries interiors interact but their boundaries do not.
* Most useful for finding line crosses cases.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::crosses
* \since 2.2
 }
function GEOSCrosses(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometry g1 is completely within g2, and not
* touching the boundary of g2.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::within
* \since 2.2
 }
function GEOSWithin(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometry g2 is completely within g1.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::contains
* \since 2.2
 }
function GEOSContains(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometries share interiors but are neither
* within nor contained.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::overlaps
* \since 2.2
 }
function GEOSOverlaps(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometries cover the same space on the plane.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::equals
* \since 2.2
 }
function GEOSEquals(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometry g1 is completely within g2, including possibly
* touching the boundary of g2.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::covers
*
* \since 3.3
 }
function GEOSCovers(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* True if geometry g2 is completely within g1, including possibly
* touching the boundary of g1.
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
* \see geos::geom::Geometry::coveredBy
*
* \since 3.3
 }
function GEOSCoveredBy(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Determine pointwise equivalence of two geometries, by
* checking that they have identical structure
* and that each vertex of g2 is
* within the distance tolerance of the corresponding vertex in g1.
* Z and M values are ignored by GEOSEqualsExact, and this function may return true
* for inputs with different dimensionality.
* Unlike GEOSEquals(), geometries that are topologically equivalent but have different
* representations (e.g., LINESTRING (0 0, 1 1) and MULTILINESTRING ((0 0, 1 1)) ) are not
* considered equal by GEOSEqualsExact().
* \param g1 Input geometry
* \param g2 Input geometry
* \param tolerance Tolerance to determine vertex equality
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSNormalize()
* \since 3.0
 }
function GEOSEqualsExact(g1:PGEOSGeometry; g2:PGEOSGeometry; tolerance:double):char;cdecl;external libgeos_c;
{*
 * Determine pointwise equivalence of two geometries by checking
 * that the structure, ordering, and values of all vertices are
 * identical in all dimensions. NaN values are considered to be
 * equal to other NaN values.
 *
* \param g1 Input geometry
* \param g2 Input geometry
* \returns 1 on true, 0 on false, 2 on exception
*
* \since 3.12
 }
function GEOSEqualsIdentical(g1:PGEOSGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Calculate the DE9IM pattern for this geometry pair
* and compare against the provided pattern to check for
* consistency. If the result and pattern are consistent
* return true. The pattern may include glob "*" characters
* for portions that are allowed to match any value.
* \see geos::geom::Geometry::relate
* \param g1 First geometry in pair
* \param g2 Second geometry in pair
* \param pat DE9IM pattern to check
* \return 1 on true, 0 on false, 2 on exception
* \since 2.2
 }
function GEOSRelatePattern(g1:PGEOSGeometry; g2:PGEOSGeometry; pat:Pchar):char;cdecl;external libgeos_c;
{*
* Calculate and return the DE9IM pattern for this geometry pair.
* \see geos::geom::Geometry::relate
* \param g1 First geometry in pair
* \param g2 Second geometry in pair
* \return DE9IM string. Caller is responsible for freeing with GEOSFree().
*         NULL on exception
* \since 2.2
 }
function GEOSRelate(g1:PGEOSGeometry; g2:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* Compare two DE9IM patterns and return true if they
* are consistent.
* \param mat Complete DE9IM string (does not have "*")
* \param pat Pattern to match to (may contain "*")
* \return 1 on true, 0 on false, 2 on exception
*
* \since 3.3
 }
function GEOSRelatePatternMatch(mat:Pchar; pat:Pchar):char;cdecl;external libgeos_c;
{*
* Calculate and return the DE9IM pattern for this geometry pair.
* Apply the supplied \ref GEOSRelateBoundaryNodeRules.
* \see geos::geom::Geometry::relate
* \see geos::algorithm::BoundaryNodeRule
* \param g1 First geometry in pair
* \param g2 Second geometry in pair
* \param bnr A member of the \ref GEOSRelateBoundaryNodeRules enum
* \return DE9IM string. Caller is responsible for freeing with GEOSFree().
*         NULL on exception
*
* \since 3.3
 }
function GEOSRelateBoundaryNodeRule(g1:PGEOSGeometry; g2:PGEOSGeometry; bnr:longint):Pchar;cdecl;external libgeos_c;
{/@ }
{ ========== Prepared Geometry Binary predicates ==========  }
{* @name Prepared Geometry
* A \ref GEOSPreparedGeometry is a wrapper around \ref GEOSGeometry
* that includes spatial indexing on the edges of the geometry. This
* allows spatial predicates to evaluate much faster,
* so for cases in which the same base geometry will be used over and
* over again for predicate tests, wrapping it in a \ref GEOSPreparedGeometry
* is a best practice.
*
* Prepared Geometry supports some binary spatial predicates and distance calculations.
 }
{/@ }
{*
* Create a Prepared Geometry.
* The caller retains ownership of the base geometry, and after
* processing is complete, must free **both** the prepared and the
* base geometry. (Ideally, destroy the prepared geometry first, as
* it has an internal reference to the base geometry.)
*
* \param g The base geometry to wrap in a prepared geometry.
* \return A prepared geometry. Caller is responsible for freeing with
*         GEOSPreparedGeom_destroy()
*
* \since 3.1
 }
function GEOSPrepare(g:PGEOSGeometry):PGEOSPreparedGeometry;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSPreparedGeometry.
* Caller must separately free the base \ref GEOSGeometry used
* to create the prepared geometry.
* \param g Prepared geometry to destroy.
*
* \since 3.1
 }
procedure GEOSPreparedGeom_destroy(g:PGEOSPreparedGeometry);cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry is contained.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSContains
*
* \since 3.1
 }
function GEOSPreparedContains(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided point is contained.
* \param pg1 The prepared geometry
* \param x x coordinate of point to test
* \param y y coordinate of point to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSContains
*
* \since 3.12
 }
function GEOSPreparedContainsXY(pg1:PGEOSPreparedGeometry; x:double; y:double):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry is contained properly.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSContainsProperly
*
* \since 3.1
 }
function GEOSPreparedContainsProperly(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Using a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry is covered by.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSCoveredBy
*
* \since 3.3
 }
function GEOSPreparedCoveredBy(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Using a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry covers.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSCovers
*
* \since 3.1
 }
function GEOSPreparedCovers(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Using a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry crosses.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSCrosses
*
* \since 3.3
 }
function GEOSPreparedCrosses(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry is disjoint.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSDisjoint
*
* \since 3.3
 }
function GEOSPreparedDisjoint(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry intersects.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSIntersects
*
* \since 3.1
 }
function GEOSPreparedIntersects(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided point intersects.
* \param pg1 The prepared geometry
* \param x x coordinate of point to test
* \param y y coordinate of point to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSIntersects
*
* \since 3.12
 }
function GEOSPreparedIntersectsXY(pg1:PGEOSPreparedGeometry; x:double; y:double):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry overlaps.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSOverlaps
*
* \since 3.3
 }
function GEOSPreparedOverlaps(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry touches.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSTouches
*
* \since 3.3
 }
function GEOSPreparedTouches(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation of whether the provided geometry is within.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns 1 on true, 0 on false, 2 on exception
* \see GEOSWithin
*
* \since 3.3
 }
function GEOSPreparedWithin(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):char;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation to find the nearest points between the
* prepared and provided geometry.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \returns A coordinate sequence containing the nearest points, or NULL on exception.
*          The first point in the sequence is from the prepared geometry, and the
*          seconds is from the other argument.
*
* \since 3.9
 }
function GEOSPreparedNearestPoints(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry):PGEOSCoordSequence;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation to find the distance between the
* prepared and provided geometry. Useful for situations where
* one geometry is large and static and needs to be tested
* against a large number of other geometries.
* \param[in] pg1 The prepared geometry
* \param[in] g2 The geometry to test
* \param[out] dist Pointer to store the result in
* \return 1 on success
*
* \since 3.9
 }
function GEOSPreparedDistance(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry; dist:Pdouble):longint;cdecl;external libgeos_c;
{*
* Use a \ref GEOSPreparedGeometry do a high performance
* calculation to find whether the prepared and provided geometry
* are within the given max distance.
* Useful for situations where
* one geometry is large and static and needs to be tested
* against a large number of other geometries.
* \param pg1 The prepared geometry
* \param g2 The geometry to test
* \param dist The max distance
* \return 1 on success
*
* \since 3.10
 }
function GEOSPreparedDistanceWithin(pg1:PGEOSPreparedGeometry; g2:PGEOSGeometry; dist:double):char;cdecl;external libgeos_c;
{/@ }
{ ========== STRtree functions ==========  }
{* @name STRtree
* A \ref GEOSSTRtree is a R-tree spatial index structure for two dimensional data.
* It uses the [Sort-Tile-Recursive](https://en.wikipedia.org/wiki/R-tree) packing algorithm.
 }
{/@ }
{*
* Create a new \ref GEOSSTRtree using the Sort-Tile-Recursive algorithm
* ([STRtree](https://en.wikipedia.org/wiki/R-tree))
* for two-dimensional spatial data.
*
* \param nodeCapacity The maximum number of child nodes that a node may have.
*        The minimum recommended capacity value is 4.
*        If unsure, use a default node capacity of 10.
* \return a pointer to the created tree
*
* \since 3.2
 }
function GEOSSTRtree_create(nodeCapacity:Tsize_t):PGEOSSTRtree;cdecl;external libgeos_c;
{*
* Construct an STRtree from items that have been inserted. Once constructed,
* no more items may be inserted into the tree. Functions that require a
* constructed tree will build it automatically, so there is no need to call
* `GEOSSTRtree_build` unless it is desired to explicity construct the tree
* in a certain section of code or using a certain thread.
*
* \return 1 on success, 0 on error
*
* \since 3.12
 }
function GEOSSTRtree_build(tree:PGEOSSTRtree):longint;cdecl;external libgeos_c;
{*
* Insert an item into an \ref GEOSSTRtree
*
* \param tree the \ref GEOSSTRtree in which the item should be inserted
* \param g a GEOSGeometry whose envelope corresponds to the extent of 'item'. As of GEOS 3.9, this envelope will be
 *       copied into the tree and the caller may destroy `g` while the tree is still in use. Before GEOS 3.9, `g`
 *       must be retained until the tree is destroyed.
* \param item the item to insert into the tree
* \note The tree does **not** take ownership of the geometry or the item.
*
* \since 3.2
 }
procedure GEOSSTRtree_insert(tree:PGEOSSTRtree; g:PGEOSGeometry; item:pointer);cdecl;external libgeos_c;
{*
* Query a \ref GEOSSTRtree for items intersecting a specified envelope.
* The tree will automatically be constructed if necessary, after which
* no more items may be added.
*
* \param tree the \ref GEOSSTRtree to search
* \param g a GEOSGeomety from which a query envelope will be extracted
* \param callback a function to be executed for each item in the tree whose envelope intersects
*            the envelope of 'g'.  The callback function should take two parameters: a void
*            pointer representing the located item in the tree, and a void userdata pointer.
* \param userdata an optional pointer to pe passed to `callback` as an argument
*
* \since 3.2
 }
procedure GEOSSTRtree_query(tree:PGEOSSTRtree; g:PGEOSGeometry; callback:TGEOSQueryCallback; userdata:pointer);cdecl;external libgeos_c;
{*
* Returns the nearest item in the \ref GEOSSTRtree to the supplied geometry.
* All items in the tree MUST be of type \ref GEOSGeometry.
* If this is not the case, use GEOSSTRtree_nearest_generic() instead.
* The tree will automatically be constructed if necessary, after which
* no more items may be added.
*
* \param tree the \ref GEOSSTRtree to search
* \param geom the geometry with which the tree should be queried
* \return a const pointer to the nearest \ref GEOSGeometry in the tree to 'geom', or NULL in
*            case of exception
*
* \since 3.6
 }
function GEOSSTRtree_nearest(tree:PGEOSSTRtree; geom:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Returns the nearest item in the \ref GEOSSTRtree to the supplied item
* The tree will automatically be constructed if necessary, after which
* no more items may be added.
*
* \param tree the STRtree to search
* \param item the item with which the tree should be queried
* \param itemEnvelope a GEOSGeometry having the bounding box of 'item'
* \param distancefn a function that can compute the distance between two items
*            in the STRtree.  The function should return zero in case of error,
*            and should store the computed distance to the location pointed to by
*            the `distance` argument.  The computed distance between two items
*            must not exceed the Cartesian distance between their envelopes.
* \param userdata optional pointer to arbitrary data; will be passed to `distancefn`
*            each time it is called.
* \return a const pointer to the nearest item in the tree to `item`, or NULL in
*            case of exception
*
* \since 3.6
 }
function GEOSSTRtree_nearest_generic(tree:PGEOSSTRtree; item:pointer; itemEnvelope:PGEOSGeometry; distancefn:TGEOSDistanceCallback; userdata:pointer):pointer;cdecl;external libgeos_c;
{*
* Iterate over all items in the \ref GEOSSTRtree.
* This will not cause the tree to be constructed.
*
* \param tree the STRtree over which to iterate
* \param callback a function to be executed for each item in the tree.
* \param userdata payload to pass the callback function.
*
* \since 3.2
 }
procedure GEOSSTRtree_iterate(tree:PGEOSSTRtree; callback:TGEOSQueryCallback; userdata:pointer);cdecl;external libgeos_c;
{*
 * Removes an item from the \ref GEOSSTRtree
 * The tree will automatically be constructed if necessary, after which
 * no more items may be added.
 *
 * \param tree the STRtree from which to remove an item
 * \param g the envelope of the item to remove
 * \param item the item to remove
 * \return 0 if the item was not removed;
 *         1 if the item was removed;
 *         2 if an exception occurred
 *
 * \since 3.2
  }
function GEOSSTRtree_remove(tree:PGEOSSTRtree; g:PGEOSGeometry; item:pointer):char;cdecl;external libgeos_c;
{*
* Frees all the memory associated with a \ref GEOSSTRtree.
* Only the tree is freed. The geometries and items fed into
* GEOSSTRtree_insert() are not owned by the tree, and are
* still left to the caller to manage.
*
* \since 3.2
 }
procedure GEOSSTRtree_destroy(tree:PGEOSSTRtree);cdecl;external libgeos_c;
{/@ }
{ ========== Algorithms ======================================================  }
{* @name Geometric Algorithms
* Functions to compute basic geometric algorithms.
 }
{/@ }
{*
* Computes the coordinate where two line segments intersect, if any
*
* \param[in] ax0 x-coordinate of 1st point in 1st segment
* \param[in] ay0 y-coordinate of 1st point in 1st segment
* \param[in] ax1 x-coordinate of 2nd point in 1st segment
* \param[in] ay1 y-coordinate of 2nd point in 1st segment
* \param[in] bx0 x-coordinate of 1st point in 2nd segment
* \param[in] by0 y-coordinate of 1st point in 2nd segment
* \param[in] bx1 x-coordinate of 2nd point in 2nd segment
* \param[in] by1 y-coordinate of 2nd point in 2nd segment
* \param[out] cx x-coordinate of intersection point
* \param[out] cy y-coordinate of intersection point
*
* \return 0 on error, 1 on success, -1 if segments do not intersect
*
* \since 3.7
 }
function GEOSSegmentIntersection(ax0:double; ay0:double; ax1:double; ay1:double; bx0:double; 
           by0:double; bx1:double; by1:double; cx:Pdouble; cy:Pdouble):longint;cdecl;external libgeos_c;
{*
* For the points formed by the six input ordinates,
* walking from A to B and then to P.
* \param Ax X coordinate of A
* \param Ay Y coordinate of A
* \param Bx X coordinate of B
* \param By Y coordinate of B
* \param Px X coordinate of P
* \param Py Y coordinate of P
* \return  -1 if reaching P takes a counter-clockwise (left) turn,
*           1 if reaching P takes a clockwise (right) turn,
*           0 if P is collinear with A-B
*
* \since 3.3
 }
function GEOSOrientationIndex(Ax:double; Ay:double; Bx:double; By:double; Px:double; 
           Py:double):longint;cdecl;external libgeos_c;
{/@ }
{ ========= Reader and Writer APIs =========  }
{* @name WKT Reader and Writer
* Functions for doing WKT I/O.
 }
{/@ }
{ ========= WKT Reader =========  }
{*
* Allocate a new \ref GEOSWKTReader.
* \returns a new reader. Caller must free with GEOSWKTReader_destroy()
* \since 3.0
 }
function GEOSWKTReader_create:PGEOSWKTReader;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSWKTReader.
* \param reader The reader to destroy.
* \since 3.0
 }
procedure GEOSWKTReader_destroy(reader:PGEOSWKTReader);cdecl;external libgeos_c;
{*
* Use a reader to parse the well-known text representation of
* a geometry, and return an allocated geometry.
* \param reader A WKT reader object, caller retains ownership
* \param wkt The WKT string to parse, caller retains ownership
* \return A \ref GEOSGeometry, caller to free with GEOSGeom_destroy())
* \since 3.0
 }
function GEOSWKTReader_read(reader:PGEOSWKTReader; wkt:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Set the reader to automatically repair structural errors
* in the input (currently just unclosed rings) while reading.
* \param reader A WKT reader object, caller retains ownership
* \param doFix Set to 1 to repair, 0 for no repair (default).
*
* \since 3.11
 }
procedure GEOSWKTReader_setFixStructure(reader:PGEOSWKTReader; doFix:char);cdecl;external libgeos_c;
{ ========= WKT Writer =========  }
{*
* Allocate a new \ref GEOSWKTWriter.
* \returns a new writer. Caller must free with GEOSWKTWriter_destroy()
* \since 3.0
 }
function GEOSWKTWriter_create:PGEOSWKTWriter;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSWKTWriter.
* \param writer The writer to destroy.
* \since 3.0
 }
procedure GEOSWKTWriter_destroy(writer:PGEOSWKTWriter);cdecl;external libgeos_c;
{*
* Writes out the well-known text representation of a geometry,
* using the trim, rounding and dimension settings of the writer.
* \param writer A \ref GEOSWKTWriter.
* \param g Input geometry
* \return A newly allocated string containing the WKT output or NULL on exception.
* Caller must free with GEOSFree()
* \since 3.0
 }
function GEOSWKTWriter_write(writer:PGEOSWKTWriter; g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* Sets the number trimming option on a \ref GEOSWKTWriter.
* With trim set to 1, the writer will strip trailing 0's from
* the output coordinates. With 0, all coordinates will be
* padded with 0's out to the rounding precision.
* Default since GEOS 3.12 is with trim set to 1 for 'on'.
* \param writer A \ref GEOSWKTWriter.
* \param trim The trimming behaviour to set, 1 for 'on', 0 for 'off'
*
* \since 3.3
 }
procedure GEOSWKTWriter_setTrim(writer:PGEOSWKTWriter; trim:char);cdecl;external libgeos_c;
{*
* Sets the number places after the decimal to output in
* WKT.
* \param writer A \ref GEOSWKTWriter.
* \param precision The desired precision, default 16.
*
* \since 3.3
 }
procedure GEOSWKTWriter_setRoundingPrecision(writer:PGEOSWKTWriter; precision:longint);cdecl;external libgeos_c;
{*
* Set the output dimensionality of the writer. Either
* 2, 3, or 4 dimensions. Default since GEOS 3.12 is 4.
* \param writer A \ref GEOSWKTWriter.
* \param dim The dimensionality desired.
*
* \since 3.3
 }
procedure GEOSWKTWriter_setOutputDimension(writer:PGEOSWKTWriter; dim:longint);cdecl;external libgeos_c;
{*
* Reads the current output dimension from a \ref GEOSWKTWriter.
* \param writer A \ref GEOSWKTWriter.
* \return The current dimension.
*
* \since 3.3
 }
function GEOSWKTWriter_getOutputDimension(writer:PGEOSWKTWriter):longint;cdecl;external libgeos_c;
{*
* Sets the format for 3D outputs. The "old 3D" format does not
* include a Z dimension tag, e.g. "POINT (1 2 3)", except for XYM,
* e.g. "POINT M (1 2 3)". Geometries with XYZM coordinates do not add
* any dimensionality tags, e.g. "POINT (1 2 3 4)".
* \param writer A \ref GEOSWKTWriter.
* \param useOld3D True to use the old format, false is the default.
*
* \since 3.3
 }
procedure GEOSWKTWriter_setOld3D(writer:PGEOSWKTWriter; useOld3D:longint);cdecl;external libgeos_c;
{/@ }
{ ==============================================================================  }
{* @name WKB Reader and Writer
* Functions for doing WKB I/O.
 }
{/@ }
{ ========== WKB Reader ==========  }
{*
* Allocate a new \ref GEOSWKBReader.
* \returns a new reader. Caller must free with GEOSWKBReader_destroy()
* \since 3.0
 }
function GEOSWKBReader_create:PGEOSWKBReader;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSWKBReader.
* \param reader The reader to destroy.
* \since 3.0
 }
procedure GEOSWKBReader_destroy(reader:PGEOSWKBReader);cdecl;external libgeos_c;
{*
* Set the reader to automatically repair structural errors
* in the input (currently just unclosed rings) while reading.
* \param reader A WKB reader object, caller retains ownership
* \param doFix Set to 1 to repair, 0 for no repair (default).
*
* \since 3.11
 }
procedure GEOSWKBReader_setFixStructure(reader:PGEOSWKBReader; doFix:char);cdecl;external libgeos_c;
{*
* Read a geometry from a well-known binary buffer.
* \param reader A \ref GEOSWKBReader
* \param wkb A pointer to the buffer to read from
* \param size The number of bytes of data in the buffer
* \return A \ref GEOSGeometry built from the WKB, or NULL on exception.
* \since 3.0
 }
function GEOSWKBReader_read(reader:PGEOSWKBReader; wkb:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{*
* Read a geometry from a **hex encoded** well-known binary buffer.
* \param reader A \ref GEOSWKBReader
* \param hex A pointer to the buffer to read from
* \param size The number of bytes of data in the buffer
* \return A \ref GEOSGeometry built from the HEX WKB, or NULL on exception.
* \since 3.0
 }
function GEOSWKBReader_readHEX(reader:PGEOSWKBReader; hex:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{ ========== WKB Writer ==========  }
{*
* Allocate a new \ref GEOSWKBWriter.
* \returns a new writer. Caller must free with GEOSWKBWriter_destroy()
* \since 3.0
 }
function GEOSWKBWriter_create:PGEOSWKBWriter;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSWKBWriter.
* \param writer The writer to destroy.
* \since 3.0
 }
procedure GEOSWKBWriter_destroy(writer:PGEOSWKBWriter);cdecl;external libgeos_c;
{*
* Write out the WKB representation of a geometry.
* \param writer The \ref GEOSWKBWriter controlling the
* writing.
* \param g Geometry to convert to WKB
* \param size Pointer to write the size of the final output WKB to
* \return The WKB representation. Caller must free with GEOSFree()
* \since 3.0
 }
function GEOSWKBWriter_write(writer:PGEOSWKBWriter; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* Write out the **hex** WKB representation of a geometry.
* \param writer The \ref GEOSWKBWriter controlling the
* writing.
* \param g Geometry to convert to WKB
* \param size Pointer to write the size of the final output WKB to
* \return The HEX WKB representation. Caller must free with GEOSFree()
* \since 3.0
 }
function GEOSWKBWriter_writeHEX(writer:PGEOSWKBWriter; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* Read the current output dimension of the writer.
* Either 2, 3, or 4 dimensions.
* Return current number of dimensions.
* \param writer The writer to read from.
* \return Number of dimensions (2, 3, or 4)
* \since 3.0
 }
function GEOSWKBWriter_getOutputDimension(writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{*
* Set the output dimensionality of the writer. Either
* 2, 3, or 4 dimensions. Default since GEOS 3.12 is 4.
* \param writer The writer to read from.
* \param newDimension The dimensionality desired
* \since 3.0
 }
procedure GEOSWKBWriter_setOutputDimension(writer:PGEOSWKBWriter; newDimension:longint);cdecl;external libgeos_c;
{*
* Find whether the writer will use WKB
* [byte order](https://en.wikipedia.org/wiki/Endianness)
* that is big or little endian.
* The return value is a member of \ref GEOSWKBByteOrders.
* \param writer The writer to read byte order from
* \return The current byte order
* \since 3.0
 }
function GEOSWKBWriter_getByteOrder(writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{*
* Set the output byte order of the writer, using
* a value from \ref GEOSWKBByteOrders enum.
* \param writer The writer to set byte order on
* \param byteOrder Desired byte order
* \since 3.0
 }
procedure GEOSWKBWriter_setByteOrder(writer:PGEOSWKBWriter; byteOrder:longint);cdecl;external libgeos_c;
{*
* Find whether the writer will use
* [WKB](https://en.wikipedia.org/wiki/Well-known_text_representation_of_geometry#Well-known_binary)
* that is ISO flavor or "extended" flavor. The flavor
* determines how extra dimensionality is encoded with the
* type number, and whether SRID can be included in the WKB.
* ISO flavor does not support SRID embedding. ISO flavor
* is "more standard" for 3D output. GEOS can read both flavors.
* The return value is a member of \ref GEOSWKBFlavors.
* \param writer The writer to read flavor from
* \return The current flavor
*
* \since 3.10
 }
function GEOSWKBWriter_getFlavor(writer:PGEOSWKBWriter):longint;cdecl;external libgeos_c;
{*
* Set the output flavor of the writer, using
* a value from \ref GEOSWKBFlavors enum.
* \param writer The writer to set flavor on
* \param flavor Desired flavor
*
* \since 3.10
 }
procedure GEOSWKBWriter_setFlavor(writer:PGEOSWKBWriter; flavor:longint);cdecl;external libgeos_c;
{*
* Read the current SRID embedding value from the writer.
* \param writer The writer to check SRID value on
* \since 3.0
 }
function GEOSWKBWriter_getIncludeSRID(writer:PGEOSWKBWriter):char;cdecl;external libgeos_c;
{*
* Specify whether SRID values should be output in WKB.
* Many WKB readers do not support SRID values, use with caution.
* \param writer The writer to set SRID output on
* \param writeSRID Set to 1 to include SRID, 0 otherwise
* \since 3.0
 }
procedure GEOSWKBWriter_setIncludeSRID(writer:PGEOSWKBWriter; writeSRID:char);cdecl;external libgeos_c;
{/@ }
{ =============================================================================  }
{* @name GeoJSON Reader and Writer
* Functions for doing GeoJSON I/O.
 }
{/@ }
{ ========= GeoJSON Reader =========  }
{*
* Allocate a new \ref GEOSGeoJSONReader.
* \returns a new reader. Caller must free with GEOSGeoJSONReader_destroy()
*
* \since 3.10
 }
function GEOSGeoJSONReader_create:PGEOSGeoJSONReader;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSGeoJSONReader.
* \param reader The reader to destroy.
*
* \since 3.10
 }
procedure GEOSGeoJSONReader_destroy(reader:PGEOSGeoJSONReader);cdecl;external libgeos_c;
{*
* Use a reader to parse a GeoJSON string. A single geometry or `Feature` is
* parsed as a geometry. A  `FeatureCollection` is parsed as a
* `GeometryCollection`. Feature properties are not read.
* \param reader A GeoJSON reader object, caller retains ownership
* \param geojson The json string to parse, caller retains ownership
* \return A \ref GEOSGeometry, caller to free with GEOSGeom_destroy())
*
* \since 3.10
 }
function GEOSGeoJSONReader_readGeometry(reader:PGEOSGeoJSONReader; geojson:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{ ========= GeoJSON Writer =========  }
{*
* Allocate a new \ref GEOSGeoJSONWriter.
* \returns a new writer. Caller must free with GEOSGeoJSONWriter_destroy()
*
* \since 3.10
 }
function GEOSGeoJSONWriter_create:PGEOSGeoJSONWriter;cdecl;external libgeos_c;
{*
* Free the memory associated with a \ref GEOSGeoJSONWriter.
* \param writer The writer to destroy.
*
* \since 3.10
 }
procedure GEOSGeoJSONWriter_destroy(writer:PGEOSGeoJSONWriter);cdecl;external libgeos_c;
{*
* Write out the GeoJSON representation of a geometry. Note that writing a GeoJSON
* Feature or FeatureCollection is unsupported through the GEOS C API.
* \param writer A GeoJSON reader object, caller retains ownership.
* \param g The geometry to convert, caller retains ownership.
* \param indent The indentation used. Use -1 for no formatting.
* \return A char pointer, caller to free with GEOSFree())
*
* \since 3.10
 }
function GEOSGeoJSONWriter_writeGeometry(writer:PGEOSGeoJSONWriter; g:PGEOSGeometry; indent:longint):Pchar;cdecl;external libgeos_c;
{/@ }
{$endif}
{ #ifndef GEOS_USE_ONLY_R_API  }
{ ======================================================================  }
{ DEPRECATIONS  }
{ ======================================================================  }
{* @name DEPRECATED
* Deprecated Functions.
* See description for replacement.
 }
{/@ }
{*
* \deprecated in 3.3.0, use GEOSOffsetCurve() instead
 }

function GEOSSingleSidedBuffer(g:PGEOSGeometry; width:double; quadsegs:longint; joinStyle:longint; mitreLimit:double; 
           leftSide:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated in 3.3.0, use GEOSOffsetCurve() instead
 }
function GEOSSingleSidedBuffer_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; width:double; quadsegs:longint; joinStyle:longint; 
           mitreLimit:double; leftSide:longint):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated in 3.5.0. Use GEOS_init_r() and set the message handlers using
* GEOSContext_setNoticeHandler_r() and/or GEOSContext_setErrorHandler_r()
 }
function initGEOS_r(notice_function:TGEOSMessageHandler; error_function:TGEOSMessageHandler):TGEOSContextHandle_t;cdecl;external libgeos_c;
{*
* \deprecated in 3.5.0, replaced by GEOS_finish_r()
 }
procedure finishGEOS_r(handle:TGEOSContextHandle_t);cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKTReader and GEOSWKTReader_read_r()
 }
function GEOSGeomFromWKT_r(handle:TGEOSContextHandle_t; wkt:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKTWriter and GEOSWKTWriter_write_r()
 }
function GEOSGeomToWKT_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_getOutputDimension_r()
 }
function GEOS_getWKBOutputDims_r(handle:TGEOSContextHandle_t):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_setOutputDimension_r()
 }
function GEOS_setWKBOutputDims_r(handle:TGEOSContextHandle_t; newDims:longint):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_getByteOrder_r()
 }
function GEOS_getWKBByteOrder_r(handle:TGEOSContextHandle_t):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_setByteOrder_r()
 }
function GEOS_setWKBByteOrder_r(handle:TGEOSContextHandle_t; byteOrder:longint):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBReader and GEOSWKBReader_read_r()
 }
function GEOSGeomFromWKB_buf_r(handle:TGEOSContextHandle_t; wkb:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_write_r()
 }
function GEOSGeomToWKB_buf_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBReader and GEOSWKBReader_readHEX_r()
 }
function GEOSGeomFromHEX_buf_r(handle:TGEOSContextHandle_t; hex:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_writeHEX_r()
 }
function GEOSGeomToHEX_buf_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKTReader and GEOSWKTReader_read_r()
 }
function GEOSGeomFromWKT(wkt:Pchar):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKTWriter and GEOSWKTWriter_write()
 }
function GEOSGeomToWKT(g:PGEOSGeometry):Pchar;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOS_getWKBOutputDims()
 }
function GEOS_getWKBOutputDims:longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOS_setWKBOutputDims()
 }
function GEOS_setWKBOutputDims(newDims:longint):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_getByteOrder()
 }
function GEOS_getWKBByteOrder:longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_setByteOrder()
 }
function GEOS_setWKBByteOrder(byteOrder:longint):longint;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBReader and GEOSWKBWriter_read()
 }
function GEOSGeomFromWKB_buf(wkb:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_write()
 }
function GEOSGeomToWKB_buf(g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBReader and GEOSWKBWriter_readHEX()
 }
function GEOSGeomFromHEX_buf(hex:Pbyte; size:Tsize_t):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated use \ref GEOSWKBWriter and GEOSWKBWriter_writeHEX()
 }
function GEOSGeomToHEX_buf(g:PGEOSGeometry; size:Psize_t):Pbyte;cdecl;external libgeos_c;
{*
* \deprecated in 3.3.0: use GEOSUnaryUnion() instead
 }
function GEOSUnionCascaded(g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{*
* \deprecated in 3.3.0: use GEOSUnaryUnion_r() instead
 }
function GEOSUnionCascaded_r(handle:TGEOSContextHandle_t; g:PGEOSGeometry):PGEOSGeometry;cdecl;external libgeos_c;
{/@ }
{ ======================================================================  }
{ END DEPRECATIONS  }
{ ======================================================================  }
{$endif}
{ #ifndef GEOS_C_H_INCLUDED  }

// === Konventiert am: 23-1-26 16:51:41 ===


implementation



end.
