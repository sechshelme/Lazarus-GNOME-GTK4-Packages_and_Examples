unit web_common;

interface

uses
  fp_glib2, fp_GTK4;

// ==== ausgelagertes

type
TWebKitWebViewBasePrivate = record
end;
PWebKitWebViewBasePrivate = ^TWebKitWebViewBasePrivate;

TWebKitWebViewBase = record
  parent_instance: TGtkWidget;
  priv: PWebKitWebViewBasePrivate;
end;
PWebKitWebViewBase = ^TWebKitWebViewBase;


TWebKitWebViewPrivate = record
end;
PWebKitWebViewPrivate = ^TWebKitWebViewPrivate;

TWebKitWebView = record
  parent_instance: TWebKitWebViewBase;
  priv: PWebKitWebViewPrivate;
end;
PWebKitWebView = ^TWebKitWebView;


TWebKitContextMenu = record
  end;
  PWebKitContextMenu = ^TWebKitContextMenu;

  TWebKitContextMenuClass = record
    parent_class: TGObjectClass;
  end;
  PWebKitContextMenuClass = ^TWebKitContextMenuClass;




implementation

end.

