
unit 2;
interface

{
  Automatically converted by H2Pas 1.0.0 from 2.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    2.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}



{ was #define dname def_expr }
function PANGO_TYPE_OT_RULESET : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_OT_RULESET(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_OT_RULESET(object : longint) : longint;


implementation

{ was #define dname def_expr }
function PANGO_TYPE_OT_RULESET : longint; { return type might be wrong }
  begin
    PANGO_TYPE_OT_RULESET:=pango_ot_ruleset_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_OT_RULESET(object : longint) : longint;
begin
  PANGO_OT_RULESET:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_OT_RULESET,PangoOTRuleset);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_OT_RULESET(object : longint) : longint;
begin
  PANGO_IS_OT_RULESET:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_OT_RULESET);
end;


end.
