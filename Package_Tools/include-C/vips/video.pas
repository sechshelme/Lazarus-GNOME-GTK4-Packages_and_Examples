unit video;

interface

uses
  fp_glib2;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ video.h
 *
 * 20/9/09
 * 	- from proto.h
  }
{

	This file is part of VIPS.

	VIPS is free software; you can redistribute it and/or modify
	it under the terms of the GNU Lesser General Public License as published by
	the Free Software Foundation; either version 2 of the License, or
	(at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
	GNU Lesser General Public License for more details.

	You should have received a copy of the GNU Lesser General Public License
	along with this program; if not, write to the Free Software
	Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
	02110-1301  USA

  }
{

	These files are distributed with VIPS - http://www.vips.ecs.soton.ac.uk

  }
{$ifndef IM_VIDEO_H}
{$define IM_VIDEO_H}
{ C++ extern C conditionnal removed }
{__cplusplus }
{xxxx VIPS_DEPRECATED }

function im_video_v4l1(im:PVipsImage; device:Pchar; channel:longint; brightness:longint; colour:longint; 
           contrast:longint; hue:longint; ngrabs:longint):longint;cdecl;external libvips;
{xxxx VIPS_DEPRECATED }
function im_video_test(im:PVipsImage; brightness:longint; error:longint):longint;cdecl;external libvips;
{ C++ end of extern C conditionnal removed }
{__cplusplus }
{$endif}
{IM_VIDEO_H }

// === Konventiert am: 26-4-26 16:08:13 ===


implementation



end.
