unit gegl_processor;

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
 * Copyright 2007 Øyvind Kolås
  }
{$ifndef __GEGL_PROCESSOR_H__}
{$define __GEGL_PROCESSOR_H__}
{**
 * GeglProcessor:
 *
 * A #GeglProcessor, is a worker that can be used for background rendering
 * of regions in a node's cache. Or for processing a sink node. For most
 * non GUI tasks using #gegl_node_blit and #gegl_node_process directly
 * should be sufficient. See #gegl_processor_work for a code sample.
 *
  }
{*
 * gegl_node_new_processor:
 * @node: a #GeglNode
 * @rectangle: the #GeglRectangle to work on or NULL to work on all available
 * data.
 *
 * Return value: (transfer full): a new #GeglProcessor.
  }

function gegl_node_new_processor(node:PGeglNode; rectangle:PGeglRectangle):PGeglProcessor;cdecl;external libgegl;
procedure gegl_processor_set_level(processor:PGeglProcessor; level:Tgint);cdecl;external libgegl;
procedure gegl_processor_set_scale(processor:PGeglProcessor; scale:Tgdouble);cdecl;external libgegl;
{*
 * gegl_processor_set_rectangle:
 * @processor: a #GeglProcessor
 * @rectangle: the new #GeglRectangle the processor shold work on or NULL
 * to make it work on all data in the buffer.
 *
 * Change the rectangle a #GeglProcessor is working on.
  }
procedure gegl_processor_set_rectangle(processor:PGeglProcessor; rectangle:PGeglRectangle);cdecl;external libgegl;
{*
 * gegl_processor_work:
 * @processor: a #GeglProcessor
 * @progress: (out caller-allocates): a location to store the (estimated) percentage complete.
 *
 * Do an iteration of work for the processor.
 *
 * Returns TRUE if there is more work to be done.
 *
 * ---
 * GeglProcessor *processor = gegl_node_new_processor (node, &roi);
 * double         progress;
 *
 * while (gegl_processor_work (processor, &progress))
 *   g_warning ("%f%% complete", progress);
 * g_object_unref (processor);
  }
function gegl_processor_work(processor:PGeglProcessor; progress:Pgdouble):Tgboolean;cdecl;external libgegl;
{*
 * gegl_processor_get_buffer:
 * @processor: a #GeglProcessor
 *
 * Returns the (cache) buffer the processor is rendering into, another way of
 * getting to the same pixel data is calling gegl_node_blit with flags
 * indicating that we want caching and accept dirty data.
 *
 * Return value: (transfer full): the #GeglBuffer rendered into.
  }
function gegl_processor_get_buffer(processor:PGeglProcessor):PGeglBuffer;cdecl;external libgegl;
{$endif}
{ __GEGL_PROCESSOR_H__  }

// === Konventiert am: 12-8-26 15:23:55 ===


implementation



end.
