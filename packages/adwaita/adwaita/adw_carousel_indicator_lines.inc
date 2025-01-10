{$IFDEF read_interface}


  {G_DECLARE_FINAL_TYPE (AdwCarouselIndicatorLines, adw_carousel_indicator_lines, ADW, CAROUSEL_INDICATOR_LINES, GtkWidget) }
type
  TAdwCarouselIndicatorLines = record
  end;
  PAdwCarouselIndicatorLines = ^TAdwCarouselIndicatorLines;

  TAdwCarouselIndicatorLinesClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwCarouselIndicatorLinesClass = ^TAdwCarouselIndicatorLinesClass;

function adw_carousel_indicator_lines_get_type: TGType; cdecl; external libadwaita;
function adw_carousel_indicator_lines_new: PGtkWidget; cdecl; external libadwaita;
function adw_carousel_indicator_lines_get_carousel(self: PAdwCarouselIndicatorLines): PAdwCarousel; cdecl; external libadwaita;
procedure adw_carousel_indicator_lines_set_carousel(self: PAdwCarouselIndicatorLines; carousel: PAdwCarousel); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 14:49:45 ===

function ADW_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
function ADW_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdwCarouselIndicatorLines;
function ADW_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_CAROUSEL_INDICATOR_LINES: TGType;
begin
  Result := adw_carousel_indicator_lines_get_type;
end;

function ADW_CAROUSEL_INDICATOR_LINES(obj: Pointer): PAdwCarouselIndicatorLines;
begin
  Result := PAdwCarouselIndicatorLines(g_type_check_instance_cast(obj, ADW_TYPE_CAROUSEL_INDICATOR_LINES));
end;

function ADW_IS_CAROUSEL_INDICATOR_LINES(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CAROUSEL_INDICATOR_LINES);
end;


{$ENDIF read_implementation}
