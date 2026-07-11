unit gstiterator;

interface

uses
  fp_glib2, fp_gst;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GStreamer
 * Copyright (C) 2004 Wim Taymans <wim@fluendo.com>
 * Copyright (C) 2011 Sebastian Dröge <sebastian.droege@collabora.co.uk>
 *
 * gstiterator.h: Header for GstIterator
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 51 Franklin St, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$ifndef __GST_ITERATOR_H__}
{$define __GST_ITERATOR_H__}
{$include <glib-object.h> /* for GValue in the fold */}
{$include <gst/gstconfig.h>}

  PGstIteratorResult = ^TGstIteratorResult;
  TGstIteratorResult =  Longint;
  Const
    GST_ITERATOR_DONE = 0;
    GST_ITERATOR_OK = 1;
    GST_ITERATOR_RESYNC = 2;
    GST_ITERATOR_ERROR = 3;
;
type
{*
 * GstIteratorItem:
 * @GST_ITERATOR_ITEM_SKIP:  Skip this item
 * @GST_ITERATOR_ITEM_PASS:  Return item
 * @GST_ITERATOR_ITEM_END:   Stop after this item.
 *
 * The result of a #GstIteratorItemFunction.
  }

  PGstIteratorItem = ^TGstIteratorItem;
  TGstIteratorItem =  Longint;
  Const
    GST_ITERATOR_ITEM_SKIP = 0;
    GST_ITERATOR_ITEM_PASS = 1;
    GST_ITERATOR_ITEM_END = 2;
;
{*
 * GstIteratorCopyFunction:
 * @it: The original iterator
 * @copy: The copied iterator
 *
 * This function will be called when creating a copy of @it and should
 * create a copy of all custom iterator fields or increase their
 * reference counts.
  }
type

  TGstIteratorCopyFunction = procedure (it:PGstIterator; copy:PGstIterator);cdecl;
{*
 * GstIteratorItemFunction:
 * @it: the iterator
 * @item: the item being retrieved.
 *
 * The function that will be called after the next item of the iterator
 * has been retrieved. This function can be used to skip items or stop
 * the iterator.
 *
 * The function will be called with the iterator lock held.
 *
 * Returns: the result of the operation.
  }

  TGstIteratorItemFunction = function (it:PGstIterator; item:PGValue):TGstIteratorItem;cdecl;
{*
 * GstIteratorNextFunction:
 * @it: the iterator
 * @result: a pointer to hold the next item
 *
 * The function that will be called when the next element of the iterator
 * should be retrieved.
 *
 * Implementors of a #GstIterator should implement this
 * function and pass it to the constructor of the custom iterator.
 * The function will be called with the iterator lock held.
 *
 * Returns: the result of the operation.
  }

  TGstIteratorNextFunction = function (it:PGstIterator; result:PGValue):TGstIteratorResult;cdecl;
{*
 * GstIteratorResyncFunction:
 * @it: the iterator
 *
 * This function will be called whenever a concurrent update happened
 * to the iterated datastructure. The implementor of the iterator should
 * restart the iterator from the beginning and clean up any state it might
 * have.
 *
 * Implementors of a #GstIterator should implement this
 * function and pass it to the constructor of the custom iterator.
 * The function will be called with the iterator lock held.
  }

  TGstIteratorResyncFunction = procedure (it:PGstIterator);cdecl;
{*
 * GstIteratorFreeFunction:
 * @it: the iterator
 *
 * This function will be called when the iterator is freed.
 *
 * Implementors of a #GstIterator should implement this
 * function and pass it to the constructor of the custom iterator.
 * The function will be called with the iterator lock held.
  }

  TGstIteratorFreeFunction = procedure (it:PGstIterator);cdecl;
{*
 * GstIteratorForeachFunction:
 * @item: The item
 * @user_data: User data
 *
 * A function that is called by gst_iterator_foreach() for every element.
  }

  TGstIteratorForeachFunction = procedure (item:PGValue; user_data:Tgpointer);cdecl;
{*
 * GstIteratorFoldFunction:
 * @item: the item to fold
 * @ret: a #GValue collecting the result
 * @user_data: data passed to gst_iterator_fold()
 *
 * A function to be passed to gst_iterator_fold().
 *
 * Returns: %TRUE if the fold should continue, %FALSE if it should stop.
  }

  TGstIteratorFoldFunction = function (item:PGValue; ret:PGValue; user_data:Tgpointer):Tgboolean;cdecl;
{*
 * GST_ITERATOR:
 * @it: the #GstIterator value
 *
 * Macro to cast to a #GstIterator
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }

function GST_ITERATOR(it : longint) : PGstIterator;

{*
 * GST_ITERATOR_LOCK:
 * @it: the #GstIterator to get the lock of
 *
 * Macro to get the lock protecting the datastructure being iterated.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ITERATOR_LOCK(it : longint) : longint;

{*
 * GST_ITERATOR_COOKIE:
 * @it: the #GstIterator to get the cookie of
 *
 * Macro to get the cookie of a #GstIterator. The cookie of the
 * iterator is the value of the master cookie when the iterator
 * was created.
 * Whenever the iterator is iterated, the value is compared to the
 * value of the master cookie. If they are different, a concurrent
 * modification happened to the iterator and a resync is needed.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ITERATOR_COOKIE(it : longint) : longint;

{*
 * GST_ITERATOR_ORIG_COOKIE:
 * @it: the #GstIterator to get the master cookie of
 *
 * Macro to get a pointer to where the master cookie is stored. The
 * master cookie protects the structure being iterated and gets updated
 * whenever the datastructure changes.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ITERATOR_ORIG_COOKIE(it : longint) : longint;

{*
 * GstIterator:
 * @copy: The function to copy the iterator
 * @next: The function to get the next item in the iterator
 * @item: The function to be called for each item retrieved
 * @resync: The function to call when a resync is needed.
 * @free: The function to call when the iterator is freed
 * @pushed: The iterator that is currently pushed with gst_iterator_push()
 * @type: The type of the object that this iterator will return
 * @lock: The lock protecting the data structure and the cookie.
 * @cookie: The cookie; the value of the master_cookie when this iterator was
 *          created.
 * @master_cookie: A pointer to the master cookie.
 * @size: the size of the iterator
 *
 * #GstIterator base structure. The values of this structure are
 * protected for subclasses, use the methods to use the #GstIterator.
  }
{< protected > }
{ pushed iterator  }
{ cookie of the iterator  }
{ pointer to guint32 holding the cookie when this
                                   iterator was created  }
{< private > }
type
  PGstIterator = ^TGstIterator;
  TGstIterator = record
      copy : TGstIteratorCopyFunction;cdecl;
      next : TGstIteratorNextFunction;
      item : TGstIteratorItemFunction;
      resync : TGstIteratorResyncFunction;
      free : TGstIteratorFreeFunction;
      pushed : PGstIterator;
      _type : TGType;
      lock : PGMutex;
      cookie : Tguint32;
      master_cookie : Pguint32;
      size : Tguint;
      _gst_reserved : array[0..(GST_PADDING)-1] of Tgpointer;
    end;


function gst_iterator_get_type:TGType;cdecl;external libgstreamer;
{ creating iterators  }
function gst_iterator_new(size:Tguint; _type:TGType; lock:PGMutex; master_cookie:Pguint32; copy:TGstIteratorCopyFunction; 
           next:TGstIteratorNextFunction; item:TGstIteratorItemFunction; resync:TGstIteratorResyncFunction; free:TGstIteratorFreeFunction):PGstIterator;cdecl;external libgstreamer;
function gst_iterator_new_list(_type:TGType; lock:PGMutex; master_cookie:Pguint32; list:PPGList; owner:PGObject; 
           item:TGstIteratorItemFunction):PGstIterator;cdecl;external libgstreamer;
function gst_iterator_new_single(_type:TGType; object:PGValue):PGstIterator;cdecl;external libgstreamer;
function gst_iterator_copy(it:PGstIterator):PGstIterator;cdecl;external libgstreamer;
{ using iterators  }
function gst_iterator_next(it:PGstIterator; elem:PGValue):TGstIteratorResult;cdecl;external libgstreamer;
procedure gst_iterator_resync(it:PGstIterator);cdecl;external libgstreamer;
procedure gst_iterator_free(it:PGstIterator);cdecl;external libgstreamer;
procedure gst_iterator_push(it:PGstIterator; other:PGstIterator);cdecl;external libgstreamer;
{ higher-order functions that operate on iterators  }
function gst_iterator_filter(it:PGstIterator; func:TGCompareFunc; user_data:PGValue):PGstIterator;cdecl;external libgstreamer;
function gst_iterator_fold(it:PGstIterator; func:TGstIteratorFoldFunction; ret:PGValue; user_data:Tgpointer):TGstIteratorResult;cdecl;external libgstreamer;
function gst_iterator_foreach(it:PGstIterator; func:TGstIteratorForeachFunction; user_data:Tgpointer):TGstIteratorResult;cdecl;external libgstreamer;
function gst_iterator_find_custom(it:PGstIterator; func:TGCompareFunc; elem:PGValue; user_data:Tgpointer):Tgboolean;cdecl;external libgstreamer;
{//////G_DEFINE_AUTOPTR_CLEANUP_FUNC    (GstIterator, gst_iterator_free) }
{$endif}
{ __GST_ITERATOR_H__  }

// === Konventiert am: 11-7-26 11:30:30 ===

function GST_TYPE_ITERATOR : TGType;
begin
begin

implementation
{ was #define dname(params) para_def_expr }
function GST_TYPE_ITERATOR : TGType;
  begin
    GST_TYPE_ITERATOR:=gst_iterator_get_type;
  end;

begin
  GST_ITERATOR:=PGstIterator(it);
  Result := P(g_type_check_instance_cast(obj, GST_TYPE_ITERATOR));

{ was #define dname(params) para_def_expr }
begin
  GST_ITERATOR_LOCK:=(GST_ITERATOR(it))^.lock;
  Result := g_type_check_instance_is_a(obj,  GST_TYPE_ITERATOR);

{ was #define dname(params) para_def_expr }

{ argument types are unknown }
{ return type might be wrong }   
function GST_ITERATOR_COOKIE(it : longint) : longint;
begin
  GST_ITERATOR_COOKIE:=(GST_ITERATOR(it))^.cookie;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GST_ITERATOR_ORIG_COOKIE(it : longint) : longint;
begin
  GST_ITERATOR_ORIG_COOKIE:=(GST_ITERATOR(it))^.master_cookie;
end;


end.
