unit fp_fontconfig;

interface

const
  {$IFDEF Linux}
  libfontconfig = 'libfontconfig';
  {$ENDIF}

  {$IFDEF Windows}
  libfontconfig = 'libfontconfig-1.dll';
  {$ENDIF}

type
  Pstat = type Pointer;
  Tva_list = type Pointer;


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TFcChar8 = uint8;
  PFcChar8 = ^TFcChar8;
  PPFcChar8 = ^PFcChar8;

  TFcChar16 = uint16;
  PFcChar16 = ^TFcChar16;

  TFcChar32 = uint32;
  PFcChar32 = ^TFcChar32;

  TFcBool = Boolean32;
  PFcBool = ^TFcBool;

function FC_VERSION: int64;

const
  FC_MAJOR = 2;
  FC_MINOR = 15;
  FC_REVISION = 0;

  FC_CACHE_VERSION_NUMBER = 9;
  FcFalse = 0;
  FcTrue = 1;
  FcDontCare = 2;
  FC_FAMILY = 'family';
  FC_STYLE = 'style';
  FC_SLANT = 'slant';
  FC_WEIGHT = 'weight';
  FC_SIZE = 'size';
  FC_ASPECT = 'aspect';
  FC_PIXEL_SIZE = 'pixelsize';
  FC_SPACING = 'spacing';
  FC_FOUNDRY = 'foundry';
  FC_ANTIALIAS = 'antialias';
  FC_HINTING = 'hinting';
  FC_HINT_STYLE = 'hintstyle';
  FC_VERTICAL_LAYOUT = 'verticallayout';
  FC_AUTOHINT = 'autohint';
  FC_GLOBAL_ADVANCE = 'globaladvance';
  FC_WIDTH = 'width';
  FC_FILE = 'file';
  FC_INDEX = 'index';
  FC_FT_FACE = 'ftface';
  FC_RASTERIZER = 'rasterizer';
  FC_OUTLINE = 'outline';
  FC_SCALABLE = 'scalable';
  FC_COLOR = 'color';
  FC_VARIABLE = 'variable';
  FC_SCALE = 'scale';
  FC_SYMBOL = 'symbol';
  FC_DPI = 'dpi';
  FC_RGBA = 'rgba';
  FC_MINSPACE = 'minspace';
  FC_SOURCE = 'source';
  FC_CHARSET = 'charset';
  FC_LANG = 'lang';
  FC_FONTVERSION = 'fontversion';
  FC_FULLNAME = 'fullname';
  FC_FAMILYLANG = 'familylang';
  FC_STYLELANG = 'stylelang';
  FC_FULLNAMELANG = 'fullnamelang';
  FC_CAPABILITY = 'capability';
  FC_FONTFORMAT = 'fontformat';
  FC_EMBOLDEN = 'embolden';
  FC_EMBEDDED_BITMAP = 'embeddedbitmap';
  FC_DECORATIVE = 'decorative';
  FC_LCD_FILTER = 'lcdfilter';
  FC_FONT_FEATURES = 'fontfeatures';
  FC_FONT_VARIATIONS = 'fontvariations';
  FC_NAMELANG = 'namelang';
  FC_PRGNAME = 'prgname';
  FC_HASH = 'hash';
  FC_POSTSCRIPT_NAME = 'postscriptname';
  FC_FONT_HAS_HINT = 'fonthashint';
  FC_ORDER = 'order';
  FC_DESKTOP_NAME = 'desktop';
  FC_NAMED_INSTANCE = 'namedinstance';
  FC_FONT_WRAPPER = 'fontwrapper';
  FC_CACHE_SUFFIX = '.cache-9';
  FC_DIR_CACHE_FILE = 'fonts.cache-9';
  FC_USER_CACHE_FILE = '.fonts.cache-9';
  FC_CHARWIDTH = 'charwidth';
  FC_CHAR_WIDTH = FC_CHARWIDTH;
  FC_CHAR_HEIGHT = 'charheight';
  FC_MATRIX = 'matrix';
  FC_WEIGHT_THIN = 0;
  FC_WEIGHT_EXTRALIGHT = 40;
  FC_WEIGHT_ULTRALIGHT = FC_WEIGHT_EXTRALIGHT;
  FC_WEIGHT_LIGHT = 50;
  FC_WEIGHT_DEMILIGHT = 55;
  FC_WEIGHT_SEMILIGHT = FC_WEIGHT_DEMILIGHT;
  FC_WEIGHT_BOOK = 75;
  FC_WEIGHT_REGULAR = 80;
  FC_WEIGHT_NORMAL = FC_WEIGHT_REGULAR;
  FC_WEIGHT_MEDIUM = 100;
  FC_WEIGHT_DEMIBOLD = 180;
  FC_WEIGHT_SEMIBOLD = FC_WEIGHT_DEMIBOLD;
  FC_WEIGHT_BOLD = 200;
  FC_WEIGHT_EXTRABOLD = 205;
  FC_WEIGHT_ULTRABOLD = FC_WEIGHT_EXTRABOLD;
  FC_WEIGHT_BLACK = 210;
  FC_WEIGHT_HEAVY = FC_WEIGHT_BLACK;
  FC_WEIGHT_EXTRABLACK = 215;
  FC_WEIGHT_ULTRABLACK = FC_WEIGHT_EXTRABLACK;
  FC_SLANT_ROMAN = 0;
  FC_SLANT_ITALIC = 100;
  FC_SLANT_OBLIQUE = 110;
  FC_WIDTH_ULTRACONDENSED = 50;
  FC_WIDTH_EXTRACONDENSED = 63;
  FC_WIDTH_CONDENSED = 75;
  FC_WIDTH_SEMICONDENSED = 87;
  FC_WIDTH_NORMAL = 100;
  FC_WIDTH_SEMIEXPANDED = 113;
  FC_WIDTH_EXPANDED = 125;
  FC_WIDTH_EXTRAEXPANDED = 150;
  FC_WIDTH_ULTRAEXPANDED = 200;
  FC_PROPORTIONAL = 0;
  FC_DUAL = 90;
  FC_MONO = 100;
  FC_CHARCELL = 110;
  FC_RGBA_UNKNOWN = 0;
  FC_RGBA_RGB = 1;
  FC_RGBA_BGR = 2;
  FC_RGBA_VRGB = 3;
  FC_RGBA_VBGR = 4;
  FC_RGBA_NONE = 5;
  FC_HINT_NONE = 0;
  FC_HINT_SLIGHT = 1;
  FC_HINT_MEDIUM = 2;
  FC_HINT_FULL = 3;
  FC_LCD_NONE = 0;
  FC_LCD_DEFAULT = 1;
  FC_LCD_LIGHT = 2;
  FC_LCD_LEGACY = 3;

type
  PFcType = ^TFcType;
  TFcType = longint;

const
  FcTypeUnknown = -(1);
  FcTypeVoid = (-(1)) + 1;
  FcTypeInteger = (-(1)) + 2;
  FcTypeDouble = (-(1)) + 3;
  FcTypeString = (-(1)) + 4;
  FcTypeBool = (-(1)) + 5;
  FcTypeMatrix = (-(1)) + 6;
  FcTypeCharSet = (-(1)) + 7;
  FcTypeFTFace = (-(1)) + 8;
  FcTypeLangSet = (-(1)) + 9;
  FcTypeRange = (-(1)) + 10;

type
  TFcMatrix = record
    xx: double;
    xy: double;
    yx: double;
    yy: double;
  end;
  PFcMatrix = ^TFcMatrix;
  PPFcMatrix = ^PFcMatrix;

procedure FcMatrixInit(m: PFcMatrix);

type
  PFcCharSet = type Pointer;
  PPFcCharSet = ^PFcCharSet;

type
  TFcObjectType = record
    obj: pchar;
    _type: TFcType;
  end;
  PFcObjectType = ^TFcObjectType;

  TFcConstant = record
    name: PFcChar8;
    obj: pchar;
    value: longint;
  end;
  PFcConstant = ^TFcConstant;

type
  PFcResult = ^TFcResult;
  TFcResult = longint;

const
  FcResultMatch = 0;
  FcResultNoMatch = 1;
  FcResultTypeMismatch = 2;
  FcResultNoId = 3;
  FcResultOutOfMemory = 4;

type
  PFcValueBinding = ^TFcValueBinding;
  TFcValueBinding = longint;

const
  FcValueBindingWeak = 0;
  FcValueBindingStrong = 1;
  FcValueBindingSame = 2;
  FcValueBindingEnd = 2147483647;  //INT_MAX;

type
  PFcPattern = type Pointer;

  TFcPatternIter = record
    dummy1: pointer;
    dummy2: pointer;
  end;
  PFcPatternIter = ^TFcPatternIter;

  PFcLangSet = type Pointer;
  PPFcLangSet = ^PFcLangSet;
  PFcRange = type Pointer;
  PPFcRange = ^PFcRange;

  TFcValue = record
    _type: TFcType;
    u: record
      case longint of
        0: (s: PFcChar8);
        1: (i: longint);
        2: (b: TFcBool);
        3: (d: double);
        4: (m: PFcMatrix);
        5: (c: PFcCharSet);
        6: (f: pointer);
        7: (l: PFcLangSet);
        8: (r: PFcRange);
      end;
  end;
  PFcValue = ^TFcValue;

  TFcFontSet = record
    nfont: longint;
    sfont: longint;
    fonts: ^PFcPattern;
  end;
  PFcFontSet = ^TFcFontSet;
  PPFcFontSet = ^PFcFontSet;

  TFcObjectSet = record
    nobject: longint;
    sobject: longint;
    objects: ^pchar;
  end;
  PFcObjectSet = ^TFcObjectSet;

type
  PFcMatchKind = ^TFcMatchKind;
  TFcMatchKind = longint;

const
  FcMatchPattern = 0;
  FcMatchFont = 1;
  FcMatchScan = 2;
  FcMatchKindEnd = 3;
  FcMatchKindBegin = FcMatchPattern;

type
  PFcLangResult = ^TFcLangResult;
  TFcLangResult = longint;

const
  FcLangEqual = 0;
  FcLangDifferentCountry = 1;
  FcLangDifferentTerritory = 1;
  FcLangDifferentLang = 2;

type
  PFcSetName = ^TFcSetName;
  TFcSetName = longint;

const
  FcSetSystem = 0;
  FcSetApplication = 1;

type
  TFcConfigFileInfoIter = record
    dummy1: pointer;
    dummy2: pointer;
    dummy3: pointer;
  end;
  PFcConfigFileInfoIter = ^TFcConfigFileInfoIter;

type
  PFcAtomic = type Pointer;

type
  PFcEndian = ^TFcEndian;
  TFcEndian = longint;

const
  FcEndianBig = 0;
  FcEndianLittle = 1;

type
  PFcConfig = type Pointer;
  PFcFileCache = type Pointer;
  PFcBlanks = type Pointer;
  PFcStrList = type Pointer;
  PFcStrSet = type Pointer;
  PFcCache = type Pointer;

function FcBlanksCreate: PFcBlanks; cdecl; external libfontconfig;
procedure FcBlanksDestroy(b: PFcBlanks); cdecl; external libfontconfig;
function FcBlanksAdd(b: PFcBlanks; ucs4: TFcChar32): TFcBool; cdecl; external libfontconfig;
function FcBlanksIsMember(b: PFcBlanks; ucs4: TFcChar32): TFcBool; cdecl; external libfontconfig;
function FcCacheDir(c: PFcCache): PFcChar8; cdecl; external libfontconfig;
function FcCacheCopySet(c: PFcCache): PFcFontSet; cdecl; external libfontconfig;
function FcCacheSubdir(c: PFcCache; i: longint): PFcChar8; cdecl; external libfontconfig;
function FcCacheNumSubdir(c: PFcCache): longint; cdecl; external libfontconfig;
function FcCacheNumFont(c: PFcCache): longint; cdecl; external libfontconfig;
function FcDirCacheUnlink(dir: PFcChar8; config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcDirCacheValid(cache_file: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcDirCacheClean(cache_dir: PFcChar8; verbose: TFcBool): TFcBool; cdecl; external libfontconfig;
procedure FcCacheCreateTagFile(config: PFcConfig); cdecl; external libfontconfig;
function FcDirCacheCreateUUID(dir: PFcChar8; force: TFcBool; config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcDirCacheDeleteUUID(dir: PFcChar8; config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcConfigHome: PFcChar8; cdecl; external libfontconfig;
function FcConfigEnableHome(enable: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcConfigGetFilename(config: PFcConfig; url: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcConfigFilename(url: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcConfigCreate: PFcConfig; cdecl; external libfontconfig;
function FcConfigReference(config: PFcConfig): PFcConfig; cdecl; external libfontconfig;
procedure FcConfigDestroy(config: PFcConfig); cdecl; external libfontconfig;
function FcConfigSetCurrent(config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcConfigGetCurrent: PFcConfig; cdecl; external libfontconfig;
function FcConfigUptoDate(config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcConfigBuildFonts(config: PFcConfig): TFcBool; cdecl; external libfontconfig;
function FcConfigGetFontDirs(config: PFcConfig): PFcStrList; cdecl; external libfontconfig;
function FcConfigGetConfigDirs(config: PFcConfig): PFcStrList; cdecl; external libfontconfig;
function FcConfigGetConfigFiles(config: PFcConfig): PFcStrList; cdecl; external libfontconfig;
function FcConfigGetCache(config: PFcConfig): PFcChar8; cdecl; external libfontconfig;
function FcConfigGetBlanks(config: PFcConfig): PFcBlanks; cdecl; external libfontconfig;
function FcConfigGetCacheDirs(config: PFcConfig): PFcStrList; cdecl; external libfontconfig;
function FcConfigGetRescanInterval(config: PFcConfig): longint; cdecl; external libfontconfig;
function FcConfigSetRescanInterval(config: PFcConfig; rescanInterval: longint): TFcBool; cdecl; external libfontconfig;
function FcConfigGetFonts(config: PFcConfig; set_: TFcSetName): PFcFontSet; cdecl; external libfontconfig;
function FcConfigAppFontAddFile(config: PFcConfig; file_: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcConfigAppFontAddDir(config: PFcConfig; dir: PFcChar8): TFcBool; cdecl; external libfontconfig;
procedure FcConfigAppFontClear(config: PFcConfig); cdecl; external libfontconfig;
function FcConfigSubstituteWithPat(config: PFcConfig; p: PFcPattern; p_pat: PFcPattern; kind: TFcMatchKind): TFcBool; cdecl; external libfontconfig;
function FcConfigSubstitute(config: PFcConfig; p: PFcPattern; kind: TFcMatchKind): TFcBool; cdecl; external libfontconfig;
function FcConfigGetSysRoot(config: PFcConfig): PFcChar8; cdecl; external libfontconfig;
procedure FcConfigSetSysRoot(config: PFcConfig; sysroot: PFcChar8); cdecl; external libfontconfig;
procedure FcConfigFileInfoIterInit(config: PFcConfig; iter: PFcConfigFileInfoIter); cdecl; external libfontconfig;
function FcConfigFileInfoIterNext(config: PFcConfig; iter: PFcConfigFileInfoIter): TFcBool; cdecl; external libfontconfig;
function FcConfigFileInfoIterGet(config: PFcConfig; iter: PFcConfigFileInfoIter; name: PPFcChar8; description: PPFcChar8; enabled: PFcBool): TFcBool; cdecl; external libfontconfig;
function FcCharSetCreate: PFcCharSet; cdecl; external libfontconfig;
function FcCharSetNew: PFcCharSet; cdecl; external libfontconfig;
procedure FcCharSetDestroy(fcs: PFcCharSet); cdecl; external libfontconfig;
function FcCharSetAddChar(fcs: PFcCharSet; ucs4: TFcChar32): TFcBool; cdecl; external libfontconfig;
function FcCharSetDelChar(fcs: PFcCharSet; ucs4: TFcChar32): TFcBool; cdecl; external libfontconfig;
function FcCharSetCopy(src: PFcCharSet): PFcCharSet; cdecl; external libfontconfig;
function FcCharSetEqual(a: PFcCharSet; b: PFcCharSet): TFcBool; cdecl; external libfontconfig;
function FcCharSetIntersect(a: PFcCharSet; b: PFcCharSet): PFcCharSet; cdecl; external libfontconfig;
function FcCharSetUnion(a: PFcCharSet; b: PFcCharSet): PFcCharSet; cdecl; external libfontconfig;
function FcCharSetSubtract(a: PFcCharSet; b: PFcCharSet): PFcCharSet; cdecl; external libfontconfig;
function FcCharSetMerge(a: PFcCharSet; b: PFcCharSet; changed: PFcBool): TFcBool; cdecl; external libfontconfig;
function FcCharSetHasChar(fcs: PFcCharSet; ucs4: TFcChar32): TFcBool; cdecl; external libfontconfig;
function FcCharSetCount(a: PFcCharSet): TFcChar32; cdecl; external libfontconfig;
function FcCharSetIntersectCount(a: PFcCharSet; b: PFcCharSet): TFcChar32; cdecl; external libfontconfig;
function FcCharSetSubtractCount(a: PFcCharSet; b: PFcCharSet): TFcChar32; cdecl; external libfontconfig;
function FcCharSetIsSubset(a: PFcCharSet; b: PFcCharSet): TFcBool; cdecl; external libfontconfig;

const
  FC_CHARSET_MAP_SIZE = 256 div 32;
  FC_CHARSET_DONE = TFcChar32(-(1));

function FcCharSetFirstPage(a: PFcCharSet; map: PFcChar32; next: PFcChar32): TFcChar32; cdecl; external libfontconfig;
function FcCharSetNextPage(a: PFcCharSet; map: PFcChar32; next: PFcChar32): TFcChar32; cdecl; external libfontconfig;
function FcCharSetCoverage(a: PFcCharSet; page: TFcChar32; result: PFcChar32): TFcChar32; cdecl; external libfontconfig;
procedure FcValuePrint(v: TFcValue); cdecl; external libfontconfig;
procedure FcPatternPrint(p: PFcPattern); cdecl; external libfontconfig;
procedure FcFontSetPrint(s: PFcFontSet); cdecl; external libfontconfig;
function FcGetDefaultLangs: PFcStrSet; cdecl; external libfontconfig;
procedure FcDefaultSubstitute(pattern: PFcPattern); cdecl; external libfontconfig;
function FcFileIsDir(file_: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcFileScan(set_: PFcFontSet; dirs: PFcStrSet; cache: PFcFileCache; blanks: PFcBlanks; file_: PFcChar8; force: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcDirScan(set_: PFcFontSet; dirs: PFcStrSet; cache: PFcFileCache; blanks: PFcBlanks; dir: PFcChar8; force: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcDirSave(set_: PFcFontSet; dirs: PFcStrSet; dir: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcDirCacheLoad(dir: PFcChar8; config: PFcConfig; cache_file: PPFcChar8): PFcCache; cdecl; external libfontconfig;
function FcDirCacheRescan(dir: PFcChar8; config: PFcConfig): PFcCache; cdecl; external libfontconfig;
function FcDirCacheRead(dir: PFcChar8; force: TFcBool; config: PFcConfig): PFcCache; cdecl; external libfontconfig;
function FcDirCacheLoadFile(cache_file: PFcChar8; file_stat: Pstat): PFcCache; cdecl; external libfontconfig;
procedure FcDirCacheUnload(cache: PFcCache); cdecl; external libfontconfig;
function FcFreeTypeQuery(file_: PFcChar8; id: dword; blanks: PFcBlanks; count: Plongint): PFcPattern; cdecl; external libfontconfig;
function FcFreeTypeQueryAll(file_: PFcChar8; id: dword; blanks: PFcBlanks; count: Plongint; set_: PFcFontSet): dword; cdecl; external libfontconfig;
function FcFontSetCreate: PFcFontSet; cdecl; external libfontconfig;
procedure FcFontSetDestroy(s: PFcFontSet); cdecl; external libfontconfig;
function FcFontSetAdd(s: PFcFontSet; font: PFcPattern): TFcBool; cdecl; external libfontconfig;
function FcInitLoadConfig: PFcConfig; cdecl; external libfontconfig;
function FcInitLoadConfigAndFonts: PFcConfig; cdecl; external libfontconfig;
function FcInit: TFcBool; cdecl; external libfontconfig;
procedure FcFini; cdecl; external libfontconfig;
function FcGetVersion: longint; cdecl; external libfontconfig;
function FcInitReinitialize: TFcBool; cdecl; external libfontconfig;
function FcInitBringUptoDate: TFcBool; cdecl; external libfontconfig;
function FcGetLangs: PFcStrSet; cdecl; external libfontconfig;
function FcLangNormalize(lang: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcLangGetCharSet(lang: PFcChar8): PFcCharSet; cdecl; external libfontconfig;
function FcLangSetCreate: PFcLangSet; cdecl; external libfontconfig;
procedure FcLangSetDestroy(ls: PFcLangSet); cdecl; external libfontconfig;
function FcLangSetCopy(ls: PFcLangSet): PFcLangSet; cdecl; external libfontconfig;
function FcLangSetAdd(ls: PFcLangSet; lang: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcLangSetDel(ls: PFcLangSet; lang: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcLangSetHasLang(ls: PFcLangSet; lang: PFcChar8): TFcLangResult; cdecl; external libfontconfig;
function FcLangSetCompare(lsa: PFcLangSet; lsb: PFcLangSet): TFcLangResult; cdecl; external libfontconfig;
function FcLangSetContains(lsa: PFcLangSet; lsb: PFcLangSet): TFcBool; cdecl; external libfontconfig;
function FcLangSetEqual(lsa: PFcLangSet; lsb: PFcLangSet): TFcBool; cdecl; external libfontconfig;
function FcLangSetHash(ls: PFcLangSet): TFcChar32; cdecl; external libfontconfig;
function FcLangSetGetLangs(ls: PFcLangSet): PFcStrSet; cdecl; external libfontconfig;
function FcLangSetUnion(a: PFcLangSet; b: PFcLangSet): PFcLangSet; cdecl; external libfontconfig;
function FcLangSetSubtract(a: PFcLangSet; b: PFcLangSet): PFcLangSet; cdecl; external libfontconfig;
function FcObjectSetCreate: PFcObjectSet; cdecl; external libfontconfig;
function FcObjectSetAdd(os: PFcObjectSet; obj: pchar): TFcBool; cdecl; external libfontconfig;
procedure FcObjectSetDestroy(os: PFcObjectSet); cdecl; external libfontconfig;
function FcObjectSetVaBuild(first: pchar; va: Tva_list): PFcObjectSet; cdecl; external libfontconfig;
function FcObjectSetBuild(first: pchar): PFcObjectSet; cdecl; varargs; external libfontconfig;
function FcFontSetList(config: PFcConfig; sets: PPFcFontSet; nsets: longint; p: PFcPattern; os: PFcObjectSet): PFcFontSet; cdecl; external libfontconfig;
function FcFontList(config: PFcConfig; p: PFcPattern; os: PFcObjectSet): PFcFontSet; cdecl; external libfontconfig;
function FcAtomicCreate(file_: PFcChar8): PFcAtomic; cdecl; external libfontconfig;
function FcAtomicLock(atomic: PFcAtomic): TFcBool; cdecl; external libfontconfig;
function FcAtomicNewFile(atomic: PFcAtomic): PFcChar8; cdecl; external libfontconfig;
function FcAtomicOrigFile(atomic: PFcAtomic): PFcChar8; cdecl; external libfontconfig;
function FcAtomicReplaceOrig(atomic: PFcAtomic): TFcBool; cdecl; external libfontconfig;
procedure FcAtomicDeleteNew(atomic: PFcAtomic); cdecl; external libfontconfig;
procedure FcAtomicUnlock(atomic: PFcAtomic); cdecl; external libfontconfig;
procedure FcAtomicDestroy(atomic: PFcAtomic); cdecl; external libfontconfig;
function FcFontSetMatch(config: PFcConfig; sets: PPFcFontSet; nsets: longint; p: PFcPattern; result: PFcResult): PFcPattern; cdecl; external libfontconfig;
function FcFontMatch(config: PFcConfig; p: PFcPattern; result: PFcResult): PFcPattern; cdecl; external libfontconfig;
function FcFontRenderPrepare(config: PFcConfig; pat: PFcPattern; font: PFcPattern): PFcPattern; cdecl; external libfontconfig;
function FcFontSetSort(config: PFcConfig; sets: PPFcFontSet; nsets: longint; p: PFcPattern; trim: TFcBool; csp: PPFcCharSet; result: PFcResult): PFcFontSet; cdecl; external libfontconfig;
function FcFontSort(config: PFcConfig; p: PFcPattern; trim: TFcBool; csp: PPFcCharSet; result: PFcResult): PFcFontSet; cdecl; external libfontconfig;
procedure FcFontSetSortDestroy(fs: PFcFontSet); cdecl; external libfontconfig;
function FcMatrixCopy(mat: PFcMatrix): PFcMatrix; cdecl; external libfontconfig;
function FcMatrixEqual(mat1: PFcMatrix; mat2: PFcMatrix): TFcBool; cdecl; external libfontconfig;
procedure FcMatrixMultiply(result: PFcMatrix; a: PFcMatrix; b: PFcMatrix); cdecl; external libfontconfig;
procedure FcMatrixRotate(m: PFcMatrix; c: double; s: double); cdecl; external libfontconfig;
procedure FcMatrixScale(m: PFcMatrix; sx: double; sy: double); cdecl; external libfontconfig;
procedure FcMatrixShear(m: PFcMatrix; sh: double; sv: double); cdecl; external libfontconfig;
function FcNameRegisterObjectTypes(types: PFcObjectType; ntype: longint): TFcBool; cdecl; external libfontconfig;
function FcNameUnregisterObjectTypes(types: PFcObjectType; ntype: longint): TFcBool; cdecl; external libfontconfig;
function FcNameGetObjectType(obj: pchar): PFcObjectType; cdecl; external libfontconfig;
function FcNameRegisterConstants(consts: PFcConstant; nconsts: longint): TFcBool; cdecl; external libfontconfig;
function FcNameUnregisterConstants(consts: PFcConstant; nconsts: longint): TFcBool; cdecl; external libfontconfig;
function FcNameGetConstant(_string: PFcChar8): PFcConstant; cdecl; external libfontconfig;
function FcNameGetConstantFor(_string: PFcChar8; obj: pchar): PFcConstant; cdecl; external libfontconfig;
function FcNameConstant(_string: PFcChar8; result: Plongint): TFcBool; cdecl; external libfontconfig;
function FcNameParse(name: PFcChar8): PFcPattern; cdecl; external libfontconfig;
function FcNameUnparse(pat: PFcPattern): PFcChar8; cdecl; external libfontconfig;
function FcPatternCreate: PFcPattern; cdecl; external libfontconfig;
function FcPatternDuplicate(p: PFcPattern): PFcPattern; cdecl; external libfontconfig;
procedure FcPatternReference(p: PFcPattern); cdecl; external libfontconfig;
function FcPatternFilter(p: PFcPattern; os: PFcObjectSet): PFcPattern; cdecl; external libfontconfig;
procedure FcValueDestroy(v: TFcValue); cdecl; external libfontconfig;
function FcValueEqual(va: TFcValue; vb: TFcValue): TFcBool; cdecl; external libfontconfig;
function FcValueSave(v: TFcValue): TFcValue; cdecl; external libfontconfig;
procedure FcPatternDestroy(p: PFcPattern); cdecl; external libfontconfig;
function FcPatternObjectCount(pat: PFcPattern): longint; cdecl; external libfontconfig;
function FcPatternEqual(pa: PFcPattern; pb: PFcPattern): TFcBool; cdecl; external libfontconfig;
function FcPatternEqualSubset(pa: PFcPattern; pb: PFcPattern; os: PFcObjectSet): TFcBool; cdecl; external libfontconfig;
function FcPatternHash(p: PFcPattern): TFcChar32; cdecl; external libfontconfig;
function FcPatternAdd(p: PFcPattern; obj: pchar; value: TFcValue; append: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcPatternAddWeak(p: PFcPattern; obj: pchar; value: TFcValue; append: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcPatternGet(p: PFcPattern; obj: pchar; id: longint; v: PFcValue): TFcResult; cdecl; external libfontconfig;
function FcPatternGetWithBinding(p: PFcPattern; obj: pchar; id: longint; v: PFcValue; b: PFcValueBinding): TFcResult; cdecl; external libfontconfig;
function FcPatternDel(p: PFcPattern; obj: pchar): TFcBool; cdecl; external libfontconfig;
function FcPatternRemove(p: PFcPattern; obj: pchar; id: longint): TFcBool; cdecl; external libfontconfig;
function FcPatternAddInteger(p: PFcPattern; obj: pchar; i: longint): TFcBool; cdecl; external libfontconfig;
function FcPatternAddDouble(p: PFcPattern; obj: pchar; d: double): TFcBool; cdecl; external libfontconfig;
function FcPatternAddString(p: PFcPattern; obj: pchar; s: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcPatternAddMatrix(p: PFcPattern; obj: pchar; s: PFcMatrix): TFcBool; cdecl; external libfontconfig;
function FcPatternAddCharSet(p: PFcPattern; obj: pchar; c: PFcCharSet): TFcBool; cdecl; external libfontconfig;
function FcPatternAddBool(p: PFcPattern; obj: pchar; b: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcPatternAddLangSet(p: PFcPattern; obj: pchar; ls: PFcLangSet): TFcBool; cdecl; external libfontconfig;
function FcPatternAddRange(p: PFcPattern; obj: pchar; r: PFcRange): TFcBool; cdecl; external libfontconfig;
function FcPatternGetInteger(p: PFcPattern; obj: pchar; n: longint; i: Plongint): TFcResult; cdecl; external libfontconfig;
function FcPatternGetDouble(p: PFcPattern; obj: pchar; n: longint; d: Pdouble): TFcResult; cdecl; external libfontconfig;
function FcPatternGetString(p: PFcPattern; obj: pchar; n: longint; s: PPFcChar8): TFcResult; cdecl; external libfontconfig;
function FcPatternGetMatrix(p: PFcPattern; obj: pchar; n: longint; s: PPFcMatrix): TFcResult; cdecl; external libfontconfig;
function FcPatternGetCharSet(p: PFcPattern; obj: pchar; n: longint; c: PPFcCharSet): TFcResult; cdecl; external libfontconfig;
function FcPatternGetBool(p: PFcPattern; obj: pchar; n: longint; b: PFcBool): TFcResult; cdecl; external libfontconfig;
function FcPatternGetLangSet(p: PFcPattern; obj: pchar; n: longint; ls: PPFcLangSet): TFcResult; cdecl; external libfontconfig;
function FcPatternGetRange(p: PFcPattern; obj: pchar; id: longint; r: PPFcRange): TFcResult; cdecl; external libfontconfig;
function FcPatternVaBuild(p: PFcPattern; va: Tva_list): PFcPattern; cdecl; external libfontconfig;
function FcPatternBuild(p: PFcPattern): PFcPattern; cdecl; varargs; external libfontconfig;
function FcPatternFormat(pat: PFcPattern; format: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcRangeCreateDouble(begin_: double; end_: double): PFcRange; cdecl; external libfontconfig;
function FcRangeCreateInteger(begin_: TFcChar32; end_: TFcChar32): PFcRange; cdecl; external libfontconfig;
procedure FcRangeDestroy(range: PFcRange); cdecl; external libfontconfig;
function FcRangeCopy(r: PFcRange): PFcRange; cdecl; external libfontconfig;
function FcRangeGetDouble(range: PFcRange; begin_: Pdouble; end_: Pdouble): TFcBool; cdecl; external libfontconfig;
procedure FcPatternIterStart(pat: PFcPattern; iter: PFcPatternIter); cdecl; external libfontconfig;
function FcPatternIterNext(pat: PFcPattern; iter: PFcPatternIter): TFcBool; cdecl; external libfontconfig;
function FcPatternIterEqual(p1: PFcPattern; i1: PFcPatternIter; p2: PFcPattern; i2: PFcPatternIter): TFcBool; cdecl; external libfontconfig;
function FcPatternFindIter(pat: PFcPattern; iter: PFcPatternIter; obj: pchar): TFcBool; cdecl; external libfontconfig;
function FcPatternIterIsValid(pat: PFcPattern; iter: PFcPatternIter): TFcBool; cdecl; external libfontconfig;
function FcPatternIterGetObject(pat: PFcPattern; iter: PFcPatternIter): pchar; cdecl; external libfontconfig;
function FcPatternIterValueCount(pat: PFcPattern; iter: PFcPatternIter): longint; cdecl; external libfontconfig;
function FcPatternIterGetValue(pat: PFcPattern; iter: PFcPatternIter; id: longint; v: PFcValue; b: PFcValueBinding): TFcResult; cdecl; external libfontconfig;
function FcWeightFromOpenType(ot_weight: longint): longint; cdecl; external libfontconfig;
function FcWeightFromOpenTypeDouble(ot_weight: double): double; cdecl; external libfontconfig;
function FcWeightToOpenType(fc_weight: longint): longint; cdecl; external libfontconfig;
function FcWeightToOpenTypeDouble(fc_weight: double): double; cdecl; external libfontconfig;
function FcStrCopy(s: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrCopyFilename(s: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrPlus(s1: PFcChar8; s2: PFcChar8): PFcChar8; cdecl; external libfontconfig;
procedure FcStrFree(s: PFcChar8); cdecl; external libfontconfig;

function FcIsUpper(c: char): boolean;
function FcIsLower(c: char): boolean;
function FcToLower(c: char): char;

function FcStrDowncase(s: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrCmpIgnoreCase(s1: PFcChar8; s2: PFcChar8): longint; cdecl; external libfontconfig;
function FcStrCmp(s1: PFcChar8; s2: PFcChar8): longint; cdecl; external libfontconfig;
function FcStrStrIgnoreCase(s1: PFcChar8; s2: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrStr(s1: PFcChar8; s2: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcUtf8ToUcs4(src_orig: PFcChar8; dst: PFcChar32; len: longint): longint; cdecl; external libfontconfig;
function FcUtf8Len(_string: PFcChar8; len: longint; nchar: Plongint; wchar: Plongint): TFcBool; cdecl; external libfontconfig;

const
  FC_UTF8_MAX_LEN = 6;

function FcUcs4ToUtf8(ucs4: TFcChar32; dest: PFcChar8): longint; cdecl; external libfontconfig;
function FcUtf16ToUcs4(src_orig: PFcChar8; endian: TFcEndian; dst: PFcChar32; len: longint): longint; cdecl; external libfontconfig;
function FcUtf16Len(_string: PFcChar8; endian: TFcEndian; len: longint; nchar: Plongint; wchar: Plongint): TFcBool; cdecl; external libfontconfig;
function FcStrBuildFilename(path: PFcChar8): PFcChar8; cdecl; varargs; external libfontconfig;
function FcStrDirname(file_: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrBasename(file_: PFcChar8): PFcChar8; cdecl; external libfontconfig;
function FcStrSetCreate: PFcStrSet; cdecl; external libfontconfig;
function FcStrSetMember(set_: PFcStrSet; s: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcStrSetEqual(sa: PFcStrSet; sb: PFcStrSet): TFcBool; cdecl; external libfontconfig;
function FcStrSetAdd(set_: PFcStrSet; s: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcStrSetAddFilename(set_: PFcStrSet; s: PFcChar8): TFcBool; cdecl; external libfontconfig;
function FcStrSetDel(set_: PFcStrSet; s: PFcChar8): TFcBool; cdecl; external libfontconfig;
procedure FcStrSetDestroy(set_: PFcStrSet); cdecl; external libfontconfig;
function FcStrListCreate(set_: PFcStrSet): PFcStrList; cdecl; external libfontconfig;
procedure FcStrListFirst(list: PFcStrList); cdecl; external libfontconfig;
function FcStrListNext(list: PFcStrList): PFcChar8; cdecl; external libfontconfig;
procedure FcStrListDone(list: PFcStrList); cdecl; external libfontconfig;
function FcConfigParseAndLoad(config: PFcConfig; file_: PFcChar8; complain: TFcBool): TFcBool; cdecl; external libfontconfig;
function FcConfigParseAndLoadFromMemory(config: PFcConfig; buffer: PFcChar8; complain: TFcBool): TFcBool; cdecl; external libfontconfig;

// === fcfreetype.h

type
  TFT_Face = type Pointer;
  PFT_Face = TFT_Face;
  TFT_UInt = integer;

function FcFreeTypeCharIndex(face: TFT_Face; ucs4: TFcChar32): TFT_UInt; cdecl; external libfontconfig;
function FcFreeTypeCharSetAndSpacing(face: TFT_Face; blanks: PFcBlanks; spacing: Plongint): PFcCharSet; cdecl; external libfontconfig;
function FcFreeTypeCharSet(face: TFT_Face; blanks: PFcBlanks): PFcCharSet; cdecl; external libfontconfig;
function FcPatternGetFTFace(p: PFcPattern; object_: pchar; n: longint; f: PFT_Face): TFcResult; cdecl; external libfontconfig;
function FcPatternAddFTFace(p: PFcPattern; object_: pchar; f: TFT_Face): TFcBool; cdecl; external libfontconfig;
function FcFreeTypeQueryFace(face: TFT_Face; file_: PFcChar8; id: dword; blanks: PFcBlanks): PFcPattern; cdecl; external libfontconfig;


// === Konventiert am: 28-7-25 17:04:36 ===


implementation

function FC_VERSION: int64;
begin
  Result := (FC_MAJOR * 10000) + (FC_MINOR * 100) + FC_REVISION;
end;

procedure FcMatrixInit(m: PFcMatrix);
begin
  m^.xx := 1;
  m^.yy := 1;
  m^.xy := 0;
  m^.yx := 0;
end;

// ======


function FcIsUpper(c: char): boolean;
begin
  Result := (c >= #65) and (c <= #90);
end;

function FcIsLower(c: char): boolean;
begin
  Result := (c >= #97) and (c <= #122);
end;

function FcToLower(c: char): char;
begin
  if FcIsUpper(c) then begin
    Result := Char(Byte(c) - 65 + 97);
  end else begin
    Result := c;
  end;
end;


end.
