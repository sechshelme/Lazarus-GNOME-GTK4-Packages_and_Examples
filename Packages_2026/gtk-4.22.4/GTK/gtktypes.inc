
  {$IFDEF read_struct}
type
  PGtkSnapshot = PGdkSnapshot;


  PGtkATContext = type Pointer;                    // blank
  PGtkBitset = type Pointer;                       // blank
  PGtkBuilder = type Pointer;                      // blank
  PGtkBuilderScope = type Pointer;                 // blank
  PGtkCssStyleChange = type Pointer;               // blank
  PGtkEventController = type Pointer;              // blank
  PGtkGesture = type Pointer;                      // blank
  PGtkListItem = type Pointer;                     // blank
  PGtkListItemFactory = type Pointer;              // blank
  PGtkNative = type Pointer;                       // blank
  PGtkRoot = type Pointer;                         // blank
  PGtkScrollInfo = type Pointer;                   // blank
  PGtkSettings = type Pointer;                     // blank
  PGtkShortcut = type Pointer;                     // blank
  PGtkShortcutAction = type Pointer;               // blank
  PGtkShortcutTrigger = type Pointer;              // blank
  PGtkStyleContext = type Pointer;                 // deprecated full
  PGtkTooltip = type Pointer;                      // blank



  // zum berabeiten und löschen !

  PGtkPrintSettings=Pointer;                // gtk/print
//  PGtkPageSetup=pointer;                    // gtk/print


  PGtkAccessible = type Pointer;                   // deprecated blank
  PPGtkAccessible = ^PGtkAccessible;
  PGtkShortcutsWindow = type Pointer;              // deprecated blank
  PGtkEntryCompletion=Pointer;                      // deprecated blank


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
