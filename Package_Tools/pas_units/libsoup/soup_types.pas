unit soup_types;

interface

uses
  fp_glib2, fp_soup;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



  {#define _SOUP_ATOMIC_INTERN_STRING(variable, value) ((const char *)(g_atomic_pointer_get (&(variable)) ? (variable) : (g_atomic_pointer_set (&(variable), (gpointer)g_intern_static_string (value)), (variable)))) }
type
  PSoupAuth = type Pointer;
  PSoupAuthDomain = type Pointer;
  PSoupCookie = type Pointer;
  PSoupCookieJar = type Pointer;
  PSoupHSTSEnforcer = type Pointer;
  PSoupHSTSPolicy = type Pointer;
  PSoupMessage = type Pointer;
  PSoupMessageMetrics = type Pointer;
  PSoupServer = type Pointer;
  PSoupServerMessage = type Pointer;
  PSoupSession = type Pointer;
  PSoupSessionFeature = type Pointer;
  PSoupWebsocketConnection = type Pointer;
  PSoupWebsocketExtension = type Pointer;

  // === Konventiert am: 29-9-25 19:43:53 ===


implementation



end.
