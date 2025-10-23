{$IFDEF read_interface}

  {GES_DECLARE_TYPE( TextOverlay, text_overlay, TEXT_OVERLAY); }
type
  TGESTextOverlayPrivate = record
  end;
  PGESTextOverlayPrivate = ^TGESTextOverlayPrivate;

  TGESTextOverlay = record
    parent: TGESOperation;
    priv: PGESTextOverlayPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTextOverlay = ^TGESTextOverlay;

  TGESTextOverlayClass = record
    parent_class: TGESOperationClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTextOverlayClass = ^TGESTextOverlayClass;

function ges_text_overlay_get_type: TGType; cdecl; external libges;
procedure ges_text_overlay_set_text(self: PGESTextOverlay; Text: Pgchar); cdecl; external libges;
procedure ges_text_overlay_set_font_desc(self: PGESTextOverlay; font_desc: Pgchar); cdecl; external libges;
procedure ges_text_overlay_set_halignment(self: PGESTextOverlay; halign: TGESTextHAlign); cdecl; external libges;
procedure ges_text_overlay_set_valignment(self: PGESTextOverlay; valign: TGESTextVAlign); cdecl; external libges;
procedure ges_text_overlay_set_color(self: PGESTextOverlay; color: Tguint32); cdecl; external libges;
procedure ges_text_overlay_set_xpos(self: PGESTextOverlay; position: Tgdouble); cdecl; external libges;
procedure ges_text_overlay_set_ypos(self: PGESTextOverlay; position: Tgdouble); cdecl; external libges;
function ges_text_overlay_new: PGESTextOverlay; cdecl; external libges; deprecated 'GES_DEPRECATED';
function ges_text_overlay_get_text(self: PGESTextOverlay): Pgchar; cdecl; external libges;
function ges_text_overlay_get_font_desc(self: PGESTextOverlay): pchar; cdecl; external libges;
function ges_text_overlay_get_halignment(self: PGESTextOverlay): TGESTextHAlign; cdecl; external libges;
function ges_text_overlay_get_valignment(self: PGESTextOverlay): TGESTextVAlign; cdecl; external libges;
function ges_text_overlay_get_color(self: PGESTextOverlay): Tguint32; cdecl; external libges;
function ges_text_overlay_get_xpos(self: PGESTextOverlay): Tgdouble; cdecl; external libges;
function ges_text_overlay_get_ypos(self: PGESTextOverlay): Tgdouble; cdecl; external libges;

// === Konventiert am: 13-12-24 15:20:26 ===

function GES_TYPE_TEXT_OVERLAY: TGType;
function GES_TEXT_OVERLAY(obj: Pointer): PGESTextOverlay;
function GES_IS_TEXT_OVERLAY(obj: Pointer): Tgboolean;
function GES_TEXT_OVERLAY_CLASS(klass: Pointer): PGESTextOverlayClass;
function GES_IS_TEXT_OVERLAY_CLASS(klass: Pointer): Tgboolean;
function GES_TEXT_OVERLAY_GET_CLASS(obj: Pointer): PGESTextOverlayClass;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function GES_TYPE_TEXT_OVERLAY: TGType;
begin
  Result := ges_text_overlay_get_type;
end;

function GES_TEXT_OVERLAY(obj: Pointer): PGESTextOverlay;
begin
  Result := PGESTextOverlay(g_type_check_instance_cast(obj, GES_TYPE_TEXT_OVERLAY));
end;

function GES_IS_TEXT_OVERLAY(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TEXT_OVERLAY);
end;

function GES_TEXT_OVERLAY_CLASS(klass: Pointer): PGESTextOverlayClass;
begin
  Result := PGESTextOverlayClass(g_type_check_class_cast(klass, GES_TYPE_TEXT_OVERLAY));
end;

function GES_IS_TEXT_OVERLAY_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TEXT_OVERLAY);
end;

function GES_TEXT_OVERLAY_GET_CLASS(obj: Pointer): PGESTextOverlayClass;
begin
  Result := PGESTextOverlayClass(PGTypeInstance(obj)^.g_class);
end;




{$ENDIF read_implementation}
