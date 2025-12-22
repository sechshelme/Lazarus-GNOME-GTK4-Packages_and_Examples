
unit rom1394;
interface

{
  Automatically converted by H2Pas 1.0.0 from rom1394.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    rom1394.h
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
Pquadlet_t  = ^quadlet_t;
Prom1394_bus_options  = ^rom1394_bus_options;
Prom1394_bus_options_struct  = ^rom1394_bus_options_struct;
Prom1394_directory  = ^rom1394_directory;
Prom1394_directory_struct  = ^rom1394_directory_struct;
Prom1394_node_types  = ^rom1394_node_types;
Prom1394_node_types_enum  = ^rom1394_node_types_enum;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * librom1394 - GNU/Linux IEEE 1394 CSR Config ROM Library
 *
 * Originally written by Andreas Micklei <andreas.micklei@ivistar.de>
 * Better directory and textual leaf processing provided by Stefan Lucke
 * Libtoolize-d and modifications by Dan Dennedy <dan@dennedy.org>
 * ROM manipulation routines by Dan Dennedy
 * Currently maintained by Dan Dennedy
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
  }
{$ifndef ROM1394_H}
{$define ROM1394_H}
{$include <libraw1394/raw1394.h>}
{ #define ROM1394_DEBUG 1 }
{ define standard offsets into config rom address space  }

const
  ROM1394_HEADER = $00;  
  ROM1394_BUS_ID = $04;  
  ROM1394_BUS_OPTIONS = $08;  
  ROM1394_GUID_HI = $0C;  
  ROM1394_GUID_LO = $10;  
  ROM1394_ROOT_DIRECTORY = $14;  
{ C++ extern C conditionnal removed }
type
  Prom1394_node_types_enum = ^Trom1394_node_types_enum;
  Trom1394_node_types_enum =  Longint;
  Const
    ROM1394_NODE_TYPE_UNKNOWN = 0;
    ROM1394_NODE_TYPE_DC = 1;
    ROM1394_NODE_TYPE_AVC = 2;
    ROM1394_NODE_TYPE_SBP2 = 3;
    ROM1394_NODE_TYPE_CPU = 4;
;
  Trom1394_node_types = Trom1394_node_types_enum;
  Prom1394_node_types = ^Trom1394_node_types;
type
  Prom1394_bus_options_struct = ^Trom1394_bus_options_struct;
  Trom1394_bus_options_struct = record
      irmc : char;
      cmc : char;
      isc : char;
      bmc : char;
      cyc_clk_acc : byte;
      max_rec : longint;
    end;
  Trom1394_bus_options = Trom1394_bus_options_struct;
  Prom1394_bus_options = ^Trom1394_bus_options;
{ aggregated from textual leaves  }

  Prom1394_directory_struct = ^Trom1394_directory_struct;
  Trom1394_directory_struct = record
      node_capabilities : Tquadlet_t;
      vendor_id : Tquadlet_t;
      unit_spec_id : Tquadlet_t;
      unit_sw_version : Tquadlet_t;
      model_id : Tquadlet_t;
      nr_textual_leafs : longint;
      max_textual_leafs : longint;
      textual_leafs : ^Pchar;
      _label : Pchar;
    end;
  Trom1394_directory = Trom1394_directory_struct;
  Prom1394_directory = ^Trom1394_directory;

function rom1394_get_bus_info_block_length(handle:Traw1394handle_t; node:Tnodeid_t):longint;cdecl;external;
function rom1394_get_bus_id(handle:Traw1394handle_t; node:Tnodeid_t):Tquadlet_t;cdecl;external;
function rom1394_get_bus_options(handle:Traw1394handle_t; node:Tnodeid_t; bus_options:Prom1394_bus_options):longint;cdecl;external;
function rom1394_get_guid(handle:Traw1394handle_t; node:Tnodeid_t):Toctlet_t;cdecl;external;
function rom1394_get_directory(handle:Traw1394handle_t; node:Tnodeid_t; dir:Prom1394_directory):longint;cdecl;external;
function rom1394_get_node_type(dir:Prom1394_directory):Trom1394_node_types;cdecl;external;
procedure rom1394_free_directory(dir:Prom1394_directory);cdecl;external;
{ supply null value to skip update of a particular field  }
function rom1394_get_size(buffer:Pquadlet_t):longint;cdecl;external;
function rom1394_set_directory(buffer:Pquadlet_t; dir:Prom1394_directory):longint;cdecl;external;
function rom1394_add_unit(buffer:Pquadlet_t; dir:Prom1394_directory):longint;cdecl;external;
{ C++ end of extern C conditionnal removed }
{$endif}

implementation


end.
