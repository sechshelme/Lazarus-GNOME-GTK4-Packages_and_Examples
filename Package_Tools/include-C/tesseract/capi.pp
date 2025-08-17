
unit capi;
interface

{
  Automatically converted by H2Pas 1.0.0 from capi.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    capi.h
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
PBOOL  = ^BOOL;
PBoxa  = ^Boxa;
Pbyte  = ^byte;
Pchar  = ^char;
Pdouble  = ^double;
PETEXT_DESC  = ^ETEXT_DESC;
PFILE  = ^FILE;
Plongint  = ^longint;
PPix  = ^Pix;
PPixa  = ^Pixa;
Psingle  = ^single;
PTessBaseAPI  = ^TessBaseAPI;
PTessChoiceIterator  = ^TessChoiceIterator;
PTessMutableIterator  = ^TessMutableIterator;
PTessOcrEngineMode  = ^TessOcrEngineMode;
PTessOrientation  = ^TessOrientation;
PTessPageIterator  = ^TessPageIterator;
PTessPageIteratorLevel  = ^TessPageIteratorLevel;
PTessPageSegMode  = ^TessPageSegMode;
PTessParagraphJustification  = ^TessParagraphJustification;
PTessPolyBlockType  = ^TessPolyBlockType;
PTessResultIterator  = ^TessResultIterator;
PTessResultRenderer  = ^TessResultRenderer;
PTessTextlineOrder  = ^TessTextlineOrder;
PTessWritingDirection  = ^TessWritingDirection;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ SPDX-License-Identifier: Apache-2.0 }
{ File:        capi.h }
{ Description: C-API TessBaseAPI }
{ }
{ (C) Copyright 2012, Google Inc. }
{ Licensed under the Apache License, Version 2.0 (the "License"); }
{ you may not use this file except in compliance with the License. }
{ You may obtain a copy of the License at }
{ http://www.apache.org/licenses/LICENSE-2.0 }
{ Unless required by applicable law or agreed to in writing, software }
{ distributed under the License is distributed on an "AS IS" BASIS, }
{ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{ See the License for the specific language governing permissions and }
{ limitations under the License. }
{$ifndef API_CAPI_H_}
{$define API_CAPI_H_}
{$include "export.h"}
{$include <stdbool.h>}
{$include <stdio.h>}
{ C++ extern C conditionnal removed }
{$ifndef BOOL}

const
  BOOL = longint;  
  TRUE = 1;  
  FALSE = 0;  
{$endif}
type

  PTessOcrEngineMode = ^TTessOcrEngineMode;
  TTessOcrEngineMode =  Longint;
  Const
    OEM_TESSERACT_ONLY = 0;
    OEM_LSTM_ONLY = 1;
    OEM_TESSERACT_LSTM_COMBINED = 2;
    OEM_DEFAULT = 3;
;
type
  PTessPageSegMode = ^TTessPageSegMode;
  TTessPageSegMode =  Longint;
  Const
    PSM_OSD_ONLY = 0;
    PSM_AUTO_OSD = 1;
    PSM_AUTO_ONLY = 2;
    PSM_AUTO = 3;
    PSM_SINGLE_COLUMN = 4;
    PSM_SINGLE_BLOCK_VERT_TEXT = 5;
    PSM_SINGLE_BLOCK = 6;
    PSM_SINGLE_LINE = 7;
    PSM_SINGLE_WORD = 8;
    PSM_CIRCLE_WORD = 9;
    PSM_SINGLE_CHAR = 10;
    PSM_SPARSE_TEXT = 11;
    PSM_SPARSE_TEXT_OSD = 12;
    PSM_RAW_LINE = 13;
    PSM_COUNT = 14;
;
type
  PTessPageIteratorLevel = ^TTessPageIteratorLevel;
  TTessPageIteratorLevel =  Longint;
  Const
    RIL_BLOCK = 0;
    RIL_PARA = 1;
    RIL_TEXTLINE = 2;
    RIL_WORD = 3;
    RIL_SYMBOL = 4;
;
type
  PTessPolyBlockType = ^TTessPolyBlockType;
  TTessPolyBlockType =  Longint;
  Const
    PT_UNKNOWN = 0;
    PT_FLOWING_TEXT = 1;
    PT_HEADING_TEXT = 2;
    PT_PULLOUT_TEXT = 3;
    PT_EQUATION = 4;
    PT_INLINE_EQUATION = 5;
    PT_TABLE = 6;
    PT_VERTICAL_TEXT = 7;
    PT_CAPTION_TEXT = 8;
    PT_FLOWING_IMAGE = 9;
    PT_HEADING_IMAGE = 10;
    PT_PULLOUT_IMAGE = 11;
    PT_HORZ_LINE = 12;
    PT_VERT_LINE = 13;
    PT_NOISE = 14;
    PT_COUNT = 15;
;
type
  PTessOrientation = ^TTessOrientation;
  TTessOrientation =  Longint;
  Const
    ORIENTATION_PAGE_UP = 0;
    ORIENTATION_PAGE_RIGHT = 1;
    ORIENTATION_PAGE_DOWN = 2;
    ORIENTATION_PAGE_LEFT = 3;
;
type
  PTessParagraphJustification = ^TTessParagraphJustification;
  TTessParagraphJustification =  Longint;
  Const
    JUSTIFICATION_UNKNOWN = 0;
    JUSTIFICATION_LEFT = 1;
    JUSTIFICATION_CENTER = 2;
    JUSTIFICATION_RIGHT = 3;
;
type
  PTessWritingDirection = ^TTessWritingDirection;
  TTessWritingDirection =  Longint;
  Const
    WRITING_DIRECTION_LEFT_TO_RIGHT = 0;
    WRITING_DIRECTION_RIGHT_TO_LEFT = 1;
    WRITING_DIRECTION_TOP_TO_BOTTOM = 2;
;
type
  PTessTextlineOrder = ^TTessTextlineOrder;
  TTessTextlineOrder =  Longint;
  Const
    TEXTLINE_ORDER_LEFT_TO_RIGHT = 0;
    TEXTLINE_ORDER_RIGHT_TO_LEFT = 1;
    TEXTLINE_ORDER_TOP_TO_BOTTOM = 2;
;
type

  TTessCancelFunc = function (cancel_this:pointer; words:longint):Tbool;cdecl;

  TTessProgressFunc = function (ths:PETEXT_DESC; left:longint; right:longint; top:longint; bottom:longint):Tbool;cdecl;
  PPix = ^TPix;
  TPix = record
      {undefined structure}
    end;

  PBoxa = ^TBoxa;
  TBoxa = record
      {undefined structure}
    end;

  PPixa = ^TPixa;
  TPixa = record
      {undefined structure}
    end;

{ General free functions  }
(* Const before type ignored *)

function TessVersion:Pchar;cdecl;external;
(* Const before type ignored *)
procedure TessDeleteText(text:Pchar);cdecl;external;
procedure TessDeleteTextArray(arr:PPchar);cdecl;external;
(* Const before type ignored *)
procedure TessDeleteIntArray(arr:Plongint);cdecl;external;
{ Renderer API  }
(* Const before type ignored *)
function TessTextRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessHOcrRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessHOcrRendererCreate2(outputbase:Pchar; font_info:TBOOL):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessAltoRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessTsvRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessPDFRendererCreate(outputbase:Pchar; datadir:Pchar; textonly:TBOOL):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessUnlvRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessBoxTextRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessLSTMBoxRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessWordStrBoxRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external;
procedure TessDeleteResultRenderer(renderer:PTessResultRenderer);cdecl;external;
procedure TessResultRendererInsert(renderer:PTessResultRenderer; next:PTessResultRenderer);cdecl;external;
function TessResultRendererNext(renderer:PTessResultRenderer):PTessResultRenderer;cdecl;external;
(* Const before type ignored *)
function TessResultRendererBeginDocument(renderer:PTessResultRenderer; title:Pchar):TBOOL;cdecl;external;
function TessResultRendererAddImage(renderer:PTessResultRenderer; api:PTessBaseAPI):TBOOL;cdecl;external;
function TessResultRendererEndDocument(renderer:PTessResultRenderer):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultRendererExtention(renderer:PTessResultRenderer):Pchar;cdecl;external;
(* Const before type ignored *)
function TessResultRendererTitle(renderer:PTessResultRenderer):Pchar;cdecl;external;
function TessResultRendererImageNum(renderer:PTessResultRenderer):longint;cdecl;external;
{ Base API  }
function TessBaseAPICreate:PTessBaseAPI;cdecl;external;
procedure TessBaseAPIDelete(handle:PTessBaseAPI);cdecl;external;
function TessBaseAPIGetOpenCLDevice(handle:PTessBaseAPI; device:Ppointer):Tsize_t;cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPISetInputName(handle:PTessBaseAPI; name:Pchar);cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetInputName(handle:PTessBaseAPI):Pchar;cdecl;external;
procedure TessBaseAPISetInputImage(handle:PTessBaseAPI; pix:PPix);cdecl;external;
function TessBaseAPIGetInputImage(handle:PTessBaseAPI):PPix;cdecl;external;
function TessBaseAPIGetSourceYResolution(handle:PTessBaseAPI):longint;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetDatapath(handle:PTessBaseAPI):Pchar;cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPISetOutputName(handle:PTessBaseAPI; name:Pchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPISetVariable(handle:PTessBaseAPI; name:Pchar; value:Pchar):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPISetDebugVariable(handle:PTessBaseAPI; name:Pchar; value:Pchar):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIGetIntVariable(handle:PTessBaseAPI; name:Pchar; value:Plongint):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIGetBoolVariable(handle:PTessBaseAPI; name:Pchar; value:PBOOL):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIGetDoubleVariable(handle:PTessBaseAPI; name:Pchar; value:Pdouble):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIGetStringVariable(handle:PTessBaseAPI; name:Pchar):Pchar;cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPIPrintVariables(handle:PTessBaseAPI; fp:PFILE);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIPrintVariablesToFile(handle:PTessBaseAPI; filename:Pchar):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIInit1(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; oem:TTessOcrEngineMode; configs:PPchar; 
           configs_size:longint):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIInit2(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; oem:TTessOcrEngineMode):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIInit3(handle:PTessBaseAPI; datapath:Pchar; language:Pchar):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIInit4(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; mode:TTessOcrEngineMode; configs:PPchar; 
           configs_size:longint; vars_vec:PPchar; vars_values:PPchar; vars_vec_size:Tsize_t; set_only_non_debug_params:TBOOL):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIInit5(handle:PTessBaseAPI; data:Pchar; data_size:longint; language:Pchar; mode:TTessOcrEngineMode; 
           configs:PPchar; configs_size:longint; vars_vec:PPchar; vars_values:PPchar; vars_vec_size:Tsize_t; 
           set_only_non_debug_params:TBOOL):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIGetInitLanguagesAsString(handle:PTessBaseAPI):Pchar;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetLoadedLanguagesAsVector(handle:PTessBaseAPI):^Pchar;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetAvailableLanguagesAsVector(handle:PTessBaseAPI):^Pchar;cdecl;external;
procedure TessBaseAPIInitForAnalysePage(handle:PTessBaseAPI);cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPIReadConfigFile(handle:PTessBaseAPI; filename:Pchar);cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPIReadDebugConfigFile(handle:PTessBaseAPI; filename:Pchar);cdecl;external;
procedure TessBaseAPISetPageSegMode(handle:PTessBaseAPI; mode:TTessPageSegMode);cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetPageSegMode(handle:PTessBaseAPI):TTessPageSegMode;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIRect(handle:PTessBaseAPI; imagedata:Pbyte; bytes_per_pixel:longint; bytes_per_line:longint; left:longint; 
           top:longint; width:longint; height:longint):Pchar;cdecl;external;
procedure TessBaseAPIClearAdaptiveClassifier(handle:PTessBaseAPI);cdecl;external;
(* Const before type ignored *)
procedure TessBaseAPISetImage(handle:PTessBaseAPI; imagedata:Pbyte; width:longint; height:longint; bytes_per_pixel:longint; 
            bytes_per_line:longint);cdecl;external;
procedure TessBaseAPISetImage2(handle:PTessBaseAPI; pix:PPix);cdecl;external;
procedure TessBaseAPISetSourceResolution(handle:PTessBaseAPI; ppi:longint);cdecl;external;
procedure TessBaseAPISetRectangle(handle:PTessBaseAPI; left:longint; top:longint; width:longint; height:longint);cdecl;external;
function TessBaseAPIGetThresholdedImage(handle:PTessBaseAPI):PPix;cdecl;external;
function TessBaseAPIGetRegions(handle:PTessBaseAPI; pixa:PPPixa):PBoxa;cdecl;external;
function TessBaseAPIGetTextlines(handle:PTessBaseAPI; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external;
function TessBaseAPIGetTextlines1(handle:PTessBaseAPI; raw_image:TBOOL; raw_padding:longint; pixa:PPPixa; blockids:PPlongint; 
           paraids:PPlongint):PBoxa;cdecl;external;
function TessBaseAPIGetStrips(handle:PTessBaseAPI; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external;
function TessBaseAPIGetWords(handle:PTessBaseAPI; pixa:PPPixa):PBoxa;cdecl;external;
function TessBaseAPIGetConnectedComponents(handle:PTessBaseAPI; cc:PPPixa):PBoxa;cdecl;external;
function TessBaseAPIGetComponentImages(handle:PTessBaseAPI; level:TTessPageIteratorLevel; text_only:TBOOL; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external;
function TessBaseAPIGetComponentImages1(handle:PTessBaseAPI; level:TTessPageIteratorLevel; text_only:TBOOL; raw_image:TBOOL; raw_padding:longint; 
           pixa:PPPixa; blockids:PPlongint; paraids:PPlongint):PBoxa;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetThresholdedImageScaleFactor(handle:PTessBaseAPI):longint;cdecl;external;
function TessBaseAPIAnalyseLayout(handle:PTessBaseAPI):PTessPageIterator;cdecl;external;
function TessBaseAPIRecognize(handle:PTessBaseAPI; monitor:PETEXT_DESC):longint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIProcessPages(handle:PTessBaseAPI; filename:Pchar; retry_config:Pchar; timeout_millisec:longint; renderer:PTessResultRenderer):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessBaseAPIProcessPage(handle:PTessBaseAPI; pix:PPix; page_index:longint; filename:Pchar; retry_config:Pchar; 
           timeout_millisec:longint; renderer:PTessResultRenderer):TBOOL;cdecl;external;
function TessBaseAPIGetIterator(handle:PTessBaseAPI):PTessResultIterator;cdecl;external;
function TessBaseAPIGetMutableIterator(handle:PTessBaseAPI):PTessMutableIterator;cdecl;external;
function TessBaseAPIGetUTF8Text(handle:PTessBaseAPI):Pchar;cdecl;external;
function TessBaseAPIGetHOCRText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetAltoText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetTsvText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetLSTMBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetWordStrBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external;
function TessBaseAPIGetUNLVText(handle:PTessBaseAPI):Pchar;cdecl;external;
function TessBaseAPIMeanTextConf(handle:PTessBaseAPI):longint;cdecl;external;
function TessBaseAPIAllWordConfidences(handle:PTessBaseAPI):Plongint;cdecl;external;
{$ifndef DISABLED_LEGACY_ENGINE}
(* Const before type ignored *)

function TessBaseAPIAdaptToWordStr(handle:PTessBaseAPI; mode:TTessPageSegMode; wordstr:Pchar):TBOOL;cdecl;external;
{$endif}
{ #ifndef DISABLED_LEGACY_ENGINE }

procedure TessBaseAPIClear(handle:PTessBaseAPI);cdecl;external;
procedure TessBaseAPIEnd(handle:PTessBaseAPI);cdecl;external;
(* Const before type ignored *)
function TessBaseAPIIsValidWord(handle:PTessBaseAPI; word:Pchar):longint;cdecl;external;
function TessBaseAPIGetTextDirection(handle:PTessBaseAPI; out_offset:Plongint; out_slope:Psingle):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIGetUnichar(handle:PTessBaseAPI; unichar_id:longint):Pchar;cdecl;external;
procedure TessBaseAPIClearPersistentCache(handle:PTessBaseAPI);cdecl;external;
{$ifndef DISABLED_LEGACY_ENGINE}
{ Call TessDeleteText(*best_script_name) to free memory allocated by this }
{ function }
(* Const before type ignored *)

function TessBaseAPIDetectOrientationScript(handle:PTessBaseAPI; orient_deg:Plongint; orient_conf:Psingle; script_name:PPchar; script_conf:Psingle):TBOOL;cdecl;external;
{$endif}
{ #ifndef DISABLED_LEGACY_ENGINE }

procedure TessBaseAPISetMinOrientationMargin(handle:PTessBaseAPI; margin:Tdouble);cdecl;external;
(* Const before type ignored *)
function TessBaseAPINumDawgs(handle:PTessBaseAPI):longint;cdecl;external;
(* Const before type ignored *)
function TessBaseAPIOem(handle:PTessBaseAPI):TTessOcrEngineMode;cdecl;external;
procedure TessBaseGetBlockTextOrientations(handle:PTessBaseAPI; block_orientation:PPlongint; vertical_writing:PPbool);cdecl;external;
{ Page iterator  }
procedure TessPageIteratorDelete(handle:PTessPageIterator);cdecl;external;
(* Const before type ignored *)
function TessPageIteratorCopy(handle:PTessPageIterator):PTessPageIterator;cdecl;external;
procedure TessPageIteratorBegin(handle:PTessPageIterator);cdecl;external;
function TessPageIteratorNext(handle:PTessPageIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorIsAtBeginningOf(handle:PTessPageIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorIsAtFinalElement(handle:PTessPageIterator; level:TTessPageIteratorLevel; element:TTessPageIteratorLevel):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorBoundingBox(handle:PTessPageIterator; level:TTessPageIteratorLevel; left:Plongint; top:Plongint; right:Plongint; 
           bottom:Plongint):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorBlockType(handle:PTessPageIterator):TTessPolyBlockType;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorGetBinaryImage(handle:PTessPageIterator; level:TTessPageIteratorLevel):PPix;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorGetImage(handle:PTessPageIterator; level:TTessPageIteratorLevel; padding:longint; original_image:PPix; left:Plongint; 
           top:Plongint):PPix;cdecl;external;
(* Const before type ignored *)
function TessPageIteratorBaseline(handle:PTessPageIterator; level:TTessPageIteratorLevel; x1:Plongint; y1:Plongint; x2:Plongint; 
           y2:Plongint):TBOOL;cdecl;external;
procedure TessPageIteratorOrientation(handle:PTessPageIterator; orientation:PTessOrientation; writing_direction:PTessWritingDirection; textline_order:PTessTextlineOrder; deskew_angle:Psingle);cdecl;external;
procedure TessPageIteratorParagraphInfo(handle:PTessPageIterator; justification:PTessParagraphJustification; is_list_item:PBOOL; is_crown:PBOOL; first_line_indent:Plongint);cdecl;external;
{ Result iterator  }
procedure TessResultIteratorDelete(handle:PTessResultIterator);cdecl;external;
(* Const before type ignored *)
function TessResultIteratorCopy(handle:PTessResultIterator):PTessResultIterator;cdecl;external;
function TessResultIteratorGetPageIterator(handle:PTessResultIterator):PTessPageIterator;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessResultIteratorGetPageIteratorConst(handle:PTessResultIterator):PTessPageIterator;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorGetChoiceIterator(handle:PTessResultIterator):PTessChoiceIterator;cdecl;external;
function TessResultIteratorNext(handle:PTessResultIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorGetUTF8Text(handle:PTessResultIterator; level:TTessPageIteratorLevel):Pchar;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorConfidence(handle:PTessResultIterator; level:TTessPageIteratorLevel):single;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessResultIteratorWordRecognitionLanguage(handle:PTessResultIterator):Pchar;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessResultIteratorWordFontAttributes(handle:PTessResultIterator; is_bold:PBOOL; is_italic:PBOOL; is_underlined:PBOOL; is_monospace:PBOOL; 
           is_serif:PBOOL; is_smallcaps:PBOOL; pointsize:Plongint; font_id:Plongint):Pchar;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorWordIsFromDictionary(handle:PTessResultIterator):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorWordIsNumeric(handle:PTessResultIterator):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorSymbolIsSuperscript(handle:PTessResultIterator):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorSymbolIsSubscript(handle:PTessResultIterator):TBOOL;cdecl;external;
(* Const before type ignored *)
function TessResultIteratorSymbolIsDropcap(handle:PTessResultIterator):TBOOL;cdecl;external;
procedure TessChoiceIteratorDelete(handle:PTessChoiceIterator);cdecl;external;
function TessChoiceIteratorNext(handle:PTessChoiceIterator):TBOOL;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function TessChoiceIteratorGetUTF8Text(handle:PTessChoiceIterator):Pchar;cdecl;external;
(* Const before type ignored *)
function TessChoiceIteratorConfidence(handle:PTessChoiceIterator):single;cdecl;external;
{ Progress monitor  }
function TessMonitorCreate:PETEXT_DESC;cdecl;external;
procedure TessMonitorDelete(monitor:PETEXT_DESC);cdecl;external;
procedure TessMonitorSetCancelFunc(monitor:PETEXT_DESC; cancelFunc:TTessCancelFunc);cdecl;external;
procedure TessMonitorSetCancelThis(monitor:PETEXT_DESC; cancelThis:pointer);cdecl;external;
function TessMonitorGetCancelThis(monitor:PETEXT_DESC):pointer;cdecl;external;
procedure TessMonitorSetProgressFunc(monitor:PETEXT_DESC; progressFunc:TTessProgressFunc);cdecl;external;
function TessMonitorGetProgress(monitor:PETEXT_DESC):longint;cdecl;external;
procedure TessMonitorSetDeadlineMSecs(monitor:PETEXT_DESC; deadline:longint);cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}
{ API_CAPI_H_ }

implementation


end.
