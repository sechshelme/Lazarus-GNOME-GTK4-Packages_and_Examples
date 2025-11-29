unit fp_sratom;

interface

uses
  fp_serd;

const
  {$IFDEF Linux}
  libsratom0 = 'sratom-0';
  {$ENDIF}

  {$IFDEF Windows}
  libsratom0 = 'sratom-0.dll';  // ?????
  {$ENDIF}


{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


type
 PSratom=type Pointer;
type
  PSratomObjectMode = ^TSratomObjectMode;
  TSratomObjectMode =  Longint;
  Const
    SRATOM_OBJECT_MODE_BLANK = 0;
    SRATOM_OBJECT_MODE_BLANK_SUBJECT = 1;

function sratom_new(map:PLV2_URID_Map):PSratom;cdecl;external libsratom0;
procedure sratom_free(sratom:PSratom);cdecl;external libsratom0;
procedure sratom_set_env(sratom:PSratom; env:PSerdEnv);cdecl;external libsratom0;
procedure sratom_set_sink(sratom:PSratom; base_uri:Pchar; sink:TSerdStatementSink; end_sink:TSerdEndSink; handle:pointer);cdecl;external libsratom0;
procedure sratom_set_pretty_numbers(sratom:PSratom; pretty_numbers:Tbool);cdecl;external libsratom0;
procedure sratom_set_object_mode(sratom:PSratom; object_mode:TSratomObjectMode);cdecl;external libsratom0;
function sratom_write(sratom:PSratom; unmap:PLV2_URID_Unmap; flags:Tuint32_t; subject:PSerdNode; predicate:PSerdNode;
           type_urid:Tuint32_t; size:Tuint32_t; body:pointer):longint;cdecl;external libsratom0;
procedure sratom_read(sratom:PSratom; forge:PLV2_Atom_Forge; world:PSordWorld; model:PSordModel; node:PSordNode);cdecl;external libsratom0;
function sratom_to_turtle(sratom:PSratom; unmap:PLV2_URID_Unmap; base_uri:Pchar; subject:PSerdNode; predicate:PSerdNode;
           _type:Tuint32_t; size:Tuint32_t; body:pointer):Pchar;cdecl;external libsratom0;
function sratom_from_turtle(sratom:PSratom; base_uri:Pchar; subject:PSerdNode; predicate:PSerdNode; str:Pchar):PLV2_Atom;cdecl;external libsratom0;
function sratom_forge_sink(handle:TLV2_Atom_Forge_Sink_Handle; buf:pointer; size:Tuint32_t):TLV2_Atom_Forge_Ref;cdecl;external libsratom0;
function sratom_forge_deref(handle:TLV2_Atom_Forge_Sink_Handle; ref:TLV2_Atom_Forge_Ref):PLV2_Atom;cdecl;external libsratom0;

// === Konventiert am: 29-11-25 16:56:23 ===


implementation



end.
