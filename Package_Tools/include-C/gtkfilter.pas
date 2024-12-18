unit gtkfilter;

interface

uses
  fp_glib2, fp_gst, ges_enums, ges_types;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright © 2019 Benjamin Otte
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Benjamin Otte <otte@gnome.org>
  }
{$include <gdk/gdk.h>}
{*
 * GtkFilterMatch:
 * @GTK_FILTER_MATCH_SOME: The filter matches some items,
 *   gtk_filter_match() may return %TRUE or %FALSE
 * @GTK_FILTER_MATCH_NONE: The filter does not match any item,
 *   gtk_filter_match() will always return %FALSE.
 * @GTK_FILTER_MATCH_ALL: The filter matches all items,
 *   gtk_filter_match() will alays return %TRUE.
 *
 * Describes the known strictness of a filter.
 *
 * Note that for filters where the strictness is not known,
 * %GTK_FILTER_MATCH_SOME is always an acceptable value,
 * even if a filter does match all or no items.
  }
type
  PGtkFilterMatch = ^TGtkFilterMatch;
  TGtkFilterMatch =  Longint;
  Const
    GTK_FILTER_MATCH_SOME = 0;
    GTK_FILTER_MATCH_NONE = 1;
    GTK_FILTER_MATCH_ALL = 2;
;
{*
 * GtkFilterChange:
 * @GTK_FILTER_CHANGE_DIFFERENT: The filter change cannot be
 *   described with any of the other enumeration values.
 * @GTK_FILTER_CHANGE_LESS_STRICT: The filter is less strict than
 *   it was before: All items that it used to return %TRUE for
 *   still return %TRUE, others now may, too.
 * @GTK_FILTER_CHANGE_MORE_STRICT: The filter is more strict than
 *   it was before: All items that it used to return %FALSE for
 *   still return %FALSE, others now may, too.
 *
 * Describes changes in a filter in more detail and allows objects
 * using the filter to optimize refiltering items.
 *
 * If you are writing an implementation and are not sure which
 * value to pass, %GTK_FILTER_CHANGE_DIFFERENT is always a correct
 * choice.
  }
type
  PGtkFilterChange = ^TGtkFilterChange;
  TGtkFilterChange =  Longint;
  Const
    GTK_FILTER_CHANGE_DIFFERENT = 0;
    GTK_FILTER_CHANGE_LESS_STRICT = 1;
    GTK_FILTER_CHANGE_MORE_STRICT = 2;
;

{G_DECLARE_DERIVABLE_TYPE       (GtkFilter,       gtk_filter,GTK, FILTER, GObject) }
{ optional  }
{ Padding for future expansion  }
type
  PGtkFilterClass = ^TGtkFilterClass;
  TGtkFilterClass = record
      parent_class : TGObjectClass;
      match : function (self:PGtkFilter; item:Tgpointer):Tgboolean;cdecl;
      get_strictness : function (self:PGtkFilter):TGtkFilterMatch;cdecl;
      _gtk_reserved1 : procedure ;cdecl;
      _gtk_reserved2 : procedure ;cdecl;
      _gtk_reserved3 : procedure ;cdecl;
      _gtk_reserved4 : procedure ;cdecl;
      _gtk_reserved5 : procedure ;cdecl;
      _gtk_reserved6 : procedure ;cdecl;
      _gtk_reserved7 : procedure ;cdecl;
      _gtk_reserved8 : procedure ;cdecl;
    end;


function gtk_filter_match(self:PGtkFilter; item:Tgpointer):Tgboolean;cdecl;external libges;
function gtk_filter_get_strictness(self:PGtkFilter):TGtkFilterMatch;cdecl;external libges;
{ for filter implementations  }
procedure gtk_filter_changed(self:PGtkFilter; change:TGtkFilterChange);cdecl;external libges;

// === Konventiert am: 18-12-24 17:39:43 ===

function GTK_TYPE_FILTER: TGType;
function GTK_FILTER(obj: Pointer): PGtkFilter;
function GTK_IS_FILTER(obj: Pointer): Tgboolean;
function GTK_FILTER_CLASS(klass: Pointer): PGtkFilterClass;
function GTK_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
function GTK_FILTER_GET_CLASS(obj: Pointer): PGtkFilterClass;

implementation

function GTK_TYPE_FILTER: TGType;
begin
  Result := gtk_filter_get_type;
end;

function GTK_FILTER(obj: Pointer): PGtkFilter;
begin
  Result := PGtkFilter(g_type_check_instance_cast(obj, GTK_TYPE_FILTER));
end;

function GTK_IS_FILTER(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GTK_TYPE_FILTER);
end;

function GTK_FILTER_CLASS(klass: Pointer): PGtkFilterClass;
begin
  Result := PGtkFilterClass(g_type_check_class_cast(klass, GTK_TYPE_FILTER));
end;

function GTK_IS_FILTER_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GTK_TYPE_FILTER);
end;

function GTK_FILTER_GET_CLASS(obj: Pointer): PGtkFilterClass;
begin
  Result := PGtkFilterClass(PGTypeInstance(obj)^.g_class);
end;

type 
  TGtkFilter = record
    parent_instance: TGObject
  end;
  PGtkFilter = ^TGtkFilter;

  TGtkFilterClass = record
  end;
  PGtkFilterClass = ^TGtkFilterClass;

function gtk_filter_get_type: TGType; cdecl; external libgxxxxxxx;



end.
