{$IFDEF read_interface}


{ xxxxxxxxxxxxxxxxxxxx
#define _SOUP_ATOMIC_INTERN_STRING(variable, value) ((const char *)(g_atomic_pointer_get (&(variable)) ? (variable) : (g_atomic_pointer_set (&(variable), (gpointer)g_intern_static_string (value)), (variable))))


#define _SOUP_INTERN_METHOD(method) (_SOUP_ATOMIC_INTERN_STRING (_SOUP_METHOD_##method, #method))

#define SOUP_METHOD_OPTIONS   _SOUP_INTERN_METHOD (OPTIONS)
#define SOUP_METHOD_GET       _SOUP_INTERN_METHOD (GET)
#define SOUP_METHOD_HEAD      _SOUP_INTERN_METHOD (HEAD)
#define SOUP_METHOD_POST      _SOUP_INTERN_METHOD (POST)
#define SOUP_METHOD_PUT       _SOUP_INTERN_METHOD (PUT)
#define SOUP_METHOD_DELETE    _SOUP_INTERN_METHOD (DELETE)
#define SOUP_METHOD_TRACE     _SOUP_INTERN_METHOD (TRACE)
#define SOUP_METHOD_CONNECT   _SOUP_INTERN_METHOD (CONNECT)

#define SOUP_METHOD_PROPFIND  _SOUP_INTERN_METHOD (PROPFIND)
#define SOUP_METHOD_PROPPATCH _SOUP_INTERN_METHOD (PROPPATCH)
#define SOUP_METHOD_MKCOL     _SOUP_INTERN_METHOD (MKCOL)
#define SOUP_METHOD_COPY      _SOUP_INTERN_METHOD (COPY)
#define SOUP_METHOD_MOVE      _SOUP_INTERN_METHOD (MOVE)
#define SOUP_METHOD_LOCK      _SOUP_INTERN_METHOD (LOCK)
#define SOUP_METHOD_UNLOCK    _SOUP_INTERN_METHOD (UNLOCK)

extern gpointer _SOUP_METHOD_OPTIONS;
extern gpointer _SOUP_METHOD_GET;
extern gpointer _SOUP_METHOD_HEAD;
extern gpointer _SOUP_METHOD_POST;
extern gpointer _SOUP_METHOD_PUT;
extern gpointer _SOUP_METHOD_DELETE;
extern gpointer _SOUP_METHOD_TRACE;
extern gpointer _SOUP_METHOD_CONNECT;

extern gpointer _SOUP_METHOD_PROPFIND;
extern gpointer _SOUP_METHOD_PROPPATCH;
extern gpointer _SOUP_METHOD_MKCOL;
extern gpointer _SOUP_METHOD_COPY;
extern gpointer _SOUP_METHOD_MOVE;
extern gpointer _SOUP_METHOD_LOCK;
extern gpointer _SOUP_METHOD_UNLOCK;
 }

var
  _SOUP_METHOD_OPTIONS: Tgpointer; cvar; external;
  _SOUP_METHOD_GET: Tgpointer; cvar; external;
  _SOUP_METHOD_HEAD: Tgpointer; cvar; external;
  _SOUP_METHOD_POST: Tgpointer; cvar; external;
  _SOUP_METHOD_PUT: Tgpointer; cvar; external;
  _SOUP_METHOD_DELETE: Tgpointer; cvar; external;
  _SOUP_METHOD_TRACE: Tgpointer; cvar; external;
  _SOUP_METHOD_CONNECT: Tgpointer; cvar; external;

  _SOUP_METHOD_PROPFIND: Tgpointer; cvar; external;
  _SOUP_METHOD_PROPPATCH: Tgpointer; cvar; external;
  _SOUP_METHOD_MKCOL: Tgpointer; cvar; external;
  _SOUP_METHOD_COPY: Tgpointer; cvar; external;
  _SOUP_METHOD_MOVE: Tgpointer; cvar; external;
  _SOUP_METHOD_LOCK: Tgpointer; cvar; external;
  _SOUP_METHOD_UNLOCK: Tgpointer; cvar; external;


function SOUP_METHOD_OPTIONS: pchar; inline;
function SOUP_METHOD_GET: pchar; inline;
function SOUP_METHOD_HEAD: pchar; inline;
function SOUP_METHOD_POST: pchar; inline;
function SOUP_METHOD_PUT: pchar; inline;
function SOUP_METHOD_DELETE: pchar; inline;
function SOUP_METHOD_TRACE: pchar; inline;
function SOUP_METHOD_CONNECT: pchar; inline;
function SOUP_METHOD_PROPFIND: pchar; inline;
function SOUP_METHOD_PROPPATCH: pchar; inline;
function SOUP_METHOD_MKCOL: pchar; inline;
function SOUP_METHOD_COPY: pchar; inline;
function SOUP_METHOD_MOVE: pchar; inline;
function SOUP_METHOD_LOCK: pchar; inline;
function SOUP_METHOD_UNLOCK: pchar; inline;


// === Konventiert am: 29-9-25 19:44:21 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}

function _SOUP_ATOMIC_INTERN_STRING(var variable: Tgpointer; value: pchar): pchar;
begin
  if g_atomic_pointer_get(@variable) <> nil then begin
    Result := pchar(variable);
  end else begin
    g_atomic_pointer_set(@variable, Tgpointer(g_intern_static_string(value)));
    Result := pchar(variable);
  end;
end;

function _SOUP_INTERN_METHOD(var variable: Tgpointer; const method: pchar): pchar;
begin
  Result := _SOUP_ATOMIC_INTERN_STRING(variable, method);
end;

function SOUP_METHOD_OPTIONS: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_OPTIONS, 'OPTIONS');
end;

function SOUP_METHOD_GET: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_GET, 'GET');
end;

function SOUP_METHOD_HEAD: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_HEAD, 'HEAD');
end;

function SOUP_METHOD_POST: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_POST, 'POST');
end;

function SOUP_METHOD_PUT: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_PUT, 'PUT');
end;

function SOUP_METHOD_DELETE: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_DELETE, 'DELETE');
end;

function SOUP_METHOD_TRACE: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_TRACE, 'TRACE');
end;

function SOUP_METHOD_CONNECT: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_CONNECT, 'CONNECT');
end;

function SOUP_METHOD_PROPFIND: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_PROPFIND, 'PROPFIND');
end;

function SOUP_METHOD_PROPPATCH: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_PROPPATCH, 'PROPPATCH');
end;

function SOUP_METHOD_MKCOL: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_MKCOL, 'MKCOL');
end;

function SOUP_METHOD_COPY: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_COPY, 'COPY');
end;

function SOUP_METHOD_MOVE: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_MOVE, 'MOVE');
end;

function SOUP_METHOD_LOCK: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_LOCK, 'LOCK');
end;

function SOUP_METHOD_UNLOCK: pchar; inline;
begin
  Result := _SOUP_INTERN_METHOD(_SOUP_METHOD_UNLOCK, 'UNLOCK');
end;



{$ENDIF read_implementation}
