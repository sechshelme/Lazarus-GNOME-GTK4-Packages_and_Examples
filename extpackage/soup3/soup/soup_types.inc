  {$IFDEF read_interface}


type
  TSoupAuth = record
    parent_instance: TGObject;
  end;
  PSoupAuth = ^TSoupAuth;

  TSoupAuthDomain = record
    parent_instance: TGObject;
  end;
  PSoupAuthDomain = ^TSoupAuthDomain;

  PSoupCookie = type Pointer;

  TSoupCookieJar = record
    parent_instance: TGObject;
  end;
  PSoupCookieJar = ^TSoupCookieJar;

  PSoupHSTSPolicy = type Pointer;
  PSoupMessage = type Pointer;
  PSoupMessageMetrics = type Pointer;
  PSoupServerMessage = type Pointer;

  TSoupSession = record
    parent_instance: TGObject;
  end;
  PSoupSession = ^TSoupSession;

  PSoupSessionFeature = type Pointer;

  PSoupWebsocketConnection = type Pointer;

  TSoupWebsocketExtension = record
    parent_instance: TGObject;
  end;
  PSoupWebsocketExtension = ^TSoupWebsocketExtension;


  // === Konventiert am: 29-9-25 19:43:53 ===


  {$ENDIF read_interface}


  {$IFDEF read_implementation}



  {$ENDIF read_implementation}
