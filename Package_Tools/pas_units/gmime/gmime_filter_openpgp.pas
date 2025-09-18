unit gmime_filter_openpgp;

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
{$ifndef __GMIME_FILTER_OPENPGP_H__}
{$define __GMIME_FILTER_OPENPGP_H__}
{$include <gmime/gmime-filter.h>}

type
{*
 * GMimeOpenPGPData:
 * @GMIME_OPENPGP_DATA_NONE: No OpenPGP data found.
 * @GMIME_OPENPGP_DATA_ENCRYPTED: The content contains OpenPGP encrypted data.
 * @GMIME_OPENPGP_DATA_SIGNED: The content contains OpenPGP signed data.
 * @GMIME_OPENPGP_DATA_PUBLIC_KEY: The content contains OpenPGP public key data.
 * @GMIME_OPENPGP_DATA_PRIVATE_KEY: The content contains OpenPGP private key data.
 *
 * The type of OpenPGP data found, if any.
 * }

  PGMimeOpenPGPData = ^TGMimeOpenPGPData;
  TGMimeOpenPGPData =  Longint;
  Const
    GMIME_OPENPGP_DATA_NONE = 0;
    GMIME_OPENPGP_DATA_ENCRYPTED = 1;
    GMIME_OPENPGP_DATA_SIGNED = 2;
    GMIME_OPENPGP_DATA_PUBLIC_KEY = 3;
    GMIME_OPENPGP_DATA_PRIVATE_KEY = 4;
;
{*
 * GMimeOpenPGPState:
 * @GMIME_OPENPGP_NONE: No OpenPGP markers have been found (yet).
 * @GMIME_OPENPGP_BEGIN_PGP_MESSAGE: The "-----BEGIN PGP MESSAGE-----" marker has been found.
 * @GMIME_OPENPGP_END_PGP_MESSAGE: The "-----END PGP MESSAGE-----" marker has been found.
 * @GMIME_OPENPGP_BEGIN_PGP_SIGNED_MESSAGE: The "-----BEGIN PGP SIGNED MESSAGE-----" marker has been found.
 * @GMIME_OPENPGP_BEGIN_PGP_SIGNATURE: The "-----BEGIN PGP SIGNATURE-----" marker has been found.
 * @GMIME_OPENPGP_END_PGP_SIGNATURE: The "-----END PGP SIGNATURE-----" marker has been found.
 * @GMIME_OPENPGP_BEGIN_PGP_PUBLIC_KEY_BLOCK: The "-----BEGIN PGP PUBLIC KEY BLOCK-----" marker has been found.
 * @GMIME_OPENPGP_END_PGP_PUBLIC_KEY_BLOCK: The "-----END PGP PUBLIC KEY BLOCK-----" marker has been found.
 * @GMIME_OPENPGP_BEGIN_PGP_PRIVATE_KEY_BLOCK: The "-----BEGIN PGP PRIVATE KEY BLOCK-----" marker has been found.
 * @GMIME_OPENPGP_END_PGP_PRIVATE_KEY_BLOCK: The "-----END PGP PRIVATE KEY BLOCK-----" marker has been found.
 *
 * The current state of the #GMimeFilterOpenPGP filter.
 *
 * Since: 3.2
 * }
type
  PGMimeOpenPGPState = ^TGMimeOpenPGPState;
  TGMimeOpenPGPState =  Longint;
  Const
    GMIME_OPENPGP_NONE = 0;
    GMIME_OPENPGP_BEGIN_PGP_MESSAGE = 1 shl 0;
    GMIME_OPENPGP_END_PGP_MESSAGE = (1 shl 1) or (1 shl 0);
    GMIME_OPENPGP_BEGIN_PGP_SIGNED_MESSAGE = 1 shl 2;
    GMIME_OPENPGP_BEGIN_PGP_SIGNATURE = (1 shl 3) or (1 shl 2);
    GMIME_OPENPGP_END_PGP_SIGNATURE = ((1 shl 4) or (1 shl 3)) or (1 shl 2);
    GMIME_OPENPGP_BEGIN_PGP_PUBLIC_KEY_BLOCK = 1 shl 5;
    GMIME_OPENPGP_END_PGP_PUBLIC_KEY_BLOCK = (1 shl 6) or (1 shl 5);
    GMIME_OPENPGP_BEGIN_PGP_PRIVATE_KEY_BLOCK = 1 shl 7;
    GMIME_OPENPGP_END_PGP_PRIVATE_KEY_BLOCK = (1 shl 8) or (1 shl 7);
;
{*
 * GMimeOpenPGPMarker:
 * @marker: The OpenPGP marker.
 * @len: The length of the OpenPGP marker.
 * @before: The #GMimeOpenPGPState that the state machine must be in before encountering this marker.
 * @after: The #GMimeOpenPGPState that the state machine will transition into once this marker is found.
 * @is_end_marker: %TRUE if the marker is an end marker; otherwise, %FALSE.
 *
 * An OpenPGP marker for use with GMime's internal state machines used for detecting OpenPGP blocks.
 *
 * Since: 3.2
 * }
type
  PGMimeOpenPGPMarker = ^TGMimeOpenPGPMarker;
  TGMimeOpenPGPMarker = record
      marker : Pchar;
      len : Tsize_t;
      before : TGMimeOpenPGPState;
      after : TGMimeOpenPGPState;
      is_end_marker : Tgboolean;
    end;
{*
 * GMimeFilterOpenPGP:
 * @parent_object: parent #GMimeFilter
 *
 * A filter to detect OpenPGP markers.
 *
 * Since: 3.2
 * }
{ < private >  }
  PGMimeFilterOpenPGP = ^TGMimeFilterOpenPGP;
  TGMimeFilterOpenPGP = record
      parent_object : TGMimeFilter;
      state : TGMimeOpenPGPState;
      seen_end_marker : Tgboolean;
      midline : Tgboolean;
      begin_offset : Tgint64;
      end_offset : Tgint64;
      position : Tgint64;
      next : Tguint;
    end;

  PGMimeFilterOpenPGPClass = ^TGMimeFilterOpenPGPClass;
  TGMimeFilterOpenPGPClass = record
      parent_class : TGMimeFilterClass;
    end;


function g_mime_filter_openpgp_get_type:TGType;cdecl;external libgmime3;
function g_mime_filter_openpgp_new:PGMimeFilter;cdecl;external libgmime3;
function g_mime_filter_openpgp_get_data_type(openpgp:PGMimeFilterOpenPGP):TGMimeOpenPGPData;cdecl;external libgmime3;
function g_mime_filter_openpgp_get_begin_offset(openpgp:PGMimeFilterOpenPGP):Tgint64;cdecl;external libgmime3;
function g_mime_filter_openpgp_get_end_offset(openpgp:PGMimeFilterOpenPGP):Tgint64;cdecl;external libgmime3;
{$endif}
{ __GMIME_FILTER_OPENPGP_H__  }

// === Konventiert am: 18-9-25 15:28:00 ===

function GMIME_TYPE_FILTER_OPENPGP : TGType;
function GMIME_FILTER_OPENPGP(obj : Pointer) : PGMimeFilterOpenPGP;
function GMIME_FILTER_OPENPGP_CLASS(klass : Pointer) : PGMimeFilterOpenPGPClass;
function GMIME_IS_FILTER_OPENPGP(obj : Pointer) : Tgboolean;
function GMIME_IS_FILTER_OPENPGP_CLASS(klass : Pointer) : Tgboolean;
function GMIME_FILTER_OPENPGP_GET_CLASS(obj : Pointer) : PGMimeFilterOpenPGPClass;

implementation

function GMIME_TYPE_FILTER_OPENPGP : TGType;
  begin
    GMIME_TYPE_FILTER_OPENPGP:=g_mime_filter_openpgp_get_type;
  end;

function GMIME_FILTER_OPENPGP(obj : Pointer) : PGMimeFilterOpenPGP;
begin
  Result := PGMimeFilterOpenPGP(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_OPENPGP));
end;

function GMIME_FILTER_OPENPGP_CLASS(klass : Pointer) : PGMimeFilterOpenPGPClass;
begin
  Result := PGMimeFilterOpenPGPClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_OPENPGP));
end;

function GMIME_IS_FILTER_OPENPGP(obj : Pointer) : Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj,  GMIME_TYPE_FILTER_OPENPGP);
end;

function GMIME_IS_FILTER_OPENPGP_CLASS(klass : Pointer) : Tgboolean;
begin
  Result := g_type_check_class_is_a(klass,  GMIME_TYPE_FILTER_OPENPGP);
end;

function GMIME_FILTER_OPENPGP_GET_CLASS(obj : Pointer) : PGMimeFilterOpenPGPClass;
begin
  Result := PGMimeFilterOpenPGPClass(PGTypeInstance(obj)^.g_class);
end;



end.
