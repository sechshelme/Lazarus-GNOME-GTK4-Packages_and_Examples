unit gmime_filter;

interface

uses
  fp_glib2, fp_gmime3;

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


function g_mime_filter_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_copy(filter:PGMimeFilter):PGMimeFilter;cdecl;external libgmime3;
procedure g_mime_filter_filter(filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
            outlen:Psize_t; outprespace:Psize_t);cdecl;external libgmime3;
procedure g_mime_filter_complete(filter:PGMimeFilter; inbuf:Pchar; inlen:Tsize_t; prespace:Tsize_t; outbuf:PPchar; 
            outlen:Psize_t; outprespace:Psize_t);cdecl;external libgmime3;
procedure g_mime_filter_reset(filter:PGMimeFilter);cdecl;external libgmime3;
{ sets/returns number of bytes backed up on the input  }
procedure g_mime_filter_backup(filter:PGMimeFilter; data:Pchar; length:Tsize_t);cdecl;external libgmime3;
{ ensure this much size available for filter output  }
procedure g_mime_filter_set_size(filter:PGMimeFilter; size:Tsize_t; keep:Tgboolean);cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_H__  }

// === Konventiert am: 18-9-25 15:27:00 ===

function GMIME_TYPE_FILTER : TGType;
function GMIME_FILTER(obj : Pointer) : PGMimeFilter;
function GMIME_FILTER_CLASS(klass : Pointer) : PGMimeFilterClass;
function GMIME_IS_FILTER(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_GET_CLASS(obj : Pointer) : PGMimeFilterClass;

implementation

function GMIME_TYPE_FILTER : TGType;
  begin
    GMIME_TYPE_FILTER:=g_mime_filter_get_type;
  end;

function GMIME_FILTER(obj : Pointer) : PGMimeFilter;
begin
  Result := PGMimeFilter(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER));
end;

function GMIME_FILTER_CLASS(klass : Pointer) : PGMimeFilterClass;
begin
  Result := PGMimeFilterClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER));
end;

function GMIME_IS_FILTER(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER);
end;

function GMIME_IS_FILTER_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER);
end;

function GMIME_FILTER_GET_CLASS(obj : Pointer) : PGMimeFilterClass;
begin
  Result := PGMimeFilterClass(PGTypeInstance(obj)^.g_class);
end;



end.
