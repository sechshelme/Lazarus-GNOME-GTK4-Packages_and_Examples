unit ges_overlay_clip;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types, ges_operation_clip;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  PGESOverlayClipClass = ^TGESOverlayClipClass;
  TGESOverlayClipClass = record
    parent_class: TGESOperationClipClass;
    _ges_reserved: array[0..(GES_PADDING) - 1] of Tgpointer;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function ges_overlay_clip_get_type: TGType; cdecl; external libges;

// === Konventiert am: 28-7-26 13:06:03 ===

function GES_TYPE_OVERLAY_CLIP: TGType;
function GES_OVERLAY_CLIP(obj: Pointer): PGESOverlayClip;
function GES_IS_OVERLAY_CLIP(obj: Pointer): Tgboolean;
function GES_OVERLAY_CLIP_CLASS(klass: Pointer): PGESOverlayClipClass;
function GES_IS_OVERLAY_CLIP_CLASS(klass: Pointer): Tgboolean;
function GES_OVERLAY_CLIP_GET_CLASS(obj: Pointer): PGESOverlayClipClass;
{$ENDIF read_function}

implementation

function GES_TYPE_OVERLAY_CLIP: TGType;
begin
  Result := ges_overlay_clip_get_type;
end;

function GES_OVERLAY_CLIP(obj: Pointer): PGESOverlayClip;
begin
  Result := PGESOverlayClip(g_type_check_instance_cast(obj, GES_TYPE_OVERLAY_CLIP));
end;

function GES_IS_OVERLAY_CLIP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GES_TYPE_OVERLAY_CLIP);
end;

function GES_OVERLAY_CLIP_CLASS(klass: Pointer): PGESOverlayClipClass;
begin
  Result := PGESOverlayClipClass(g_type_check_class_cast(klass, GES_TYPE_OVERLAY_CLIP));
end;

function GES_IS_OVERLAY_CLIP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GES_TYPE_OVERLAY_CLIP);
end;

function GES_OVERLAY_CLIP_GET_CLASS(obj: Pointer): PGESOverlayClipClass;
begin
  Result := PGESOverlayClipClass(PGTypeInstance(obj)^.g_class);
end;

end.
