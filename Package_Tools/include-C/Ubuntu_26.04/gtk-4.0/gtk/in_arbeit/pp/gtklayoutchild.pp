
unit gtklayoutchild;
interface

{
  Automatically converted by H2Pas 1.0.0 from gtklayoutchild.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gtklayoutchild.h
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
PGtkLayoutChild  = ^GtkLayoutChild;
PGtkLayoutChildClass  = ^GtkLayoutChildClass;
PGtkLayoutManager  = ^GtkLayoutManager;
PGtkWidget  = ^GtkWidget;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


(** unsupported pragma#pragma once*)
{$if !defined (__GTK_H_INSIDE__) && !defined (GTK_COMPILATION)}
{$error "Only <gtk/gtk.h> can be included directly."}
{$endif}
{$include <gtk/gtktypes.h>}

{ was #define dname def_expr }
function GTK_TYPE_LAYOUT_CHILD : longint; { return type might be wrong }

{G_DECLARE_DERIVABLE_TYPE (GtkLayoutChild, gtk_layout_child, GTK, LAYOUT_CHILD, GObject) }
{< private > }
type
  PGtkLayoutChildClass = ^TGtkLayoutChildClass;
  TGtkLayoutChildClass = record
      parent_class : TGObjectClass;
    end;


function gtk_layout_child_get_layout_manager(layout_child:PGtkLayoutChild):PGtkLayoutManager;cdecl;external;
function gtk_layout_child_get_child_widget(layout_child:PGtkLayoutChild):PGtkWidget;cdecl;external;

implementation

{ was #define dname def_expr }
function GTK_TYPE_LAYOUT_CHILD : longint; { return type might be wrong }
  begin
    GTK_TYPE_LAYOUT_CHILD:=gtk_layout_child_get_type;
  end;


end.
