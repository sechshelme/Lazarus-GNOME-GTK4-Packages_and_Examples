unit Eldbus;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_ecore;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  ELDBUS_VERSION_MAJOR = EFL_VERSION_MAJOR;
  ELDBUS_VERSION_MINOR = EFL_VERSION_MINOR;
  ELDBUS_FDO_BUS = 'org.freedesktop.DBus';
  ELDBUS_FDO_PATH = '/org/freedesktop/DBus';
  ELDBUS_FDO_INTERFACE = ELDBUS_FDO_BUS;
  ELDBUS_FDO_INTERFACE_PROPERTIES = 'org.freedesktop.DBus.Properties';
  ELDBUS_FDO_INTERFACE_OBJECT_MANAGER = 'org.freedesktop.DBus.ObjectManager';
  ELDBUS_FDO_INTERFACE_INTROSPECTABLE = 'org.freedesktop.DBus.Introspectable';
  ELDBUS_FDO_INTEFACE_PEER = 'org.freedesktop.DBus.Peer';
  ELDBUS_ERROR_PENDING_CANCELED = 'org.enlightenment.DBus.Canceled';
  ELDBUS_ERROR_PENDING_TIMEOUT = 'org.freedesktop.DBus.Error.NoReply';

type
  TEldbus_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEldbus_Version = ^TEldbus_Version;

var
  eldbus_version: PEldbus_Version; cvar;external libeldbus;

function eldbus_init: longint; cdecl; external libeldbus;
function eldbus_shutdown: longint; cdecl; external libeldbus;

type
  TEldbus_Message = record
  end;
  PEldbus_Message = ^TEldbus_Message;
  PPEldbus_Message = ^PEldbus_Message;

  TEldbus_Pending = record
  end;
  PEldbus_Pending = ^TEldbus_Pending;

  TEldbus_Message_Iter = record
  end;
  PEldbus_Message_Iter = ^TEldbus_Message_Iter;

  TEldbus_Free_Cb = procedure(data: pointer; deadptr: pointer); cdecl;

  TEldbus_Signal_Handler = record
  end;
  PEldbus_Signal_Handler = ^TEldbus_Signal_Handler;

  TEldbus_Message_Cb = procedure(data: pointer; msg: PEldbus_Message; pending: PEldbus_Pending); cdecl;
  TEldbus_Signal_Cb = procedure(data: pointer; msg: PEldbus_Message); cdecl;

  TEldbus_Proxy = record
  end;
  PEldbus_Proxy = ^TEldbus_Proxy;

  TEldbus_Connection = record
  end;
  PEldbus_Connection = ^TEldbus_Connection;

  TEldbus_Object = record
  end;
  PEldbus_Object = ^TEldbus_Object;

  // === Konventiert am: 9-6-25 19:56:20 ===


implementation



end.
