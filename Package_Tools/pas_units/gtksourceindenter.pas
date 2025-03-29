unit gtksourceindenter;

interface

uses
  fp_glib2, fp_GDK4, fp_GTK4, gtksourcetypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_INTERFACE (GtkSourceIndenter, gtk_source_indenter, GTK_SOURCE, INDENTER, GObject) }
type
  TGtkSourceIndenter = record
  end;
  PGtkSourceIndenter = ^TGtkSourceIndenter;

  TGtkSourceIndenterInterface = record
    parent_iface: TGTypeInterface;
    is_trigger: function(self: PGtkSourceIndenter; view: PGtkSourceView; location: PGtkTextIter; state: TGdkModifierType; keyval: Tguint): Tgboolean; cdecl;
    indent: procedure(self: PGtkSourceIndenter; view: PGtkSourceView; iter: PGtkTextIter); cdecl;
  end;
  PGtkSourceIndenterInterface = ^TGtkSourceIndenterInterface;

function gtk_source_indenter_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_indenter_is_trigger(self: PGtkSourceIndenter; view: PGtkSourceView; location: PGtkTextIter; state: TGdkModifierType; keyval: Tguint): Tgboolean; cdecl; external libgtksourceview5;
procedure gtk_source_indenter_indent(self: PGtkSourceIndenter; view: PGtkSourceView; iter: PGtkTextIter); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:51:04 ===

function GTK_SOURCE_TYPE_INDENTER: TGType;
function GTK_SOURCE_INDENTER(obj: Pointer): PGtkSourceIndenter;
function GTK_SOURCE_IS_INDENTER(obj: Pointer): Tgboolean;
function GTK_SOURCE_INDENTER_GET_IFACE(obj: Pointer): PGtkSourceIndenterInterface;

implementation

function GTK_SOURCE_TYPE_INDENTER: TGType;
begin
  Result := gtk_source_indenter_get_type;
end;

function GTK_SOURCE_INDENTER(obj: Pointer): PGtkSourceIndenter;
begin
  Result := PGtkSourceIndenter(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_INDENTER));
end;

function GTK_SOURCE_IS_INDENTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_INDENTER);
end;

function GTK_SOURCE_INDENTER_GET_IFACE(obj: Pointer): PGtkSourceIndenterInterface;
begin
  Result := g_type_interface_peek(obj, GTK_SOURCE_TYPE_INDENTER);
end;


end.
