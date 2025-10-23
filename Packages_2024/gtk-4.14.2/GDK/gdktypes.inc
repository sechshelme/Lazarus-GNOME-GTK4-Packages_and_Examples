
{$IFDEF read_interface}


  // ==== ausgelagertes
type
  TGdkDevice = record
  end;
  PGdkDevice = ^TGdkDevice;

  TGdkDisplay = record
  end;
  PGdkDisplay = ^TGdkDisplay;

  TGdkEvent = record
  end;
  PGdkEvent = ^TGdkEvent;

  TGdkSurface = record
  end;
  PGdkSurface = ^TGdkSurface;

  TGdkContentProvider = record
    parent: TGObject;
  end;
  PGdkContentProvider = ^TGdkContentProvider;
  PPGdkContentProvider = ^PGdkContentProvider;

  // ====

const
  GDK_CURRENT_TIME = 0;

type
  TGdkKeymapKey = record
    keycode: Tguint;
    group: cint;
    level: cint;
  end;
  PGdkKeymapKey = ^TGdkKeymapKey;
  PPGdkKeymapKey = ^PGdkKeymapKey;


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
