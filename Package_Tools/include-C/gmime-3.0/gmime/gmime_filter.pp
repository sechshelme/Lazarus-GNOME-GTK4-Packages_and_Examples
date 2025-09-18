
unit gmime_filter;
interface

{
  Automatically converted by H2Pas 1.0.0 from gmime_filter.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gmime_filter.h
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
PGMimeFilter  = ^GMimeFilter;
PGMimeFilterClass  = ^GMimeFilterClass;
PGMimeFilterPrivate  = ^GMimeFilterPrivate;
Psize_t  = ^size_t;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-  }
{  GMime
 *  Copyright (C) 2000-2022 Jeffrey Stedfast
 *
 *  This library is free software; you can redistribute it and/or
 *  modify it under the terms of the GNU Lesser General Public License
 *  as published by the Free Software Foundation; either version 2.1
 *  of the License, or (at your option) any later version.
 *
 *  This library is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *  Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public
 *  License along with this library; if not, write to the Free
 *  Software Foundation, 51 Franklin Street, Fifth Floor, Boston, MA
 *  02110-1301, USA.
  }
{$ifndef __GMIME_FILTER_H__}
{$define __GMIME_FILTER_H__}
{$include <glib.h>}
{$include <glib-object.h>}
{$include <sys/types.h>}

{ was #define dname def_expr }
function GMIME_TYPE_FILTER : longint; { return type might be wrong }

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER(obj : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_CLASS(klass : longint) : longint;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GET_CLASS(obj : longint) : longint;

type
{*
 * GMimeFilter:
 * @parent_object: parent #GObject
 * @priv: private state data
 *
 * Base class for filters used by #GMimeStreamFilter.
 * }
{ <protected>  }
{ real malloc'd buffer  }
{ first 'writable' position allowed (@outreal + @outpre)  }
{ current writable position  }
{ current bytes in @outbuf  }
{ current prespace of @outbuf  }
{ backup buffer  }
{ backup buffer size  }
{ number of bytes backed-up in @backbuf  }
  PGMimeFilter = ^TGMimeFilter;
  TGMimeFilter = record
      parent_object : TGObject;
      priv : PGMimeFilterPrivate;
      outreal : Pchar;
      outbuf : Pchar;
      outptr : Pchar;
      outsize : Tsize_t;
      outpre : Tsize_t;
      backbuf : Pchar;
      backsize : Tsize_t;
      backlen : Tsize_t;
    end;

{ virtual functions  }
  PGMimeFilterClass = ^TGMimeFilterClass;
  TGMimeFilterClass = record
      parent_class : TGObjectClass;
      copy : function (filter:PGMimeFilter):PGMimeFilter;cdecl;
      filter : procedure (filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
                    outlen:Psize_t; outprespace:Psize_t);cdecl;
      complete : procedure (filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
                    outlen:Psize_t; outprespace:Psize_t);cdecl;
      reset : procedure (filter:PGMimeFilter);cdecl;
    end;


function g_mime_filter_get_type:TGType;cdecl;external;
function g_mime_filter_copy(filter:PGMimeFilter):PGMimeFilter;cdecl;external;
procedure g_mime_filter_filter(filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
            outlen:Psize_t; outprespace:Psize_t);cdecl;external;
procedure g_mime_filter_complete(filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
            outlen:Psize_t; outprespace:Psize_t);cdecl;external;
procedure g_mime_filter_reset(filter:PGMimeFilter);cdecl;external;
{ sets/returns number of bytes backed up on the input  }
(* Const before type ignored *)
procedure g_mime_filter_backup(filter:PGMimeFilter; data:Pchar; length:Tsize_t);cdecl;external;
{ ensure this much size available for filter output  }
procedure g_mime_filter_set_size(filter:PGMimeFilter; size:Tsize_t; keep:Tgboolean);cdecl;external;
{$endif}
{ __GMIME_FILTER_H__  }

implementation

{ was #define dname def_expr }
function GMIME_TYPE_FILTER : longint; { return type might be wrong }
  begin
    GMIME_TYPE_FILTER:=g_mime_filter_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER(obj : longint) : longint;
begin
  GMIME_FILTER:=G_TYPE_CHECK_INSTANCE_CAST(obj,GMIME_TYPE_FILTER,GMimeFilter);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_CLASS(klass : longint) : longint;
begin
  GMIME_FILTER_CLASS:=G_TYPE_CHECK_CLASS_CAST(klass,GMIME_TYPE_FILTER,GMimeFilterClass);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER(obj : longint) : longint;
begin
  GMIME_IS_FILTER:=G_TYPE_CHECK_INSTANCE_TYPE(obj,GMIME_TYPE_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_IS_FILTER_CLASS(klass : longint) : longint;
begin
  GMIME_IS_FILTER_CLASS:=G_TYPE_CHECK_CLASS_TYPE(klass,GMIME_TYPE_FILTER);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function GMIME_FILTER_GET_CLASS(obj : longint) : longint;
begin
  GMIME_FILTER_GET_CLASS:=G_TYPE_INSTANCE_GET_CLASS(obj,GMIME_TYPE_FILTER,GMimeFilterClass);
end;


end.
