{$IFDEF read_interface}


type
  PEeze_Scanner_Event_Type = ^TEeze_Scanner_Event_Type;
  TEeze_Scanner_Event_Type = longint;

const
  EEZE_SCANNER_EVENT_TYPE_NONE = 0;
  EEZE_SCANNER_EVENT_TYPE_ADD = EEZE_UDEV_EVENT_ADD;
  EEZE_SCANNER_EVENT_TYPE_REMOVE = EEZE_UDEV_EVENT_REMOVE;
  EEZE_SCANNER_EVENT_TYPE_CHANGE = EEZE_UDEV_EVENT_CHANGE;

type
  TEeze_Scanner_Event = record
    device: pchar;
    _type: TEeze_Scanner_Event_Type;
    volume: TEina_Bool;
  end;
  PEeze_Scanner_Event = ^TEeze_Scanner_Event;

  TEeze_Scanner_Device = record
    poller: PEcore_Poller;
    device: pchar;
    mounted: TEina_Bool;
  end;
  PEeze_Scanner_Device = ^TEeze_Scanner_Device;

  // === Konventiert am: 12-6-25 17:32:39 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
