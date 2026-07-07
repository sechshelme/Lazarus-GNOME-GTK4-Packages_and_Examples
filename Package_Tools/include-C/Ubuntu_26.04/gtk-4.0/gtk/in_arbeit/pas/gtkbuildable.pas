unit gtkbuildable;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkBuildable = type Pointer;
  PGtkBuildableParseContext = type Pointer;

  PGtkBuildableParser = ^TGtkBuildableParser;
  TGtkBuildableParser = record
    start_element: procedure(context: PGtkBuildableParseContext; element_name: pchar; attribute_names: PPchar; attribute_values: PPchar; user_data: Tgpointer; error: PPGError); cdecl;
    end_element: procedure(context: PGtkBuildableParseContext; element_name: pchar; user_data: Tgpointer; error: PPGError); cdecl;
    text: procedure(context: PGtkBuildableParseContext; text: pchar; text_len: Tgsize; user_data: Tgpointer; error: PPGError); cdecl;
    error: procedure(context: PGtkBuildableParseContext; error: PGError; user_data: Tgpointer); cdecl;
    padding: array[0..3] of Tgpointer;
  end;

  PGtkBuildableIface = ^TGtkBuildableIface;
  TGtkBuildableIface = record
    g_iface: TGTypeInterface;
    set_id: procedure(buildable: PGtkBuildable; id: pchar); cdecl;
    get_id: function(buildable: PGtkBuildable): pchar; cdecl;
    add_child: procedure(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; _type: pchar); cdecl;
    set_buildable_property: procedure(buildable: PGtkBuildable; builder: PGtkBuilder; name: pchar; value: PGValue); cdecl;
    construct_child: function(buildable: PGtkBuildable; builder: PGtkBuilder; name: pchar): PGObject; cdecl;
    custom_tag_start: function(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: pchar; parser: PGtkBuildableParser; data: Pgpointer): Tgboolean; cdecl;
    custom_tag_end: procedure(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: pchar; data: Tgpointer); cdecl;
    custom_finished: procedure(buildable: PGtkBuildable; builder: PGtkBuilder; child: PGObject; tagname: pchar; data: Tgpointer); cdecl;
    parser_finished: procedure(buildable: PGtkBuildable; builder: PGtkBuilder); cdecl;
    get_internal_child: function(buildable: PGtkBuildable; builder: PGtkBuilder; childname: pchar): PGObject; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_buildable_get_type: TGType; cdecl; external libgtk4;
function gtk_buildable_get_buildable_id(buildable: PGtkBuildable): pchar; cdecl; external libgtk4;
procedure gtk_buildable_parse_context_push(context: PGtkBuildableParseContext; parser: PGtkBuildableParser; user_data: Tgpointer); cdecl; external libgtk4;
function gtk_buildable_parse_context_pop(context: PGtkBuildableParseContext): Tgpointer; cdecl; external libgtk4;
function gtk_buildable_parse_context_get_element(context: PGtkBuildableParseContext): pchar; cdecl; external libgtk4;
function gtk_buildable_parse_context_get_element_stack(context: PGtkBuildableParseContext): PGPtrArray; cdecl; external libgtk4;
procedure gtk_buildable_parse_context_get_position(context: PGtkBuildableParseContext; line_number: Plongint; char_number: Plongint); cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:54:26 ===

function GTK_TYPE_BUILDABLE: TGType;
function GTK_BUILDABLE(obj: Pointer): PGtkBuildable;
function GTK_IS_BUILDABLE(obj: Pointer): Tgboolean;
function GTK_BUILDABLE_GET_IFACE(obj: Pointer): PGtkBuildableIface;
{$ENDIF read_function}

implementation

function GTK_TYPE_BUILDABLE: TGType;
begin
  GTK_TYPE_BUILDABLE := gtk_buildable_get_type;
end;

function GTK_BUILDABLE(obj: Pointer): PGtkBuildable;
begin
  Result := PGtkBuildable(g_type_check_instance_cast(obj, GTK_TYPE_BUILDABLE));
end;

function GTK_IS_BUILDABLE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BUILDABLE);
end;

function GTK_BUILDABLE_GET_IFACE(obj: Pointer): PGtkBuildableIface;
begin
  Result := g_type_interface_peek(obj, GTK_TYPE_BUILDABLE);
end;



end.
