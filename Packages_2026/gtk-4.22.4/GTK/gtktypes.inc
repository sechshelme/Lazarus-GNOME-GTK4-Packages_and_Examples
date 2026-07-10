
  {$IFDEF read_struct}
type
  PGtkSnapshot = PGdkSnapshot;

  PGtkATContext = type Pointer;
  PGtkBitset = type Pointer;
  PGtkBuilder = type Pointer;
  PGtkBuilderScope = type Pointer;
  PGtkCssStyleChange = type Pointer;
  PGtkEventController = type Pointer;
  PGtkGesture = type Pointer;
  PGtkListItem = type Pointer;
  PGtkListItemFactory = type Pointer;
  PGtkNative = type Pointer;
  PGtkRoot = type Pointer;
  PGtkScrollInfo = type Pointer;
  PGtkSettings = type Pointer;
  PGtkShortcut = type Pointer;
  PGtkShortcutAction = type Pointer;
  PGtkShortcutTrigger = type Pointer;
  PGtkTooltip = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function GTK_INVALID_LIST_POSITION: Tguint;
{$ENDIF read_function}


// === Konventiert am: 6-7-26 16:45:06 ===

{$IFDEF read_implementation}

function GTK_INVALID_LIST_POSITION: Tguint;
begin
  GTK_INVALID_LIST_POSITION := Tguint($ffffffff);
end;

{$ENDIF read_implementation}
