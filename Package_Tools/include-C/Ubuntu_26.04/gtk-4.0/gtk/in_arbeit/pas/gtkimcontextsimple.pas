unit gtkimcontextsimple;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtkimcontext;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_enum}
const
  GTK_MAX_COMPOSE_LEN = 7;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGtkIMContextSimplePrivate = type Pointer;

  PGtkIMContextSimple = ^TGtkIMContextSimple;
  TGtkIMContextSimple = record
    obj: TGtkIMContext;
    priv: PGtkIMContextSimplePrivate;
  end;

  PGtkIMContextSimpleClass = ^TGtkIMContextSimpleClass;
  TGtkIMContextSimpleClass = record
    parent_class: TGtkIMContextClass;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_im_context_simple_get_type: TGType; cdecl; external libgtk4;
function gtk_im_context_simple_new: PGtkIMContext; cdecl; external libgtk4;
procedure gtk_im_context_simple_add_table(context_simple: PGtkIMContextSimple; data: Pguint16; max_seq_len: longint; n_seqs: longint); cdecl; external libgtk4; deprecated;
procedure gtk_im_context_simple_add_compose_file(context_simple: PGtkIMContextSimple; compose_file: pchar); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 16:37:16 ===

function GTK_TYPE_IM_CONTEXT_SIMPLE: TGType;
function GTK_IM_CONTEXT_SIMPLE(obj: Pointer): PGtkIMContextSimple;
function GTK_IM_CONTEXT_SIMPLE_CLASS(klass: Pointer): PGtkIMContextSimpleClass;
function GTK_IS_IM_CONTEXT_SIMPLE(obj: Pointer): Tgboolean;
function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass: Pointer): Tgboolean;
function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj: Pointer): PGtkIMContextSimpleClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_IM_CONTEXT_SIMPLE: TGType;
begin
  GTK_TYPE_IM_CONTEXT_SIMPLE := gtk_im_context_simple_get_type;
end;

function GTK_IM_CONTEXT_SIMPLE(obj: Pointer): PGtkIMContextSimple;
begin
  Result := PGtkIMContextSimple(g_type_check_instance_cast(obj, GTK_TYPE_IM_CONTEXT_SIMPLE));
end;

function GTK_IM_CONTEXT_SIMPLE_CLASS(klass: Pointer): PGtkIMContextSimpleClass;
begin
  Result := PGtkIMContextSimpleClass(g_type_check_class_cast(klass, GTK_TYPE_IM_CONTEXT_SIMPLE));
end;

function GTK_IS_IM_CONTEXT_SIMPLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

function GTK_IS_IM_CONTEXT_SIMPLE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_IM_CONTEXT_SIMPLE);
end;

function GTK_IM_CONTEXT_SIMPLE_GET_CLASS(obj: Pointer): PGtkIMContextSimpleClass;
begin
  Result := PGtkIMContextSimpleClass(PGTypeInstance(obj)^.g_class);
end;



end.
