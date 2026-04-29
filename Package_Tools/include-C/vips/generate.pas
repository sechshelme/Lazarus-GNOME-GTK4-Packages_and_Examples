unit generate;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_vips, rect, image;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_struct}
type
  TVipsRegionWrite = function(region: PVipsRegion; area: PVipsRect; a: pointer): longint; cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_sink_disc(im: PVipsImage; write_fn: TVipsRegionWrite; a: pointer): longint; cdecl; external libvips;
function vips_sink(im: PVipsImage; start_fn: TVipsStartFn; generate_fn: TVipsGenerateFn; stop_fn: TVipsStopFn; a: pointer;
  b: pointer): longint; cdecl; external libvips;
function vips_sink_tile(im: PVipsImage; tile_width: longint; tile_height: longint; start_fn: TVipsStartFn; generate_fn: TVipsGenerateFn;
  stop_fn: TVipsStopFn; a: pointer; b: pointer): longint; cdecl; external libvips;
{$ENDIF read_function}

{$IFDEF read_struct}
type
  TVipsSinkNotify = procedure(im: PVipsImage; rect: PVipsRect; a: pointer); cdecl;
  {$ENDIF read_struct}

{$IFDEF read_function}
function vips_sink_screen(in_: PVipsImage; out_: PVipsImage; mask: PVipsImage; tile_width: longint; tile_height: longint;
  max_tiles: longint; priority: longint; notify_fn: TVipsSinkNotify; a: pointer): longint; cdecl; external libvips;
function vips_sink_memory(im: PVipsImage): longint; cdecl; external libvips;
function vips_start_one(out_: PVipsImage; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_stop_one(seq: pointer; a: pointer; b: pointer): longint; cdecl; external libvips;
function vips_start_many(out_: PVipsImage; a: pointer; b: pointer): pointer; cdecl; external libvips;
function vips_stop_many(seq: pointer; a: pointer; b: pointer): longint; cdecl; external libvips;
function vips_allocate_input_array(out_: PVipsImage): PPVipsImage; varargs; cdecl; external libvips;
function vips_image_generate(image: PVipsImage; start_fn: TVipsStartFn; generate_fn: TVipsGenerateFn; stop_fn: TVipsStopFn; a: pointer;
  b: pointer): longint; cdecl; external libvips;
function vips_image_pipeline_array(image: PVipsImage; hint: TVipsDemandStyle; in_: PPVipsImage): longint; cdecl; external libvips;
function vips_image_pipelinev(image: PVipsImage; hint: TVipsDemandStyle): longint; varargs; cdecl; external libvips;
{$ENDIF read_function}

// === Konventiert am: 26-4-26 16:13:16 ===


implementation



end.
