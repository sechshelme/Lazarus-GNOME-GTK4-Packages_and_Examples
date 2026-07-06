unit gtktexttag;

interface

uses
  fp_glib2, fp_gtk4;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gtktexttag.c - text tag object
 *
 * Copyright (c) 1992-1994 The Regents of the University of California.
 * Copyright (c) 1994-1997 Sun Microsystems, Inc.
 * Copyright (c) 2000      Red Hat, Inc.
 * Tk -> Gtk port by Havoc Pennington <hp@redhat.com>
 *
 * This software is copyrighted by the Regents of the University of
 * California, Sun Microsystems, Inc., and other parties.  The
 * following terms apply to all files associated with the software
 * unless explicitly disclaimed in individual files.
 *
 * The authors hereby grant permission to use, copy, modify,
 * distribute, and license this software and its documentation for any
 * purpose, provided that existing copyright notices are retained in
 * all copies and that this notice is included verbatim in any
 * distributions. No written agreement, license, or royalty fee is
 * required for any of the authorized uses.  Modifications to this
 * software may be copyrighted by their authors and need not follow
 * the licensing terms described here, provided that the new terms are
 * clearly indicated on the first page of each file where they apply.
 *
 * IN NO EVENT SHALL THE AUTHORS OR DISTRIBUTORS BE LIABLE TO ANY
 * PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL
 * DAMAGES ARISING OUT OF THE USE OF THIS SOFTWARE, ITS DOCUMENTATION,
 * OR ANY DERIVATIVES THEREOF, EVEN IF THE AUTHORS HAVE BEEN ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * THE AUTHORS AND DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND
 * NON-INFRINGEMENT.  THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS,
 * AND THE AUTHORS AND DISTRIBUTORS HAVE NO OBLIGATION TO PROVIDE
 * MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
 *
 * GOVERNMENT USE: If you are acquiring this software on behalf of the
 * U.S. government, the Government shall have only "Restricted Rights"
 * in the software and related documentation as defined in the Federal
 * Acquisition Regulations (FARs) in Clause 52.227.19 (c) (2).  If you
 * are acquiring the software on behalf of the Department of Defense,
 * the software shall be classified as "Commercial Computer Software"
 * and the Government shall have only "Restricted Rights" as defined
 * in Clause 252.227-7013 (c) (1) of DFARs.  Notwithstanding the
 * foregoing, the authors grant the U.S. Government and others acting
 * in its behalf permission to use and distribute the software in
 * accordance with the terms specified in this license.
 *
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gdk/gdk.h>}
{$include <gtk/gtkenums.h>}
type

type
  PGtkTextTag = ^TGtkTextTag;
  TGtkTextTag = record
      parent_instance : TGObject;
      priv : PGtkTextTagPrivate;
    end;

{< private > }
  PGtkTextTagClass = ^TGtkTextTagClass;
  TGtkTextTagClass = record
      parent_class : TGObjectClass;
      padding : array[0..7] of Tgpointer;
    end;


function gtk_text_tag_get_type:TGType;cdecl;external libgtk4;
function gtk_text_tag_new(name:Pchar):PGtkTextTag;cdecl;external libgtk4;
function gtk_text_tag_get_priority(tag:PGtkTextTag):longint;cdecl;external libgtk4;
procedure gtk_text_tag_set_priority(tag:PGtkTextTag; priority:longint);cdecl;external libgtk4;
procedure gtk_text_tag_changed(tag:PGtkTextTag; size_changed:Tgboolean);cdecl;external libgtk4;
{////G_DEFINE_AUTOPTR_CLEANUP_FUNC   (GtkTextTag, g_object_unref) }

// === Konventiert am: 6-7-26 16:24:33 ===

function GTK_TYPE_TEXT_TAG : TGType;
function GTK_TEXT_TAG(obj : Pointer) : PGtkTextTag;
function GTK_TEXT_TAG_CLASS(klass : Pointer) : PGtkTextTagClass;
function GTK_IS_TEXT_TAG(obj : Pointer) : Tgboolean;
function GTK_IS_TEXT_TAG_CLASS(klass : Pointer) : Tgboolean;
function GTK_TEXT_TAG_GET_CLASS(obj : Pointer) : PGtkTextTagClass;

implementation

function GTK_TYPE_TEXT_TAG : TGType;
  begin
    GTK_TYPE_TEXT_TAG:=gtk_text_tag_get_type;
  end;

function GTK_TEXT_TAG(obj : Pointer) : PGtkTextTag;
begin
  Result := PGtkTextTag(g_type_check_instance_cast(obj, GTK_TYPE_TEXT_TAG));
end;

function GTK_TEXT_TAG_CLASS(klass : Pointer) : PGtkTextTagClass;
begin
  Result := PGtkTextTagClass(g_type_check_class_cast(klass, GTK_TYPE_TEXT_TAG));
end;

function GTK_IS_TEXT_TAG(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GTK_TYPE_TEXT_TAG);
end;

function GTK_IS_TEXT_TAG_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GTK_TYPE_TEXT_TAG);
end;

function GTK_TEXT_TAG_GET_CLASS(obj : Pointer) : PGtkTextTagClass;
begin
  Result := PGtkTextTagClass(PGTypeInstance(obj)^.g_class);
end;



end.
