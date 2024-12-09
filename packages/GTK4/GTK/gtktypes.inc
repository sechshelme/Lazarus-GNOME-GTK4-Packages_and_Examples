
{$IFDEF read_interface}

type
  PGtkSnapshot = ^TGtkSnapshot;
  TGtkSnapshot = TGdkSnapshot;


  // ===  Zwingende Auslagerungen wegen Kreuzverbindungen mit gtkwidget

  TGtkWidgetPrivate = record
  end;
  PGtkWidgetPrivate = ^TGtkWidgetPrivate;

  TGtkWidget = record
    parent_instance: TGInitiallyUnowned;
    priv: PGtkWidgetPrivate;
  end;
  PGtkWidget = ^TGtkWidget;
  PPGtkWidget = ^PGtkWidget;

  TGtkApplication = record
    parent_instance: TGApplication;
  end;
  PGtkApplication = ^TGtkApplication;

  TGtkNative = record
  end;
  PGtkNative = ^TGtkNative;

  TGtkLayoutManager = record
    parent_instance: TGObject
  end;
  PGtkLayoutManager = ^TGtkLayoutManager;

  TGtkRoot = record
  end;
  PGtkRoot = ^TGtkRoot;

  TGtkShortcut = record
  end;
  PGtkShortcut = ^TGtkShortcut;
  TGtkShortcutFunc = function(widget: PGtkWidget; args: PGVariant; user_data: Tgpointer): Tgboolean; cdecl;

  TGtkCssStyleChange = record
  end;
  PGtkCssStyleChange = ^TGtkCssStyleChange;

  TGtkStyleContext = record
    parent_object: TGObject;
  end;
  PGtkStyleContext = ^TGtkStyleContext;

  TGtkTooltip = record
  end;
  PGtkTooltip = ^TGtkTooltip;

  TGtkSettings = record
  end;
  PGtkSettings = ^TGtkSettings;

  TGtkEventController = record
  end;
  PGtkEventController = ^TGtkEventController;

  TGtkBuilderScope = record
  end;
  PGtkBuilderScope = ^TGtkBuilderScope;

  TGtkListItemFactory = record
  end;
  PGtkListItemFactory = ^TGtkListItemFactory;

  TGtkAccessible = record
  end;
  PGtkAccessible = ^TGtkAccessible;
  PPGtkAccessible = ^PGtkAccessible;

  TGtkWindowGroupPrivate = record
  end;
  PGtkWindowGroupPrivate = ^TGtkWindowGroupPrivate;

  TGtkWindowGroup = record
    parent_instance: TGObject;
    priv: PGtkWindowGroupPrivate;
  end;
  PGtkWindowGroup = ^TGtkWindowGroup;

  TGtkColumnViewColumn = record
  end;
  PGtkColumnViewColumn = ^TGtkColumnViewColumn;

  TGtkCellAreaContext = record
    parent_instance: TGObject;
  end;
  PGtkCellAreaContext = ^TGtkCellAreaContext;

  TGtkTreeSelection = record
  end;
  PGtkTreeSelection = ^TGtkTreeSelection;



type
  PGtkBuilderClosureFlags = ^TGtkBuilderClosureFlags;
  TGtkBuilderClosureFlags = longint;

const
  GTK_BUILDER_CLOSURE_SWAPPED = 1 shl 0;


  // =======================



function GTK_INVALID_LIST_POSITION: Tguint;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GTK_INVALID_LIST_POSITION: Tguint;
begin
  GTK_INVALID_LIST_POSITION := Tguint($ffffffff);
end;


{$ENDIF read_implementation}
