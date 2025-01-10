{$IFDEF read_interface}



  {G_DECLARE_FINAL_TYPE (AdwCarouselIndicatorDots, adw_carousel_indicator_dots, ADW, CAROUSEL_INDICATOR_DOTS, GtkWidget) }
type
  TAdwCarouselIndicatorDots = record
  end;
  PAdwCarouselIndicatorDots = ^TAdwCarouselIndicatorDots;

  TAdwCarouselIndicatorDotsClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwCarouselIndicatorDotsClass = ^TAdwCarouselIndicatorDotsClass;

function adw_carousel_indicator_dots_get_type: TGType; cdecl; external libadwaita;
function adw_carousel_indicator_dots_new: PGtkWidget; cdecl; external libadwaita;
function adw_carousel_indicator_dots_get_carousel(self: PAdwCarouselIndicatorDots): PAdwCarousel; cdecl; external libadwaita;
procedure adw_carousel_indicator_dots_set_carousel(self: PAdwCarouselIndicatorDots; carousel: PAdwCarousel); cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:01:30 ===

function ADW_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
function ADW_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdwCarouselIndicatorDots;
function ADW_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function ADW_TYPE_CAROUSEL_INDICATOR_DOTS: TGType;
begin
  Result := adw_carousel_indicator_dots_get_type;
end;

function ADW_CAROUSEL_INDICATOR_DOTS(obj: Pointer): PAdwCarouselIndicatorDots;
begin
  Result := PAdwCarouselIndicatorDots(g_type_check_instance_cast(obj, ADW_TYPE_CAROUSEL_INDICATOR_DOTS));
end;

function ADW_IS_CAROUSEL_INDICATOR_DOTS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CAROUSEL_INDICATOR_DOTS);
end;


{$ENDIF read_implementation}
