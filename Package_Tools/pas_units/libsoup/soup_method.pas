unit soup_method;

interface

uses
  fp_glib2, fp_soup;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


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
  _SOUP_METHOD_OPTIONS  : Tgpointer; cvar; external;
  _SOUP_METHOD_GET      : Tgpointer; cvar; external;
  _SOUP_METHOD_HEAD     : Tgpointer; cvar; external;
  _SOUP_METHOD_POST     : Tgpointer; cvar; external;
  _SOUP_METHOD_PUT      : Tgpointer; cvar; external;
  _SOUP_METHOD_DELETE   : Tgpointer; cvar; external;
  _SOUP_METHOD_TRACE    : Tgpointer; cvar; external;
  _SOUP_METHOD_CONNECT  : Tgpointer; cvar; external;

  _SOUP_METHOD_PROPFIND : Tgpointer; cvar; external;
  _SOUP_METHOD_PROPPATCH: Tgpointer; cvar; external;
  _SOUP_METHOD_MKCOL    : Tgpointer; cvar; external;
  _SOUP_METHOD_COPY     : Tgpointer; cvar; external;
  _SOUP_METHOD_MOVE     : Tgpointer; cvar; external;
  _SOUP_METHOD_LOCK     : Tgpointer; cvar; external;
  _SOUP_METHOD_UNLOCK   : Tgpointer; cvar; external;

var
  SOUP_METHOD_OPTIONS   : PChar absolute _SOUP_METHOD_OPTIONS;
  SOUP_METHOD_GET       : PChar absolute _SOUP_METHOD_GET;
  SOUP_METHOD_HEAD      : PChar absolute _SOUP_METHOD_HEAD;
  SOUP_METHOD_POST      : PChar absolute _SOUP_METHOD_POST;
  SOUP_METHOD_PUT       : PChar absolute _SOUP_METHOD_PUT;
  SOUP_METHOD_DELETE    : PChar absolute _SOUP_METHOD_DELETE;
  SOUP_METHOD_TRACE     : PChar absolute _SOUP_METHOD_TRACE;
  SOUP_METHOD_CONNECT   : PChar absolute _SOUP_METHOD_CONNECT;

  SOUP_METHOD_PROPFIND  : PChar absolute _SOUP_METHOD_PROPFIND;
  SOUP_METHOD_PROPPATCH : PChar absolute _SOUP_METHOD_PROPPATCH;
  SOUP_METHOD_MKCOL     : PChar absolute _SOUP_METHOD_MKCOL;
  SOUP_METHOD_COPY      : PChar absolute _SOUP_METHOD_COPY;
  SOUP_METHOD_MOVE      : PChar absolute _SOUP_METHOD_MOVE;
  SOUP_METHOD_LOCK      : PChar absolute _SOUP_METHOD_LOCK;
  SOUP_METHOD_UNLOCK    : PChar absolute _SOUP_METHOD_UNLOCK;


// === Konventiert am: 29-9-25 19:44:21 ===


implementation



end.
