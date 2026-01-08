{$IFDEF read_interface}

const
  MagickPackageName = 'ImageMagick';
  MagickCopyright = '(C) 1999 ImageMagick Studio LLC';
  MagickLibVersion = $69C;
  MagickLibVersionText = '6.9.12';
  MagickLibAddendum = '-98';
  MagickLibInterface = 7;
  MagickLibMinInterface = 7;
  MagickPlatform = 'x86_64';
  MagickppLibVersionText = '6.9.12';
  MagickppLibAddendum = '-98';
  MagickppLibInterface = 9;
  MagickppLibMinInterface = 9;
  MagickGitRevision = '18038';
  MagickReleaseDate = '2024-03-31';
  MagickHomeURL = 'file:///usr/share/doc/imagemagick-6-common/html/index.html';
  MagickAuthoritativeLicense = 'https://imagemagick.org/script/license.php';
  MagickAuthoritativeURL = 'https://legacy.imagemagick.org';

const
  MagickQuantumDepth = 'Q16';
  MagickQuantumRange = '65535';

const
  MagickHDRISupport = '';

function GetMagickHomeURL: pchar; cdecl; external libmagickcore;
function GetMagickCopyright: pchar; cdecl; external libmagickcore;
function GetMagickDelegates: pchar; cdecl; external libmagickcore;
function GetMagickFeatures: pchar; cdecl; external libmagickcore;
function GetMagickLicense: pchar; cdecl; external libmagickcore;
function GetMagickPackageName: pchar; cdecl; external libmagickcore;
function GetMagickQuantumDepth(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickQuantumRange(para1: Psize_t): pchar; cdecl; external libmagickcore;
function GetMagickReleaseDate: pchar; cdecl; external libmagickcore;
function GetMagickVersion(para1: Psize_t): pchar; cdecl; external libmagickcore;
procedure ListMagickVersion(para1: PFILE); cdecl; external libmagickcore;

// === Konventiert am: 6-1-26 15:36:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
