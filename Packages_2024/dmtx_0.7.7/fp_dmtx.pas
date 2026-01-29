unit fp_dmtx;

interface

const
  {$IFDEF Linux}
  libdmtx = 'dmtx';
  {$ENDIF}

  {$IFDEF Windows}
  libdmtx = 'libdmtx.dll';
  {$ENDIF}

type
  {$IFDEF Linux}
  Tclong = int64;
  Tculong = uint64;
  {$ENDIF}

  {$IFDEF Windows}
  Tclong = int32;
  Tculong = uint32;
  {$ENDIF}
  Pculong = ^Tculong;
  Pclong = ^Tclong;

  Tsize_t = SizeUInt;
  Ttime_t = uint64;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  M_PI = 3.14159265358979323846;
  M_PI_2 = 1.57079632679489661923;

type
  TDmtxPassFail = dword;
  PDmtxPassFail = ^TDmtxPassFail;
  TDmtxBoolean = dword;

const
  DmtxVersion_ = '0.7.5';
  DmtxUndefined = -(1);
  DmtxPass = 1;
  DmtxFail = 0;
  DmtxTrue = 1;
  DmtxFalse = 0;
  DmtxFormatMatrix = 0;
  DmtxFormatMosaic = 1;
  DmtxSymbolSquareCount = 24;
  DmtxSymbolRectCount = 6;
  DmtxModuleOff = $00;
  DmtxModuleOnRed = $01;
  DmtxModuleOnGreen = $02;
  DmtxModuleOnBlue = $04;
  DmtxModuleOnRGB = $07;
  DmtxModuleOn = $07;
  DmtxModuleUnsure = $08;
  DmtxModuleAssigned = $10;
  DmtxModuleVisited = $20;
  DmtxModuleData = $40;

type
  PDmtxStatus = ^TDmtxStatus;
  TDmtxStatus = longint;

const
  DmtxStatusEncoding = 0;
  DmtxStatusComplete = 1;
  DmtxStatusInvalid = 2;
  DmtxStatusFatal = 3;

type
  PDmtxScheme = ^TDmtxScheme;
  TDmtxScheme = longint;

const
  DmtxSchemeAutoFast = -(2);
  DmtxSchemeAutoBest = -(1);
  DmtxSchemeAscii = 0;
  DmtxSchemeC40 = 1;
  DmtxSchemeText = 2;
  DmtxSchemeX12 = 3;
  DmtxSchemeEdifact = 4;
  DmtxSchemeBase256 = 5;

type
  PDmtxSymbolSize = ^TDmtxSymbolSize;
  TDmtxSymbolSize = longint;

const
  DmtxSymbolRectAuto = -(3);
  DmtxSymbolSquareAuto = -(2);
  DmtxSymbolShapeAuto = -(1);
  DmtxSymbol10x10 = 0;
  DmtxSymbol12x12 = 1;
  DmtxSymbol14x14 = 2;
  DmtxSymbol16x16 = 3;
  DmtxSymbol18x18 = 4;
  DmtxSymbol20x20 = 5;
  DmtxSymbol22x22 = 6;
  DmtxSymbol24x24 = 7;
  DmtxSymbol26x26 = 8;
  DmtxSymbol32x32 = 9;
  DmtxSymbol36x36 = 10;
  DmtxSymbol40x40 = 11;
  DmtxSymbol44x44 = 12;
  DmtxSymbol48x48 = 13;
  DmtxSymbol52x52 = 14;
  DmtxSymbol64x64 = 15;
  DmtxSymbol72x72 = 16;
  DmtxSymbol80x80 = 17;
  DmtxSymbol88x88 = 18;
  DmtxSymbol96x96 = 19;
  DmtxSymbol104x104 = 20;
  DmtxSymbol120x120 = 21;
  DmtxSymbol132x132 = 22;
  DmtxSymbol144x144 = 23;
  DmtxSymbol8x18 = 24;
  DmtxSymbol8x32 = 25;
  DmtxSymbol12x26 = 26;
  DmtxSymbol12x36 = 27;
  DmtxSymbol16x36 = 28;
  DmtxSymbol16x48 = 29;

type
  PDmtxDirection = ^TDmtxDirection;
  TDmtxDirection = longint;

const
  DmtxDirNone = $00;
  DmtxDirUp = $01 shl 0;
  DmtxDirLeft = $01 shl 1;
  DmtxDirDown = $01 shl 2;
  DmtxDirRight = $01 shl 3;
  DmtxDirHorizontal = DmtxDirLeft or DmtxDirRight;
  DmtxDirVertical = DmtxDirUp or DmtxDirDown;
  DmtxDirRightUp = DmtxDirRight or DmtxDirUp;
  DmtxDirLeftDown = DmtxDirLeft or DmtxDirDown;

type
  PDmtxSymAttribute = ^TDmtxSymAttribute;
  TDmtxSymAttribute = longint;

const
  DmtxSymAttribSymbolRows = 0;
  DmtxSymAttribSymbolCols = 1;
  DmtxSymAttribDataRegionRows = 2;
  DmtxSymAttribDataRegionCols = 3;
  DmtxSymAttribHorizDataRegions = 4;
  DmtxSymAttribVertDataRegions = 5;
  DmtxSymAttribMappingMatrixRows = 6;
  DmtxSymAttribMappingMatrixCols = 7;
  DmtxSymAttribInterleavedBlocks = 8;
  DmtxSymAttribBlockErrorWords = 9;
  DmtxSymAttribBlockMaxCorrectable = 10;
  DmtxSymAttribSymbolDataWords = 11;
  DmtxSymAttribSymbolErrorWords = 12;
  DmtxSymAttribSymbolMaxCorrectable = 13;

type
  PDmtxCornerLoc = ^TDmtxCornerLoc;
  TDmtxCornerLoc = longint;

const
  DmtxCorner00 = $01 shl 0;
  DmtxCorner10 = $01 shl 1;
  DmtxCorner11 = $01 shl 2;
  DmtxCorner01 = $01 shl 3;

type
  PDmtxProperty = ^TDmtxProperty;
  TDmtxProperty = longint;

const
  DmtxPropScheme = 100;
  DmtxPropSizeRequest = 101;
  DmtxPropMarginSize = 102;
  DmtxPropModuleSize = 103;
  DmtxPropFnc1 = 104;
  DmtxPropEdgeMin = 200;
  DmtxPropEdgeMax = 201;
  DmtxPropScanGap = 202;
  DmtxPropSquareDevn = 203;
  DmtxPropSymbolSize = 204;
  DmtxPropEdgeThresh = 205;
  DmtxPropWidth = 300;
  DmtxPropHeight = 301;
  DmtxPropPixelPacking = 302;
  DmtxPropBitsPerPixel = 303;
  DmtxPropBytesPerPixel = 304;
  DmtxPropRowPadBytes = 305;
  DmtxPropRowSizeBytes = 306;
  DmtxPropImageFlip = 307;
  DmtxPropChannelCount = 308;
  DmtxPropXmin = 400;
  DmtxPropXmax = 401;
  DmtxPropYmin = 402;
  DmtxPropYmax = 403;
  DmtxPropScale = 404;

type
  PDmtxPackOrder = ^TDmtxPackOrder;
  TDmtxPackOrder = longint;

const
  DmtxPackCustom = 100;
  DmtxPack1bppK = 200;
  DmtxPack8bppK = 300;
  DmtxPack16bppRGB = 400;
  DmtxPack16bppRGBX = 401;
  DmtxPack16bppXRGB = 402;
  DmtxPack16bppBGR = 403;
  DmtxPack16bppBGRX = 404;
  DmtxPack16bppXBGR = 405;
  DmtxPack16bppYCbCr = 406;
  DmtxPack24bppRGB = 500;
  DmtxPack24bppBGR = 501;
  DmtxPack24bppYCbCr = 502;
  DmtxPack32bppRGBX = 600;
  DmtxPack32bppXRGB = 601;
  DmtxPack32bppBGRX = 602;
  DmtxPack32bppXBGR = 603;
  DmtxPack32bppCMYK = 604;

type
  PDmtxFlip = ^TDmtxFlip;
  TDmtxFlip = longint;

const
  DmtxFlipNone = $00;
  DmtxFlipX = $01 shl 0;
  DmtxFlipY = $01 shl 1;

type
  PDmtxMatrix3 = ^TDmtxMatrix3;
  TDmtxMatrix3 = array[0..2] of array[0..2] of double;

  TDmtxPixelLoc_struct = record
    X: longint;
    Y: longint;
  end;
  PDmtxPixelLoc_struct = ^TDmtxPixelLoc_struct;
  TDmtxPixelLoc = TDmtxPixelLoc_struct;
  PDmtxPixelLoc = ^TDmtxPixelLoc;

  TDmtxVector2_struct = record
    X: double;
    Y: double;
  end;
  PDmtxVector2_struct = ^TDmtxVector2_struct;
  TDmtxVector2 = TDmtxVector2_struct;
  PDmtxVector2 = ^TDmtxVector2;

  TDmtxRay2_struct = record
    tMin: double;
    tMax: double;
    p: TDmtxVector2;
    v: TDmtxVector2;
  end;
  PDmtxRay2_struct = ^TDmtxRay2_struct;
  TDmtxRay2 = TDmtxRay2_struct;
  PDmtxRay2 = ^TDmtxRay2;

  PDmtxByte = ^TDmtxByte;
  TDmtxByte = byte;

  TDmtxByteList_struct = record
    length: longint;
    capacity: longint;
    b: PDmtxByte;
  end;
  TDmtxByteList = TDmtxByteList_struct;
  PDmtxByteList = ^TDmtxByteList;
  PDmtxByteList_struct = ^TDmtxByteList_struct;

  TDmtxEncodeStream_struct = record
    currentScheme: longint;
    inputNext: longint;
    outputChainValueCount: longint;
    outputChainWordCount: longint;
    reason: pchar;
    sizeIdx: longint;
    fnc1: longint;
    status: TDmtxStatus;
    input: PDmtxByteList;
    output: PDmtxByteList;
  end;
  TDmtxEncodeStream = TDmtxEncodeStream_struct;
  PDmtxEncodeStream_struct = ^TDmtxEncodeStream_struct;

  TDmtxImage_struct = record
    width: longint;
    height: longint;
    pixelPacking: longint;
    bitsPerPixel: longint;
    bytesPerPixel: longint;
    rowPadBytes: longint;
    rowSizeBytes: longint;
    imageFlip: longint;
    channelCount: longint;
    channelStart: array[0..3] of longint;
    bitsPerChannel: array[0..3] of longint;
    pxl: pbyte;
  end;
  PDmtxImage_struct = ^TDmtxImage_struct;
  TDmtxImage = TDmtxImage_struct;
  PDmtxImage = ^TDmtxImage;
  PPDmtxImage = ^PDmtxImage;

  TDmtxPointFlow_struct = record
    plane: longint;
    arrive: longint;
    depart: longint;
    mag: longint;
    loc: TDmtxPixelLoc;
  end;
  PDmtxPointFlow_struct = ^TDmtxPointFlow_struct;
  TDmtxPointFlow = TDmtxPointFlow_struct;
  PDmtxPointFlow = ^TDmtxPointFlow;

  TDmtxBestLine_struct = record
    angle: longint;
    hOffset: longint;
    mag: longint;
    stepBeg: longint;
    stepPos: longint;
    stepNeg: longint;
    distSq: longint;
    devn: double;
    locBeg: TDmtxPixelLoc;
    locPos: TDmtxPixelLoc;
    locNeg: TDmtxPixelLoc;
  end;
  PDmtxBestLine_struct = ^TDmtxBestLine_struct;
  TDmtxBestLine = TDmtxBestLine_struct;
  PDmtxBestLine = ^TDmtxBestLine;

  TDmtxRegion_struct = record
    jumpToPos: longint;
    jumpToNeg: longint;
    stepsTotal: longint;
    finalPos: TDmtxPixelLoc;
    finalNeg: TDmtxPixelLoc;
    boundMin: TDmtxPixelLoc;
    boundMax: TDmtxPixelLoc;
    flowBegin: TDmtxPointFlow;
    polarity: longint;
    stepR: longint;
    stepT: longint;
    locR: TDmtxPixelLoc;
    locT: TDmtxPixelLoc;
    leftKnown: longint;
    leftAngle: longint;
    leftLoc: TDmtxPixelLoc;
    leftLine: TDmtxBestLine;
    bottomKnown: longint;
    bottomAngle: longint;
    bottomLoc: TDmtxPixelLoc;
    bottomLine: TDmtxBestLine;
    topKnown: longint;
    topAngle: longint;
    topLoc: TDmtxPixelLoc;
    rightKnown: longint;
    rightAngle: longint;
    rightLoc: TDmtxPixelLoc;
    onColor: longint;
    offColor: longint;
    sizeIdx: longint;
    symbolRows: longint;
    symbolCols: longint;
    mappingRows: longint;
    mappingCols: longint;
    raw2fit: TDmtxMatrix3;
    fit2raw: TDmtxMatrix3;
  end;
  PDmtxRegion_struct = ^TDmtxRegion_struct;
  TDmtxRegion = TDmtxRegion_struct;
  PDmtxRegion = ^TDmtxRegion;
  PPDmtxRegion = ^PDmtxRegion;

  TDmtxMessage_struct = record
    arraySize: Tsize_t;
    codeSize: Tsize_t;
    outputSize: Tsize_t;
    outputIdx: longint;
    padCount: longint;
    fnc1: longint;
    arr: pbyte;
    code: pbyte;
    output: pbyte;
  end;
  PDmtxMessage_struct = ^TDmtxMessage_struct;
  TDmtxMessage = TDmtxMessage_struct;
  PDmtxMessage = ^TDmtxMessage;
  PPDmtxMessage = ^PDmtxMessage;

  TDmtxScanGrid_struct = record
    minExtent: longint;
    maxExtent: longint;
    xOffset: longint;
    yOffset: longint;
    xMin: longint;
    xMax: longint;
    yMin: longint;
    yMax: longint;
    total: longint;
    extent: longint;
    jumpSize: longint;
    pixelTotal: longint;
    startPos: longint;
    pixelCount: longint;
    xCenter: longint;
    yCenter: longint;
  end;
  PDmtxScanGrid_struct = ^TDmtxScanGrid_struct;
  TDmtxScanGrid = TDmtxScanGrid_struct;
  PDmtxScanGrid = ^TDmtxScanGrid;

  TDmtxTime_struct = record
    sec: Ttime_t;
    usec: Tculong;
  end;
  PDmtxTime_struct = ^TDmtxTime_struct;
  TDmtxTime = TDmtxTime_struct;
  PDmtxTime = ^TDmtxTime;

  TDmtxDecode_struct = record
    edgeMin: longint;
    edgeMax: longint;
    scanGap: longint;
    fnc1: longint;
    squareDevn: double;
    sizeIdxExpected: longint;
    edgeThresh: longint;
    xMin: longint;
    xMax: longint;
    yMin: longint;
    yMax: longint;
    scale: longint;
    cache: pbyte;
    image: PDmtxImage;
    grid: TDmtxScanGrid;
  end;
  PDmtxDecode_struct = ^TDmtxDecode_struct;
  TDmtxDecode = TDmtxDecode_struct;
  PDmtxDecode = ^TDmtxDecode;
  PPDmtxDecode = ^PDmtxDecode;

  TDmtxEncode_struct = record
    method: longint;
    scheme: longint;
    sizeIdxRequest: longint;
    marginSize: longint;
    moduleSize: longint;
    pixelPacking: longint;
    imageFlip: longint;
    rowPadBytes: longint;
    fnc1: longint;
    message: PDmtxMessage;
    image: PDmtxImage;
    region: TDmtxRegion;
    xfrm: TDmtxMatrix3;
    rxfrm: TDmtxMatrix3;
  end;
  PDmtxEncode_struct = ^TDmtxEncode_struct;
  TDmtxEncode = TDmtxEncode_struct;
  PDmtxEncode = ^TDmtxEncode;
  PPDmtxEncode = ^PDmtxEncode;

  TDmtxChannel_struct = record
    encScheme: longint;
    invalid: longint;
    inputPtr: pbyte;
    inputStop: pbyte;
    encodedLength: longint;
    currentLength: longint;
    firstCodeWord: longint;
    encodedWords: array[0..1557] of byte;
  end;
  PDmtxChannel_struct = ^TDmtxChannel_struct;
  TDmtxChannel = TDmtxChannel_struct;
  PDmtxChannel = ^TDmtxChannel;

  TDmtxChannelGroup_struct = record
    channel: array[0..5] of TDmtxChannel;
  end;
  PDmtxChannelGroup_struct = ^TDmtxChannelGroup_struct;
  TDmtxChannelGroup = TDmtxChannelGroup_struct;
  PDmtxChannelGroup = ^TDmtxChannelGroup;

  TDmtxTriplet_struct = record
    value: array[0..2] of byte;
  end;
  PDmtxTriplet_struct = ^TDmtxTriplet_struct;
  TDmtxTriplet = TDmtxTriplet_struct;
  PDmtxTriplet = ^TDmtxTriplet;

  TDmtxQuadruplet_struct = record
    value: array[0..3] of byte;
  end;
  PDmtxQuadruplet_struct = ^TDmtxQuadruplet_struct;
  TDmtxQuadruplet = TDmtxQuadruplet_struct;
  PDmtxQuadruplet = ^TDmtxQuadruplet;

function dmtxTimeNow: TDmtxTime; cdecl; external libdmtx;
function dmtxTimeAdd(t: TDmtxTime; msec: Tclong): TDmtxTime; cdecl; external libdmtx;
function dmtxTimeExceeded(timeout: TDmtxTime): longint; cdecl; external libdmtx;

function dmtxEncodeCreate: PDmtxEncode; cdecl; external libdmtx;
function dmtxEncodeDestroy(enc: PPDmtxEncode): TDmtxPassFail; cdecl; external libdmtx;
function dmtxEncodeSetProp(enc: PDmtxEncode; prop: longint; value: longint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxEncodeGetProp(enc: PDmtxEncode; prop: longint): longint; cdecl; external libdmtx;
function dmtxEncodeDataMatrix(enc: PDmtxEncode; n: longint; s: PChar): TDmtxPassFail; cdecl; external libdmtx;
function dmtxEncodeDataMosaic(enc: PDmtxEncode; n: longint; s: PChar): TDmtxPassFail; cdecl; external libdmtx;

function dmtxDecodeCreate(img: PDmtxImage; scale: longint): PDmtxDecode; cdecl; external libdmtx;
function dmtxDecodeDestroy(dec: PPDmtxDecode): TDmtxPassFail; cdecl; external libdmtx;
function dmtxDecodeSetProp(dec: PDmtxDecode; prop: longint; value: longint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxDecodeGetProp(dec: PDmtxDecode; prop: longint): longint; cdecl; external libdmtx;
function dmtxDecodeGetCache(dec: PDmtxDecode; x: longint; y: longint): pbyte; cdecl; external libdmtx;
function dmtxDecodeGetPixelValue(dec: PDmtxDecode; x: longint; y: longint; channel: longint; value: Plongint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxDecodeMatrixRegion(dec: PDmtxDecode; reg: PDmtxRegion; fix: longint): PDmtxMessage; cdecl; external libdmtx;
function dmtxDecodePopulatedArray(sizeIdx: longint; msg: PDmtxMessage; fix: longint): PDmtxMessage; cdecl; external libdmtx;
function dmtxDecodeMosaicRegion(dec: PDmtxDecode; reg: PDmtxRegion; fix: longint): PDmtxMessage; cdecl; external libdmtx;
function dmtxDecodeCreateDiagnostic(dec: PDmtxDecode; totalBytes: Plongint; headerBytes: Plongint; style: longint): pbyte; cdecl; external libdmtx;

function dmtxRegionCreate(reg: PDmtxRegion): PDmtxRegion; cdecl; external libdmtx;
function dmtxRegionDestroy(reg: PPDmtxRegion): TDmtxPassFail; cdecl; external libdmtx;
function dmtxRegionFindNext(dec: PDmtxDecode; timeout: PDmtxTime): PDmtxRegion; cdecl; external libdmtx;
function dmtxRegionScanPixel(dec: PDmtxDecode; x: longint; y: longint): PDmtxRegion; cdecl; external libdmtx;
function dmtxRegionUpdateCorners(dec: PDmtxDecode; reg: PDmtxRegion; p00: TDmtxVector2; p10: TDmtxVector2; p11: TDmtxVector2; p01: TDmtxVector2): TDmtxPassFail; cdecl; external libdmtx;
function dmtxRegionUpdateXfrms(dec: PDmtxDecode; reg: PDmtxRegion): TDmtxPassFail; cdecl; external libdmtx;

function dmtxMessageCreate(sizeIdx: longint; symbolFormat: longint): PDmtxMessage; cdecl; external libdmtx;
function dmtxMessageDestroy(msg: PPDmtxMessage): TDmtxPassFail; cdecl; external libdmtx;

function dmtxImageCreate(pxl: pbyte; width: longint; height: longint; pack: longint): PDmtxImage; cdecl; external libdmtx;
function dmtxImageDestroy(img: PPDmtxImage): TDmtxPassFail; cdecl; external libdmtx;
function dmtxImageSetChannel(img: PDmtxImage; channelStart: longint; bitsPerChannel: longint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxImageSetProp(img: PDmtxImage; prop: longint; value: longint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxImageGetProp(img: PDmtxImage; prop: longint): longint; cdecl; external libdmtx;
function dmtxImageGetByteOffset(img: PDmtxImage; x: longint; y: longint): longint; cdecl; external libdmtx;
function dmtxImageGetPixelValue(img: PDmtxImage; x: longint; y: longint; channel: longint; value: Plongint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxImageSetPixelValue(img: PDmtxImage; x: longint; y: longint; channel: longint; value: longint): TDmtxPassFail; cdecl; external libdmtx;
function dmtxImageContainsInt(img: PDmtxImage; margin: longint; x: longint; y: longint): TDmtxBoolean; cdecl; external libdmtx;
function dmtxImageContainsFloat(img: PDmtxImage; x: double; y: double): TDmtxBoolean; cdecl; external libdmtx;

function dmtxVector2AddTo(v1: PDmtxVector2; v2: PDmtxVector2): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2Add(vOut: PDmtxVector2; v1: PDmtxVector2; v2: PDmtxVector2): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2SubFrom(v1: PDmtxVector2; v2: PDmtxVector2): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2Sub(vOut: PDmtxVector2; v1: PDmtxVector2; v2: PDmtxVector2): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2ScaleBy(v: PDmtxVector2; s: double): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2Scale(vOut: PDmtxVector2; v: PDmtxVector2; s: double): PDmtxVector2; cdecl; external libdmtx;
function dmtxVector2Cross(v1: PDmtxVector2; v2: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxVector2Norm(v: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxVector2Dot(v1: PDmtxVector2; v2: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxVector2Mag(v: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxDistanceFromRay2(r: PDmtxRay2; q: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxDistanceAlongRay2(r: PDmtxRay2; q: PDmtxVector2): double; cdecl; external libdmtx;
function dmtxRay2Intersect(point: PDmtxVector2; p0: PDmtxRay2; p1: PDmtxRay2): TDmtxPassFail; cdecl; external libdmtx;
function dmtxPointAlongRay2(point: PDmtxVector2; r: PDmtxRay2; t: double): TDmtxPassFail; cdecl; external libdmtx;

procedure dmtxMatrix3Copy(m0: TDmtxMatrix3; m1: TDmtxMatrix3); cdecl; external libdmtx;
procedure dmtxMatrix3Identity(m: TDmtxMatrix3); cdecl; external libdmtx;
procedure dmtxMatrix3Translate(m: TDmtxMatrix3; tx: double; ty: double); cdecl; external libdmtx;
procedure dmtxMatrix3Rotate(m: TDmtxMatrix3; angle: double); cdecl; external libdmtx;
procedure dmtxMatrix3Scale(m: TDmtxMatrix3; sx: double; sy: double); cdecl; external libdmtx;
procedure dmtxMatrix3Shear(m: TDmtxMatrix3; shx: double; shy: double); cdecl; external libdmtx;
procedure dmtxMatrix3LineSkewTop(m: TDmtxMatrix3; b0: double; b1: double; sz: double); cdecl; external libdmtx;
procedure dmtxMatrix3LineSkewTopInv(m: TDmtxMatrix3; b0: double; b1: double; sz: double); cdecl; external libdmtx;
procedure dmtxMatrix3LineSkewSide(m: TDmtxMatrix3; b0: double; b1: double; sz: double); cdecl; external libdmtx;
procedure dmtxMatrix3LineSkewSideInv(m: TDmtxMatrix3; b0: double; b1: double; sz: double); cdecl; external libdmtx;
procedure dmtxMatrix3Multiply(mOut: TDmtxMatrix3; m0: TDmtxMatrix3; m1: TDmtxMatrix3); cdecl; external libdmtx;
procedure dmtxMatrix3MultiplyBy(m0: TDmtxMatrix3; m1: TDmtxMatrix3); cdecl; external libdmtx;
function dmtxMatrix3VMultiply(vOut: PDmtxVector2; vIn: PDmtxVector2; m: TDmtxMatrix3): longint; cdecl; external libdmtx;
function dmtxMatrix3VMultiplyBy(v: PDmtxVector2; m: TDmtxMatrix3): longint; cdecl; external libdmtx;
procedure dmtxMatrix3Print(m: TDmtxMatrix3); cdecl; external libdmtx;

function dmtxSymbolModuleStatus(mapping: PDmtxMessage; sizeIdx: longint; row: longint; col: longint): longint; cdecl; external libdmtx;
function dmtxGetSymbolAttribute(attribute: longint; sizeIdx: longint): longint; cdecl; external libdmtx;
function dmtxGetBlockDataSize(sizeIdx: longint; blockIdx: longint): longint; cdecl; external libdmtx;
function getSizeIdxFromSymbolDimension(rows: longint; cols: longint): longint; cdecl; external libdmtx;

function dmtxByteListBuild(storage: PDmtxByte; capacity: longint): TDmtxByteList; cdecl; external libdmtx;
procedure dmtxByteListInit(list: PDmtxByteList; length: longint; value: TDmtxByte; passFail: PDmtxPassFail); cdecl; external libdmtx;
procedure dmtxByteListClear(list: PDmtxByteList); cdecl; external libdmtx;
function dmtxByteListHasCapacity(list: PDmtxByteList): TDmtxBoolean; cdecl; external libdmtx;
procedure dmtxByteListCopy(dst: PDmtxByteList; src: PDmtxByteList; passFail: PDmtxPassFail); cdecl; external libdmtx;
procedure dmtxByteListPush(list: PDmtxByteList; value: TDmtxByte; passFail: PDmtxPassFail); cdecl; external libdmtx;
function dmtxByteListPop(list: PDmtxByteList; passFail: PDmtxPassFail): TDmtxByte; cdecl; external libdmtx;
procedure dmtxByteListPrint(list: PDmtxByteList; prefix: pchar); cdecl; external libdmtx;
function dmtxVersion: pchar; cdecl; external libdmtx;

// === Konventiert am: 29-1-26 14:59:06 ===


implementation


end.
