unit ges_text_overlay_clip;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_overlay_clip;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}

{GES_DECLARE_TYPE (TextOverlayClip, text_overlay_clip, OVERLAY_TEXT_CLIP); }
type
  TGESTextOverlayClipPrivate = record
  end;
  PGESTextOverlayClipPrivate = ^TGESTextOverlayClipPrivate;

  TGESTextOverlayClip = record
      parent : TGESOverlayClip;
      priv : PGESTextOverlayClipPrivate;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  PGESTextOverlayClip = ^TGESTextOverlayClip;

  TGESTextOverlayClipClass = record
      parent_class : TGESOverlayClipClass;
      _ges_reserved : array[0..(GES_PADDING)-1] of Tgpointer;
    end;
  PGESTextOverlayClipClass = ^TGESTextOverlayClipClass;

function ges_text_overlay_clip_get_type: TGType; cdecl; external libges;
procedure ges_text_overlay_clip_set_text(self:PGESTextOverlayClip; text:Pgchar);cdecl;external libges;
procedure ges_text_overlay_clip_set_font_desc(self:PGESTextOverlayClip; font_desc:Pgchar);cdecl;external libges;
procedure ges_text_overlay_clip_set_valign(self:PGESTextOverlayClip; valign:TGESTextVAlign);cdecl;external libges;
procedure ges_text_overlay_clip_set_halign(self:PGESTextOverlayClip; halign:TGESTextHAlign);cdecl;external libges;
procedure ges_text_overlay_clip_set_color(self:PGESTextOverlayClip; color:Tguint32);cdecl;external libges;
procedure ges_text_overlay_clip_set_xpos(self:PGESTextOverlayClip; position:Tgdouble);cdecl;external libges;
procedure ges_text_overlay_clip_set_ypos(self:PGESTextOverlayClip; position:Tgdouble);cdecl;external libges;
function ges_text_overlay_clip_get_text(self:PGESTextOverlayClip):Pgchar;cdecl;external libges;
function ges_text_overlay_clip_get_font_desc(self:PGESTextOverlayClip):Pgchar;cdecl;external libges;
function ges_text_overlay_clip_get_valignment(self:PGESTextOverlayClip):TGESTextVAlign;cdecl;external libges;
function ges_text_overlay_clip_get_color(self:PGESTextOverlayClip):Tguint32;cdecl;external libges;
function ges_text_overlay_clip_get_xpos(self:PGESTextOverlayClip):Tgdouble;cdecl;external libges;
function ges_text_overlay_clip_get_ypos(self:PGESTextOverlayClip):Tgdouble;cdecl;external libges;
function ges_text_overlay_clip_get_halignment(self:PGESTextOverlayClip):TGESTextHAlign;cdecl;external libges;
function ges_text_overlay_clip_new:PGESTextOverlayClip;cdecl;external libges;

// === Konventiert am: 13-12-24 15:20:30 ===

function GES_TYPE_OVERLAY_TEXT_CLIP: TGType;
function GES_OVERLAY_TEXT_CLIP(obj: Pointer): PGESTextOverlayClip;
function GES_IS_OVERLAY_TEXT_CLIP(obj: Pointer): Tgboolean;
function GES_OVERLAY_TEXT_CLIP_CLASS(klass: Pointer): PGESTextOverlayClipClass;
function GES_IS_OVERLAY_TEXT_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_OVERLAY_TEXT_CLIP_GET_CLASS(obj: Pointer): PGESTextOverlayClipClass;

implementation

function GES_TYPE_OVERLAY_TEXT_CLIP: TGType;
begin
  Result := ges_text_overlay_clip_get_type;
end;

function GES_OVERLAY_TEXT_CLIP(obj: Pointer): PGESTextOverlayClip;
begin
  Result := PGESTextOverlayClip(g_type_check_instance_cast(obj, GES_TYPE_OVERLAY_TEXT_CLIP));
end;

function GES_IS_OVERLAY_TEXT_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OVERLAY_TEXT_CLIP);
end;

function GES_OVERLAY_TEXT_CLIP_CLASS(klass: Pointer): PGESTextOverlayClipClass;
begin
  Result := PGESTextOverlayClipClass(g_type_check_class_cast(klass, GES_TYPE_OVERLAY_TEXT_CLIP));
end;

function GES_IS_OVERLAY_TEXT_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OVERLAY_TEXT_CLIP);
end;

function GES_OVERLAY_TEXT_CLIP_GET_CLASS(obj: Pointer): PGESTextOverlayClipClass;
begin
  Result := PGESTextOverlayClipClass(PGTypeInstance(obj)^.g_class);
end;



end.
