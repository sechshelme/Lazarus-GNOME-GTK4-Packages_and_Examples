unit poppler;

interface

uses
  fp_glib2, fp_poppler_glib;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function poppler_error_quark: TGQuark; cdecl; external poppler_glib;
function POPPLER_ERROR: TGQuark;

type
  PPopplerError = ^TPopplerError;
  TPopplerError = longint;

const
  POPPLER_ERROR_INVALID = 0;
  POPPLER_ERROR_ENCRYPTED = 1;
  POPPLER_ERROR_OPEN_FILE = 2;
  POPPLER_ERROR_BAD_CATALOG = 3;
  POPPLER_ERROR_DAMAGED = 4;
  POPPLER_ERROR_SIGNING = 5;

type
  PPopplerPageTransitionType = ^TPopplerPageTransitionType;
  TPopplerPageTransitionType = longint;

const
  POPPLER_PAGE_TRANSITION_REPLACE = 0;
  POPPLER_PAGE_TRANSITION_SPLIT = 1;
  POPPLER_PAGE_TRANSITION_BLINDS = 2;
  POPPLER_PAGE_TRANSITION_BOX = 3;
  POPPLER_PAGE_TRANSITION_WIPE = 4;
  POPPLER_PAGE_TRANSITION_DISSOLVE = 5;
  POPPLER_PAGE_TRANSITION_GLITTER = 6;
  POPPLER_PAGE_TRANSITION_FLY = 7;
  POPPLER_PAGE_TRANSITION_PUSH = 8;
  POPPLER_PAGE_TRANSITION_COVER = 9;
  POPPLER_PAGE_TRANSITION_UNCOVER = 10;
  POPPLER_PAGE_TRANSITION_FADE = 11;

type
  PPopplerPageTransitionAlignment = ^TPopplerPageTransitionAlignment;
  TPopplerPageTransitionAlignment = longint;

const
  POPPLER_PAGE_TRANSITION_HORIZONTAL = 0;
  POPPLER_PAGE_TRANSITION_VERTICAL = 1;

type
  PPopplerPageTransitionDirection = ^TPopplerPageTransitionDirection;
  TPopplerPageTransitionDirection = longint;

const
  POPPLER_PAGE_TRANSITION_INWARD = 0;
  POPPLER_PAGE_TRANSITION_OUTWARD = 1;

type
  PPopplerSelectionStyle = ^TPopplerSelectionStyle;
  TPopplerSelectionStyle = longint;

const
  POPPLER_SELECTION_GLYPH = 0;
  POPPLER_SELECTION_WORD = 1;
  POPPLER_SELECTION_LINE = 2;

type
  PPopplerPrintFlags = ^TPopplerPrintFlags;
  TPopplerPrintFlags = longint;

const
  POPPLER_PRINT_DOCUMENT = 0;
  POPPLER_PRINT_MARKUP_ANNOTS = 1 shl 0;
  POPPLER_PRINT_STAMP_ANNOTS_ONLY = 1 shl 1;
  POPPLER_PRINT_ALL = POPPLER_PRINT_MARKUP_ANNOTS;

type
  PPopplerFindFlags = ^TPopplerFindFlags;
  TPopplerFindFlags = longint;

const
  POPPLER_FIND_DEFAULT = 0;
  POPPLER_FIND_CASE_SENSITIVE = 1 shl 0;
  POPPLER_FIND_BACKWARDS = 1 shl 1;
  POPPLER_FIND_WHOLE_WORDS_ONLY = 1 shl 2;
  POPPLER_FIND_IGNORE_DIACRITICS = 1 shl 3;
  POPPLER_FIND_MULTILINE = 1 shl 4;

type
  PPopplerDocument = type Pointer;
  PPopplerIndexIter = type Pointer;
  PPopplerFontsIter = type Pointer;
  PPPopplerFontsIter = ^PPopplerFontsIter;
  PPopplerLayersIter = type Pointer;
  PPopplerPoint = type Pointer;
  PPopplerRectangle = type Pointer;
  PPPopplerRectangle = ^PPopplerRectangle;
  PPopplerTextAttributes = type Pointer;
  PPopplerColor = type Pointer;
  PPopplerLinkMapping = type Pointer;
  PPopplerPageTransition = type Pointer;
  PPopplerImageMapping = type Pointer;
  PPopplerFormFieldMapping = type Pointer;
  PPopplerAnnotMapping = type Pointer;
  PPopplerPage = type Pointer;
  PPopplerFontInfo = type Pointer;
  PPopplerLayer = type Pointer;
  PPopplerPSFile = type Pointer;
  PPopplerAction = type Pointer;
  PPopplerDest = type Pointer;
  PPopplerActionLayer = type Pointer;
  PPopplerFormField = type Pointer;
  PPopplerAttachment = type Pointer;
  PPopplerMovie = type Pointer;
  PPopplerMedia = type Pointer;
  PPopplerAnnot = type Pointer;
  PPopplerAnnotMarkup = type Pointer;
  PPopplerAnnotText = type Pointer;
  PPopplerAnnotTextMarkup = type Pointer;
  PPopplerAnnotFreeText = type Pointer;
  PPopplerAnnotFileAttachment = type Pointer;
  PPopplerAnnotMovie = type Pointer;
  PPopplerAnnotScreen = type Pointer;
  PPopplerAnnotCalloutLine = type Pointer;
  PPopplerAnnotLine = type Pointer;
  PPopplerAnnotCircle = type Pointer;
  PPopplerAnnotSquare = type Pointer;
  PPopplerQuadrilateral = type Pointer;
  PPopplerStructureElement = type Pointer;
  PPopplerStructureElementIter = type Pointer;
  PPopplerTextSpan = type Pointer;
  PPPopplerTextSpan = ^PPopplerTextSpan;
  PPopplerPageRange = type Pointer;
  PPopplerSignatureInfo = type Pointer;
  PPopplerAnnotStamp = type Pointer;
  PPopplerCertificateInfo = type Pointer;
  PPopplerSigningData = type Pointer;


  PPopplerBackend = ^TPopplerBackend;
  TPopplerBackend = longint;

const
  POPPLER_BACKEND_UNKNOWN = 0;
  POPPLER_BACKEND_SPLASH = 1;
  POPPLER_BACKEND_CAIRO = 2;

function poppler_get_backend: TPopplerBackend; cdecl; external poppler_glib;
function poppler_get_version: pchar; cdecl; external poppler_glib;

// === Konventiert am: 15-8-25 16:52:42 ===


implementation


function POPPLER_ERROR: TGQuark;
begin
  POPPLER_ERROR := poppler_error_quark;
end;


end.
