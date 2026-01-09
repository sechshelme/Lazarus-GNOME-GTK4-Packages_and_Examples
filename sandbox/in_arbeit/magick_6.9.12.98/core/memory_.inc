{$IFDEF read_interface}



function AcquireVirtualMemory(para1: Tsize_t; para2: Tsize_t): PMemoryInfo; cdecl; external libmagickcore;
function RelinquishVirtualMemory(para1: PMemoryInfo): PMemoryInfo; cdecl; external libmagickcore;
function GetMaxMemoryRequest: Tsize_t; cdecl; external libmagickcore;
function AcquireAlignedMemory(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireMagickMemory(para1: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireCriticalMemory(para1: Tsize_t): pointer; cdecl; external libmagickcore;
function AcquireQuantumMemory(para1: Tsize_t; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function CopyMagickMemory(magick_restrict: pointer; magick_restrict2: pointer; para3: Tsize_t): pointer; cdecl; external libmagickcore;
procedure DestroyMagickMemory; cdecl; external libmagickcore;
procedure GetMagickMemoryMethods(para1: PAcquireMemoryHandler; para2: PResizeMemoryHandler; para3: PDestroyMemoryHandler); cdecl; external libmagickcore;
function GetVirtualMemoryBlob(para1: PMemoryInfo): pointer; cdecl; external libmagickcore;
function RelinquishAlignedMemory(para1: pointer): pointer; cdecl; external libmagickcore;
function RelinquishMagickMemory(para1: pointer): pointer; cdecl; external libmagickcore;
function ResetMagickMemory(para1: pointer; para2: longint; para3: Tsize_t): pointer; cdecl; external libmagickcore;
function ResizeMagickMemory(para1: pointer; para2: Tsize_t): pointer; cdecl; external libmagickcore;
function ResizeQuantumMemory(para1: pointer; para2: Tsize_t; para3: Tsize_t): pointer; cdecl; external libmagickcore;
procedure SetMagickAlignedMemoryMethods(para1: TAcquireAlignedMemoryHandler; para2: TRelinquishAlignedMemoryHandler); cdecl; external libmagickcore;
procedure SetMagickMemoryMethods(para1: TAcquireMemoryHandler; para2: TResizeMemoryHandler; para3: TDestroyMemoryHandler); cdecl; external libmagickcore;

function HeapOverflowSanityCheck(count, quantum: Tsize_t): TMagickBooleanType; inline;
function HeapOverflowSanityCheckGetSize(count, quantum: Tsize_t; var extent: Tsize_t): TMagickBooleanType; inline;


// === Konventiert am: 6-1-26 15:03:26 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function HeapOverflowSanityCheck(count, quantum: Tsize_t): TMagickBooleanType; inline;
begin
  if (count = 0) or (quantum = 0) then begin
    Result := MagickTrue;
    Exit;
  end;

  if quantum <> ((count * quantum) div count) then begin
    Result := MagickTrue;
  end else begin
    Result := MagickFalse;
  end;
end;

function HeapOverflowSanityCheckGetSize(count, quantum: Tsize_t; var extent: Tsize_t): TMagickBooleanType; inline;
var
  length: Tsize_t;
begin
  if (count = 0) or (quantum = 0) then begin
    Result := MagickTrue;
    Exit;
  end;

  length := count * quantum;
  if quantum <> (length div count) then begin
    Result := MagickTrue;
  end else begin
    if @extent <> nil then begin
      extent := length;
    end;
    Result := MagickFalse;
  end;
end;




{$ENDIF read_implementation}
