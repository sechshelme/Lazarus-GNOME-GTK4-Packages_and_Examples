{$IFDEF read_interface}


function GSOUND_ERROR: TGQuark;

function gsound_error_quark: TGQuark; cdecl; external libgsound;

type
  PGSoundError = ^TGSoundError;
  TGSoundError = longint;

const
  GSOUND_ERROR_NOTSUPPORTED = -(1);
  GSOUND_ERROR_INVALID = -(2);
  GSOUND_ERROR_STATE = -(3);
  GSOUND_ERROR_OOM = -(4);
  GSOUND_ERROR_NODRIVER = -(5);
  GSOUND_ERROR_SYSTEM = -(6);
  GSOUND_ERROR_CORRUPT = -(7);
  GSOUND_ERROR_TOOBIG = -(8);
  GSOUND_ERROR_NOTFOUND = -(9);
  GSOUND_ERROR_DESTROYED = -(10);
  GSOUND_ERROR_CANCELED = -(11);
  GSOUND_ERROR_NOTAVAILABLE = -(12);
  GSOUND_ERROR_ACCESS = -(13);
  GSOUND_ERROR_IO = -(14);
  GSOUND_ERROR_INTERNAL = -(15);
  GSOUND_ERROR_DISABLED = -(16);
  GSOUND_ERROR_FORKED = -(17);
  GSOUND_ERROR_DISCONNECTED = -(18);

type
  PGSoundContext = type Pointer;
  PGSoundContextClass = type Pointer;

function gsound_context_get_type: TGType; cdecl; external libgsound;
function gsound_context_new(cancellable: PGCancellable; error: PPGError): PGSoundContext; cdecl; external libgsound;
function gsound_context_open(context: PGSoundContext; error: PPGError): Tgboolean; cdecl; external libgsound;
function gsound_context_set_attributes(context: PGSoundContext; error: PPGError): Tgboolean; cdecl; varargs; external libgsound;
function gsound_context_set_attributesv(context: PGSoundContext; attrs: PGHashTable; error: PPGError): Tgboolean; cdecl; external libgsound;
function gsound_context_set_driver(context: PGSoundContext; driver: pchar; error: PPGError): Tgboolean; cdecl; external libgsound;
function gsound_context_play_simple(context: PGSoundContext; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; varargs; external libgsound;
function gsound_context_play_simplev(context: PGSoundContext; attrs: PGHashTable; cancellable: PGCancellable; error: PPGError): Tgboolean; cdecl; external libgsound;
procedure gsound_context_play_full(context: PGSoundContext; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; varargs; external libgsound;
procedure gsound_context_play_fullv(context: PGSoundContext; attrs: PGHashTable; cancellable: PGCancellable; callback: TGAsyncReadyCallback; user_data: Tgpointer); cdecl; external libgsound;
function gsound_context_play_full_finish(context: PGSoundContext; result: PGAsyncResult; error: PPGError): Tgboolean; cdecl; external libgsound;
function gsound_context_cache(context: PGSoundContext; error: PPGError): Tgboolean; cdecl; varargs; external libgsound;
function gsound_context_cachev(context: PGSoundContext; attrs: PGHashTable; error: PPGError): Tgboolean; cdecl; external libgsound;

// === Konventiert am: 17-9-25 19:20:11 ===

function GSOUND_TYPE_CONTEXT: TGType;
function GSOUND_CONTEXT(obj: Pointer): PGSoundContext;
function GSOUND_CONTEXT_CLASS(obj: Pointer): PGSoundContextClass;
function GSOUND_IS_CONTEXT(obj: Pointer): Tgboolean;
function GSOUND_IS_CONTEXT_CLASS(obj: Pointer): Tgboolean;
function GSOUND_CONTEXT_GET_CLASS(obj: Pointer): PGSoundContextClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GSOUND_TYPE_CONTEXT: TGType;
begin
  GSOUND_TYPE_CONTEXT := gsound_context_get_type;
end;

function GSOUND_CONTEXT(obj: Pointer): PGSoundContext;
begin
  Result := PGSoundContext(g_type_check_instance_cast(obj, GSOUND_TYPE_CONTEXT));
end;

function GSOUND_CONTEXT_CLASS(obj: Pointer): PGSoundContextClass;
begin
  Result := PGSoundContextClass(g_type_check_class_cast(obj, GSOUND_TYPE_CONTEXT));
end;

function GSOUND_IS_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GSOUND_TYPE_CONTEXT);
end;

function GSOUND_IS_CONTEXT_CLASS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(obj, GSOUND_TYPE_CONTEXT);
end;

function GSOUND_CONTEXT_GET_CLASS(obj: Pointer): PGSoundContextClass;
begin
  Result := PGSoundContextClass(PGTypeInstance(obj)^.g_class);
end;


function GSOUND_ERROR: TGQuark;
begin
  GSOUND_ERROR := gsound_error_quark;
end;


{$ENDIF read_implementation}
