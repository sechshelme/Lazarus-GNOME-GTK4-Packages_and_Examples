unit apriltag;

interface

uses
  fp_apriltag, matd;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  APRILTAG_TASKS_PER_THREAD_TARGET = 10;

type
  Pquad = ^Tquad;
  Tquad = record
    p: array[0..3] of array[0..1] of single;
    reversed_border: Tbool;
    H: Pmatd_t;
    Hinv: Pmatd_t;
  end;

  Papriltag_family_t = ^Tapriltag_family_t;
  Tapriltag_family_t = record
    ncodes: Tuint32_t;
    codes: Puint64_t;
    width_at_border: longint;
    total_width: longint;
    reversed_border: Tbool;
    nbits: Tuint32_t;
    bit_x: Puint32_t;
    bit_y: Puint32_t;
    h: Tuint32_t;
    name: pchar;
    impl: pointer;
  end;

  Papriltag_quad_thresh_params = ^Tapriltag_quad_thresh_params;
  Tapriltag_quad_thresh_params = record
    min_cluster_pixels: longint;
    max_nmaxima: longint;
    critical_rad: single;
    cos_critical_rad: single;
    max_line_fit_mse: single;
    min_white_black_diff: longint;
    deglitch: longint;
  end;

  Papriltag_detector_t = ^Tapriltag_detector_t;
  Tapriltag_detector_T = record
    nthreads: longint;
    quad_decimate: single;
    quad_sigma: single;
    refine_edges: Tbool;
    decode_sharpening: Tdouble;
    debug: Tbool;
    qtp: Tapriltag_quad_thresh_params;
    tp: Ptimeprofile_t;
    nedges: Tuint32_t;
    nsegments: Tuint32_t;
    nquads: Tuint32_t;
    tag_families: Pzarray_t;
    wp: Pworkerpool_t;
    mutex: Tpthread_mutex_t;
  end;

  Papriltag_detection_t = ^Tapriltag_detection_t;
  Tapriltag_detection_t = record
    family: Papriltag_family_t;
    id: longint;
    hamming: longint;
    decision_margin: single;
    H: Pmatd_t;
    c: array[0..1] of Tdouble;
    p: array[0..3] of array[0..1] of Tdouble;
  end;

function apriltag_detector_create: Papriltag_detector_t; cdecl; external libapriltag;
procedure apriltag_detector_add_family_bits(td: Papriltag_detector_t; fam: Papriltag_family_t; bits_corrected: longint); cdecl; external libapriltag;

procedure apriltag_detector_add_family(td: Apriltag_detector_t; fam: Apriltag_family_t);

procedure apriltag_detector_remove_family(td: Papriltag_detector_t; fam: Papriltag_family_t); cdecl; external libapriltag;
procedure apriltag_detector_clear_families(td: Papriltag_detector_t); cdecl; external libapriltag;
procedure apriltag_detector_destroy(td: Papriltag_detector_t); cdecl; external libapriltag;
function apriltag_detector_detect(td: Papriltag_detector_t; im_orig: Pimage_u8_t): Pzarray_t; cdecl; external libapriltag;
procedure apriltag_detection_destroy(det: Papriltag_detection_t); cdecl; external libapriltag;
procedure apriltag_detections_destroy(detections: Pzarray_t); cdecl; external libapriltag;
function apriltag_to_image(fam: Papriltag_family_t; idx: longint): Pimage_u8_t; cdecl; external libapriltag;

// === Konventiert am: 12-9-26 17:04:36 ===


implementation

procedure apriltag_detector_add_family(td: Apriltag_detector_t; fam: Apriltag_family_t);
begin
  apriltag_detector_add_family_bits(td, fam, 2);
end;

end.
