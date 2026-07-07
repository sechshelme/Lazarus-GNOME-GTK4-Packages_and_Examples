unit gtkbuilderlistitemfactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes, gtkbuilderscope, gtklistitemfactory;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGtkBuilderListItemFactory = type Pointer;
  PGtkBuilderListItemFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_builder_list_item_factory_get_type: TGType; cdecl; external libgtk4;
function gtk_builder_list_item_factory_new_from_bytes(scope: PGtkBuilderScope; bytes: PGBytes): PGtkListItemFactory; cdecl; external libgtk4;
function gtk_builder_list_item_factory_new_from_resource(scope: PGtkBuilderScope; resource_path: pchar): PGtkListItemFactory; cdecl; external libgtk4;
function gtk_builder_list_item_factory_get_bytes(self: PGtkBuilderListItemFactory): PGBytes; cdecl; external libgtk4;
function gtk_builder_list_item_factory_get_resource(self: PGtkBuilderListItemFactory): pchar; cdecl; external libgtk4;
function gtk_builder_list_item_factory_get_scope(self: PGtkBuilderListItemFactory): PGtkBuilderScope; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 13:53:40 ===

function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY: TGType;
function GTK_BUILDER_LIST_ITEM_FACTORY(obj: Pointer): PGtkBuilderListItemFactory;
function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(klass: Pointer): PGtkBuilderListItemFactoryClass;
function GTK_IS_BUILDER_LIST_ITEM_FACTORY(obj: Pointer): Tgboolean;
function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(obj: Pointer): PGtkBuilderListItemFactoryClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_BUILDER_LIST_ITEM_FACTORY: TGType;
begin
  GTK_TYPE_BUILDER_LIST_ITEM_FACTORY := gtk_builder_list_item_factory_get_type;
end;

function GTK_BUILDER_LIST_ITEM_FACTORY(obj: Pointer): PGtkBuilderListItemFactory;
begin
  Result := PGtkBuilderListItemFactory(g_type_check_instance_cast(obj, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY));
end;

function GTK_BUILDER_LIST_ITEM_FACTORY_CLASS(klass: Pointer): PGtkBuilderListItemFactoryClass;
begin
  Result := PGtkBuilderListItemFactoryClass(g_type_check_class_cast(klass, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY));
end;

function GTK_IS_BUILDER_LIST_ITEM_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

function GTK_IS_BUILDER_LIST_ITEM_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_BUILDER_LIST_ITEM_FACTORY);
end;

function GTK_BUILDER_LIST_ITEM_FACTORY_GET_CLASS(obj: Pointer): PGtkBuilderListItemFactoryClass;
begin
  Result := PGtkBuilderListItemFactoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
