// SPDX-License-Identifier: Apache-2.0
// File:        capi.h
// Description: C-API TessBaseAPI
//
// (C) Copyright 2012, Google Inc.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// http://www.apache.org/licenses/LICENSE-2.0
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#ifndef API_CAPI_H_
#define API_CAPI_H_

#include "export.h"

#ifdef __cplusplus
#  include <tesseract/baseapi.h>
#  include <tesseract/ocrclass.h>
#  include <tesseract/pageiterator.h>
#  include <tesseract/renderer.h>
#  include <tesseract/resultiterator.h>
#endif

#include <stdbool.h>
#include <stdio.h>

#ifdef __cplusplus
extern "C" {
#endif

#ifndef BOOL
#  define BOOL int
#  define TRUE 1
#  define FALSE 0
#endif

#ifdef __cplusplus
typedef tesseract::TessResultRenderer TessResultRenderer;
typedef tesseract::TessBaseAPI TessBaseAPI;
typedef tesseract::PageIterator TessPageIterator;
typedef tesseract::ResultIterator TessResultIterator;
typedef tesseract::MutableIterator TessMutableIterator;
typedef tesseract::ChoiceIterator TessChoiceIterator;
typedef tesseract::OcrEngineMode TessOcrEngineMode;
typedef tesseract::PageSegMode TessPageSegMode;
typedef tesseract::PageIteratorLevel TessPageIteratorLevel;
typedef tesseract::Orientation TessOrientation;
typedef tesseract::ParagraphJustification TessParagraphJustification;
typedef tesseract::WritingDirection TessWritingDirection;
typedef tesseract::TextlineOrder TessTextlineOrder;
typedef tesseract::PolyBlockType TessPolyBlockType;
typedef tesseract::ETEXT_DESC ETEXT_DESC;
#else
typedef struct TessResultRenderer TessResultRenderer;
typedef struct TessBaseAPI TessBaseAPI;
typedef struct TessPageIterator TessPageIterator;
typedef struct TessResultIterator TessResultIterator;
typedef struct TessMutableIterator TessMutableIterator;
typedef struct TessChoiceIterator TessChoiceIterator;
typedef enum TessOcrEngineMode {
  OEM_TESSERACT_ONLY,
  OEM_LSTM_ONLY,
  OEM_TESSERACT_LSTM_COMBINED,
  OEM_DEFAULT
} TessOcrEngineMode;
typedef enum TessPageSegMode {
  PSM_OSD_ONLY,
  PSM_AUTO_OSD,
  PSM_AUTO_ONLY,
  PSM_AUTO,
  PSM_SINGLE_COLUMN,
  PSM_SINGLE_BLOCK_VERT_TEXT,
  PSM_SINGLE_BLOCK,
  PSM_SINGLE_LINE,
  PSM_SINGLE_WORD,
  PSM_CIRCLE_WORD,
  PSM_SINGLE_CHAR,
  PSM_SPARSE_TEXT,
  PSM_SPARSE_TEXT_OSD,
  PSM_RAW_LINE,
  PSM_COUNT
} TessPageSegMode;
typedef enum TessPageIteratorLevel {
  RIL_BLOCK,
  RIL_PARA,
  RIL_TEXTLINE,
  RIL_WORD,
  RIL_SYMBOL
} TessPageIteratorLevel;
typedef enum TessPolyBlockType {
  PT_UNKNOWN,
  PT_FLOWING_TEXT,
  PT_HEADING_TEXT,
  PT_PULLOUT_TEXT,
  PT_EQUATION,
  PT_INLINE_EQUATION,
  PT_TABLE,
  PT_VERTICAL_TEXT,
  PT_CAPTION_TEXT,
  PT_FLOWING_IMAGE,
  PT_HEADING_IMAGE,
  PT_PULLOUT_IMAGE,
  PT_HORZ_LINE,
  PT_VERT_LINE,
  PT_NOISE,
  PT_COUNT
} TessPolyBlockType;
typedef enum TessOrientation {
  ORIENTATION_PAGE_UP,
  ORIENTATION_PAGE_RIGHT,
  ORIENTATION_PAGE_DOWN,
  ORIENTATION_PAGE_LEFT
} TessOrientation;
typedef enum TessParagraphJustification {
  JUSTIFICATION_UNKNOWN,
  JUSTIFICATION_LEFT,
  JUSTIFICATION_CENTER,
  JUSTIFICATION_RIGHT
} TessParagraphJustification;
typedef enum TessWritingDirection {
  WRITING_DIRECTION_LEFT_TO_RIGHT,
  WRITING_DIRECTION_RIGHT_TO_LEFT,
  WRITING_DIRECTION_TOP_TO_BOTTOM
} TessWritingDirection;
typedef enum TessTextlineOrder {
  TEXTLINE_ORDER_LEFT_TO_RIGHT,
  TEXTLINE_ORDER_RIGHT_TO_LEFT,
  TEXTLINE_ORDER_TOP_TO_BOTTOM
} TessTextlineOrder;
typedef struct ETEXT_DESC ETEXT_DESC;
#endif

typedef bool (*TessCancelFunc)(void *cancel_this, int words);
typedef bool (*TessProgressFunc)(ETEXT_DESC *ths, int left, int right, int top,
                                 int bottom);

struct Pix;
struct Boxa;
struct Pixa;

/* General free functions */

extern const char *TessVersion();
extern void TessDeleteText(const char *text);
extern void TessDeleteTextArray(char **arr);
extern void TessDeleteIntArray(const int *arr);

/* Renderer API */
extern TessResultRenderer *TessTextRendererCreate(const char *outputbase);
extern TessResultRenderer *TessHOcrRendererCreate(const char *outputbase);
extern TessResultRenderer *TessHOcrRendererCreate2(const char *outputbase,
                                                     BOOL font_info);
extern TessResultRenderer *TessAltoRendererCreate(const char *outputbase);
extern TessResultRenderer *TessTsvRendererCreate(const char *outputbase);
extern TessResultRenderer *TessPDFRendererCreate(const char *outputbase,
                                                   const char *datadir,
                                                   BOOL textonly);
extern TessResultRenderer *TessUnlvRendererCreate(const char *outputbase);
extern TessResultRenderer *TessBoxTextRendererCreate(const char *outputbase);
extern TessResultRenderer *TessLSTMBoxRendererCreate(const char *outputbase);
extern TessResultRenderer *TessWordStrBoxRendererCreate(
    const char *outputbase);

extern void TessDeleteResultRenderer(TessResultRenderer *renderer);
extern void TessResultRendererInsert(TessResultRenderer *renderer,
                                       TessResultRenderer *next);
extern TessResultRenderer *TessResultRendererNext(
    TessResultRenderer *renderer);
extern BOOL TessResultRendererBeginDocument(TessResultRenderer *renderer,
                                              const char *title);
extern BOOL TessResultRendererAddImage(TessResultRenderer *renderer,
                                         TessBaseAPI *api);
extern BOOL TessResultRendererEndDocument(TessResultRenderer *renderer);

extern const char *TessResultRendererExtention(TessResultRenderer *renderer);
extern const char *TessResultRendererTitle(TessResultRenderer *renderer);
extern int TessResultRendererImageNum(TessResultRenderer *renderer);

/* Base API */

extern TessBaseAPI *TessBaseAPICreate();
extern void TessBaseAPIDelete(TessBaseAPI *handle);

extern size_t TessBaseAPIGetOpenCLDevice(TessBaseAPI *handle, void **device);

extern void TessBaseAPISetInputName(TessBaseAPI *handle, const char *name);
extern const char *TessBaseAPIGetInputName(TessBaseAPI *handle);

extern void TessBaseAPISetInputImage(TessBaseAPI *handle, struct Pix *pix);
extern struct Pix *TessBaseAPIGetInputImage(TessBaseAPI *handle);

extern int TessBaseAPIGetSourceYResolution(TessBaseAPI *handle);
extern const char *TessBaseAPIGetDatapath(TessBaseAPI *handle);

extern void TessBaseAPISetOutputName(TessBaseAPI *handle, const char *name);

extern BOOL TessBaseAPISetVariable(TessBaseAPI *handle, const char *name,
                                     const char *value);
extern BOOL TessBaseAPISetDebugVariable(TessBaseAPI *handle, const char *name,
                                          const char *value);

extern BOOL TessBaseAPIGetIntVariable(const TessBaseAPI *handle,
                                        const char *name, int *value);
extern BOOL TessBaseAPIGetBoolVariable(const TessBaseAPI *handle,
                                         const char *name, BOOL *value);
extern BOOL TessBaseAPIGetDoubleVariable(const TessBaseAPI *handle,
                                           const char *name, double *value);
extern const char *TessBaseAPIGetStringVariable(const TessBaseAPI *handle,
                                                  const char *name);

extern void TessBaseAPIPrintVariables(const TessBaseAPI *handle, FILE *fp);
extern BOOL TessBaseAPIPrintVariablesToFile(const TessBaseAPI *handle,
                                              const char *filename);

extern int TessBaseAPIInit1(TessBaseAPI *handle, const char *datapath,
                              const char *language, TessOcrEngineMode oem,
                              char **configs, int configs_size);
extern int TessBaseAPIInit2(TessBaseAPI *handle, const char *datapath,
                              const char *language, TessOcrEngineMode oem);
extern int TessBaseAPIInit3(TessBaseAPI *handle, const char *datapath,
                              const char *language);

extern int TessBaseAPIInit4(TessBaseAPI *handle, const char *datapath,
                              const char *language, TessOcrEngineMode mode,
                              char **configs, int configs_size, char **vars_vec,
                              char **vars_values, size_t vars_vec_size,
                              BOOL set_only_non_debug_params);

extern int TessBaseAPIInit5(TessBaseAPI *handle, const char *data, int data_size,
                              const char *language, TessOcrEngineMode mode,
                              char **configs, int configs_size, char **vars_vec,
                              char **vars_values, size_t vars_vec_size,
                              BOOL set_only_non_debug_params);

extern const char *TessBaseAPIGetInitLanguagesAsString(
    const TessBaseAPI *handle);
extern char **TessBaseAPIGetLoadedLanguagesAsVector(
    const TessBaseAPI *handle);
extern char **TessBaseAPIGetAvailableLanguagesAsVector(
    const TessBaseAPI *handle);

extern void TessBaseAPIInitForAnalysePage(TessBaseAPI *handle);

extern void TessBaseAPIReadConfigFile(TessBaseAPI *handle,
                                        const char *filename);
extern void TessBaseAPIReadDebugConfigFile(TessBaseAPI *handle,
                                             const char *filename);

extern void TessBaseAPISetPageSegMode(TessBaseAPI *handle,
                                        TessPageSegMode mode);
extern TessPageSegMode TessBaseAPIGetPageSegMode(const TessBaseAPI *handle);

extern char *TessBaseAPIRect(TessBaseAPI *handle,
                               const unsigned char *imagedata,
                               int bytes_per_pixel, int bytes_per_line,
                               int left, int top, int width, int height);

extern void TessBaseAPIClearAdaptiveClassifier(TessBaseAPI *handle);

extern void TessBaseAPISetImage(TessBaseAPI *handle,
                                  const unsigned char *imagedata, int width,
                                  int height, int bytes_per_pixel,
                                  int bytes_per_line);
extern void TessBaseAPISetImage2(TessBaseAPI *handle, struct Pix *pix);

extern void TessBaseAPISetSourceResolution(TessBaseAPI *handle, int ppi);

extern void TessBaseAPISetRectangle(TessBaseAPI *handle, int left, int top,
                                      int width, int height);

extern struct Pix *TessBaseAPIGetThresholdedImage(TessBaseAPI *handle);
extern struct Boxa *TessBaseAPIGetRegions(TessBaseAPI *handle,
                                            struct Pixa **pixa);
extern struct Boxa *TessBaseAPIGetTextlines(TessBaseAPI *handle,
                                              struct Pixa **pixa,
                                              int **blockids);
extern struct Boxa *TessBaseAPIGetTextlines1(TessBaseAPI *handle,
                                               BOOL raw_image, int raw_padding,
                                               struct Pixa **pixa,
                                               int **blockids, int **paraids);
extern struct Boxa *TessBaseAPIGetStrips(TessBaseAPI *handle,
                                           struct Pixa **pixa, int **blockids);
extern struct Boxa *TessBaseAPIGetWords(TessBaseAPI *handle,
                                          struct Pixa **pixa);
extern struct Boxa *TessBaseAPIGetConnectedComponents(TessBaseAPI *handle,
                                                        struct Pixa **cc);
extern struct Boxa *TessBaseAPIGetComponentImages(TessBaseAPI *handle,
                                                    TessPageIteratorLevel level,
                                                    BOOL text_only,
                                                    struct Pixa **pixa,
                                                    int **blockids);
extern struct Boxa *TessBaseAPIGetComponentImages1(
    TessBaseAPI *handle, TessPageIteratorLevel level, BOOL text_only,
    BOOL raw_image, int raw_padding, struct Pixa **pixa, int **blockids,
    int **paraids);

extern int TessBaseAPIGetThresholdedImageScaleFactor(
    const TessBaseAPI *handle);

extern TessPageIterator *TessBaseAPIAnalyseLayout(TessBaseAPI *handle);

extern int TessBaseAPIRecognize(TessBaseAPI *handle, ETEXT_DESC *monitor);

extern BOOL TessBaseAPIProcessPages(TessBaseAPI *handle, const char *filename,
                                      const char *retry_config,
                                      int timeout_millisec,
                                      TessResultRenderer *renderer);
extern BOOL TessBaseAPIProcessPage(TessBaseAPI *handle, struct Pix *pix,
                                     int page_index, const char *filename,
                                     const char *retry_config,
                                     int timeout_millisec,
                                     TessResultRenderer *renderer);

extern TessResultIterator *TessBaseAPIGetIterator(TessBaseAPI *handle);
extern TessMutableIterator *TessBaseAPIGetMutableIterator(
    TessBaseAPI *handle);

extern char *TessBaseAPIGetUTF8Text(TessBaseAPI *handle);
extern char *TessBaseAPIGetHOCRText(TessBaseAPI *handle, int page_number);

extern char *TessBaseAPIGetAltoText(TessBaseAPI *handle, int page_number);
extern char *TessBaseAPIGetTsvText(TessBaseAPI *handle, int page_number);

extern char *TessBaseAPIGetBoxText(TessBaseAPI *handle, int page_number);
extern char *TessBaseAPIGetLSTMBoxText(TessBaseAPI *handle, int page_number);
extern char *TessBaseAPIGetWordStrBoxText(TessBaseAPI *handle,
                                            int page_number);

extern char *TessBaseAPIGetUNLVText(TessBaseAPI *handle);
extern int TessBaseAPIMeanTextConf(TessBaseAPI *handle);

extern int *TessBaseAPIAllWordConfidences(TessBaseAPI *handle);

#ifndef DISABLED_LEGACY_ENGINE
extern BOOL TessBaseAPIAdaptToWordStr(TessBaseAPI *handle,
                                        TessPageSegMode mode,
                                        const char *wordstr);
#endif // #ifndef DISABLED_LEGACY_ENGINE

extern void TessBaseAPIClear(TessBaseAPI *handle);
extern void TessBaseAPIEnd(TessBaseAPI *handle);

extern int TessBaseAPIIsValidWord(TessBaseAPI *handle, const char *word);
extern BOOL TessBaseAPIGetTextDirection(TessBaseAPI *handle, int *out_offset,
                                          float *out_slope);

extern const char *TessBaseAPIGetUnichar(TessBaseAPI *handle, int unichar_id);

extern void TessBaseAPIClearPersistentCache(TessBaseAPI *handle);

#ifndef DISABLED_LEGACY_ENGINE

// Call TessDeleteText(*best_script_name) to free memory allocated by this
// function
extern BOOL TessBaseAPIDetectOrientationScript(TessBaseAPI *handle,
                                                 int *orient_deg,
                                                 float *orient_conf,
                                                 const char **script_name,
                                                 float *script_conf);
#endif // #ifndef DISABLED_LEGACY_ENGINE

extern void TessBaseAPISetMinOrientationMargin(TessBaseAPI *handle,
                                                 double margin);

extern int TessBaseAPINumDawgs(const TessBaseAPI *handle);

extern TessOcrEngineMode TessBaseAPIOem(const TessBaseAPI *handle);

extern void TessBaseGetBlockTextOrientations(TessBaseAPI *handle,
                                               int **block_orientation,
                                               bool **vertical_writing);

/* Page iterator */

extern void TessPageIteratorDelete(TessPageIterator *handle);

extern TessPageIterator *TessPageIteratorCopy(const TessPageIterator *handle);

extern void TessPageIteratorBegin(TessPageIterator *handle);

extern BOOL TessPageIteratorNext(TessPageIterator *handle,
                                   TessPageIteratorLevel level);

extern BOOL TessPageIteratorIsAtBeginningOf(const TessPageIterator *handle,
                                              TessPageIteratorLevel level);

extern BOOL TessPageIteratorIsAtFinalElement(const TessPageIterator *handle,
                                               TessPageIteratorLevel level,
                                               TessPageIteratorLevel element);

extern BOOL TessPageIteratorBoundingBox(const TessPageIterator *handle,
                                          TessPageIteratorLevel level,
                                          int *left, int *top, int *right,
                                          int *bottom);

extern TessPolyBlockType
TessPageIteratorBlockType(const TessPageIterator *handle);

extern struct Pix *TessPageIteratorGetBinaryImage(
    const TessPageIterator *handle, TessPageIteratorLevel level);

extern struct Pix *TessPageIteratorGetImage(const TessPageIterator *handle,
                                              TessPageIteratorLevel level,
                                              int padding,
                                              struct Pix *original_image,
                                              int *left, int *top);

extern BOOL TessPageIteratorBaseline(const TessPageIterator *handle,
                                       TessPageIteratorLevel level, int *x1,
                                       int *y1, int *x2, int *y2);

extern void TessPageIteratorOrientation(
    TessPageIterator *handle, TessOrientation *orientation,
    TessWritingDirection *writing_direction, TessTextlineOrder *textline_order,
    float *deskew_angle);

extern void TessPageIteratorParagraphInfo(
    TessPageIterator *handle, TessParagraphJustification *justification,
    BOOL *is_list_item, BOOL *is_crown, int *first_line_indent);

/* Result iterator */

extern void TessResultIteratorDelete(TessResultIterator *handle);
extern TessResultIterator *TessResultIteratorCopy(
    const TessResultIterator *handle);
extern TessPageIterator *TessResultIteratorGetPageIterator(
    TessResultIterator *handle);
extern const TessPageIterator *TessResultIteratorGetPageIteratorConst(
    const TessResultIterator *handle);
extern TessChoiceIterator *TessResultIteratorGetChoiceIterator(
    const TessResultIterator *handle);

extern BOOL TessResultIteratorNext(TessResultIterator *handle,
                                     TessPageIteratorLevel level);
extern char *TessResultIteratorGetUTF8Text(const TessResultIterator *handle,
                                             TessPageIteratorLevel level);
extern float TessResultIteratorConfidence(const TessResultIterator *handle,
                                            TessPageIteratorLevel level);
extern const char *TessResultIteratorWordRecognitionLanguage(
    const TessResultIterator *handle);
extern const char *TessResultIteratorWordFontAttributes(
    const TessResultIterator *handle, BOOL *is_bold, BOOL *is_italic,
    BOOL *is_underlined, BOOL *is_monospace, BOOL *is_serif, BOOL *is_smallcaps,
    int *pointsize, int *font_id);

extern BOOL
TessResultIteratorWordIsFromDictionary(const TessResultIterator *handle);
extern BOOL TessResultIteratorWordIsNumeric(const TessResultIterator *handle);
extern BOOL
TessResultIteratorSymbolIsSuperscript(const TessResultIterator *handle);
extern BOOL
TessResultIteratorSymbolIsSubscript(const TessResultIterator *handle);
extern BOOL
TessResultIteratorSymbolIsDropcap(const TessResultIterator *handle);

extern void TessChoiceIteratorDelete(TessChoiceIterator *handle);
extern BOOL TessChoiceIteratorNext(TessChoiceIterator *handle);
extern const char *TessChoiceIteratorGetUTF8Text(
    const TessChoiceIterator *handle);
extern float TessChoiceIteratorConfidence(const TessChoiceIterator *handle);

/* Progress monitor */

extern ETEXT_DESC *TessMonitorCreate();
extern void TessMonitorDelete(ETEXT_DESC *monitor);
extern void TessMonitorSetCancelFunc(ETEXT_DESC *monitor,
                                       TessCancelFunc cancelFunc);
extern void TessMonitorSetCancelThis(ETEXT_DESC *monitor, void *cancelThis);
extern void *TessMonitorGetCancelThis(ETEXT_DESC *monitor);
extern void TessMonitorSetProgressFunc(ETEXT_DESC *monitor,
                                         TessProgressFunc progressFunc);
extern int TessMonitorGetProgress(ETEXT_DESC *monitor);
extern void TessMonitorSetDeadlineMSecs(ETEXT_DESC *monitor, int deadline);

#ifdef __cplusplus
}
#endif

#endif // API_CAPI_H_
