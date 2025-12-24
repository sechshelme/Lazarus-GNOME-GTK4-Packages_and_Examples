
unit rlist;
interface

{
  Automatically converted by H2Pas 1.0.0 from rlist.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rlist.h
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
PAvahiRList  = ^AvahiRList;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef foorlistfoo}
{$define foorlistfoo}
{**
  This file is part of avahi.

  avahi is free software; you can redistribute it and/or modify it
  under the terms of the GNU Lesser General Public License as
  published by the Free Software Foundation; either version 2.1 of the
  License, or (at your option) any later version.

  avahi is distributed in the hope that it will be useful, but WITHOUT
  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
  or FITNESS FOR A PARTICULAR PURPOSE. See the GNU Lesser General
  Public License for more details.

  You should have received a copy of the GNU Lesser General Public
  License along with avahi; if not, write to the Free Software
  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307
  USA.
** }
{* \file rlist.h A simple linked list implementation  }
{$include "llist.h"}
{* A doubly linked list type  }
type
{* A doubly linked list type  }
{ xxxxxxxxxxx #define AVAHI_LLIST_FIELDS(t,name) t *name##_next, *name##_prev }
{struct AvahiRList  }
{    AVAHI_LLIST_FIELDS(AvahiRList, rlist); }
{    void *data; }
{; }
{* Prepend a new item to the beginning of the list and return the new beginning  }

function avahi_rlist_prepend(r:PAvahiRList; data:pointer):PAvahiRList;cdecl;external;
{* Remove the first occurence of the specified item from the list and return the new beginning  }
function avahi_rlist_remove(r:PAvahiRList; data:pointer):PAvahiRList;cdecl;external;
{* Remove the specified item from the list and return the new beginning  }
function avahi_rlist_remove_by_link(r:PAvahiRList; n:PAvahiRList):PAvahiRList;cdecl;external;
{$endif}

implementation


end.
