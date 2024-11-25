
unit pango_ot;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_ot.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_ot.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pguint  = ^guint;
Plongint  = ^longint;
PPangoFcFont  = ^PangoFcFont;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLanguage  = ^PangoLanguage;
PPangoOTBuffer  = ^PangoOTBuffer;
PPangoOTFeatureMap  = ^PangoOTFeatureMap;
PPangoOTGlyph  = ^PangoOTGlyph;
PPangoOTInfo  = ^PangoOTInfo;
PPangoOTRuleset  = ^PangoOTRuleset;
PPangoOTRulesetDescription  = ^PangoOTRulesetDescription;
PPangoOTTableType  = ^PangoOTTableType;
PPangoOTTag  = ^PangoOTTag;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-ot.h:
 *
 * Copyright (C) 2000,2007 Red Hat Software
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
{$ifndef __PANGO_OT_H__}
{$define __PANGO_OT_H__}
{ Deprecated.  Use HarfBuzz directly!  }
{$include <pango/pangofc-font.h>}
{$include <pango/pango-glyph.h>}
{$include <pango/pango-font.h>}
{$include <pango/pango-script.h>}
{$include <pango/pango-language.h>}
{$include <ft2build.h>}
{$include FT_FREETYPE_H}

{ was #define dname def_expr }
function PANGO_TYPE_OT_INFO : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_OT_INFO(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_OT_INFO(object : longint) : longint;

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

{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PangoOTTag:
 *
 * The `PangoOTTag` typedef is used to represent TrueType and OpenType
 * four letter tags inside Pango. Use PANGO_OT_TAG_MAKE()
 * or PANGO_OT_TAG_MAKE_FROM_STRING() macros to create PangoOTTags manually.
  }
type
  PPangoOTTag = ^TPangoOTTag;
  TPangoOTTag = Tguint32;
{*
 * PANGO_OT_TAG_MAKE:
 * @c1: First character.
 * @c2: Second character.
 * @c3: Third character.
 * @c4: Fourth character.
 *
 * Creates a `PangoOTTag` from four characters.  This is similar and
 * compatible with the FT_MAKE_TAG() macro from FreeType.
  }
{*
 * PANGO_OT_TAG_MAKE_FROM_STRING:
 * @s: The string representation of the tag.
 *
 * Creates a `PangoOTTag` from a string. The string should be at least
 * four characters long (pad with space characters if needed), and need
 * not be nul-terminated.  This is a convenience wrapper around
 * PANGO_OT_TAG_MAKE(), but cannot be used in certain situations, for
 * example, as a switch expression, as it dereferences pointers.
  }
{#define PANGO_OT_TAG_MAKE(c1,c2,c3,c4)		((PangoOTTag) FT_MAKE_TAG (c1, c2, c3, c4)) }
{#define PANGO_OT_TAG_MAKE_FROM_STRING(s)	(PANGO_OT_TAG_MAKE(((const char *) s)[0], \ }
{								   ((const char *) s)[1], \ }
{								   ((const char *) s)[2], \ }
{								   ((const char *) s)[3])) }
{*
 * PangoOTTableType:
 * @PANGO_OT_TABLE_GSUB: The GSUB table.
 * @PANGO_OT_TABLE_GPOS: The GPOS table.
 *
 * The PangoOTTableType enumeration values are used to
 * identify the various OpenType tables in the
 * pango_ot_info_… functions.
  }

  PPangoOTTableType = ^TPangoOTTableType;
  TPangoOTTableType =  Longint;
  Const
    PANGO_OT_TABLE_GSUB = 0;
    PANGO_OT_TABLE_GPOS = 1;
;
{*
 * PANGO_OT_ALL_GLYPHS:
 *
 * This is used as the property bit in pango_ot_ruleset_add_feature() when a
 * feature should be applied to all glyphs.
 *
 * Since: 1.16
  }
{*
 * PANGO_OT_NO_FEATURE:
 *
 * This is used as a feature index that represent no feature, that is, should be
 * skipped.  It may be returned as feature index by pango_ot_info_find_feature()
 * if the feature is not found, and pango_ot_ruleset_add_feature() function
 * automatically skips this value, so no special handling is required by the user.
 *
 * Since: 1.18
  }
{*
 * PANGO_OT_NO_SCRIPT:
 *
 * This is used as a script index that represent no script, that is, when the
 * requested script was not found, and a default ('DFLT') script was not found
 * either.  It may be returned as script index by pango_ot_info_find_script()
 * if the script or a default script are not found, all other functions
 * taking a script index essentially return if the input script index is
 * this value, so no special handling is required by the user.
 *
 * Since: 1.18
  }
{*
 * PANGO_OT_DEFAULT_LANGUAGE:
 *
 * This is used as the language index in pango_ot_info_find_feature() when
 * the default language system of the script is desired.
 *
 * It is also returned by pango_ot_info_find_language() if the requested language
 * is not found, or the requested language tag was PANGO_OT_TAG_DEFAULT_LANGUAGE.
 * The end result is that one can always call pango_ot_tag_from_language()
 * followed by pango_ot_info_find_language() and pass the result to
 * pango_ot_info_find_feature() without having to worry about falling back to
 * default language system explicitly.
 *
 * Since: 1.16
  }

{ was #define dname def_expr }
function PANGO_OT_ALL_GLYPHS : Tguint;  

{ was #define dname def_expr }
function PANGO_OT_NO_FEATURE : Tguint;  

{ was #define dname def_expr }
function PANGO_OT_NO_SCRIPT : Tguint;  

{ was #define dname def_expr }
function PANGO_OT_DEFAULT_LANGUAGE : Tguint;  

{*
 * PANGO_OT_TAG_DEFAULT_SCRIPT:
 *
 * This is a `PangoOTTag` representing the special script tag 'DFLT'.  It is
 * returned as script tag by pango_ot_tag_from_script() if the requested script
 * is not found.
 *
 * Since: 1.18
  }
{*
 * PANGO_OT_TAG_DEFAULT_LANGUAGE:
 *
 * This is a `PangoOTTag` representing a special language tag 'dflt'.  It is
 * returned as language tag by pango_ot_tag_from_language() if the requested
 * language is not found.  It is safe to pass this value to
 * pango_ot_info_find_language() as that function falls back to returning default
 * language-system if the requested language tag is not found.
 *
 * Since: 1.18
  }
{ was #define dname def_expr }
function PANGO_OT_TAG_DEFAULT_SCRIPT : longint; { return type might be wrong }

{ was #define dname def_expr }
function PANGO_OT_TAG_DEFAULT_LANGUAGE : longint; { return type might be wrong }

{ Note that this must match hb_glyph_info_t  }
{*
 * PangoOTGlyph:
 * @glyph: the glyph itself.
 * @properties: the properties value, identifying which features should be
 * applied on this glyph.  See pango_ot_ruleset_add_feature().
 * @cluster: the cluster that this glyph belongs to.
 * @component: a component value, set by the OpenType layout engine.
 * @ligID: a ligature index value, set by the OpenType layout engine.
 * @internal: for Pango internal use
 *
 * The `PangoOTGlyph` structure represents a single glyph together with
 * information used for OpenType layout processing of the glyph.
 * It contains the following fields.
  }
type
  PPangoOTGlyph = ^TPangoOTGlyph;
  TPangoOTGlyph = record
      glyph : Tguint32;
      properties : Tguint;
      cluster : Tguint;
      component : Tgushort;
      ligID : Tgushort;
      internal : Tguint;
    end;

{*
 * PangoOTFeatureMap:
 * @feature_name: feature tag in represented as four-letter ASCII string.
 * @property_bit: the property bit to use for this feature.  See
 * pango_ot_ruleset_add_feature() for details.
 *
 * The `PangoOTFeatureMap` typedef is used to represent an OpenType
 * feature with the property bit associated with it.  The feature tag is
 * represented as a char array instead of a `PangoOTTag` for convenience.
 *
 * Since: 1.18
  }
  PPangoOTFeatureMap = ^TPangoOTFeatureMap;
  TPangoOTFeatureMap = record
      feature_name : array[0..4] of char;
      property_bit : Tgulong;
    end;

{*
 * PangoOTRulesetDescription:
 * @script: a `PangoScript`
 * @language: a `PangoLanguage`
 * @static_gsub_features: (nullable): static map of GSUB features
 * @n_static_gsub_features: length of @static_gsub_features, or 0.
 * @static_gpos_features: (nullable): static map of GPOS features
 * @n_static_gpos_features: length of @static_gpos_features, or 0.
 * @other_features: (nullable): map of extra features to add to both
 *   GSUB and GPOS. Unlike the static maps, this pointer need not
 *   live beyond the life of function calls taking this struct.
 * @n_other_features: length of @other_features, or 0.
 *
 * The `PangoOTRuleset` structure holds all the information needed
 * to build a complete `PangoOTRuleset` from an OpenType font.
 * The main use of this struct is to act as the key for a per-font
 * hash of rulesets.  The user populates a ruleset description and
 * gets the ruleset using pango_ot_ruleset_get_for_description()
 * or create a new one using pango_ot_ruleset_new_from_description().
 *
 * Since: 1.18
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PPangoOTRulesetDescription = ^TPangoOTRulesetDescription;
  TPangoOTRulesetDescription = record
      script : TPangoScript;
      language : PPangoLanguage;
      static_gsub_features : PPangoOTFeatureMap;
      n_static_gsub_features : Tguint;
      static_gpos_features : PPangoOTFeatureMap;
      n_static_gpos_features : Tguint;
      other_features : PPangoOTFeatureMap;
      n_other_features : Tguint;
    end;


function pango_ot_info_get_type:TGType;cdecl;external;
function pango_ot_ruleset_get_type:TGType;cdecl;external;
function pango_ot_info_get(face:TFT_Face):PPangoOTInfo;cdecl;external;
function pango_ot_info_find_script(info:PPangoOTInfo; table_type:TPangoOTTableType; script_tag:TPangoOTTag; script_index:Pguint):Tgboolean;cdecl;external;
function pango_ot_info_find_language(info:PPangoOTInfo; table_type:TPangoOTTableType; script_index:Tguint; language_tag:TPangoOTTag; language_index:Pguint; 
           required_feature_index:Pguint):Tgboolean;cdecl;external;
function pango_ot_info_find_feature(info:PPangoOTInfo; table_type:TPangoOTTableType; feature_tag:TPangoOTTag; script_index:Tguint; language_index:Tguint; 
           feature_index:Pguint):Tgboolean;cdecl;external;
function pango_ot_info_list_scripts(info:PPangoOTInfo; table_type:TPangoOTTableType):PPangoOTTag;cdecl;external;
function pango_ot_info_list_languages(info:PPangoOTInfo; table_type:TPangoOTTableType; script_index:Tguint; language_tag:TPangoOTTag):PPangoOTTag;cdecl;external;
function pango_ot_info_list_features(info:PPangoOTInfo; table_type:TPangoOTTableType; tag:TPangoOTTag; script_index:Tguint; language_index:Tguint):PPangoOTTag;cdecl;external;
{ was #define dname def_expr }
function PANGO_TYPE_OT_BUFFER : longint; { return type might be wrong }

function pango_ot_buffer_get_type:TGType;cdecl;external;
function pango_ot_buffer_new(font:PPangoFcFont):PPangoOTBuffer;cdecl;external;
procedure pango_ot_buffer_destroy(buffer:PPangoOTBuffer);cdecl;external;
procedure pango_ot_buffer_clear(buffer:PPangoOTBuffer);cdecl;external;
procedure pango_ot_buffer_set_rtl(buffer:PPangoOTBuffer; rtl:Tgboolean);cdecl;external;
procedure pango_ot_buffer_add_glyph(buffer:PPangoOTBuffer; glyph:Tguint; properties:Tguint; cluster:Tguint);cdecl;external;
(* Const before type ignored *)
procedure pango_ot_buffer_get_glyphs(buffer:PPangoOTBuffer; glyphs:PPPangoOTGlyph; n_glyphs:Plongint);cdecl;external;
(* Const before type ignored *)
procedure pango_ot_buffer_output(buffer:PPangoOTBuffer; glyphs:PPangoGlyphString);cdecl;external;
procedure pango_ot_buffer_set_zero_width_marks(buffer:PPangoOTBuffer; zero_width_marks:Tgboolean);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pango_ot_ruleset_get_for_description(info:PPangoOTInfo; desc:PPangoOTRulesetDescription):PPangoOTRuleset;cdecl;external;
function pango_ot_ruleset_new(info:PPangoOTInfo):PPangoOTRuleset;cdecl;external;
function pango_ot_ruleset_new_for(info:PPangoOTInfo; script:TPangoScript; language:PPangoLanguage):PPangoOTRuleset;cdecl;external;
(* Const before type ignored *)
function pango_ot_ruleset_new_from_description(info:PPangoOTInfo; desc:PPangoOTRulesetDescription):PPangoOTRuleset;cdecl;external;
procedure pango_ot_ruleset_add_feature(ruleset:PPangoOTRuleset; table_type:TPangoOTTableType; feature_index:Tguint; property_bit:Tgulong);cdecl;external;
function pango_ot_ruleset_maybe_add_feature(ruleset:PPangoOTRuleset; table_type:TPangoOTTableType; feature_tag:TPangoOTTag; property_bit:Tgulong):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_ot_ruleset_maybe_add_features(ruleset:PPangoOTRuleset; table_type:TPangoOTTableType; features:PPangoOTFeatureMap; n_features:Tguint):Tguint;cdecl;external;
(* Const before type ignored *)
function pango_ot_ruleset_get_feature_count(ruleset:PPangoOTRuleset; n_gsub_features:Pguint; n_gpos_features:Pguint):Tguint;cdecl;external;
(* Const before type ignored *)
procedure pango_ot_ruleset_substitute(ruleset:PPangoOTRuleset; buffer:PPangoOTBuffer);cdecl;external;
(* Const before type ignored *)
procedure pango_ot_ruleset_position(ruleset:PPangoOTRuleset; buffer:PPangoOTBuffer);cdecl;external;
function pango_ot_tag_to_script(script_tag:TPangoOTTag):TPangoScript;cdecl;external;
function pango_ot_tag_from_script(script:TPangoScript):TPangoOTTag;cdecl;external;
function pango_ot_tag_to_language(language_tag:TPangoOTTag):PPangoLanguage;cdecl;external;
function pango_ot_tag_from_language(language:PPangoLanguage):TPangoOTTag;cdecl;external;
{ was #define dname def_expr }
function PANGO_TYPE_OT_RULESET_DESCRIPTION : longint; { return type might be wrong }

function pango_ot_ruleset_description_get_type:TGType;cdecl;external;
(* Const before type ignored *)
function pango_ot_ruleset_description_hash(desc:PPangoOTRulesetDescription):Tguint;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function pango_ot_ruleset_description_equal(desc1:PPangoOTRulesetDescription; desc2:PPangoOTRulesetDescription):Tgboolean;cdecl;external;
(* Const before type ignored *)
function pango_ot_ruleset_description_copy(desc:PPangoOTRulesetDescription):PPangoOTRulesetDescription;cdecl;external;
procedure pango_ot_ruleset_description_free(desc:PPangoOTRulesetDescription);cdecl;external;
{$endif}
{ PANGO_DISABLE_DEPRECATED  }
{$endif}
{ __PANGO_OT_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_OT_INFO : longint; { return type might be wrong }
  begin
    PANGO_TYPE_OT_INFO:=pango_ot_info_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_OT_INFO(object : longint) : longint;
begin
  PANGO_OT_INFO:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_OT_INFO,PangoOTInfo);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_OT_INFO(object : longint) : longint;
begin
  PANGO_IS_OT_INFO:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_OT_INFO);
end;

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

{ was #define dname def_expr }
function PANGO_OT_ALL_GLYPHS : Tguint;
  begin
    PANGO_OT_ALL_GLYPHS:=Tguint($FFFF);
  end;

{ was #define dname def_expr }
function PANGO_OT_NO_FEATURE : Tguint;
  begin
    PANGO_OT_NO_FEATURE:=Tguint($FFFF);
  end;

{ was #define dname def_expr }
function PANGO_OT_NO_SCRIPT : Tguint;
  begin
    PANGO_OT_NO_SCRIPT:=Tguint($FFFF);
  end;

{ was #define dname def_expr }
function PANGO_OT_DEFAULT_LANGUAGE : Tguint;
  begin
    PANGO_OT_DEFAULT_LANGUAGE:=Tguint($FFFF);
  end;

{ was #define dname def_expr }
function PANGO_OT_TAG_DEFAULT_SCRIPT : longint; { return type might be wrong }
  begin
    PANGO_OT_TAG_DEFAULT_SCRIPT:=PANGO_OT_TAG_MAKE('D','F','L','T');
  end;

{ was #define dname def_expr }
function PANGO_OT_TAG_DEFAULT_LANGUAGE : longint; { return type might be wrong }
  begin
    PANGO_OT_TAG_DEFAULT_LANGUAGE:=PANGO_OT_TAG_MAKE('d','f','l','t');
  end;

{ was #define dname def_expr }
function PANGO_TYPE_OT_BUFFER : longint; { return type might be wrong }
  begin
    PANGO_TYPE_OT_BUFFER:=pango_ot_buffer_get_type;
  end;

{ was #define dname def_expr }
function PANGO_TYPE_OT_RULESET_DESCRIPTION : longint; { return type might be wrong }
  begin
    PANGO_TYPE_OT_RULESET_DESCRIPTION:=pango_ot_ruleset_description_get_type;
  end;


end.
