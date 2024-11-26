
#define PANGO_TYPE_XFT_FONT              (pango_xft_font_get_type ())
#define PANGO_XFT_FONT(object)           (G_TYPE_CHECK_INSTANCE_CAST ((object), PANGO_TYPE_XFT_FONT, PangoXftFont))
#define PANGO_XFT_IS_FONT(object)        (G_TYPE_CHECK_INSTANCE_TYPE ((object), PANGO_TYPE_XFT_FONT))


