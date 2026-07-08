unit gtkpasswordentrybuffer;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkentrybuffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkPasswordEntryBuffer = type Pointer;

  TGtkPasswordEntryBufferClass = record
    parent_class: TGtkEntryBufferClass;
  end;
  PGtkPasswordEntryBufferClass = ^TGtkPasswordEntryBufferClass;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_password_entry_buffer_get_type: TGType; cdecl; external libgtk4;
function gtk_password_entry_buffer_new: PGtkEntryBuffer; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:18:15 ===

function GTK_TYPE_PASSWORD_ENTRY_BUFFER: TGType;
function GTK_PASSWORD_ENTRY_BUFFER(obj: Pointer): PGtkPasswordEntryBuffer;
function GTK_IS_PASSWORD_ENTRY_BUFFER(obj: Pointer): Tgboolean;
{$ENDIF read_function}

implementation

function GTK_TYPE_PASSWORD_ENTRY_BUFFER: TGType;
begin
  Result := gtk_password_entry_buffer_get_type;
end;

function GTK_PASSWORD_ENTRY_BUFFER(obj: Pointer): PGtkPasswordEntryBuffer;
begin
  Result := PGtkPasswordEntryBuffer(g_type_check_instance_cast(obj, GTK_TYPE_PASSWORD_ENTRY_BUFFER));
end;

function GTK_IS_PASSWORD_ENTRY_BUFFER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_PASSWORD_ENTRY_BUFFER);
end;

end.
