unit gmime_filter_smtp_data;

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
{$ifndef __GMIME_FILTER_SMTP_DATA_H__}
{$define __GMIME_FILTER_SMTP_DATA_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeFilterSmtpData:
 * @parent_object: parent #GMimeFilter
 * @bol: beginning-of-line state.
 *
 * A filter to byte-stuff SMTP DATA.
 * }
  PGMimeFilterSmtpData = ^TGMimeFilterSmtpData;
  TGMimeFilterSmtpData = record
      parent_object : TGMimeFilter;
      bol : Tgboolean;
    end;

  PGMimeFilterSmtpDataClass = ^TGMimeFilterSmtpDataClass;
  TGMimeFilterSmtpDataClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_smtp_data_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_smtp_data_new:PGMimeFilter;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_SMTP_DATA_H__  }

// === Konventiert am: 18-9-25 15:28:04 ===

function GMIME_TYPE_FILTER_SMTP_DATA : TGType;
function GMIME_FILTER_SMTP_DATA(obj : Pointer) : PGMimeFilterSmtpData;
function GMIME_FILTER_SMTP_DATA_CLASS(klass : Pointer) : PGMimeFilterSmtpDataClass;
function GMIME_IS_FILTER_SMTP_DATA(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_SMTP_DATA_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_SMTP_DATA_GET_CLASS(obj : Pointer) : PGMimeFilterSmtpDataClass;

implementation

function GMIME_TYPE_FILTER_SMTP_DATA : TGType;
  begin
    GMIME_TYPE_FILTER_SMTP_DATA:=g_mime_filter_smtp_data_get_type;
  end;

function GMIME_FILTER_SMTP_DATA(obj : Pointer) : PGMimeFilterSmtpData;
begin
  Result := PGMimeFilterSmtpData(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_SMTP_DATA));
end;

function GMIME_FILTER_SMTP_DATA_CLASS(klass : Pointer) : PGMimeFilterSmtpDataClass;
begin
  Result := PGMimeFilterSmtpDataClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_SMTP_DATA));
end;

function GMIME_IS_FILTER_SMTP_DATA(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_SMTP_DATA);
end;

function GMIME_IS_FILTER_SMTP_DATA_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_SMTP_DATA);
end;

function GMIME_FILTER_SMTP_DATA_GET_CLASS(obj : Pointer) : PGMimeFilterSmtpDataClass;
begin
  Result := PGMimeFilterSmtpDataClass(PGTypeInstance(obj)^.g_class);
end;



end.
