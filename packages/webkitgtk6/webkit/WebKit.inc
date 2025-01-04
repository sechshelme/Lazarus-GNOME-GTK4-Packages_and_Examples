{$IFDEF read_interface}


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


  TWebKitWebPage = record
  end;
  PWebKitWebPage = ^TWebKitWebPage;

{$ENDIF read_interface}


{$IFDEF read_implementation}






{$ENDIF read_implementation}
