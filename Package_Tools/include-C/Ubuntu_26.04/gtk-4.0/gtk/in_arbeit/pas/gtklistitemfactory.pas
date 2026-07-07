unit gtklistitemfactory;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4, gtktypes;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {$IFDEF read_struct}
type
  PGtkListItemFactoryClass = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gtk_list_item_factory_get_type: TGType; cdecl; external libgtk4;

// === Konventiert am: 6-7-26 17:10:30 ===

function GTK_TYPE_LIST_ITEM_FACTORY: TGType;
function GTK_LIST_ITEM_FACTORY(obj: Pointer): PGtkListItemFactory;
function GTK_LIST_ITEM_FACTORY_CLASS(klass: Pointer): PGtkListItemFactoryClass;
function GTK_IS_LIST_ITEM_FACTORY(obj: Pointer): Tgboolean;
function GTK_IS_LIST_ITEM_FACTORY_CLASS(klass: Pointer): Tgboolean;
function GTK_LIST_ITEM_FACTORY_GET_CLASS(obj: Pointer): PGtkListItemFactoryClass;
{$ENDIF read_function}

implementation

function GTK_TYPE_LIST_ITEM_FACTORY: TGType;
begin
  GTK_TYPE_LIST_ITEM_FACTORY := gtk_list_item_factory_get_type;
end;

function GTK_LIST_ITEM_FACTORY(obj: Pointer): PGtkListItemFactory;
begin
  Result := PGtkListItemFactory(g_type_check_instance_cast(obj, GTK_TYPE_LIST_ITEM_FACTORY));
end;

function GTK_LIST_ITEM_FACTORY_CLASS(klass: Pointer): PGtkListItemFactoryClass;
begin
  Result := PGtkListItemFactoryClass(g_type_check_class_cast(klass, GTK_TYPE_LIST_ITEM_FACTORY));
end;

function GTK_IS_LIST_ITEM_FACTORY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_LIST_ITEM_FACTORY);
end;

function GTK_IS_LIST_ITEM_FACTORY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_LIST_ITEM_FACTORY);
end;

function GTK_LIST_ITEM_FACTORY_GET_CLASS(obj: Pointer): PGtkListItemFactoryClass;
begin
  Result := PGtkListItemFactoryClass(PGTypeInstance(obj)^.g_class);
end;



end.
