
unit Segment;
interface

{
  Automatically converted by H2Pas 1.0.0 from Segment.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    Segment.h
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
Pgr_attrCode  = ^gr_attrCode;
Pgr_bidirtl  = ^gr_bidirtl;
Pgr_break_weight  = ^gr_break_weight;
Pgr_char_info  = ^gr_char_info;
Pgr_face  = ^gr_face;
Pgr_feature_val  = ^gr_feature_val;
Pgr_font  = ^gr_font;
Pgr_justFlags  = ^gr_justFlags;
Pgr_segment  = ^gr_segment;
Pgr_slot  = ^gr_slot;
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
{$include "graphite2/Font.h"}
{ after break weights  }
{ before break weights  }
type
  Tgr_break_weight =  Longint;
  Const
    gr_breakNone = 0;
    gr_breakWhitespace = 10;
    gr_breakWord = 15;
    gr_breakIntra = 20;
    gr_breakLetter = 30;
    gr_breakClip = 40;
    gr_breakBeforeWhitespace = -(10);
    gr_breakBeforeWord = -(15);
    gr_breakBeforeIntra = -(20);
    gr_breakBeforeLetter = -(30);
    gr_breakBeforeClip = -(40);

{/ Indicates that this segment is a complete line }
{/ Indicates that the start of the slot list is not at the start of a line }
{/ Indicates that the end of the slot list is not at the end of a line }
type
  Tgr_justFlags =  Longint;
  Const
    gr_justCompleteLine = 0;
    gr_justStartInline = 1;
    gr_justEndInline = 2;

{* Used for looking up slot attributes. Most are already available in other functions * }
{/ adjusted glyph advance in x direction in design units }
{/ adjusted glyph advance in y direction (usually 0) in design units }
{/ returns 0. Deprecated. }
{/ This slot attaches to its parent at the given design units in the x direction }
{/ This slot attaches to its parent at the given design units in the y direction }
{/ This slot attaches to its parent at the given glyph point (not implemented) }
{/ x-direction adjustment from the given glyph point (not implemented) }
{/ y-direction adjustment from the given glyph point (not implemented) }
{/ Where on this glyph should align with the attachment point on the parent glyph in the x-direction. }
{/ Where on this glyph should align with the attachment point on the parent glyph in the y-direction }
{/ Which glyph point on this glyph should align with the attachment point on the parent glyph (not implemented). }
{/ Adjustment to gr_slatWithGpt in x-direction (not implemented) }
{/ Adjustment to gr_slatWithGpt in y-direction (not implemented) }
{/ Attach at given nesting level (not implemented) }
{/ Line break breakweight for this glyph }
{/ Ligature component reference (not implemented) }
{/ bidi directionality of this glyph (not implemented) }
{/ Whether insertion is allowed before this glyph }
{/ Final positioned position of this glyph relative to its parent in x-direction in pixels }
{/ Final positioned position of this glyph relative to its parent in y-direction in pixels }
{/ Amount to shift glyph by in x-direction design units }
{/ Amount to shift glyph by in y-direction design units }
{/ attribute user1 }
{/ not implemented }
{/ not implemented }
{/ Amount this slot can stretch (not implemented) }
{/ Amount this slot can shrink (not implemented) }
{/ Granularity by which this slot can stretch or shrink (not implemented) }
{/ Justification weight for this glyph (not implemented) }
{/ Amount this slot mush shrink or stretch in design units }
{/ SubSegment split point }
{/ User defined attribute, see subattr for user attr number }
{/ Bidi level }
{/ Collision flags }
{/ Collision constraint rectangle left (bl.x) }
{/ Collision constraint rectangle lower (bl.y) }
{/ Collision constraint rectangle right (tr.x) }
{/ Collision constraint rectangle upper (tr.y) }
{/ Collision shift x }
{/ Collision shift y }
{/ Collision margin }
{/ Margin cost weight }
{ Additional glyph that excludes movement near this one: }
{ Collision sequence enforcing attributes: }
{/ not implemented }
{/ not implemented }
type
  Tgr_attrCode =  Longint;
  Const
    gr_slatAdvX = 0;
    gr_slatAdvY = 1;
    gr_slatAttTo = 2;
    gr_slatAttX = 3;
    gr_slatAttY = 4;
    gr_slatAttGpt = 5;
    gr_slatAttXOff = 6;
    gr_slatAttYOff = 7;
    gr_slatAttWithX = 8;
    gr_slatAttWithY = 9;
    gr_slatWithGpt = 10;
    gr_slatAttWithXOff = 11;
    gr_slatAttWithYOff = 12;
    gr_slatAttLevel = 13;
    gr_slatBreak = 14;
    gr_slatCompRef = 15;
    gr_slatDir = 16;
    gr_slatInsert = 17;
    gr_slatPosX = 18;
    gr_slatPosY = 19;
    gr_slatShiftX = 20;
    gr_slatShiftY = 21;
    gr_slatUserDefnV1 = 22;
    gr_slatMeasureSol = 23;
    gr_slatMeasureEol = 24;
    gr_slatJStretch = 25;
    gr_slatJShrink = 26;
    gr_slatJStep = 27;
    gr_slatJWeight = 28;
    gr_slatJWidth = 29;
    gr_slatSegSplit = gr_slatJStretch+29;
    gr_slatUserDefn = (gr_slatJStretch+29)+1;
    gr_slatBidiLevel = 56;
    gr_slatColFlags = 57;
    gr_slatColLimitblx = 58;
    gr_slatColLimitbly = 59;
    gr_slatColLimittrx = 60;
    gr_slatColLimittry = 61;
    gr_slatColShiftx = 62;
    gr_slatColShifty = 63;
    gr_slatColMargin = 64;
    gr_slatColMarginWt = 65;
    gr_slatColExclGlyph = 66;
    gr_slatColExclOffx = 67;
    gr_slatColExclOffy = 68;
    gr_slatSeqClass = 69;
    gr_slatSeqProxClass = 70;
    gr_slatSeqOrder = 71;
    gr_slatSeqAboveXoff = 72;
    gr_slatSeqAboveWt = 73;
    gr_slatSeqBelowXlim = 74;
    gr_slatSeqBelowWt = 75;
    gr_slatSeqValignHt = 76;
    gr_slatSeqValignWt = 77;
    gr_slatMax = 78;
    gr_slatNoEffect = gr_slatMax+1;

{/ Underlying paragraph direction is RTL }
{/ Set this to not run the bidi pass internally, even if the font asks for it. }
{/ This presumes that the segment is in a single direction. Most of the time }
{/ this bit should be set unless you know you are passing full paragraphs of text. }
{/ Disable auto mirroring for rtl text }
type
  Tgr_bidirtl =  Longint;
  Const
    gr_rtl = 1;
    gr_nobidi = 2;
    gr_nomirror = 4;

type
{* Returns Unicode character for a charinfo.
  *
  * @param p Pointer to charinfo to return information on.
   }
(* Const before type ignored *)
{not NULL }
function gr_cinfo_unicode_char(p:Pgr_char_info):dword;cdecl;external;
{* Returns breakweight for a charinfo.
  *
  * @return Breakweight is a number between -50 and 50 indicating the cost of a
  * break before or after this character. If the value is lesser than 0, the absolute value
  * is this character's contribution to the overall breakweight before it. If the value
  * is bigger than 0, then the value is this character's contribution to the overall breakweight after it.
  * The overall breakweight between two characters is the maximum of the breakweight
  * contributions from the characters either side of it. If a character makes no
  * contribution to the breakweight on one side of it, the contribution is considered
  * to be 0.
  * @param p Pointer to charinfo to return information on.
   }
(* Const before type ignored *)
{not NULL }function gr_cinfo_break_weight(p:Pgr_char_info):longint;cdecl;external;
{* Returns the slot index that after this character is after in the slot stream
  *
  * In effect each character is associated with a set of slots and this returns
  * the index of the last slot in the segment this character is associated with.
  *
  * @return after slot index between 0 and gr_seg_n_slots()
  * @param p Pointer to charinfo to return information on.
   }
(* Const before type ignored *)
{not NULL }function gr_cinfo_after(p:Pgr_char_info):longint;cdecl;external;
{* Returns the slot index that before this character is before in the slot stream
  *
  * In effect each character is associated with a set of slots and this returns
  * the index of the first slot in the segment this character is associated with.
  *
  * @return before slot index between 0 and gr_seg_n_slots()
  * @param p Pointer to charinfo to return information on.
   }
(* Const before type ignored *)
{not NULL }function gr_cinfo_before(p:Pgr_char_info):longint;cdecl;external;
{* Returns the code unit index of this character in the input string
  *
  * @return code unit index between 0 and the end of the string
  * @param p Pointer to charinfo to return information on.
   }
(* Const before type ignored *)
{not NULL }function gr_cinfo_base(p:Pgr_char_info):Tsize_t;cdecl;external;
{* Returns the number of unicode characters in a string.
  *
  * @return number of characters in the string
  * @param enc Specifies the type of data in the string: utf8, utf16, utf32
  * @param buffer_begin The start of the string
  * @param buffer_end Measure up to the first nul or when end is reached, whichever is earliest.
  *            This parameter may be NULL.
  * @param pError If there is a structural fault in the string, the location is returned
  *               in this variable. If no error occurs, pError will contain NULL. NULL
  *               may be passed for pError if no such information is required.
   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gr_count_unicode_characters(enc:Tgr_encform; buffer_begin:pointer; buffer_end:pointer; pError:Ppointer):Tsize_t;cdecl;external;
{* Creates and returns a segment.
  *
  * @return a segment that needs seg_destroy called on it. May return NULL if bad problems
  *     in segment processing.
  * @param font Gives the size of the font in pixels per em for final positioning. If
  *             NULL, positions are returned in design units, i.e. at a ppm of the upem
  *             of the face.
  * @param face The face containing all the non-size dependent information.
  * @param script This is a tag containing a script identifier that is used to choose
  *               which graphite table within the font to use. Maybe 0. Tag may be 4 chars
  *               NULL padded in LSBs or space padded in LSBs.
  * @param pFeats Pointer to a feature values to be used for the segment. Only one
  *               feature values may be used for a segment. If NULL the default features
  *               for the font will be used.
  * @param enc Specifies what encoding form the string is in (utf8, utf16, utf32)
  * @param pStart Start of the string
  * @param nChars Number of unicode characters to process in the string. The string will
  *               be processed either up to the first NULL or until nChars have been
  *               processed. nChars is also used to initialise the internal memory
  *               allocations of the segment. So it is wise not to make nChars too much
  *               greater than the actual number of characters being processed.
  * @param dir Specifies whether the segment is processed right to left (1) or left to
  *            right (0) and whether to run the internal bidi pass, if a font requests it.
  *            See enum gr_bidirtl for details.
   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gr_make_seg(font:Pgr_font; face:Pgr_face; script:Tgr_uint32; pFeats:Pgr_feature_val; enc:Tgr_encform; 
           pStart:pointer; nChars:Tsize_t; dir:longint):Pgr_segment;cdecl;external;
{* Destroys a segment, freeing the memory.
  *
  * @param p The segment to destroy
   }
procedure gr_seg_destroy(p:Pgr_segment);cdecl;external;
{* Returns the advance for the whole segment.
  *
  * Returns the width of the segment up to the next glyph origin after the segment
   }
(* Const before type ignored *)
{not NULL }function gr_seg_advance_X(pSeg:Pgr_segment):single;cdecl;external;
{* Returns the height advance for the segment. * }
(* Const before type ignored *)
{not NULL }function gr_seg_advance_Y(pSeg:Pgr_segment):single;cdecl;external;
{* Returns the number of gr_char_infos in the segment. * }
(* Const before type ignored *)
{not NULL }function gr_seg_n_cinfo(pSeg:Pgr_segment):dword;cdecl;external;
{* Returns a gr_char_info at a given index in the segment. * }
(* Const before type ignored *)
(* Const before type ignored *)
{not NULL }{must be <number_of_CharInfo }function gr_seg_cinfo(pSeg:Pgr_segment; index:dword):Pgr_char_info;cdecl;external;
{* Returns the number of glyph gr_slots in the segment. * }
(* Const before type ignored *)
{not NULL }function gr_seg_n_slots(pSeg:Pgr_segment):dword;cdecl;external;
{one slot per glyph }
{* Returns the first gr_slot in the segment.
  *
  * The first slot in a segment has a gr_slot_prev_in_segment() of NULL. Slots are owned
  * by their segment and are destroyed along with the segment.
   }
(* Const before type ignored *)
{not NULL }function gr_seg_first_slot(pSeg:Pgr_segment):Pgr_slot;cdecl;external;
{may give a base slot or a slot which is attached to another }
{* Returns the last gr_slot in the segment.
  *
  * The last slot in a segment has a gr_slot_next_in_segment() of NULL
   }
(* Const before type ignored *)
{not NULL }function gr_seg_last_slot(pSeg:Pgr_segment):Pgr_slot;cdecl;external;
{may give a base slot or a slot which is attached to another }
{* Justifies a linked list of slots for a line to a given width
  *
  * Passed a pointer to the start of a linked list of slots corresponding to a line, as
  * set up by gr_slot_linebreak_before, this function will position the glyphs in the line
  * to take up the given width. It is possible to specify a subrange within the line to process.
  * This allows skipping of line initial or final whitespace, for example. While this will ensure
  * that the subrange fits width, the line will still be positioned with the first glyph of the
  * line at 0. So the resulting positions may be beyond width.
  *
  * @return float   The resulting width of the range of slots justified.
  * @param pSeg     Pointer to the segment
  * @param pStart   Pointer to the start of the line linked list (including skipped characters)
  * @param pFont    Font to use for positioning
  * @param width    Width in pixels in which to fit the line. If < 0. don't adjust natural width, just run justification passes
  *                 to handle line end contextuals, if there are any.
  * @param flags    Indicates line ending types. Default is linked list is a full line
  * @param pFirst   If not NULL, the first slot in the list to be considered part of the line (so can skip)
  * @param pLast    If not NULL, the last slot to process in the line (allow say trailing whitespace to be skipped)
   }
{not NULL }(* Const before type ignored *)
{not NULL }(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gr_seg_justify(pSeg:Pgr_segment; pStart:Pgr_slot; pFont:Pgr_font; width:Tdouble; flags:Tgr_justFlags; 
           pFirst:Pgr_slot; pLast:Pgr_slot):single;cdecl;external;
{* Returns the next slot along in the segment.
  *
  * Slots are held in a linked list. This returns the next in the linked list. The slot
  * may or may not be attached to another slot. Returns NULL at the end of the segment.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_next_in_segment(p:Pgr_slot):Pgr_slot;cdecl;external;
{* Returns the previous slot along in the segment.
  *
  * Slots are held in a doubly linked list. This returns the previos slot in the linked
  * list. This slot may or may not be attached to it. Returns NULL at the start of the
  * segment.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_prev_in_segment(p:Pgr_slot):Pgr_slot;cdecl;external;
{* Returns the attachment parent slot of this slot.
  *
  * Attached slots form a tree. This returns the parent of this slot in that tree. A
  * base glyph which is not attached to another glyph, always returns NULL.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_attached_to(p:Pgr_slot):Pgr_slot;cdecl;external;
{* Returns the first slot attached to this slot.
  *
  * Attached slots form a singly linked list from the parent. This returns the first
  * slot in that list. Note that this is a reference to another slot that is also in
  * the main segment doubly linked list.
  *
  * if gr_slot_first_attachment(p) != NULL then gr_slot_attached_to(gr_slot_first_attachment(p)) == p.
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_first_attachment(p:Pgr_slot):Pgr_slot;cdecl;external;
{* Returns the next slot attached to our attachment parent.
  *
  * This returns the next slot in the singly linked list of slots attached to this
  * slot's parent. If there are no more such slots, NULL is returned. If there is
  * no parent, i.e. the passed slot is a cluster base, then the next cluster base
  * in graphical order (ltr, even for rtl text) is returned.
  *
  * if gr_slot_next_sibling_attachment(p) != NULL then gr_slot_attached_to(gr_slot_next_sibling_attachment(p)) == gr_slot_attached_to(p).
   }
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_next_sibling_attachment(p:Pgr_slot):Pgr_slot;cdecl;external;
{* Returns glyph id of the slot
  *
  * Each slot has a glyphid which is rendered at the position given by the slot. This
  * glyphid is the real glyph to be rendered and never a pseudo glyph.
   }
(* Const before type ignored *)
function gr_slot_gid(p:Pgr_slot):word;cdecl;external;
{* Returns X offset of glyph from start of segment * }
(* Const before type ignored *)
function gr_slot_origin_X(p:Pgr_slot):single;cdecl;external;
{* Returns Y offset of glyph from start of segment * }
(* Const before type ignored *)
function gr_slot_origin_Y(p:Pgr_slot):single;cdecl;external;
{* Returns the glyph advance for this glyph as adjusted for kerning
  *
  * @param p    Slot to give results for
  * @param face gr_face of the glyphs. May be NULL if unhinted advances used
  * @param font gr_font to scale for pixel results. If NULL returns design
  *             units advance. If not NULL then returns pixel advance based
  *             on hinted or scaled glyph advances in the font. face must be
  *             passed for hinted advances to be used.
   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_advance_X(p:Pgr_slot; face:Pgr_face; font:Pgr_font):single;cdecl;external;
{* Returns the vertical advance for the glyph in the slot adjusted for kerning
  *
  * Returns design units unless font is not NULL in which case the pixel value
  * is returned scaled for the given font
   }
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
function gr_slot_advance_Y(p:Pgr_slot; face:Pgr_face; font:Pgr_font):single;cdecl;external;
{* Returns the gr_char_info index before us
  *
  * Returns the index of the gr_char_info that a cursor before this slot, would put
  * an underlying cursor before. This may also be interpretted as each slot holding
  * a set of char_infos that it is associated with and this function returning the
  * index of the char_info with lowest index, from this set.
   }
(* Const before type ignored *)
{not NULL }function gr_slot_before(p:Pgr_slot):longint;cdecl;external;
{* Returns the gr_char_info index after us
  *
  * Returns the index of the gr_char_info that a cursor after this slot would put an
  * underlying cursor after. This may also be interpretted as each slot holding a set
  * of char_infos that it is associated with and this function returning the index of
  * the char_info with the highest index, from this set.
   }
(* Const before type ignored *)
{not NULL }function gr_slot_after(p:Pgr_slot):longint;cdecl;external;
{* Returns the index of this slot in the segment
  *
  * Returns the index given to this slot during final positioning. This corresponds
  * to the value returned br gr_cinfo_before() and gr_cinfo_after()
   }
(* Const before type ignored *)
{not NULL }function gr_slot_index(p:Pgr_slot):dword;cdecl;external;
{* Return a slot attribute value
  *
  * Given a slot and an attribute along with a possible subattribute, return the
  * corresponding value in the slot. See enum gr_attrCode for details of each attribute.
   }
(* Const before type ignored *)
{not NULL }(* Const before type ignored *)
{not NULL }function gr_slot_attr(p:Pgr_slot; pSeg:Pgr_segment; index:Tgr_attrCode; subindex:Tgr_uint8):longint;cdecl;external;
{tbd - do we need to expose this? }
{* Returns whether text may be inserted before this glyph.
  *
  * This indicates whether a cursor can be put before this slot. It applies to
  * base glyphs that have no parent as well as attached glyphs that have the
  * .insert attribute explicitly set to true. This is the primary mechanism
  * for identifying contiguous sequences of base plus diacritics.
   }
(* Const before type ignored *)
function gr_slot_can_insert_before(p:Pgr_slot):longint;cdecl;external;
{* Returns the original gr_char_info index this slot refers to.
  *
  * Each Slot has a gr_char_info that it originates from. This is that gr_char_info.
  * The index is passed to gr_seg_cinfo(). This information is useful for testing.
   }
(* Const before type ignored *)
{not NULL }function gr_slot_original(p:Pgr_slot):longint;cdecl;external;
{* Breaks a segment into lines.
  *
  * Breaks the slot linked list at the given point in the linked list. It is up
  * to the application to keep track of the first slot on each line.
   }
{not NULL }procedure gr_slot_linebreak_before(p:Pgr_slot);cdecl;external;
{ C++ end of extern C conditionnal removed }

implementation


end.
