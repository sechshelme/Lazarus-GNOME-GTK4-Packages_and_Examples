unit 2;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}




// === Konventiert am: 25-11-24 19:41:43 ===

function PANGO_TYPE_CAIRO_FONT_MAP : TGType;
function PANGO_CAIRO_FONT_MAP(obj : Pointer) : PPangoCairoFontMap;
function PANGO_IS_CAIRO_FONT_MAP(obj : Pointer) : Tgboolean;

implementation

function PANGO_TYPE_CAIRO_FONT_MAP : TGType;
  begin
    PANGO_TYPE_CAIRO_FONT_MAP:=pango_cairo_font_map_get_type;
  end;

function PANGO_CAIRO_FONT_MAP(obj : Pointer) : PPangoCairoFontMap;
begin
  Result := PPangoCairoFontMap(g_type_check_instance_cast(obj, PANGO_TYPE_CAIRO_FONT_MAP));
end;

function PANGO_IS_CAIRO_FONT_MAP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_CAIRO_FONT_MAP);
end;



end.
