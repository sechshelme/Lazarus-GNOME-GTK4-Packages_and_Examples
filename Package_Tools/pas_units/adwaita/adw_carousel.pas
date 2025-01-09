unit adw_carousel;

interface

uses
  fp_glib2, fp_GTK4, adw_spring_params;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {G_DECLARE_FINAL_TYPE (AdwCarousel, adw_carousel, ADW, CAROUSEL, GtkWidget) }
type
  TAdwCarousel = record
  end;
  PAdwCarousel = ^TAdwCarousel;

  TAdwCarouselClass = record
    parent_class: TGtkWidgetClass;
  end;
  PAdwCarouselClass = ^TAdwCarouselClass;

function adw_carousel_get_type: TGType; cdecl; external libadwaita;
function adw_carousel_new: PGtkWidget; cdecl; external libadwaita;
procedure adw_carousel_prepend(self: PAdwCarousel; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_carousel_append(self: PAdwCarousel; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_carousel_insert(self: PAdwCarousel; child: PGtkWidget; position: longint); cdecl; external libadwaita;
procedure adw_carousel_reorder(self: PAdwCarousel; child: PGtkWidget; position: longint); cdecl; external libadwaita;
procedure adw_carousel_remove(self: PAdwCarousel; child: PGtkWidget); cdecl; external libadwaita;
procedure adw_carousel_scroll_to(self: PAdwCarousel; widget: PGtkWidget; animate: Tgboolean); cdecl; external libadwaita;
function adw_carousel_get_nth_page(self: PAdwCarousel; n: Tguint): PGtkWidget; cdecl; external libadwaita;
function adw_carousel_get_n_pages(self: PAdwCarousel): Tguint; cdecl; external libadwaita;
function adw_carousel_get_position(self: PAdwCarousel): Tdouble; cdecl; external libadwaita;
function adw_carousel_get_interactive(self: PAdwCarousel): Tgboolean; cdecl; external libadwaita;
procedure adw_carousel_set_interactive(self: PAdwCarousel; interactive: Tgboolean); cdecl; external libadwaita;
function adw_carousel_get_spacing(self: PAdwCarousel): Tguint; cdecl; external libadwaita;
procedure adw_carousel_set_spacing(self: PAdwCarousel; spacing: Tguint); cdecl; external libadwaita;
function adw_carousel_get_scroll_params(self: PAdwCarousel): PAdwSpringParams; cdecl; external libadwaita;
procedure adw_carousel_set_scroll_params(self: PAdwCarousel; params: PAdwSpringParams); cdecl; external libadwaita;
function adw_carousel_get_allow_mouse_drag(self: PAdwCarousel): Tgboolean; cdecl; external libadwaita;
procedure adw_carousel_set_allow_mouse_drag(self: PAdwCarousel; allow_mouse_drag: Tgboolean); cdecl; external libadwaita;
function adw_carousel_get_allow_scroll_wheel(self: PAdwCarousel): Tgboolean; cdecl; external libadwaita;
procedure adw_carousel_set_allow_scroll_wheel(self: PAdwCarousel; allow_scroll_wheel: Tgboolean); cdecl; external libadwaita;
function adw_carousel_get_allow_long_swipes(self: PAdwCarousel): Tgboolean; cdecl; external libadwaita;
procedure adw_carousel_set_allow_long_swipes(self: PAdwCarousel; allow_long_swipes: Tgboolean); cdecl; external libadwaita;
function adw_carousel_get_reveal_duration(self: PAdwCarousel): Tguint; cdecl; external libadwaita;
procedure adw_carousel_set_reveal_duration(self: PAdwCarousel; reveal_duration: Tguint); cdecl; external libadwaita;

// === Konventiert am: 9-1-25 19:57:21 ===

function ADW_TYPE_CAROUSEL: TGType;
function ADW_CAROUSEL(obj: Pointer): PAdwCarousel;
function ADW_IS_CAROUSEL(obj: Pointer): Tgboolean;

implementation

function ADW_TYPE_CAROUSEL: TGType;
begin
  Result := adw_carousel_get_type;
end;

function ADW_CAROUSEL(obj: Pointer): PAdwCarousel;
begin
  Result := PAdwCarousel(g_type_check_instance_cast(obj, ADW_TYPE_CAROUSEL));
end;

function ADW_IS_CAROUSEL(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, ADW_TYPE_CAROUSEL);
end;


end.
