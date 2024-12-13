unit ges_title_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_source_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  {GES_DECLARE_TYPE (TitleClip, title_clip, TITLE_CLIP); }
type
  TGESTitleClipPrivate = record
  end;
  PGESTitleClipPrivate = ^TGESTitleClipPrivate;

  TGESTitleClip = record
    parent: TGESSourceClip;
    priv: PGESTitleClipPrivate;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTitleClip = ^TGESTitleClip;

  TGESTitleClipClass = record
    parent_class: TGESSourceClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  PGESTitleClipClass = ^TGESTitleClipClass;

function ges_title_clip_get_type: TGType; cdecl; external libges;
procedure ges_title_clip_set_text(self: PGESTitleClip; Text: Pgchar); cdecl; external libges;
procedure ges_title_clip_set_font_desc(self: PGESTitleClip; font_desc: Pgchar); cdecl; external libges;
procedure ges_title_clip_set_valignment(self: PGESTitleClip; valign: TGESTextVAlign); cdecl; external libges;
procedure ges_title_clip_set_halignment(self: PGESTitleClip; halign: TGESTextHAlign); cdecl; external libges;
procedure ges_title_clip_set_color(self: PGESTitleClip; color: Tguint32); cdecl; external libges;
procedure ges_title_clip_set_background(self: PGESTitleClip; background: Tguint32); cdecl; external libges;
procedure ges_title_clip_set_xpos(self: PGESTitleClip; position: Tgdouble); cdecl; external libges;
procedure ges_title_clip_set_ypos(self: PGESTitleClip; position: Tgdouble); cdecl; external libges;
function ges_title_clip_get_font_desc(self: PGESTitleClip): Pgchar; cdecl; external libges;
function ges_title_clip_get_valignment(self: PGESTitleClip): TGESTextVAlign; cdecl; external libges;
function ges_title_clip_get_halignment(self: PGESTitleClip): TGESTextHAlign; cdecl; external libges;
function ges_title_clip_get_text_color(self: PGESTitleClip): Tguint32; cdecl; external libges;
function ges_title_clip_get_background_color(self: PGESTitleClip): Tguint32; cdecl; external libges;
function ges_title_clip_get_xpos(self: PGESTitleClip): Tgdouble; cdecl; external libges;
function ges_title_clip_get_ypos(self: PGESTitleClip): Tgdouble; cdecl; external libges;
function ges_title_clip_get_text(self: PGESTitleClip): Pgchar; cdecl; external libges;
function ges_title_clip_new: PGESTitleClip; cdecl; external libges;

// === Konventiert am: 13-12-24 15:00:53 ===

function GES_TYPE_TITLE_CLIP: TGType;
function GES_TITLE_CLIP(obj: Pointer): PGESTitleClip;
function GES_IS_TITLE_CLIP(obj: Pointer): Tgboolean;
function GES_TITLE_CLIP_CLASS(klass: Pointer): PGESTitleClipClass;
function GES_IS_TITLE_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_TITLE_CLIP_GET_CLASS(obj: Pointer): PGESTitleClipClass;

implementation

function GES_TYPE_TITLE_CLIP: TGType;
begin
  Result := ges_title_clip_get_type;
end;

function GES_TITLE_CLIP(obj: Pointer): PGESTitleClip;
begin
  Result := PGESTitleClip(g_type_check_instance_cast(obj, GES_TYPE_TITLE_CLIP));
end;

function GES_IS_TITLE_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_TITLE_CLIP);
end;

function GES_TITLE_CLIP_CLASS(klass: Pointer): PGESTitleClipClass;
begin
  Result := PGESTitleClipClass(g_type_check_class_cast(klass, GES_TYPE_TITLE_CLIP));
end;

function GES_IS_TITLE_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_TITLE_CLIP);
end;

function GES_TITLE_CLIP_GET_CLASS(obj: Pointer): PGESTitleClipClass;
begin
  Result := PGESTitleClipClass(PGTypeInstance(obj)^.g_class);
end;




end.
