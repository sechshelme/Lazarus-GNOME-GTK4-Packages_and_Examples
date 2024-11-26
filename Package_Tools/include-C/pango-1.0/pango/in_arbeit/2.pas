unit 2;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}




// === Konventiert am: 26-11-24 13:58:36 ===

function PANGO_TYPE_XFT_FONT : TGType;
function PANGO_XFT_FONT(obj : Pointer) : PPangoXftFont;
function PANGO_XFT_IS_FONT(obj : Pointer) : Tgboolean;

implementation

function PANGO_TYPE_XFT_FONT : TGType;
  begin
    PANGO_TYPE_XFT_FONT:=pango_xft_font_get_type;
  end;

function PANGO_XFT_FONT(obj : Pointer) : PPangoXftFont;
begin
  Result := PPangoXftFont(g_type_check_instance_cast(obj, PANGO_TYPE_XFT_FONT));
end;

function PANGO_XFT_IS_FONT(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_XFT_FONT);
end;



end.
