unit monitor;

interface

uses
  fp_magiccore, magick_type;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TMagickProgressMonitor = function(para1: pchar; para2: TMagickOffsetType; para3: TMagickSizeType; para4: pointer): TMagickBooleanType; cdecl;

function SetImageProgress(para1: PImage; para2: pchar; para3: TMagickOffsetType; para4: TMagickSizeType): TMagickBooleanType; cdecl; external libmagickcore;
function SetImageProgressMonitor(para1: PImage; para2: TMagickProgressMonitor; para3: pointer): TMagickProgressMonitor; cdecl; external libmagickcore;
function SetImageInfoProgressMonitor(para1: PImageInfo; para2: TMagickProgressMonitor; para3: pointer): TMagickProgressMonitor; cdecl; external libmagickcore;

function QuantumTick(offset: TMagickOffsetType; span: TMagickSizeType): TMagickBooleanType;


// === Konventiert am: 6-1-26 17:40:01 ===


implementation

function QuantumTick(offset: TMagickOffsetType; span: TMagickSizeType): TMagickBooleanType;
begin
  if span <= 100 then begin
    Result := MagickTrue;
    Exit;
  end;

  if offset = (span - 1) then begin
    Result := MagickTrue;
    Exit;
  end;

  if (offset mod TMagickOffsetType(span div 100)) = 0 then begin
    Result := MagickTrue;
  end else begin
    Result := MagickFalse;
  end;
end;


end.
