{$IFDEF read_interface}


function MagickGetFilename(para1: PMagickWand): pchar; cdecl; external libmagickwand;
function MagickGetFormat(para1: PMagickWand): pchar; cdecl; external libmagickwand;
function MagickGetFont(para1: PMagickWand): pchar; cdecl; external libmagickwand;
function MagickGetHomeURL: pchar; cdecl; external libmagickwand;
function MagickGetImageArtifact(para1: PMagickWand; para2: pchar): pchar; cdecl; external libmagickwand;
function MagickGetImageArtifacts(para1: PMagickWand; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickGetImageProfiles(para1: PMagickWand; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickGetImageProperty(para1: PMagickWand; para2: pchar): pchar; cdecl; external libmagickwand;
function MagickGetImageProperties(para1: PMagickWand; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickGetOption(para1: PMagickWand; para2: pchar): pchar; cdecl; external libmagickwand;
function MagickGetOptions(para1: PMagickWand; para2: pchar; para3: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickQueryConfigureOption(para1: pchar): pchar; cdecl; external libmagickwand;
function MagickQueryConfigureOptions(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickQueryFonts(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickQueryFormats(para1: pchar; para2: Psize_t): Ppchar; cdecl; external libmagickwand;
function MagickGetColorspace(para1: PMagickWand): TColorspaceType; cdecl; external libmagickwand;
function MagickGetCompression(para1: PMagickWand): TCompressionType; cdecl; external libmagickwand;
function MagickGetCopyright: pchar; cdecl; external libmagickwand;
function MagickGetPackageName: pchar; cdecl; external libmagickwand;
function MagickGetQuantumDepth(para1: Psize_t): pchar; cdecl; external libmagickwand;
function MagickGetQuantumRange(para1: Psize_t): pchar; cdecl; external libmagickwand;
function MagickGetReleaseDate: pchar; cdecl; external libmagickwand;
function MagickGetVersion(para1: Psize_t): pchar; cdecl; external libmagickwand;
function MagickGetPointsize(para1: PMagickWand): double; cdecl; external libmagickwand;
function MagickGetSamplingFactors(para1: PMagickWand; para2: Psize_t): Pdouble; cdecl; external libmagickwand;
function MagickQueryFontMetrics(para1: PMagickWand; para2: PDrawingWand; para3: pchar): Pdouble; cdecl; external libmagickwand;
function MagickQueryMultilineFontMetrics(para1: PMagickWand; para2: PDrawingWand; para3: pchar): Pdouble; cdecl; external libmagickwand;
function MagickGetGravity(para1: PMagickWand): TGravityType; cdecl; external libmagickwand;
function MagickGetType(para1: PMagickWand): TImageType; cdecl; external libmagickwand;
function MagickGetInterlaceScheme(para1: PMagickWand): TInterlaceType; cdecl; external libmagickwand;
function MagickGetInterpolateMethod(para1: PMagickWand): TInterpolatePixelMethod; cdecl; external libmagickwand;
function MagickGetOrientation(para1: PMagickWand): TOrientationType; cdecl; external libmagickwand;
function MagickDeleteImageArtifact(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickDeleteImageProperty(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickDeleteOption(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickGetAntialias(para1: PMagickWand): TMagickBooleanType; cdecl; external libmagickwand;
function MagickGetPage(para1: PMagickWand; para2: Psize_t; para3: Psize_t; para4: Pssize_t; para5: Pssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickGetResolution(para1: PMagickWand; para2: Pdouble; para3: Pdouble): TMagickBooleanType; cdecl; external libmagickwand;
function MagickGetSize(para1: PMagickWand; para2: Psize_t; para3: Psize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickGetSizeOffset(para1: PMagickWand; para2: Pssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickProfileImage(para1: PMagickWand; para2: pchar; para3: pointer; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetAntialias(para1: PMagickWand; para2: TMagickBooleanType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetBackgroundColor(para1: PMagickWand; para2: PPixelWand): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetColorspace(para1: PMagickWand; para2: TColorspaceType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetCompression(para1: PMagickWand; para2: TCompressionType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetCompressionQuality(para1: PMagickWand; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetDepth(para1: PMagickWand; para2: Tsize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetExtract(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetFilename(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetFormat(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetFont(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetGravity(para1: PMagickWand; para2: TGravityType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetImageArtifact(para1: PMagickWand; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetImageProfile(para1: PMagickWand; para2: pchar; para3: pointer; para4: Tsize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetImageProperty(para1: PMagickWand; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetInterlaceScheme(para1: PMagickWand; para2: TInterlaceType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetInterpolateMethod(para1: PMagickWand; para2: TInterpolatePixelMethod): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetOption(para1: PMagickWand; para2: pchar; para3: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetOrientation(para1: PMagickWand; para2: TOrientationType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetPage(para1: PMagickWand; para2: Tsize_t; para3: Tsize_t; para4: Tssize_t; para5: Tssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetPassphrase(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetPointsize(para1: PMagickWand; para2: double): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetResolution(para1: PMagickWand; para2: double; para3: double): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetResourceLimit(_type: TResourceType; limit: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetSamplingFactors(para1: PMagickWand; para2: Tsize_t; para3: Pdouble): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetSecurityPolicy(para1: PMagickWand; para2: pchar): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetSize(para1: PMagickWand; para2: Tsize_t; para3: Tsize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetSizeOffset(para1: PMagickWand; para2: Tsize_t; para3: Tsize_t; para4: Tssize_t): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetType(para1: PMagickWand; para2: TImageType): TMagickBooleanType; cdecl; external libmagickwand;
function MagickSetProgressMonitor(para1: PMagickWand; para2: TMagickProgressMonitor; para3: pointer): TMagickProgressMonitor; cdecl; external libmagickwand;
function MagickGetResource(para1: TResourceType): TMagickSizeType; cdecl; external libmagickwand;
function MagickGetResourceLimit(para1: TResourceType): TMagickSizeType; cdecl; external libmagickwand;
function MagickGetBackgroundColor(para1: PMagickWand): PPixelWand; cdecl; external libmagickwand;
function MagickGetOrientationType(para1: PMagickWand): TOrientationType; cdecl; external libmagickwand;
function MagickGetCompressionQuality(para1: PMagickWand): Tsize_t; cdecl; external libmagickwand;
function MagickGetImageProfile(para1: PMagickWand; para2: pchar; para3: Psize_t): pbyte; cdecl; external libmagickwand;
function MagickRemoveImageProfile(para1: PMagickWand; para2: pchar; para3: Psize_t): pbyte; cdecl; external libmagickwand;

// === Konventiert am: 5-1-26 19:40:05 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
