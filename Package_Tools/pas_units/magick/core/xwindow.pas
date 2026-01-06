unit xwindow;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TXImportInfo = record
    frame: TMagickBooleanType;
    borders: TMagickBooleanType;
    screen: TMagickBooleanType;
    descend: TMagickBooleanType;
    silent: TMagickBooleanType;
  end;
  PXImportInfo = ^TXImportInfo;

function XImportImage(para1: PImageInfo; para2: PXImportInfo): PImage; cdecl; external libmagiccore;
procedure XGetImportInfo(para1: PXImportInfo); cdecl; external libmagiccore;

// === Konventiert am: 6-1-26 19:17:38 ===


implementation



end.
