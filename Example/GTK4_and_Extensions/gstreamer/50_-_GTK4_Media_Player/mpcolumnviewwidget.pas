unit MPColumnViewWidget;

interface

uses
  fp_glib2, fp_GTK4;

type
  PMPColumnViewWidget = type Pointer;
  PMPColumnViewWidgetClass = type Pointer;

function mp_column_view_widget_get_type: TGType;
function mp_column_view_widget_new: PGTKWidget;
procedure mp_column_view_widget_set_data(w: PMPColumnViewWidget; i: integer);
function mp_column_view_widget_get_data(w: PMPColumnViewWidget): integer;

implementation

// ==== private

type
  TMPColumnViewWidgetPriv = record
    meineDaten: integer;
  end;
  PMPColumnViewWidgetPriv = ^TMPColumnViewWidgetPriv;

  TMPColumnViewWidgetClassPriv = record
    meineDaten: Pointer;
  end;
  PMPColumnViewWidgetClassPriv = ^TMPColumnViewWidgetClassPriv;

var
  parent_class: PMPColumnViewWidgetClass = nil;
  InstanceOffset: integer = 0;

procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMPColumnViewWidgetPriv absolute obj;
begin
  with self^ do begin
  end;
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

procedure class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMPColumnViewWidgetPriv absolute instance;
begin
  with self^ do begin
  end;
end;


// ==== public

function mp_column_view_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
  query: TGTypeQuery;
begin
  if g_once_init_enter(@type_id) then begin
    g_type_query(GTK_TYPE_COLUMN_VIEW, @query);
    InstanceOffset := query.instance_size;

    id := g_type_register_static_simple(GTK_TYPE_COLUMN_VIEW, 'MPColumnViewWidget',
      query.class_size + SizeOf(TMPColumnViewWidgetClassPriv), @class_init,
      query.instance_size + SizeOf(TMPColumnViewWidgetPriv), @init_cp, G_TYPE_FLAG_NONE);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function mp_column_view_widget_new: PGTKWidget;
var
  self: PMPColumnViewWidget absolute Result;
begin
  Result := g_object_new(mp_column_view_widget_get_type, nil);
end;

function GetPriv(w: Tgpointer): PMPColumnViewWidgetPriv; inline;
begin
  Result := PMPColumnViewWidgetPriv(w + InstanceOffset);
end;

procedure mp_column_view_widget_set_data(w: PMPColumnViewWidget; i: integer);
begin
  GetPriv(w)^.meineDaten := i;
end;

function mp_column_view_widget_get_data(w: PMPColumnViewWidget): integer;
begin
  Result := GetPriv(w)^.meineDaten;
end;

end.
