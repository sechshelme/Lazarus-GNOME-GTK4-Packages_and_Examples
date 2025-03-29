unit gtksourcehovercontext;

interface

uses
  fp_glib2, fp_GTK4, gtksourcetypes, gtksourcebuffer;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (GtkSourceHoverContext, gtk_source_hover_context, GTK_SOURCE, HOVER_CONTEXT, GObject) }
type
  TGtkSourceHoverContext = record
  end;
  PGtkSourceHoverContext = ^TGtkSourceHoverContext;

  TGtkSourceHoverContextClass = record
    parent_class: TGObjectClass;
  end;
  PGtkSourceHoverContextClass = ^TGtkSourceHoverContextClass;

function gtk_source_hover_context_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_hover_context_get_view(self: PGtkSourceHoverContext): PGtkSourceView; cdecl; external libgtksourceview5;
function gtk_source_hover_context_get_buffer(self: PGtkSourceHoverContext): PGtkSourceBuffer; cdecl; external libgtksourceview5;
function gtk_source_hover_context_get_iter(self: PGtkSourceHoverContext; iter: PGtkTextIter): Tgboolean; cdecl; external libgtksourceview5;
function gtk_source_hover_context_get_bounds(self: PGtkSourceHoverContext; begin_: PGtkTextIter; end_: PGtkTextIter): Tgboolean; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 15:47:02 ===

function GTK_SOURCE_TYPE_HOVER_CONTEXT: TGType;
function GTK_SOURCE_HOVER_CONTEXT(obj: Pointer): PGtkSourceHoverContext;
function GTK_SOURCE_IS_HOVER_CONTEXT(obj: Pointer): Tgboolean;

implementation

function GTK_SOURCE_TYPE_HOVER_CONTEXT: TGType;
begin
  Result := gtk_source_hover_context_get_type;
end;

function GTK_SOURCE_HOVER_CONTEXT(obj: Pointer): PGtkSourceHoverContext;
begin
  Result := PGtkSourceHoverContext(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_HOVER_CONTEXT));
end;

function GTK_SOURCE_IS_HOVER_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_HOVER_CONTEXT);
end;


end.
