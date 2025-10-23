
{$IFDEF read_interface}

type
  TGFileDescriptorBased = record
  end;
  PGFileDescriptorBased = ^TGFileDescriptorBased;

  TGFileDescriptorBasedIface = record
    g_iface: TGTypeInterface;
    get_fd: function(fd_based: PGFileDescriptorBased): longint; cdecl;
  end;
  PGFileDescriptorBasedIface = ^TGFileDescriptorBasedIface;

function g_file_descriptor_based_get_type: TGType; cdecl; external libgio2;
function g_file_descriptor_based_get_fd(fd_based: PGFileDescriptorBased): longint; cdecl; external libgio2;

// === Konventiert am: 20-11-24 15:19:09 ===

function G_TYPE_FILE_DESCRIPTOR_BASED: TGType;
function G_FILE_DESCRIPTOR_BASED(obj: Pointer): PGFileDescriptorBased;
function G_IS_FILE_DESCRIPTOR_BASED(obj: Pointer): Tgboolean;
function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj: Pointer): PGFileDescriptorBasedIface;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function G_TYPE_FILE_DESCRIPTOR_BASED: TGType;
begin
  G_TYPE_FILE_DESCRIPTOR_BASED := g_file_descriptor_based_get_type;
end;

function G_FILE_DESCRIPTOR_BASED(obj: Pointer): PGFileDescriptorBased;
begin
  Result := PGFileDescriptorBased(g_type_check_instance_cast(obj, G_TYPE_FILE_DESCRIPTOR_BASED));
end;

function G_IS_FILE_DESCRIPTOR_BASED(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, G_TYPE_FILE_DESCRIPTOR_BASED);
end;

function G_FILE_DESCRIPTOR_BASED_GET_IFACE(obj: Pointer): PGFileDescriptorBasedIface;
begin
  Result := g_type_interface_peek(obj, G_TYPE_FILE_DESCRIPTOR_BASED);
end;



{$ENDIF read_implementation}
