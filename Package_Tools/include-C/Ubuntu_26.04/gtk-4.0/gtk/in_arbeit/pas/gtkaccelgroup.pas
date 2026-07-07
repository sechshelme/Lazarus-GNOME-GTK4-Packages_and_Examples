unit gtkaccelgroup;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gtk4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

{$IFDEF read_function}
function gtk_accelerator_valid(keyval: Tguint; modifiers: TGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_parse(accelerator: pchar; accelerator_key: Pguint; accelerator_mods: PGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_parse_with_keycode(accelerator: pchar; display: PGdkDisplay; accelerator_key: Pguint; accelerator_codes: PPguint; accelerator_mods: PGdkModifierType): Tgboolean; cdecl; external libgtk4;
function gtk_accelerator_name(accelerator_key: Tguint; accelerator_mods: TGdkModifierType): pchar; cdecl; external libgtk4;
function gtk_accelerator_name_with_keycode(display: PGdkDisplay; accelerator_key: Tguint; keycode: Tguint; accelerator_mods: TGdkModifierType): pchar; cdecl; external libgtk4;
function gtk_accelerator_get_label(accelerator_key: Tguint; accelerator_mods: TGdkModifierType): pchar; cdecl; external libgtk4;
function gtk_accelerator_get_label_with_keycode(display: PGdkDisplay; accelerator_key: Tguint; keycode: Tguint; accelerator_mods: TGdkModifierType): pchar; cdecl; external libgtk4;
function gtk_accelerator_get_accessible_label(accelerator_key: Tguint; accelerator_mods: TGdkModifierType): pchar; cdecl; external libgtk4;
function gtk_accelerator_get_default_mod_mask: TGdkModifierType; cdecl; external libgtk4;
{$ENDIF read_function}

// === Konventiert am: 5-7-26 16:29:10 ===


implementation



end.
