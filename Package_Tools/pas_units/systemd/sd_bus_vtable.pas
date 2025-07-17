unit sd_bus_vtable;

interface

uses
  fp_systemd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  _SD_BUS_VTABLE_START = '<';
  _SD_BUS_VTABLE_END = '>';
  _SD_BUS_VTABLE_METHOD = 'M';
  _SD_BUS_VTABLE_SIGNAL = 'S';
  _SD_BUS_VTABLE_PROPERTY = 'P';
  _SD_BUS_VTABLE_WRITABLE_PROPERTY = 'W';

const
  SD_BUS_VTABLE_DEPRECATED = 1 shl 0;
  SD_BUS_VTABLE_HIDDEN = 1 shl 1;
  SD_BUS_VTABLE_UNPRIVILEGED = 1 shl 2;
  SD_BUS_VTABLE_METHOD_NO_REPLY = 1 shl 3;
  SD_BUS_VTABLE_PROPERTY_CONST = 1 shl 4;
  SD_BUS_VTABLE_PROPERTY_EMITS_CHANGE = 1 shl 5;
  SD_BUS_VTABLE_PROPERTY_EMITS_INVALIDATION = 1 shl 6;
  SD_BUS_VTABLE_PROPERTY_EXPLICIT = 1 shl 7;
  SD_BUS_VTABLE_SENSITIVE = 1 shl 8;
  SD_BUS_VTABLE_ABSOLUTE_OFFSET = 1 shl 9;
  _SD_BUS_VTABLE_CAPABILITY_MASK = $FFFF shl 40;

function SD_BUS_VTABLE_CAPABILITY(x: uint64): uint64;

const
  _SD_BUS_VTABLE_PARAM_NAMES = 1 shl 0;

var
  sd_bus_object_vtable_format: dword; cvar;external libsystemd;

type
  Psd_bus_vtable = type Pointer;

  // === Konventiert am: 16-7-25 19:03:45 ===


implementation


function SD_BUS_VTABLE_CAPABILITY(x: uint64): uint64;
begin
  SD_BUS_VTABLE_CAPABILITY := uint64(((x + 1) and $FFFF) shl 40);
end;


end.
