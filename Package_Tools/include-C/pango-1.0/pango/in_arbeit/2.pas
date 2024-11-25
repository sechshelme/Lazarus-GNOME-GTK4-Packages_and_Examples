unit 2;

interface

uses
  fp_cairo, fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}




// === Konventiert am: 25-11-24 17:35:43 ===

function PANGO_TYPE_OT_RULESET : TGType;
function PANGO_OT_RULESET(obj : Pointer) : PPangoOTRuleset;
function PANGO_IS_OT_RULESET(obj : Pointer) : Tgboolean;

implementation

function PANGO_TYPE_OT_RULESET : TGType;
  begin
    PANGO_TYPE_OT_RULESET:=pango_ot_ruleset_get_type;
  end;

function PANGO_OT_RULESET(obj : Pointer) : PPangoOTRuleset;
begin
  Result := PPangoOTRuleset(g_type_check_instance_cast(obj, PANGO_TYPE_OT_RULESET));
end;

function PANGO_IS_OT_RULESET(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  PANGO_TYPE_OT_RULESET);
end;



end.
