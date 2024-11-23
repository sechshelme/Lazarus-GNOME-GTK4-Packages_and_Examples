
unit pango_engine;
interface

{
  Automatically converted by H2Pas 1.0.0 from pango_engine.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    pango_engine.h
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
Pchar  = ^char;
Pgchar  = ^gchar;
PGTypeModule  = ^GTypeModule;
Plongint  = ^longint;
PPangoAnalysis  = ^PangoAnalysis;
PPangoEngine  = ^PangoEngine;
PPangoEngineClass  = ^PangoEngineClass;
PPangoEngineInfo  = ^PangoEngineInfo;
PPangoEngineLang  = ^PangoEngineLang;
PPangoEngineLangClass  = ^PangoEngineLangClass;
PPangoEngineScriptInfo  = ^PangoEngineScriptInfo;
PPangoEngineShape  = ^PangoEngineShape;
PPangoEngineShapeClass  = ^PangoEngineShapeClass;
PPangoFont  = ^PangoFont;
PPangoGlyphString  = ^PangoGlyphString;
PPangoLanguage  = ^PangoLanguage;
PPangoLogAttr  = ^PangoLogAttr;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Pango
 * pango-engine.h: Engines for script and language specific processing
 *
 * Copyright (C) 2000,2003 Red Hat Software
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
{$ifndef __PANGO_ENGINE_H__}
{$define __PANGO_ENGINE_H__}
{$include <pango/pango-types.h>}
{$include <pango/pango-item.h>}
{$include <pango/pango-font.h>}
{$include <pango/pango-glyph.h>}
{$include <pango/pango-script.h>}
{ All of this is deprecated and entirely useless for bindings.
 * Leave it out of the gir file.
  }
{$ifndef __GI_SCANNER__}
{$ifndef PANGO_DISABLE_DEPRECATED}
{*
 * PANGO_RENDER_TYPE_NONE:
 *
 * A string constant defining the render type
 * for engines that are not rendering-system specific.
 *
 * Deprecated: 1.38
  }

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_GET_CLASS(obj : longint) : longint;

const
  PANGO_RENDER_TYPE_NONE = 'PangoRenderNone';  
type
{*
 * PangoEngine:
 *
 * `PangoEngine` is the base class for all types of language and
 * script specific engines. It has no functionality by itself.
 *
 * Deprecated: 1.38
 * }
{< private > }
  PPangoEngine = ^TPangoEngine;
  TPangoEngine = record
      parent_instance : TGObject;
    end;

{*
 * PangoEngineClass:
 *
 * Class structure for `PangoEngine`
 *
 * Deprecated: 1.38
 * }
{< private > }
  PPangoEngineClass = ^TPangoEngineClass;
  TPangoEngineClass = record
      parent_class : TGObjectClass;
    end;


function pango_engine_get_type:TGType;cdecl;external;
{*
 * PANGO_ENGINE_TYPE_LANG:
 *
 * A string constant defining the engine type for language engines.
 * These engines derive from `PangoEngineLang`.
 *
 * Deprecated: 1.38
  }
const
  PANGO_ENGINE_TYPE_LANG = 'PangoEngineLang';  

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE_LANG : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_LANG(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_LANG_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_GET_CLASS(obj : longint) : longint;

type
{*
 * PangoEngineLang:
 *
 * The `PangoEngineLang` class is implemented by engines that
 * customize the rendering-system independent part of the
 * Pango pipeline for a particular script or language. For
 * instance, a custom `PangoEngineLang` could be provided for
 * Thai to implement the dictionary-based word boundary
 * lookups needed for that language.
 *
 * Deprecated: 1.38
 * }
{< private > }
  PPangoEngineLang = ^TPangoEngineLang;
  TPangoEngineLang = record
      parent_instance : TPangoEngine;
    end;

{*
 * PangoEngineLangClass:
 * @script_break: (nullable): Provides a custom implementation of
 * pango_break().  If %NULL, pango_default_break() is used instead. If
 * not %NULL, for Pango versions before 1.16 (module interface version
 * before 1.6.0), this was called instead of pango_default_break(),
 * but in newer versions, pango_default_break() is always called and
 * this is called after that to allow tailoring the breaking results.
 *
 * Class structure for `PangoEngineLang`
 *
 * Deprecated: 1.38
 * }
{< private > }
{< public > }
(* Const before type ignored *)
  PPangoEngineLangClass = ^TPangoEngineLangClass;
  TPangoEngineLangClass = record
      parent_class : TPangoEngineClass;
      script_break : procedure (engine:PPangoEngineLang; text:Pchar; len:longint; analysis:PPangoAnalysis; attrs:PPangoLogAttr; 
                    attrs_len:longint);cdecl;
    end;


function pango_engine_lang_get_type:TGType;cdecl;external;
{*
 * PANGO_ENGINE_TYPE_SHAPE:
 *
 * A string constant defining the engine type for shaping engines.
 * These engines derive from `PangoEngineShape`.
 *
 * Deprecated: 1.38
  }
const
  PANGO_ENGINE_TYPE_SHAPE = 'PangoEngineShape';  

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE_SHAPE : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_SHAPE(object : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_SHAPE_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_GET_CLASS(obj : longint) : longint;

type
{*
 * PangoEngineShape:
 *
 * The `PangoEngineShape` class is implemented by engines that
 * customize the rendering-system dependent part of the
 * Pango pipeline for a particular script or language.
 * A `PangoEngineShape` implementation is then specific to both
 * a particular rendering system or group of rendering systems
 * and to a particular script. For instance, there is one
 * `PangoEngineShape` implementation to handle shaping Arabic
 * for Fontconfig-based backends.
 *
 * Deprecated: 1.38
 * }
  PPangoEngineShape = ^TPangoEngineShape;
  TPangoEngineShape = record
      parent_instance : TPangoEngine;
    end;

{*
 * PangoEngineShapeClass:
 * @script_shape: Given a font, a piece of text, and a `PangoAnalysis`
 *   structure, converts characters to glyphs and positions the
 *   resulting glyphs. The results are stored in the `PangoGlyphString`
 *   that is passed in. (The implementation should resize it
 *   appropriately using pango_glyph_string_set_size()). All fields
 *   of the @log_clusters and @glyphs array must be filled in, with
 *   the exception that Pango will automatically generate
 *   `glyphs->glyphs[i].attr.is_cluster_start`
 *   using the @log_clusters array. Each input character must occur in one
 *   of the output logical clusters;
 *   if no rendering is desired for a character, this may involve
 *   inserting glyphs with the `PangoGlyph` ID %PANGO_GLYPH_EMPTY, which
 *   is guaranteed never to render. If the shaping fails for any reason,
 *   the shaper should return with an empty (zero-size) glyph string.
 *   If the shaper has not set the size on the glyph string yet, simply
 *   returning signals the failure too.
 * @covers: Returns the characters that this engine can cover
 *   with a given font for a given language. If not overridden, the default
 *   implementation simply returns the coverage information for the
 *   font itself unmodified.
 *
 * Class structure for `PangoEngineShape`
 *
 * Deprecated: 1.38
 * }
{< private > }
{< public > }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PPangoEngineShapeClass = ^TPangoEngineShapeClass;
  TPangoEngineShapeClass = record
      parent_class : TPangoEngineClass;
      script_shape : procedure (engine:PPangoEngineShape; font:PPangoFont; item_text:Pchar; item_length:dword; analysis:PPangoAnalysis; 
                    glyphs:PPangoGlyphString; paragraph_text:Pchar; paragraph_length:dword);cdecl;
      covers : function (engine:PPangoEngineShape; font:PPangoFont; language:PPangoLanguage; wc:Tgunichar):TPangoCoverageLevel;cdecl;
    end;


function pango_engine_shape_get_type:TGType;cdecl;external;
type
{*
 * PangoEngineScriptInfo:
 * @script: a `PangoScript`. The value %PANGO_SCRIPT_COMMON has
 * the special meaning here of "all scripts"
 * @langs: a semicolon separated list of languages that this
 * engine handles for this script. This may be empty,
 * in which case the engine is saying that it is a
 * fallback choice for all languages for this range,
 * but should not be used if another engine
 * indicates that it is specific for the language for
 * a given code point. An entry in this list of "*"
 * indicates that this engine is specific to all
 * languages for this range.
 *
 * The `PangoEngineScriptInfo` structure contains
 * information about how the shaper covers a particular script.
 *
 * Deprecated: 1.38
  }
(* Const before type ignored *)
  PPangoEngineScriptInfo = ^TPangoEngineScriptInfo;
  TPangoEngineScriptInfo = record
      script : TPangoScript;
      langs : Pgchar;
    end;

{*
 * PangoEngineInfo:
 * @id: a unique string ID for the engine.
 * @engine_type: a string identifying the engine type.
 * @render_type: a string identifying the render type.
 * @scripts: array of scripts this engine supports.
 * @n_scripts: number of items in @scripts.
 *
 * The `PangoEngineInfo` structure contains information about a particular
 * engine. It contains the following fields:
 *
 * Deprecated: 1.38
  }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
  PPangoEngineInfo = ^TPangoEngineInfo;
  TPangoEngineInfo = record
      id : Pgchar;
      engine_type : Pgchar;
      render_type : Pgchar;
      scripts : PPangoEngineScriptInfo;
      n_scripts : Tgint;
    end;

{*
 * script_engine_list: (skip)
 * @engines: location to store a pointer to an array of engines.
 * @n_engines: location to store the number of elements in @engines.
 *
 * Do not use.
 *
 * Deprecated: 1.38
 * }

procedure script_engine_list(engines:PPPangoEngineInfo; n_engines:Plongint);cdecl;external;
{*
 * script_engine_init: (skip)
 * @module: a `GTypeModule` structure used to associate any
 *  GObject types created in this module with the module.
 *
 * Do not use.
 *
 * Deprecated: 1.38
 * }
procedure script_engine_init(module:PGTypeModule);cdecl;external;
{*
 * script_engine_exit: (skip)
 *
 * Do not use.
 *
 * Deprecated: 1.38
 * }
procedure script_engine_exit;cdecl;external;
{*
 * script_engine_create: (skip)
 * @id: the ID of an engine as reported by script_engine_list.
 *
 * Do not use.
 *
 * Deprecated: 1.38
 * }
(* Const before type ignored *)
function script_engine_create(id:Pchar):PPangoEngine;cdecl;external;
{ Utility macro used by PANGO_ENGINE_LANG_DEFINE_TYPE and
 * PANGO_ENGINE_LANG_DEFINE_TYPE
  }
{*
 * PANGO_ENGINE_LANG_DEFINE_TYPE:
 * @name: Name of the the type to register (for example:, ArabicEngineFc)
 * @prefix: Prefix for symbols that will be defined (for example:, arabic_engine_fc)
 * @class_init: (nullable): Class initialization function for the new type
 * @instance_init: (nullable): Instance initialization function for the new type
 *
 * Outputs the necessary code for GObject type registration for a
 * `PangoEngineLang` class defined in a module. Two static symbols
 * are defined.
 *
 * <programlisting>
 *  static GType *prefix*_type;
 *  static void *prefix*_register_type (GTypeModule module);
 *
 * The *prefix*_register_type()
 * function should be called in your script_engine_init() function for
 * each type that your module implements, and then your script_engine_create()
 * function can create instances of the object as follows:
 *
 * ```
 * PangoEngine *engine = g_object_new (prefix_type, NULL);
 * ```
 *
 * Deprecated: 1.38
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_DEFINE_TYPE(name,prefix,class_init,instance_init : longint) : longint;

{*
 * PANGO_ENGINE_SHAPE_DEFINE_TYPE:
 * @name: Name of the the type to register (for example:, ArabicEngineFc)
 * @prefix: Prefix for symbols that will be defined (for example:, arabic_engine_fc)
 * @class_init: (nullable): Class initialization function for the new type
 * @instance_init: (nullable): Instance initialization function for the new type
 *
 * Outputs the necessary code for GObject type registration for a
 * `PangoEngineShape` class defined in a module. Two static symbols
 * are defined.
 *
 * <programlisting>
 *  static GType *prefix*_type;
 *  static void *prefix*_register_type (GTypeModule module);
 * </programlisting>
 *
 * The *prefix*_register_type()
 * function should be called in your script_engine_init() function for
 * each type that your module implements, and then your script_engine_create()
 * function can create instances of the object as follows:
 *
 * ```
 * PangoEngine *engine = g_object_new (prefix_type, NULL);
 * ```
 *
 * Deprecated: 1.38
 * }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_DEFINE_TYPE(name,prefix,class_init,instance_init : longint) : longint;

{ Macro used for possibly builtin Pango modules. Not useful
 * for externally build modules. If we are compiling a module standalone,
 * then we name the entry points script_engine_list, etc. But if we
 * are compiling it for inclusion directly in Pango, then we need them to
 * to have distinct names for this module, so we prepend a prefix.
 *
 * The two intermediate macros are to deal with details of the C
 * preprocessor; token pasting tokens must be function arguments,
 * and macro substitution isn't used on function arguments that
 * are used for token pasting.
  }
{$ifdef PANGO_MODULE_PREFIX}
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_MODULE_ENTRY(func : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _PANGO_MODULE_ENTRY2(prefix,func : longint) : longint;

{$else}
{$endif}
{$endif}
{ PANGO_DISABLE_DEPRECATED  }
{$endif}
{ __GI_SCANNER__  }
{$endif}
{ __PANGO_ENGINE_H__  }

implementation

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE : longint; { return type might be wrong }
  begin
    PANGO_TYPE_ENGINE:=pango_engine_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE(object : longint) : longint;
begin
  PANGO_ENGINE:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_ENGINE,PangoEngine);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_CLASS(klass : longint) : longint;
begin
  PANGO_ENGINE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_ENGINE,PangoEngineClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE(object : longint) : longint;
begin
  PANGO_IS_ENGINE:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_ENGINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_CLASS(klass : longint) : longint;
begin
  PANGO_IS_ENGINE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_ENGINE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_GET_CLASS(obj : longint) : longint;
begin
  PANGO_ENGINE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_ENGINE,PangoEngineClass);
end;

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE_LANG : longint; { return type might be wrong }
  begin
    PANGO_TYPE_ENGINE_LANG:=pango_engine_lang_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG(object : longint) : longint;
begin
  PANGO_ENGINE_LANG:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_ENGINE_LANG,PangoEngineLang);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_CLASS(klass : longint) : longint;
begin
  PANGO_ENGINE_LANG_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_ENGINE_LANG,PangoEngineLangClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_LANG(object : longint) : longint;
begin
  PANGO_IS_ENGINE_LANG:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_ENGINE_LANG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_LANG_CLASS(klass : longint) : longint;
begin
  PANGO_IS_ENGINE_LANG_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_ENGINE_LANG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_GET_CLASS(obj : longint) : longint;
begin
  PANGO_ENGINE_LANG_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_ENGINE_LANG,PangoEngineLangClass);
end;

{ was #define dname def_expr }
function PANGO_TYPE_ENGINE_SHAPE : longint; { return type might be wrong }
  begin
    PANGO_TYPE_ENGINE_SHAPE:=pango_engine_shape_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE(object : longint) : longint;
begin
  PANGO_ENGINE_SHAPE:=G_TYPE_CHECK_INSTANCE_CAST(object,PANGO_TYPE_ENGINE_SHAPE,PangoEngineShape);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_CLASS(klass : longint) : longint;
begin
  PANGO_ENGINE_SHAPE_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,PANGO_TYPE_ENGINE_SHAPE,PangoEngineShapeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_SHAPE(object : longint) : longint;
begin
  PANGO_IS_ENGINE_SHAPE:=G_TYPE_CHECK_INSTANCE_TYPE(object,PANGO_TYPE_ENGINE_SHAPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_IS_ENGINE_SHAPE_CLASS(klass : longint) : longint;
begin
  PANGO_IS_ENGINE_SHAPE_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,PANGO_TYPE_ENGINE_SHAPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_GET_CLASS(obj : longint) : longint;
begin
  PANGO_ENGINE_SHAPE_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,PANGO_TYPE_ENGINE_SHAPE,PangoEngineShapeClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_LANG_DEFINE_TYPE(name,prefix,class_init,instance_init : longint) : longint;
begin
  PANGO_ENGINE_LANG_DEFINE_TYPE:=PANGO_ENGINE_DEFINE_TYPE(name,prefix,class_init,instance_init,PANGO_TYPE_ENGINE_LANG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_ENGINE_SHAPE_DEFINE_TYPE(name,prefix,class_init,instance_init : longint) : longint;
begin
  PANGO_ENGINE_SHAPE_DEFINE_TYPE:=PANGO_ENGINE_DEFINE_TYPE(name,prefix,class_init,instance_init,PANGO_TYPE_ENGINE_SHAPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function PANGO_MODULE_ENTRY(func : longint) : longint;
begin
  PANGO_MODULE_ENTRY:=_PANGO_MODULE_ENTRY2(PANGO_MODULE_PREFIX,func);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function _PANGO_MODULE_ENTRY2(prefix,func : longint) : longint;
begin
  _PANGO_MODULE_ENTRY2:=_PANGO_MODULE_ENTRY3(prefix,func);
end;


end.
