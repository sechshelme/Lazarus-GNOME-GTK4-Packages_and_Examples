

  {$IFDEF read_enum}
type
  PAsScreenshotKind = ^TAsScreenshotKind;
  TAsScreenshotKind = longint;
const
  AS_SCREENSHOT_KIND_UNKNOWN = 0;
  AS_SCREENSHOT_KIND_DEFAULT = 1;
  AS_SCREENSHOT_KIND_EXTRA = 2;
  AS_SCREENSHOT_KIND_LAST = 3;

type
  PAsScreenshotMediaKind = ^TAsScreenshotMediaKind;
  TAsScreenshotMediaKind = longint;
const
  AS_SCREENSHOT_MEDIA_KIND_UNKNOWN = 0;
  AS_SCREENSHOT_MEDIA_KIND_IMAGE = 1;
  AS_SCREENSHOT_MEDIA_KIND_VIDEO = 2;
  AS_SCREENSHOT_MEDIA_KIND_LAST = 3;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  TAsScreenshot = record
    parent_instance: TGObject;
  end;
  PAsScreenshot = ^TAsScreenshot;

  PAsScreenshotClass = ^TAsScreenshotClass;
  TAsScreenshotClass = record
    parent_class: TGObjectClass;
    _as_reserved1: procedure; cdecl;
    _as_reserved2: procedure; cdecl;
    _as_reserved3: procedure; cdecl;
    _as_reserved4: procedure; cdecl;
    _as_reserved5: procedure; cdecl;
    _as_reserved6: procedure; cdecl;
  end;
  {$ENDIF read_struct}

{$IFDEF read_function}
function as_screenshot_get_type: TGType; cdecl; external libappstream;
function as_screenshot_kind_from_string(kind: Pgchar): TAsScreenshotKind; cdecl; external libappstream;
function as_screenshot_kind_to_string(kind: TAsScreenshotKind): Pgchar; cdecl; external libappstream;
function as_screenshot_is_valid(screenshot: PAsScreenshot): Tgboolean; cdecl; external libappstream;
function as_screenshot_new: PAsScreenshot; cdecl; external libappstream;
function as_screenshot_get_kind(screenshot: PAsScreenshot): TAsScreenshotKind; cdecl; external libappstream;
procedure as_screenshot_set_kind(screenshot: PAsScreenshot; kind: TAsScreenshotKind); cdecl; external libappstream;
function as_screenshot_get_environment(screenshot: PAsScreenshot): Pgchar; cdecl; external libappstream;
procedure as_screenshot_set_environment(screenshot: PAsScreenshot; env_id: Pgchar); cdecl; external libappstream;
function as_screenshot_get_context(screenshot: PAsScreenshot): PAsContext; cdecl; external libappstream;
procedure as_screenshot_set_context(screenshot: PAsScreenshot; context: PAsContext); cdecl; external libappstream;
function as_screenshot_get_media_kind(screenshot: PAsScreenshot): TAsScreenshotMediaKind; cdecl; external libappstream;
function as_screenshot_get_caption(screenshot: PAsScreenshot): Pgchar; cdecl; external libappstream;
procedure as_screenshot_set_caption(screenshot: PAsScreenshot; caption: Pgchar; locale: Pgchar); cdecl; external libappstream;
function as_screenshot_get_images_all(screenshot: PAsScreenshot): PGPtrArray; cdecl; external libappstream;
function as_screenshot_get_images(screenshot: PAsScreenshot): PGPtrArray; cdecl; external libappstream;
function as_screenshot_get_image(screenshot: PAsScreenshot; width: Tguint; height: Tguint; scale: Tguint): PAsImage; cdecl; external libappstream;
procedure as_screenshot_add_image(screenshot: PAsScreenshot; image: PAsImage); cdecl; external libappstream;
procedure as_screenshot_clear_images(screenshot: PAsScreenshot); cdecl; external libappstream;
function as_screenshot_get_videos_all(screenshot: PAsScreenshot): PGPtrArray; cdecl; external libappstream;
function as_screenshot_get_videos(screenshot: PAsScreenshot): PGPtrArray; cdecl; external libappstream;
procedure as_screenshot_add_video(screenshot: PAsScreenshot; video: PAsVideo); cdecl; external libappstream;

// === Konventiert am: 30-7-26 19:34:55 ===

function AS_TYPE_SCREENSHOT: TGType;
function AS_SCREENSHOT(obj: Pointer): PAsScreenshot;
function AS_IS_SCREENSHOT(obj: Pointer): Tgboolean;
function AS_SCREENSHOT_CLASS(klass: Pointer): PAsScreenshotClass;
function AS_IS_SCREENSHOT_CLASS(klass: Pointer): Tgboolean;
function AS_SCREENSHOT_GET_CLASS(obj: Pointer): PAsScreenshotClass;
{$ENDIF read_function}


{$IFDEF read_implementation}

function AS_TYPE_SCREENSHOT: TGType;
begin
  Result := as_screenshot_get_type;
end;

function AS_SCREENSHOT(obj: Pointer): PAsScreenshot;
begin
  Result := PAsScreenshot(g_type_check_instance_cast(obj, AS_TYPE_SCREENSHOT));
end;

function AS_IS_SCREENSHOT(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, AS_TYPE_SCREENSHOT);
end;

function AS_SCREENSHOT_CLASS(klass: Pointer): PAsScreenshotClass;
begin
  Result := PAsScreenshotClass(g_type_check_class_cast(klass, AS_TYPE_SCREENSHOT));
end;

function AS_IS_SCREENSHOT_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, AS_TYPE_SCREENSHOT);
end;

function AS_SCREENSHOT_GET_CLASS(obj: Pointer): PAsScreenshotClass;
begin
  Result := PAsScreenshotClass(PGTypeInstance(obj)^.g_class);
end;

{$ENDIF read_implementation}
