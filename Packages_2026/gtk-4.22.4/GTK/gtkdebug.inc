

  {$IFDEF read_enum}
type
  PGtkDebugFlags = ^TGtkDebugFlags;
  TGtkDebugFlags = longint;
const
  GTK_DEBUG_TEXT = 1 shl 0;
  GTK_DEBUG_TREE = 1 shl 1;
  GTK_DEBUG_KEYBINDINGS = 1 shl 2;
  GTK_DEBUG_MODULES = 1 shl 3;
  GTK_DEBUG_GEOMETRY = 1 shl 4;
  GTK_DEBUG_ICONTHEME = 1 shl 5;
  GTK_DEBUG_PRINTING = 1 shl 6;
  GTK_DEBUG_BUILDER_TRACE = 1 shl 7;
  GTK_DEBUG_SIZE_REQUEST = 1 shl 8;
  GTK_DEBUG_NO_CSS_CACHE = 1 shl 9;
  GTK_DEBUG_INTERACTIVE = 1 shl 10;
  GTK_DEBUG_TOUCHSCREEN = 1 shl 11;
  GTK_DEBUG_ACTIONS = 1 shl 12;
  GTK_DEBUG_LAYOUT = 1 shl 13;
  GTK_DEBUG_SNAPSHOT = 1 shl 14;
  GTK_DEBUG_CONSTRAINTS = 1 shl 15;
  GTK_DEBUG_BUILDER_OBJECTS = 1 shl 16;
  GTK_DEBUG_A11Y = 1 shl 17;
  GTK_DEBUG_ICONFALLBACK = 1 shl 18;
  GTK_DEBUG_INVERT_TEXT_DIR = 1 shl 19;
  GTK_DEBUG_CSS = 1 shl 20;
  GTK_DEBUG_BUILDER = 1 shl 21;
  GTK_DEBUG_SESSION = 1 shl 22;
  {$ENDIF read_enum}

{$IFDEF read_struct}
function gtk_get_debug_flags: TGtkDebugFlags; cdecl; external libgtk4;
procedure gtk_set_debug_flags(flags: TGtkDebugFlags); cdecl; external libgtk4;
{$ENDIF read_struct}

// === Konventiert am: 6-7-26 14:08:14 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
