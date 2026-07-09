
{$IFDEF read_struct}
type
  PGtkAtSpiSocket = type Pointer;
  PGtkAtSpiSocketClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_at_spi_socket_get_type: TGType; cdecl; external libgtk4;
function gtk_at_spi_socket_new(bus_name: PChar; object_path: PChar; error: PPGError): PGtkAccessible; cdecl; external libgtk4;
function gtk_at_spi_socket_get_bus_name(self: PGtkAtSpiSocket): PChar; cdecl; external libgtk4;
function gtk_at_spi_socket_get_object_path(self: PGtkAtSpiSocket): PChar; cdecl; external libgtk4;

// === Konventiert am: 2-8-24 19:15:08 ===

function GTK_TYPE_AT_SPI_SOCKET: TGType;
function GTK_AT_SPI_SOCKET(obj: Pointer): PGtkAtSpiSocket;
function GTK_IS_AT_SPI_SOCKET(obj: Pointer): Tgboolean;
{$ENDIF read_function}

{$IFDEF read_implementation}

function GTK_TYPE_AT_SPI_SOCKET: TGType;
begin
  Result := gtk_at_spi_socket_get_type;
end;

function GTK_AT_SPI_SOCKET(obj: Pointer): PGtkAtSpiSocket;
begin
  Result := PGtkAtSpiSocket(g_type_check_instance_cast(obj, GTK_TYPE_AT_SPI_SOCKET));
end;

function GTK_IS_AT_SPI_SOCKET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_AT_SPI_SOCKET);
end;




{$ENDIF read_implementation}
