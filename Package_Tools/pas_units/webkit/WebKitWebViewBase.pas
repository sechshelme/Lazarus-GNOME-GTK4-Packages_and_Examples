unit WebKitWebViewBase;

interface

uses
  fp_glib2, fp_GTK4, web_common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {WEBKIT_DECLARE_DERIVABLE_TYPE (WebKitWebViewBase, webkit_web_view_base, WEBKIT, WEB_VIEW_BASE, GtkWidget) }
type
  TWebKitWebViewBaseClass = record
    parentClass: TGtkWidgetClass;
    _webkit_reserved0: procedure; cdecl;
    _webkit_reserved1: procedure; cdecl;
    _webkit_reserved2: procedure; cdecl;
    _webkit_reserved3: procedure; cdecl;
  end;
  PWebKitWebViewBaseClass = ^TWebKitWebViewBaseClass;

function webkit_web_view_base_get_type: TGType; cdecl; external libwebkit;


// === Konventiert am: 2-1-25 19:20:05 ===

function WEBKIT_TYPE_WEB_VIEW_BASE: TGType;
function WEBKIT_WEB_VIEW_BASE(obj: Pointer): PWebKitWebViewBase;
function WEBKIT_IS_WEB_VIEW_BASE(obj: Pointer): Tgboolean;
function WEBKIT_WEB_VIEW_BASE_CLASS(klass: Pointer): PWebKitWebViewBaseClass;
function WEBKIT_IS_WEB_VIEW_BASE_CLASS(klass: Pointer): Tgboolean;
function WEBKIT_WEB_VIEW_BASE_GET_CLASS(obj: Pointer): PWebKitWebViewBaseClass;

implementation

function WEBKIT_TYPE_WEB_VIEW_BASE: TGType;
begin
  Result := webkit_web_view_base_get_type;
end;

function WEBKIT_WEB_VIEW_BASE(obj: Pointer): PWebKitWebViewBase;
begin
  Result := PWebKitWebViewBase(g_type_check_instance_cast(obj, WEBKIT_TYPE_WEB_VIEW_BASE));
end;

function WEBKIT_IS_WEB_VIEW_BASE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, WEBKIT_TYPE_WEB_VIEW_BASE);
end;

function WEBKIT_WEB_VIEW_BASE_CLASS(klass: Pointer): PWebKitWebViewBaseClass;
begin
  Result := PWebKitWebViewBaseClass(g_type_check_class_cast(klass, WEBKIT_TYPE_WEB_VIEW_BASE));
end;

function WEBKIT_IS_WEB_VIEW_BASE_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, WEBKIT_TYPE_WEB_VIEW_BASE);
end;

function WEBKIT_WEB_VIEW_BASE_GET_CLASS(obj: Pointer): PWebKitWebViewBaseClass;
begin
  Result := PWebKitWebViewBaseClass(PGTypeInstance(obj)^.g_class);
end;



end.
