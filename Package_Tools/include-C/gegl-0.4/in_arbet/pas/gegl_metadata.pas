unit gegl_metadata;

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
{$ifndef __GEGL_METADATA_H__}
{$define __GEGL_METADATA_H__}
{$include <glib-object.h>}
{*
 * SECTION:gegl-metadata
 * @title: GeglMetadata
 * @short_description: A metadata interface for use with file modules.
 * @see_also: #GeglMetadataStore #GeglMetadataHash
 *
 * Objects which need to store or retrieve image metadata when saving and
 * loading image files should implement GeglMetadata. The object should be cast
 * with GEGL_METADATA() and passed to the file load or save module via the
 * `metadata` property. Image file modules should not implement the metadata
 * property if either the module or file format does not support metadata.
 *
 * Gegl understands (but is not limited to) the following well-known metadata
 * variables:
 *
 * - artist: Name of image creator.
 * - comment: Miscellaneous comment; conversion from GIF comment.
 * - copyright: Copyright notice.
 * - description: Description of image (possibly long).
 * - disclaimer: Legal disclaimer.
 * - software: Software used to create the image.
 * - source: Device used to create the image.
 * - timestamp: Time of original image creation.
 * - title: Short (one line) title or caption for image.
 * - warning: Warning of nature of content.
 *
 * The Gegl Metadata subsystem can be used in one of three ways described
 * below in order of increasing complexity:
 *
 * 1. Recommended: Create a #GeglMetadataHash and pass it to a file loader
 *    or saver via its `metadata` property. #GeglMetadataHash is a subclass of
 *    #GeglMetadataStore which saves metadata in a hash table but which adds no
 *    new properties or methods.  Image file metadata to be retrieved or saved
 *    is accessed via #GeglMetadataStore properties or methods. Metadata values
 *    not directly supported by Gegl may be declared using a #GParamSpec.
 * 2. Subclass #GeglMetadataStore. This may be useful if an application stores
 *    metadata in internal structures which may be accessed via the subclass.
 *    The subclass is used identically to #GeglMetadataHash.
 *    #GeglMetadataStore aims to be sufficiently flexible to cover the majority
 *    of application requirements.
 * 3. Implement the #GeglMetadata interface. This option should only be used if
 *    #GeglMetadataStore cannot adequately satisfy application requirements.
 *    Particular attention should be paid to semantics of the interface methods
 *    as the file modules interact directly with these.
 *
 * For more complex requirements than provided by the metadata subsystem it is
 * probably better to use a library such as `exiv2` or similar.
  }
{*
 * GeglResolutionUnit:
 * @GEGL_RESOLUTION_UNIT_NONE: Unknown or resolution not applicable.
 * @GEGL_RESOLUTION_UNIT_DPI: Dots or pixels per inch.
 * @GEGL_RESOLUTION_UNIT_DPM: Dots or pixels per metre.
 *
 * An enumerated type specifying resolution (density) units.  If resolution
 * units are unknown, X and Y resolution specify the pixel aspect ratio.
  }
type
  PGeglResolutionUnit = ^TGeglResolutionUnit;
  TGeglResolutionUnit =  Longint;
  Const
    GEGL_RESOLUTION_UNIT_NONE = 0;
    GEGL_RESOLUTION_UNIT_DPI = 1;
    GEGL_RESOLUTION_UNIT_DPM = 2;
;
{*
 * GeglMapFlags:
 * @GEGL_MAP_EXCLUDE_UNMAPPED: Prevent further mapping from being registered.
 *
 * Flags controlling the mapping strategy.
  }
type
  PGeglMapFlags = ^TGeglMapFlags;
  TGeglMapFlags =  Longint;
  Const
    GEGL_MAP_EXCLUDE_UNMAPPED = 1;
;

{G_DECLARE_INTERFACE (GeglMetadata, gegl_metadata, GEGL, METADATA, GObject) }
{*
 * GeglMetadataMap:
 * @local_name: Name of metadata variable used in the file module.
 * @name: Standard metadata variable name used by Gegl.
 * @transform: Optional #GValue transform function.
 *
 * Struct to describe how a metadata variable is mapped from the name used by
 * the image file module to the name used by Gegl.  An optional transform
 * function may be specified, e.g. to transform from a #GDatetime to a string.
  }
type
  PGeglMetadataMap = ^TGeglMetadataMap;
  TGeglMetadataMap = record
      local_name : Pgchar;
      name : Pgchar;
      transform : TGValueTransform;
    end;
{*
 * GeglMetadataIter:
 *
 * An opaque type representing a metadata iterator.
  }
{< private > }

  PGeglMetadataIter = ^TGeglMetadataIter;
  TGeglMetadataIter = record
      stamp : Tguint;
      user_data : Tgpointer;
      user_data2 : Tgpointer;
      user_data3 : Tgpointer;
    end;
{*
 * GeglMetadataInterface:
 * @register_map: See gegl_metadata_register_map().  If called with a NULL map,
 * the registration is deleted.
 * @set_resolution: See gegl_metadata_set_resolution().
 * @get_resolution: See gegl_metadata_get_resolution().
 * @iter_lookup: See gegl_metadata_iter_lookup().
 * @iter_init: See gegl_metadata_iter_init().
 * @iter_next: See gegl_metadata_iter_next().
 * @iter_set_value: See gegl_metadata_iter_set_value().
 * @iter_get_value: See gegl_metadata_iter_get_value().
 *
 * The #GeglMetadata interface structure.
  }
{< private > }
{< public > }
  PGeglMetadataInterface = ^TGeglMetadataInterface;
  TGeglMetadataInterface = record
      base_iface : TGTypeInterface;
      register_map : procedure (metadata:PGeglMetadata; file_module:Pgchar; flags:Tguint; map:PGeglMetadataMap; n_map:Tgsize);cdecl;
      set_resolution : function (metadata:PGeglMetadata; unit:TGeglResolutionUnit; x:Tgfloat; y:Tgfloat):Tgboolean;cdecl;
      get_resolution : function (metadata:PGeglMetadata; unit:PGeglResolutionUnit; x:Pgfloat; y:Pgfloat):Tgboolean;cdecl;
      iter_lookup : function (metadata:PGeglMetadata; iter:PGeglMetadataIter; key:Pgchar):Tgboolean;cdecl;
      iter_init : procedure (metadata:PGeglMetadata; iter:PGeglMetadataIter);cdecl;
      iter_next : function (metadata:PGeglMetadata; iter:PGeglMetadataIter):Pgchar;cdecl;
      iter_set_value : function (metadata:PGeglMetadata; iter:PGeglMetadataIter; value:PGValue):Tgboolean;cdecl;
      iter_get_value : function (metadata:PGeglMetadata; iter:PGeglMetadataIter; value:PGValue):Tgboolean;cdecl;
    end;

{*
 * gegl_metadata_register_map:
 * @metadata:   The #GeglMetadata interface
 * @file_module: String identifying the file module, e.g, `"gegl:png-save"`
 * @flags:      Flags specifying capabilities of underlying file format
 * @map: (array length=n_map): Array of mappings from file module metadata
 *              names to Gegl well-known names.
 * @n_map:      Number of entries in @map
 *
 * Set the name of the file module and pass an array of mappings from
 * file-format specific metadata names to those used by Gegl. A GValue
 * transformation function may be supplied, e.g. to parse or format timestamps.
  }

procedure gegl_metadata_register_map(metadata:PGeglMetadata; file_module:Pgchar; flags:Tguint; map:PGeglMetadataMap; n_map:Tgsize);cdecl;external libgegl;
{*
 * gegl_metadata_unregister_map:
 * @metadata:   The #GeglMetadata interface
 *
 * Unregister the file module mappings and any further mappings added or
 * modified by the application.  This should be called after the file module
 * completes operations.
  }
procedure gegl_metadata_unregister_map(metadata:PGeglMetadata);cdecl;external libgegl;
{*
 * gegl_metadata_set_resolution:
 * @metadata:   The #GeglMetadata interface
 * @unit:       Specify #GeglResolutionUnit
 * @x:          X resolution
 * @y:          Y resolution
 *
 * Set resolution retrieved from image file's metadata.  Intended for use by
 * the image file reader.  If resolution is not supported by the application or
 * if the operation fails %FALSE is returned and the values are ignored.
 *
 * Returns:     %TRUE if successful.
  }
function gegl_metadata_set_resolution(metadata:PGeglMetadata; unit:TGeglResolutionUnit; x:Tgfloat; y:Tgfloat):Tgboolean;cdecl;external libgegl;
{*
 * gegl_metadata_get_resolution:
 * @metadata:   The #GeglMetadata interface
 * @unit:       #GeglResolutionUnit return location
 * @x:          X resolution return location
 * @y:          Y resolution return location
 *
 * Retrieve resolution from the application image metadata.  Intended for use
 * by the image file writer.  If resolution is not supported by the application
 * or if the operation fails %FALSE is returned and the resolution values are
 * not updated.
 *
 * Returns:     %TRUE if successful.
  }
function gegl_metadata_get_resolution(metadata:PGeglMetadata; unit:PGeglResolutionUnit; x:Pgfloat; y:Pgfloat):Tgboolean;cdecl;external libgegl;
{*
 * gegl_metadata_iter_lookup:
 * @metadata:   The #GeglMetadata interface
 * @iter:       #GeglMetadataIter to be initialised
 * @key:        Name of the value look up
 *
 * Look up the specified key and initialise an iterator to reference the
 * associated metadata. The iterator is used in conjunction with
 * gegl_metadata_set_value() and gegl_metadata_get_value(). Note that this
 * iterator is not valid for gegl_metadata_iter_next().
 *
 * Returns:     %TRUE if key is found.
  }
function gegl_metadata_iter_lookup(metadata:PGeglMetadata; iter:PGeglMetadataIter; key:Pgchar):Tgboolean;cdecl;external libgegl;
{*
 * gegl_metadata_iter_init:
 * @metadata:   The #GeglMetadata interface
 * @iter:       #GeglMetadataIter to be initialised
 *
 * Initialise an iterator to find all supported metadata keys.
  }
procedure gegl_metadata_iter_init(metadata:PGeglMetadata; iter:PGeglMetadataIter);cdecl;external libgegl;
{*
 * gegl_metadata_iter_next:
 * @metadata:   The #GeglMetadata interface
 * @iter:       #GeglMetadataIter to be updated
 *
 * Move the iterator to the next metadata item
 *
 * Returns:     key name if found, else %NULL
  }
function gegl_metadata_iter_next(metadata:PGeglMetadata; iter:PGeglMetadataIter):Pgchar;cdecl;external libgegl;
{*
 * gegl_metadata_iter_set_value:
 * @metadata:   The #GeglMetadata interface
 * @iter:       #GeglMetadataIter referencing the value to set
 * @value:      Value to set in the interface
 *
 * Set application data retrieved from image file's metadata.  Intended for use
 * by the image file reader.  If the operation fails it returns %FALSE and
 * @value is ignored.
 *
 * Returns:     %TRUE if successful.
  }
function gegl_metadata_iter_set_value(metadata:PGeglMetadata; iter:PGeglMetadataIter; value:PGValue):Tgboolean;cdecl;external libgegl;
{*
 * gegl_metadata_iter_get_value:
 * @metadata:   The #GeglMetadata interface
 * @iter:       #GeglMetadataIter referencing the value to get
 * @value:      Value to set in the interface
 *
 * Retrieve image file metadata from the application.  Intended for use by the
 * image file writer. If the operation fails it returns %FALSE and @value is
 * not updated.
 *
 * Returns:     %TRUE if successful.
  }
function gegl_metadata_iter_get_value(metadata:PGeglMetadata; iter:PGeglMetadataIter; value:PGValue):Tgboolean;cdecl;external libgegl;
{$endif}

// === Konventiert am: 12-8-26 15:09:04 ===

function GEGL_TYPE_METADATA: TGType;
function GEGL_METADATA(obj: Pointer): PGeglMetadata;
function GEGL_IS_METADATA(obj: Pointer): Tgboolean;
function GEGL_METADATA_GET_IFACE(obj: Pointer): PGeglMetadataInterface;

implementation

function GEGL_TYPE_METADATA: TGType;
begin
  Result := gegl_metadata_get_type;
end;

function GEGL_METADATA(obj: Pointer): PGeglMetadata;
begin
  Result := PGeglMetadata(g_type_check_instance_cast(obj, GEGL_TYPE_METADATA));
end;

function GEGL_IS_METADATA(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_METADATA);
end;

function GEGL_METADATA_GET_IFACE(obj: Pointer): PGeglMetadataInterface;
begin
  Result := g_type_interface_peek(obj, GEGL_TYPE_METADATA);
end;

type 
  PGeglMetadata = type Pointer;

  PGeglMetadataInterface = type Pointer

function gegl_metadata_get_type: TGType; cdecl; external libgxxxxxxx;



end.
