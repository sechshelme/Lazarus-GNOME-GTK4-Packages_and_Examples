{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (GtkSourceVimIMContext, gtk_source_vim_im_context, GTK_SOURCE, VIM_IM_CONTEXT, GtkIMContext) }
type
  TGtkSourceVimIMContext = record
  end;
  PGtkSourceVimIMContext = ^TGtkSourceVimIMContext;

  TGtkSourceVimIMContextClass = record
    parent_class: TGtkIMContextClass;
  end;
  PGtkSourceVimIMContextClass = ^TGtkSourceVimIMContextClass;

function gtk_source_vim_im_context_get_type: TGType; cdecl; external libgtksourceview5;
function gtk_source_vim_im_context_new: PGtkIMContext; cdecl; external libgtksourceview5;
function gtk_source_vim_im_context_get_command_text(self: PGtkSourceVimIMContext): pchar; cdecl; external libgtksourceview5;
function gtk_source_vim_im_context_get_command_bar_text(self: PGtkSourceVimIMContext): pchar; cdecl; external libgtksourceview5;
procedure gtk_source_vim_im_context_execute_command(self: PGtkSourceVimIMContext; command: pchar); cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:25:13 ===

function GTK_SOURCE_TYPE_VIM_IM_CONTEXT: TGType;
function GTK_SOURCE_VIM_IM_CONTEXT(obj: Pointer): PGtkSourceVimIMContext;
function GTK_SOURCE_IS_VIM_IM_CONTEXT(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_SOURCE_TYPE_VIM_IM_CONTEXT: TGType;
begin
  Result := gtk_source_vim_im_context_get_type;
end;

function GTK_SOURCE_VIM_IM_CONTEXT(obj: Pointer): PGtkSourceVimIMContext;
begin
  Result := PGtkSourceVimIMContext(g_type_check_instance_cast(obj, GTK_SOURCE_TYPE_VIM_IM_CONTEXT));
end;

function GTK_SOURCE_IS_VIM_IM_CONTEXT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_SOURCE_TYPE_VIM_IM_CONTEXT);
end;


{$ENDIF read_implementation}
