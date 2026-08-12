unit gegl_metadatahash;

interface

uses
  fp_glib2, fp_gegl;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ This file is part of GEGL
 *
 * GEGL is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 3 of the License, or (at your option) any later version.
 *
 * GEGL is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with GEGL; if not, see <https://www.gnu.org/licenses/>.
 *
 * Copyright 2020 Brian Stafford
  }
{$ifndef _geglmetadatahash_h}
{$define _geglmetadatahash_h}
{$include <glib.h>}
{$include "gegl-metadatastore.h"}

{G_DECLARE_FINAL_TYPE (GeglMetadataHash, gegl_metadata_hash, GEGL, METADATA_HASH, GeglMetadataStore) }
{*
 * SECTION:gegl-metadatahash
 * @title: GeglMetadataHash
 * @short_description: A metadata store object for use with file modules.
 * @see_also: #GeglMetadata #GeglMetadataStore
 *
 * #GeglMetadataHash is a #GeglMetadataStore implementing the data store using
 * a hash table. It adds no new methods or properties to #GeglMetadataStore.
  }
{*
 * gegl_metadata_hash_new:
 *
 * Create a new #GeglMetadataHash
 *
 * Returns: (transfer full): New #GeglMetadataHash cast to #GeglMetadataStore
  }
function gegl_metadata_hash_new:PGeglMetadataStore;cdecl;external libgegl;
{$endif}

// === Konventiert am: 12-8-26 15:08:57 ===

function GEGL_TYPE_METADATA_HASH: TGType;
function GEGL_METADATA_HASH(obj: Pointer): PGeglMetadataHash;
function GEGL_IS_METADATA_HASH(obj: Pointer): Tgboolean;

implementation

function GEGL_TYPE_METADATA_HASH: TGType;
begin
  Result := gegl_metadata_hash_get_type;
end;

function GEGL_METADATA_HASH(obj: Pointer): PGeglMetadataHash;
begin
  Result := PGeglMetadataHash(g_type_check_instance_cast(obj, GEGL_TYPE_METADATA_HASH));
end;

function GEGL_IS_METADATA_HASH(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_METADATA_HASH);
end;

type 
  PGeglMetadataHash = type Pointer;

  TGeglMetadataHashClass = record
    parent_class: TGeglMetadataStoreClass;
  end;
  PGeglMetadataHashClass = ^TGeglMetadataHashClass;

function gegl_metadata_hash_get_type: TGType; cdecl; external libgxxxxxxx;



end.
