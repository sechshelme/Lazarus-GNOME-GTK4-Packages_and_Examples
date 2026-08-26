unit gusb_bos_descriptor;

interface

uses
   fp_glib2, fp_gusb;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGUsbBosDescriptor = type Pointer;

  TGUsbBosDescriptorClass = record
    parent_class: TGObjectClass;
  end;
  PGUsbBosDescriptorClass = ^TGUsbBosDescriptorClass;

function g_usb_bos_descriptor_get_type: TGType; cdecl; external libgusb;
function g_usb_bos_descriptor_get_capability(self: PGUsbBosDescriptor): Tguint8; cdecl; external libgusb;
function g_usb_bos_descriptor_get_extra(self: PGUsbBosDescriptor): PGBytes; cdecl; external libgusb;

// === Konventiert am: 26-8-26 19:42:55 ===

function G_USB_TYPE_BOS_DESCRIPTOR: TGType;
function G_USB_BOS_DESCRIPTOR(obj: Pointer): PGUsbBosDescriptor;
function G_USB_IS_BOS_DESCRIPTOR(obj: Pointer): Tgboolean;

implementation

function G_USB_TYPE_BOS_DESCRIPTOR: TGType;
begin
  Result := g_usb_bos_descriptor_get_type;
end;

function G_USB_BOS_DESCRIPTOR(obj: Pointer): PGUsbBosDescriptor;
begin
  Result := PGUsbBosDescriptor(g_type_check_instance_cast(obj, G_USB_TYPE_BOS_DESCRIPTOR));
end;

function G_USB_IS_BOS_DESCRIPTOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_USB_TYPE_BOS_DESCRIPTOR);
end;

end.
