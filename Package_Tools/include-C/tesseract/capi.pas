unit capi;

interface

uses
  ctypes;

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

function TessVersion:Pchar;cdecl;external libtesseract;
procedure TessDeleteText(text:Pchar);cdecl;external libtesseract;
procedure TessDeleteTextArray(arr:PPchar);cdecl;external libtesseract;
procedure TessDeleteIntArray(arr:Plongint);cdecl;external libtesseract;
{ Renderer API  }
function TessTextRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessHOcrRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessHOcrRendererCreate2(outputbase:Pchar; font_info:TBOOL):PTessResultRenderer;cdecl;external libtesseract;
function TessAltoRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessTsvRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessPDFRendererCreate(outputbase:Pchar; datadir:Pchar; textonly:TBOOL):PTessResultRenderer;cdecl;external libtesseract;
function TessUnlvRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessBoxTextRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessLSTMBoxRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
function TessWordStrBoxRendererCreate(outputbase:Pchar):PTessResultRenderer;cdecl;external libtesseract;
procedure TessDeleteResultRenderer(renderer:PTessResultRenderer);cdecl;external libtesseract;
procedure TessResultRendererInsert(renderer:PTessResultRenderer; next:PTessResultRenderer);cdecl;external libtesseract;
function TessResultRendererNext(renderer:PTessResultRenderer):PTessResultRenderer;cdecl;external libtesseract;
function TessResultRendererBeginDocument(renderer:PTessResultRenderer; title:Pchar):TBOOL;cdecl;external libtesseract;
function TessResultRendererAddImage(renderer:PTessResultRenderer; api:PTessBaseAPI):TBOOL;cdecl;external libtesseract;
function TessResultRendererEndDocument(renderer:PTessResultRenderer):TBOOL;cdecl;external libtesseract;
function TessResultRendererExtention(renderer:PTessResultRenderer):Pchar;cdecl;external libtesseract;
function TessResultRendererTitle(renderer:PTessResultRenderer):Pchar;cdecl;external libtesseract;
function TessResultRendererImageNum(renderer:PTessResultRenderer):longint;cdecl;external libtesseract;
{ Base API  }
function TessBaseAPICreate:PTessBaseAPI;cdecl;external libtesseract;
procedure TessBaseAPIDelete(handle:PTessBaseAPI);cdecl;external libtesseract;
function TessBaseAPIGetOpenCLDevice(handle:PTessBaseAPI; device:Ppointer):Tsize_t;cdecl;external libtesseract;
procedure TessBaseAPISetInputName(handle:PTessBaseAPI; name:Pchar);cdecl;external libtesseract;
function TessBaseAPIGetInputName(handle:PTessBaseAPI):Pchar;cdecl;external libtesseract;
procedure TessBaseAPISetInputImage(handle:PTessBaseAPI; pix:PPix);cdecl;external libtesseract;
function TessBaseAPIGetInputImage(handle:PTessBaseAPI):PPix;cdecl;external libtesseract;
function TessBaseAPIGetSourceYResolution(handle:PTessBaseAPI):longint;cdecl;external libtesseract;
function TessBaseAPIGetDatapath(handle:PTessBaseAPI):Pchar;cdecl;external libtesseract;
procedure TessBaseAPISetOutputName(handle:PTessBaseAPI; name:Pchar);cdecl;external libtesseract;
function TessBaseAPISetVariable(handle:PTessBaseAPI; name:Pchar; value:Pchar):TBOOL;cdecl;external libtesseract;
function TessBaseAPISetDebugVariable(handle:PTessBaseAPI; name:Pchar; value:Pchar):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetIntVariable(handle:PTessBaseAPI; name:Pchar; value:Plongint):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetBoolVariable(handle:PTessBaseAPI; name:Pchar; value:PBOOL):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetDoubleVariable(handle:PTessBaseAPI; name:Pchar; value:Pdouble):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetStringVariable(handle:PTessBaseAPI; name:Pchar):Pchar;cdecl;external libtesseract;
procedure TessBaseAPIPrintVariables(handle:PTessBaseAPI; fp:PFILE);cdecl;external libtesseract;
function TessBaseAPIPrintVariablesToFile(handle:PTessBaseAPI; filename:Pchar):TBOOL;cdecl;external libtesseract;
function TessBaseAPIInit1(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; oem:TTessOcrEngineMode; configs:PPchar; 
           configs_size:longint):longint;cdecl;external libtesseract;
function TessBaseAPIInit2(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; oem:TTessOcrEngineMode):longint;cdecl;external libtesseract;
function TessBaseAPIInit3(handle:PTessBaseAPI; datapath:Pchar; language:Pchar):longint;cdecl;external libtesseract;
function TessBaseAPIInit4(handle:PTessBaseAPI; datapath:Pchar; language:Pchar; mode:TTessOcrEngineMode; configs:PPchar; 
           configs_size:longint; vars_vec:PPchar; vars_values:PPchar; vars_vec_size:Tsize_t; set_only_non_debug_params:TBOOL):longint;cdecl;external libtesseract;
function TessBaseAPIInit5(handle:PTessBaseAPI; data:Pchar; data_size:longint; language:Pchar; mode:TTessOcrEngineMode; 
           configs:PPchar; configs_size:longint; vars_vec:PPchar; vars_values:PPchar; vars_vec_size:Tsize_t; 
           set_only_non_debug_params:TBOOL):longint;cdecl;external libtesseract;
function TessBaseAPIGetInitLanguagesAsString(handle:PTessBaseAPI):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetLoadedLanguagesAsVector(handle:PTessBaseAPI):^Pchar;cdecl;external libtesseract;
function TessBaseAPIGetAvailableLanguagesAsVector(handle:PTessBaseAPI):^Pchar;cdecl;external libtesseract;
procedure TessBaseAPIInitForAnalysePage(handle:PTessBaseAPI);cdecl;external libtesseract;
procedure TessBaseAPIReadConfigFile(handle:PTessBaseAPI; filename:Pchar);cdecl;external libtesseract;
procedure TessBaseAPIReadDebugConfigFile(handle:PTessBaseAPI; filename:Pchar);cdecl;external libtesseract;
procedure TessBaseAPISetPageSegMode(handle:PTessBaseAPI; mode:TTessPageSegMode);cdecl;external libtesseract;
function TessBaseAPIGetPageSegMode(handle:PTessBaseAPI):TTessPageSegMode;cdecl;external libtesseract;
function TessBaseAPIRect(handle:PTessBaseAPI; imagedata:Pbyte; bytes_per_pixel:longint; bytes_per_line:longint; left:longint; 
           top:longint; width:longint; height:longint):Pchar;cdecl;external libtesseract;
procedure TessBaseAPIClearAdaptiveClassifier(handle:PTessBaseAPI);cdecl;external libtesseract;
procedure TessBaseAPISetImage(handle:PTessBaseAPI; imagedata:Pbyte; width:longint; height:longint; bytes_per_pixel:longint; 
            bytes_per_line:longint);cdecl;external libtesseract;
procedure TessBaseAPISetImage2(handle:PTessBaseAPI; pix:PPix);cdecl;external libtesseract;
procedure TessBaseAPISetSourceResolution(handle:PTessBaseAPI; ppi:longint);cdecl;external libtesseract;
procedure TessBaseAPISetRectangle(handle:PTessBaseAPI; left:longint; top:longint; width:longint; height:longint);cdecl;external libtesseract;
function TessBaseAPIGetThresholdedImage(handle:PTessBaseAPI):PPix;cdecl;external libtesseract;
function TessBaseAPIGetRegions(handle:PTessBaseAPI; pixa:PPPixa):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetTextlines(handle:PTessBaseAPI; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetTextlines1(handle:PTessBaseAPI; raw_image:TBOOL; raw_padding:longint; pixa:PPPixa; blockids:PPlongint; 
           paraids:PPlongint):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetStrips(handle:PTessBaseAPI; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetWords(handle:PTessBaseAPI; pixa:PPPixa):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetConnectedComponents(handle:PTessBaseAPI; cc:PPPixa):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetComponentImages(handle:PTessBaseAPI; level:TTessPageIteratorLevel; text_only:TBOOL; pixa:PPPixa; blockids:PPlongint):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetComponentImages1(handle:PTessBaseAPI; level:TTessPageIteratorLevel; text_only:TBOOL; raw_image:TBOOL; raw_padding:longint; 
           pixa:PPPixa; blockids:PPlongint; paraids:PPlongint):PBoxa;cdecl;external libtesseract;
function TessBaseAPIGetThresholdedImageScaleFactor(handle:PTessBaseAPI):longint;cdecl;external libtesseract;
function TessBaseAPIAnalyseLayout(handle:PTessBaseAPI):PTessPageIterator;cdecl;external libtesseract;
function TessBaseAPIRecognize(handle:PTessBaseAPI; monitor:PETEXT_DESC):longint;cdecl;external libtesseract;
function TessBaseAPIProcessPages(handle:PTessBaseAPI; filename:Pchar; retry_config:Pchar; timeout_millisec:longint; renderer:PTessResultRenderer):TBOOL;cdecl;external libtesseract;
function TessBaseAPIProcessPage(handle:PTessBaseAPI; pix:PPix; page_index:longint; filename:Pchar; retry_config:Pchar; 
           timeout_millisec:longint; renderer:PTessResultRenderer):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetIterator(handle:PTessBaseAPI):PTessResultIterator;cdecl;external libtesseract;
function TessBaseAPIGetMutableIterator(handle:PTessBaseAPI):PTessMutableIterator;cdecl;external libtesseract;
function TessBaseAPIGetUTF8Text(handle:PTessBaseAPI):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetHOCRText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetAltoText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetTsvText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetLSTMBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetWordStrBoxText(handle:PTessBaseAPI; page_number:longint):Pchar;cdecl;external libtesseract;
function TessBaseAPIGetUNLVText(handle:PTessBaseAPI):Pchar;cdecl;external libtesseract;
function TessBaseAPIMeanTextConf(handle:PTessBaseAPI):longint;cdecl;external libtesseract;
function TessBaseAPIAllWordConfidences(handle:PTessBaseAPI):Plongint;cdecl;external libtesseract;
{$ifndef DISABLED_LEGACY_ENGINE}

function TessBaseAPIAdaptToWordStr(handle:PTessBaseAPI; mode:TTessPageSegMode; wordstr:Pchar):TBOOL;cdecl;external libtesseract;
{$endif}
{ #ifndef DISABLED_LEGACY_ENGINE }

procedure TessBaseAPIClear(handle:PTessBaseAPI);cdecl;external libtesseract;
procedure TessBaseAPIEnd(handle:PTessBaseAPI);cdecl;external libtesseract;
function TessBaseAPIIsValidWord(handle:PTessBaseAPI; word:Pchar):longint;cdecl;external libtesseract;
function TessBaseAPIGetTextDirection(handle:PTessBaseAPI; out_offset:Plongint; out_slope:Psingle):TBOOL;cdecl;external libtesseract;
function TessBaseAPIGetUnichar(handle:PTessBaseAPI; unichar_id:longint):Pchar;cdecl;external libtesseract;
procedure TessBaseAPIClearPersistentCache(handle:PTessBaseAPI);cdecl;external libtesseract;
{$ifndef DISABLED_LEGACY_ENGINE}
{ Call TessDeleteText(*best_script_name) to free memory allocated by this }
{ function }

function TessBaseAPIDetectOrientationScript(handle:PTessBaseAPI; orient_deg:Plongint; orient_conf:Psingle; script_name:PPchar; script_conf:Psingle):TBOOL;cdecl;external libtesseract;
{$endif}
{ #ifndef DISABLED_LEGACY_ENGINE }

procedure TessBaseAPISetMinOrientationMargin(handle:PTessBaseAPI; margin:Tdouble);cdecl;external libtesseract;
function TessBaseAPINumDawgs(handle:PTessBaseAPI):longint;cdecl;external libtesseract;
function TessBaseAPIOem(handle:PTessBaseAPI):TTessOcrEngineMode;cdecl;external libtesseract;
procedure TessBaseGetBlockTextOrientations(handle:PTessBaseAPI; block_orientation:PPlongint; vertical_writing:PPbool);cdecl;external libtesseract;
{ Page iterator  }
procedure TessPageIteratorDelete(handle:PTessPageIterator);cdecl;external libtesseract;
function TessPageIteratorCopy(handle:PTessPageIterator):PTessPageIterator;cdecl;external libtesseract;
procedure TessPageIteratorBegin(handle:PTessPageIterator);cdecl;external libtesseract;
function TessPageIteratorNext(handle:PTessPageIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external libtesseract;
function TessPageIteratorIsAtBeginningOf(handle:PTessPageIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external libtesseract;
function TessPageIteratorIsAtFinalElement(handle:PTessPageIterator; level:TTessPageIteratorLevel; element:TTessPageIteratorLevel):TBOOL;cdecl;external libtesseract;
function TessPageIteratorBoundingBox(handle:PTessPageIterator; level:TTessPageIteratorLevel; left:Plongint; top:Plongint; right:Plongint; 
           bottom:Plongint):TBOOL;cdecl;external libtesseract;
function TessPageIteratorBlockType(handle:PTessPageIterator):TTessPolyBlockType;cdecl;external libtesseract;
function TessPageIteratorGetBinaryImage(handle:PTessPageIterator; level:TTessPageIteratorLevel):PPix;cdecl;external libtesseract;
function TessPageIteratorGetImage(handle:PTessPageIterator; level:TTessPageIteratorLevel; padding:longint; original_image:PPix; left:Plongint; 
           top:Plongint):PPix;cdecl;external libtesseract;
function TessPageIteratorBaseline(handle:PTessPageIterator; level:TTessPageIteratorLevel; x1:Plongint; y1:Plongint; x2:Plongint; 
           y2:Plongint):TBOOL;cdecl;external libtesseract;
procedure TessPageIteratorOrientation(handle:PTessPageIterator; orientation:PTessOrientation; writing_direction:PTessWritingDirection; textline_order:PTessTextlineOrder; deskew_angle:Psingle);cdecl;external libtesseract;
procedure TessPageIteratorParagraphInfo(handle:PTessPageIterator; justification:PTessParagraphJustification; is_list_item:PBOOL; is_crown:PBOOL; first_line_indent:Plongint);cdecl;external libtesseract;
{ Result iterator  }
procedure TessResultIteratorDelete(handle:PTessResultIterator);cdecl;external libtesseract;
function TessResultIteratorCopy(handle:PTessResultIterator):PTessResultIterator;cdecl;external libtesseract;
function TessResultIteratorGetPageIterator(handle:PTessResultIterator):PTessPageIterator;cdecl;external libtesseract;
function TessResultIteratorGetPageIteratorConst(handle:PTessResultIterator):PTessPageIterator;cdecl;external libtesseract;
function TessResultIteratorGetChoiceIterator(handle:PTessResultIterator):PTessChoiceIterator;cdecl;external libtesseract;
function TessResultIteratorNext(handle:PTessResultIterator; level:TTessPageIteratorLevel):TBOOL;cdecl;external libtesseract;
function TessResultIteratorGetUTF8Text(handle:PTessResultIterator; level:TTessPageIteratorLevel):Pchar;cdecl;external libtesseract;
function TessResultIteratorConfidence(handle:PTessResultIterator; level:TTessPageIteratorLevel):single;cdecl;external libtesseract;
function TessResultIteratorWordRecognitionLanguage(handle:PTessResultIterator):Pchar;cdecl;external libtesseract;
function TessResultIteratorWordFontAttributes(handle:PTessResultIterator; is_bold:PBOOL; is_italic:PBOOL; is_underlined:PBOOL; is_monospace:PBOOL; 
           is_serif:PBOOL; is_smallcaps:PBOOL; pointsize:Plongint; font_id:Plongint):Pchar;cdecl;external libtesseract;
function TessResultIteratorWordIsFromDictionary(handle:PTessResultIterator):TBOOL;cdecl;external libtesseract;
function TessResultIteratorWordIsNumeric(handle:PTessResultIterator):TBOOL;cdecl;external libtesseract;
function TessResultIteratorSymbolIsSuperscript(handle:PTessResultIterator):TBOOL;cdecl;external libtesseract;
function TessResultIteratorSymbolIsSubscript(handle:PTessResultIterator):TBOOL;cdecl;external libtesseract;
function TessResultIteratorSymbolIsDropcap(handle:PTessResultIterator):TBOOL;cdecl;external libtesseract;
procedure TessChoiceIteratorDelete(handle:PTessChoiceIterator);cdecl;external libtesseract;
function TessChoiceIteratorNext(handle:PTessChoiceIterator):TBOOL;cdecl;external libtesseract;
function TessChoiceIteratorGetUTF8Text(handle:PTessChoiceIterator):Pchar;cdecl;external libtesseract;
function TessChoiceIteratorConfidence(handle:PTessChoiceIterator):single;cdecl;external libtesseract;
{ Progress monitor  }
function TessMonitorCreate:PETEXT_DESC;cdecl;external libtesseract;
procedure TessMonitorDelete(monitor:PETEXT_DESC);cdecl;external libtesseract;
procedure TessMonitorSetCancelFunc(monitor:PETEXT_DESC; cancelFunc:TTessCancelFunc);cdecl;external libtesseract;
procedure TessMonitorSetCancelThis(monitor:PETEXT_DESC; cancelThis:pointer);cdecl;external libtesseract;
function TessMonitorGetCancelThis(monitor:PETEXT_DESC):pointer;cdecl;external libtesseract;
procedure TessMonitorSetProgressFunc(monitor:PETEXT_DESC; progressFunc:TTessProgressFunc);cdecl;external libtesseract;
function TessMonitorGetProgress(monitor:PETEXT_DESC):longint;cdecl;external libtesseract;
procedure TessMonitorSetDeadlineMSecs(monitor:PETEXT_DESC; deadline:longint);cdecl;external libtesseract;
{ C++ end of extern C conditionnal removed }
{$endif}
{ API_CAPI_H_ }

// === Konventiert am: 17-8-25 17:13:22 ===


implementation



end.
