
unit Font;
interface

{
  Automatically converted by H2Pas 1.0.0 from Font.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Font.h
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
Pgr_face  = ^gr_face;
Pgr_face_ops  = ^gr_face_ops;
Pgr_face_options  = ^gr_face_options;
Pgr_faceinfo  = ^gr_faceinfo;
Pgr_feature_ref  = ^gr_feature_ref;
Pgr_feature_val  = ^gr_feature_val;
Pgr_font  = ^gr_font;
Pgr_font_ops  = ^gr_font_ops;
Pgr_get_table_fn  = ^gr_get_table_fn;
Pgr_uint16  = ^gr_uint16;
Pgr_uint32  = ^gr_uint32;
Plongint  = ^longint;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{  GRAPHITE2 LICENSING

    Copyright 2010, SIL International
    All rights reserved.

    This library is free software; you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published
    by the Free Software Foundation; either version 2.1 of License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should also have received a copy of the GNU Lesser General Public
    License along with this library in the file named "LICENSE".
    If not, write to the Free Software Foundation, 51 Franklin Street,
    Suite 500, Boston, MA 02110-1335, USA or visit their web page on the
    internet at http://www.fsf.org/licenses/lgpl.html.

    Alternatively, the contents of this file may be used under the terms
    of the Mozilla Public License (http://mozilla.org/MPL) or the GNU
    General Public License, as published by the Free Software Foundation,
    either version 2 of the License or (at your option) any later version.
 }
(** unsupported pragma#pragma once*)
{$include "graphite2/Types.h"}

const
  GR2_VERSION_MAJOR = 1;  
  GR2_VERSION_MINOR = 3;  
  GR2_VERSION_BUGFIX = 14;  
type
{*
* Returns version information on this engine
 }

procedure gr_engine_version(nMajor:Plongint; nMinor:Plongint; nBugFix:Plongint);cdecl;external;
{*
* The Face Options allow the application to require that certain tables are
* read during face construction. This may be of concern if the appFaceHandle
* used in the gr_get_table_fn may change.
* The values can be combined
 }
{* No preload, no cmap caching, fail if the graphite tables are invalid  }
{* Dumb rendering will be enabled if the graphite tables are invalid. @deprecated Since 1.311  }
{* preload glyphs at construction time  }
{* Cache the lookup from code point to glyph ID at construction time  }
{* Preload everything  }
type
  Tgr_face_options =  Longint;
  Const
    gr_face_default = 0;
    gr_face_dumbRendering = 1;
    gr_face_preloadGlyphs = 2;
    gr_face_cacheCmap = 4;
    gr_face_preloadAll = gr_face_preloadGlyphs or gr_face_cacheCmap;

{* Holds information about a particular Graphite silf table that has been loaded  }
{*< The extra_ascent in the GDL, in design units  }
{*< The extra_descent in the GDL, in design units  }
{*< The design units for the font  }
{*< no information is known.  }
{*< the space character never occurs in any rules.  }
{*< the space character only occurs as the first element in a rule.  }
{*< the space character only occurs as the last element in a rule.  }
{*< the space character only occurs as the only element in a rule.  }
{*< the space character may occur as the first or last element of a rule.  }
{*< the space character occurs in a rule not as a first or last element.  }
{*< the table specifies that a bidirectional pass should run  }
{*< there are line end contextuals somewhere  }
{*< there are .justify properties set somewhere on some glyphs  }
type
  Pgr_faceinfo = ^Tgr_faceinfo;
  Tgr_faceinfo = record
      extra_ascent : Tgr_uint16;
      extra_descent : Tgr_uint16;
      upem : Tgr_uint16;
      space_contextuals :  Longint;
      Const
        gr_space_unknown = 0;
        gr_space_none = 1;
        gr_space_left_only = 2;
        gr_space_right_only = 3;
        gr_space_either_only = 4;
        gr_space_both = 5;
        gr_space_cross = 6;
;
      flag0 : word;
    end

const
  bm_Tgr_faceinfo_has_bidi_pass = $1;
  bp_Tgr_faceinfo_has_bidi_pass = 0;
  bm_Tgr_faceinfo_line_ends = $2;
  bp_Tgr_faceinfo_line_ends = 1;
  bm_Tgr_faceinfo_justifies = $4;
  bp_Tgr_faceinfo_justifies = 2;

function has_bidi_pass(var a : Tgr_faceinfo) : dword;
procedure set_has_bidi_pass(var a : Tgr_faceinfo; __has_bidi_pass : dword);
function line_ends(var a : Tgr_faceinfo) : dword;
procedure set_line_ends(var a : Tgr_faceinfo; __line_ends : dword);
function justifies(var a : Tgr_faceinfo) : dword;
procedure set_justifies(var a : Tgr_faceinfo; __justifies : dword);
type
{* type describing function to retrieve font table information
  *
  * @return a pointer to the table in memory. The pointed to memory must exist as
  *          long as the gr_face which makes the call.
  * @param appFaceHandle is the unique information passed to gr_make_face()
  * @param name is a 32bit tag to the table name.
  * @param len returned by this function to say how long the table is in memory.
   }
(* Const before type ignored *)
(* Const before type ignored *)

  Pgr_get_table_fn = ^Tgr_get_table_fn;
  Tgr_get_table_fn = function (appFaceHandle:pointer; name:dword; len:Psize_t):pointer;cdecl;
{* type describing function to release any resources allocated by the above get_table table function
  *
  * @param appFaceHandle is the unique information passed to gr_make_face()
  * @param pointer to table memory returned by get_table.
   }
(* Const before type ignored *)
(* Const before type ignored *)

  Tgr_release_table_fn = procedure (appFaceHandle:pointer; table_buffer:pointer);cdecl;
{* struct housing function pointers to manage font table buffers for the graphite engine.  }
{* size in bytes of this structure  }
{* a pointer to a function to request a table from the client.  }
{* is a pointer to a function to notify the client the a table can be released.
          * This can be NULL to signify that the client does not wish to do any release handling.  }
  Pgr_face_ops = ^Tgr_face_ops;
  Tgr_face_ops = record
      size : Tsize_t;cdecl;
      get_table : Tgr_get_table_fn;
      release_table : Tgr_release_table_fn;
    end;

{* Create a gr_face object given application information and a table functions.
  *
  * @return gr_face or NULL if the font fails to load for some reason.
  * @param appFaceHandle This is application specific information that is passed
  *                      to the getTable function. The appFaceHandle must stay
  *                      alive as long as the gr_face is alive.
  * @param face_ops      Pointer to face specific callback structure for table
  *                      management. Must stay alive for the duration of the
  *                      call only.
  * @param faceOptions   Bitfield describing various options. See enum gr_face_options for details.
   }
(* Const before type ignored *)
{non-NULL }(* Const before type ignored *)

function gr_make_face_with_ops(appFaceHandle:pointer; face_ops:Pgr_face_ops; faceOptions:dword):Pgr_face;cdecl;external;
{* @deprecated Since v1.2.0 in favour of gr_make_face_with_ops.
  * Create a gr_face object given application information and a getTable function.
  *
  * @return gr_face or NULL if the font fails to load for some reason.
  * @param appFaceHandle This is application specific information that is passed
  *                      to the getTable function. The appFaceHandle must stay
  *                      alive as long as the gr_face is alive.
  * @param getTable      Callback function to get table data.
  * @param faceOptions   Bitfield describing various options. See enum gr_face_options for details.
   }
{GR2_DEPRECATED_API }(* Const before type ignored *)
{non-NULL }function gr_make_face(appFaceHandle:pointer; getTable:Tgr_get_table_fn; faceOptions:dword):Pgr_face;cdecl;external;
{* @deprecated   Since 1.3.7 this function is now an alias for gr_make_face_with_ops().
  *
  * Create a gr_face object given application information, with subsegmental caching support
  *
  * @return gr_face or NULL if the font fails to load.
  * @param appFaceHandle is a pointer to application specific information that is passed to getTable.
  *                      This may not be NULL and must stay alive as long as the gr_face is alive.
  * @param face_ops      Pointer to face specific callback structure for table management. Must stay
  *                      alive for the duration of the call only.
  * @param segCacheMaxSize Unused.
  * @param faceOptions   Bitfield of values from enum gr_face_options
   }
{GR2_DEPRECATED_API }(* Const before type ignored *)
(* Const before type ignored *)
function gr_make_face_with_seg_cache_and_ops(appFaceHandle:pointer; face_ops:Pgr_face_ops; segCacheMaxSize:dword; faceOptions:dword):Pgr_face;cdecl;external;
{* @deprecated   Since 1.3.7 this function is now an alias for gr_make_face().
  *
  * Create a gr_face object given application information, with subsegmental caching support.
  * This function is deprecated as of v1.2.0 in favour of gr_make_face_with_seg_cache_and_ops.
  *
  * @return gr_face or NULL if the font fails to load.
  * @param appFaceHandle is a pointer to application specific information that is passed to getTable.
  *                      This may not be NULL and must stay alive as long as the gr_face is alive.
  * @param getTable      The function graphite calls to access font table data
  * @param segCacheMaxSize   How large the segment cache is.
  * @param faceOptions   Bitfield of values from enum gr_face_options
   }
{GR2_DEPRECATED_API }(* Const before type ignored *)
function gr_make_face_with_seg_cache(appFaceHandle:pointer; getTable:Tgr_get_table_fn; segCacheMaxSize:dword; faceOptions:dword):Pgr_face;cdecl;external;
{* Convert a tag in a string into a gr_uint32
  *
  * @return gr_uint32 tag, zero padded
  * @param str a nul terminated string of which at most the first 4 characters are read
   }
(* Const before type ignored *)
function gr_str_to_tag(str:Pchar):Tgr_uint32;cdecl;external;
{* Convert a gr_uint32 tag into a string
  *
  * @param tag contains the tag to convert
  * @param str is a pointer to a char array of at least size 4 bytes. The first 4 bytes of this array
  *            will be overwritten by this function. No nul is appended.
   }
procedure gr_tag_to_str(tag:Tgr_uint32; str:Pchar);cdecl;external;
{* Get feature values for a given language or default
  *
  * @return a copy of the default feature values for a given language. The application must call
  *          gr_featureval_destroy() to free this object when done.
  * @param pFace The font face to get feature values from
  * @param langname The language tag to get feature values for. If there is no such language or
  *                  langname is 0, the default feature values for the font are returned.
  *                  langname is right 0 padded and assumes lowercase. Thus the en langauge
  *                  would be 0x656E0000. Langname may also be space padded, thus 0x656E2020.
   }
(* Const before type ignored *)
function gr_face_featureval_for_lang(pFace:Pgr_face; langname:Tgr_uint32):Pgr_feature_val;cdecl;external;
{* Get feature reference for a given feature id from a face
  *
  * @return a feature reference corresponding to the given id. This data is part of the gr_face and
  *          will be freed when the face is destroyed.
  * @param pFace Font face to get information on.
  * @param featId    Feature id tag to get reference to.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_face_find_fref(pFace:Pgr_face; featId:Tgr_uint32):Pgr_feature_ref;cdecl;external;
{* Returns number of feature references in a face * }
(* Const before type ignored *)
function gr_face_n_fref(pFace:Pgr_face):Tgr_uint16;cdecl;external;
{* Returns feature reference at given index in face * }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_face_fref(pFace:Pgr_face; i:Tgr_uint16):Pgr_feature_ref;cdecl;external;
{* Return number of languages the face knows about * }
(* Const before type ignored *)
function gr_face_n_languages(pFace:Pgr_face):word;cdecl;external;
{* Returns a language id corresponding to a language of given index in the face * }
(* Const before type ignored *)
function gr_face_lang_by_index(pFace:Pgr_face; i:Tgr_uint16):Tgr_uint32;cdecl;external;
{* Destroy the given face and free its memory * }
procedure gr_face_destroy(face:Pgr_face);cdecl;external;
{* Returns the number of glyphs in the face * }
(* Const before type ignored *)
function gr_face_n_glyphs(pFace:Pgr_face):word;cdecl;external;
{* Returns a faceinfo for the face and script * }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_face_info(pFace:Pgr_face; script:Tgr_uint32):Pgr_faceinfo;cdecl;external;
{* Returns whether the font supports a given Unicode character
  *
  * @return true if the character is supported.
  * @param pFace    face to test within
  * @param usv      Unicode Scalar Value of character to test
  * @param script   Tag of script for selecting which set of pseudo glyphs to test. May be NULL.
   }
(* Const before type ignored *)
function gr_face_is_char_supported(pFace:Pgr_face; usv:Tgr_uint32; script:Tgr_uint32):longint;cdecl;external;
{$ifndef GRAPHITE2_NFILEFACE}
{* Create gr_face from a font file
  *
  * @return gr_face that accesses a font file directly. Returns NULL on failure.
  * @param filename Full path and filename to font file
  * @param faceOptions Bitfile from enum gr_face_options to control face options.
   }
(* Const before type ignored *)

function gr_make_file_face(filename:Pchar; faceOptions:dword):Pgr_face;cdecl;external;
{* @deprecated   Since 1.3.7. This function is now an alias for gr_make_file_face().
  *
  * Create gr_face from a font file, with subsegment caching support.
  *
  * @return gr_face that accesses a font file directly. Returns NULL on failure.
  * @param filename Full path and filename to font file
  * @param segCacheMaxSize Specifies how big to make the cache in segments.
  * @param faceOptions   Bitfield from enum gr_face_options to control face options.
   }
{GR2_DEPRECATED_API }(* Const before type ignored *)
function gr_make_file_face_with_seg_cache(filename:Pchar; segCacheMaxSize:dword; faceOptions:dword):Pgr_face;cdecl;external;
{$endif}
{ !GRAPHITE2_NFILEFACE }
{* Create a font from a face
  *
  * @return gr_font Call font_destroy to free this font
  * @param ppm Resolution of the font in pixels per em
  * @param face Face this font corresponds to. This must stay alive as long as the font is alive.
   }
(* Const before type ignored *)

function gr_make_font(ppm:single; face:Pgr_face):Pgr_font;cdecl;external;
{* query function to find the hinted advance of a glyph
  *
  * @param appFontHandle is the unique information passed to gr_make_font_with_advance()
  * @param glyphid is the glyph to retireve the hinted advance for.
  }
(* Const before type ignored *)
type

  Tgr_advance_fn = function (appFontHandle:pointer; glyphid:Tgr_uint16):single;cdecl;
{* struct housing function pointers to manage font hinted metrics for the
  * graphite engine.  }
{* size of the structure in bytes to allow for future extensibility  }
{* a pointer to a function to retrieve the hinted
          * advance width of a glyph which the font cannot
          * provide without client assistance.  This can be
          * NULL to signify no horizontal hinted metrics are necessary.  }
{* a pointer to a function to retrieve the hinted
          * advance height of a glyph which the font cannot
          * provide without client assistance.  This can be
          * NULL to signify no horizontal hinted metrics are necessary.  }
  Pgr_font_ops = ^Tgr_font_ops;
  Tgr_font_ops = record
      size : Tsize_t;cdecl;
      glyph_advance_x : Tgr_advance_fn;
      glyph_advance_y : Tgr_advance_fn;
    end;

{* Creates a font with hinted advance width query functions
  *
  * @return gr_font to be destroyed via font_destroy
  * @param ppm size of font in pixels per em
  * @param appFontHandle font specific information that must stay alive as long
  *        as the font does
  * @param font_ops pointer font specific callback structure for hinted metrics.
  *        Need only stay alive for the duration of the call.
  * @param face the face this font corresponds to. Must stay alive as long as
  *        the font does.
   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

function gr_make_font_with_ops(ppm:single; appFontHandle:pointer; font_ops:Pgr_font_ops; face:Pgr_face):Pgr_font;cdecl;external;
{* Creates a font with hinted advance width query function.
  * This function is deprecated. Use gr_make_font_with_ops instead.
  *
  * @return gr_font to be destroyed via font_destroy
  * @param ppm size of font in pixels per em
  * @param appFontHandle font specific information that must stay alive as long
  *        as the font does
  * @param getAdvance callback function reference that returns horizontal advance in pixels for a glyph.
  * @param face the face this font corresponds to. Must stay alive as long as
  *        the font does.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_make_font_with_advance_fn(ppm:single; appFontHandle:pointer; getAdvance:Tgr_advance_fn; face:Pgr_face):Pgr_font;cdecl;external;
{* Free a font * }
procedure gr_font_destroy(font:Pgr_font);cdecl;external;
{* get a feature value
  *
  * @return value of specific feature or 0 if any problems.
  * @param pfeatureref   gr_feature_ref to the feature
  * @param feats gr_feature_val containing all the values
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_fref_feature_value(pfeatureref:Pgr_feature_ref; feats:Pgr_feature_val):Tgr_uint16;cdecl;external;
{* set a feature value
  *
  * @return false if there were any problems (value out of range, etc.)
  * @param pfeatureref   gr_feature_ref to the feature
  * @param val   value to set the feature to
  * @param pDest the gr_feature_val containing all the values for all the features
   }
(* Const before type ignored *)
function gr_fref_set_feature_value(pfeatureref:Pgr_feature_ref; val:Tgr_uint16; pDest:Pgr_feature_val):longint;cdecl;external;
{* Returns the id tag for a gr_feature_ref * }
(* Const before type ignored *)
function gr_fref_id(pfeatureref:Pgr_feature_ref):Tgr_uint32;cdecl;external;
{* Returns number of values a feature may take, given a gr_feature_ref * }
(* Const before type ignored *)
function gr_fref_n_values(pfeatureref:Pgr_feature_ref):Tgr_uint16;cdecl;external;
{* Returns the value associated with a particular value in a feature
  *
  * @return value
  * @param pfeatureref gr_feature_ref of the feature of interest
  * @param settingno   Index up to the return value of gr_fref_n_values() of the value
   }
(* Const before type ignored *)
function gr_fref_value(pfeatureref:Pgr_feature_ref; settingno:Tgr_uint16):Tgr_int16;cdecl;external;
{* Returns a string of the UI name of a feature
  *
  * @return string of the UI name, in the encoding form requested. Call gr_label_destroy() after use.
  * @param pfeatureref   gr_feature_ref of the feature
  * @param langId    This is a pointer since the face may not support a string in the requested
  *                  language. The actual language of the string is returned in langId
  * @param utf   Encoding form for the string
  * @param length    Used to return the length of the string returned in bytes.
   }
(* Const before type ignored *)
function gr_fref_label(pfeatureref:Pgr_feature_ref; langId:Pgr_uint16; utf:Tgr_encform; length:Pgr_uint32):pointer;cdecl;external;
{* Return a UI string for a possible value of a feature
  *
  * @return string of the UI name, in the encoding form requested. nul terminated. Call gr_label_destroy()
  *          after use.
  * @param pfeatureref   gr_feature_ref of the feature
  * @param settingno     Value setting index
  * @param langId        This is a pointer to the requested language. The requested language id is
  *                      replaced by the actual language id of the string returned.
  * @param utf   Encoding form for the string
  * @param length    Returns the length of the string returned in bytes.
   }
(* Const before type ignored *)
{rather than a value }function gr_fref_value_label(pfeatureref:Pgr_feature_ref; settingno:Tgr_uint16; langId:Pgr_uint16; utf:Tgr_encform; length:Pgr_uint32):pointer;cdecl;external;
{* Destroy a previously returned label string * }
procedure gr_label_destroy(_label:pointer);cdecl;external;
{* Copies a gr_feature_val * }
(* Const before type ignored *)
function gr_featureval_clone(pfeatures:Pgr_feature_val):Pgr_feature_val;cdecl;external;
{* Destroys a gr_feature_val * }
procedure gr_featureval_destroy(pfeatures:Pgr_feature_val);cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation

function has_bidi_pass(var a : Tgr_faceinfo) : dword;
begin
  has_bidi_pass:=(a.flag0 and bm_Tgr_faceinfo_has_bidi_pass) shr bp_Tgr_faceinfo_has_bidi_pass;
end;

procedure set_has_bidi_pass(var a : Tgr_faceinfo; __has_bidi_pass : dword);
begin
  a.flag0:=a.flag0 or ((__has_bidi_pass shl bp_Tgr_faceinfo_has_bidi_pass) and bm_Tgr_faceinfo_has_bidi_pass);
end;

function line_ends(var a : Tgr_faceinfo) : dword;
begin
  line_ends:=(a.flag0 and bm_Tgr_faceinfo_line_ends) shr bp_Tgr_faceinfo_line_ends;
end;

procedure set_line_ends(var a : Tgr_faceinfo; __line_ends : dword);
begin
  a.flag0:=a.flag0 or ((__line_ends shl bp_Tgr_faceinfo_line_ends) and bm_Tgr_faceinfo_line_ends);
end;

function justifies(var a : Tgr_faceinfo) : dword;
begin
  justifies:=(a.flag0 and bm_Tgr_faceinfo_justifies) shr bp_Tgr_faceinfo_justifies;
end;

procedure set_justifies(var a : Tgr_faceinfo; __justifies : dword);
begin
  a.flag0:=a.flag0 or ((__justifies shl bp_Tgr_faceinfo_justifies) and bm_Tgr_faceinfo_justifies);
end;


end.
