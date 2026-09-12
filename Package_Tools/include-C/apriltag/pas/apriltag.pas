unit apriltag;

interface

uses
  fp_apriltag;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


const
  APRILTAG_TASKS_PER_THREAD_TARGET = 10;  

type
  Pquad = ^Tquad;
  Tquad = record
      p : array[0..3] of array[0..1] of single;
      reversed_border : Tbool;
      H : Pmatd_t;
      Hinv : Pmatd_t;
    end;

  Tapriltag_family = Tapriltag_family_t;
  Papriltag_family = ^Tapriltag_family;
  Tapriltag_family = record
      ncodes : Tuint32_t;
      codes : Puint64_t;
      width_at_border : longint;
      total_width : longint;
      reversed_border : Tbool;
      nbits : Tuint32_t;
      bit_x : Puint32_t;
      bit_y : Puint32_t;
      h : Tuint32_t;
      name : Pchar;
      impl : pointer;
    end;

  Papriltag_quad_thresh_params = ^Tapriltag_quad_thresh_params;
  Tapriltag_quad_thresh_params = record
      min_cluster_pixels : longint;
      max_nmaxima : longint;
      critical_rad : single;
      cos_critical_rad : single;
      max_line_fit_mse : single;
      min_white_black_diff : longint;
      deglitch : longint;
    end;

{ Represents a detector object. Upon creating a detector, all fields }
{ are set to reasonable values, but can be overridden by accessing }
{ these fields. }
  Tapriltag_detector = Tapriltag_detector_t;
{///////////////////////////////////////////////////////////// }
{ User-configurable parameters. }
{ How many threads should be used? }
{ detection of quads can be done on a lower-resolution image, }
{ improving speed at a cost of pose accuracy and a slight }
{ decrease in detection rate. Decoding the binary payload is }
{ still done at full resolution. . }
{ What Gaussian blur should be applied to the segmented image }
{ (used for quad detection?)  Parameter is the standard deviation }
{ in pixels.  Very noisy images benefit from non-zero values }
{ (e.g. 0.8). }
{ When true, the edges of the each quad are adjusted to "snap }
{ to" strong gradients nearby. This is useful when decimation is }
{ employed, as it can increase the quality of the initial quad }
{ estimate substantially. Generally recommended to be on (true). }
{ }
{ Very computationally inexpensive. Option is ignored if }
{ quad_decimate = 1. }
{ How much sharpening should be done to decoded images? This }
{ can help decode small tags but may or may not help in odd }
{ lighting conditions or low light conditions. }
{ }
{ The default value is 0.25. }
{ When true, write a variety of debugging images to the }
{ current working directory at various stages through the }
{ detection process. (Somewhat slow). }
{///////////////////////////////////////////////////////////// }
{ Statistics relating to last processed frame }
{///////////////////////////////////////////////////////////// }
{ Internal variables below }
{ Not freed on apriltag_destroy; a tag family can be shared }
{ between multiple users. The user should ultimately destroy the }
{ tag family passed into the constructor. }
{ Used to manage multi-threading. }
{ Used for thread safety. }
  Papriltag_detector = ^Tapriltag_detector;
  Tapriltag_detector = record
      nthreads : longint;
      quad_decimate : single;
      quad_sigma : single;
      refine_edges : Tbool;
      decode_sharpening : Tdouble;
      debug : Tbool;
      qtp : Tapriltag_quad_thresh_params;
      tp : Ptimeprofile_t;
      nedges : Tuint32_t;
      nsegments : Tuint32_t;
      nquads : Tuint32_t;
      tag_families : Pzarray_t;
      wp : Pworkerpool_t;
      mutex : Tpthread_mutex_t;
    end;

{ Represents the detection of a tag. These are returned to the user }
{ and must be individually destroyed by the user. }
  Tapriltag_detection = Tapriltag_detection_t;
{ a pointer for convenience. not freed by apriltag_detection_destroy. }
{ The decoded ID of the tag }
{ How many error bits were corrected? Note: accepting large numbers of }
{ corrected errors leads to greatly increased false positive rates. }
{ NOTE: As of this implementation, the detector cannot detect tags with }
{ a hamming distance greater than 2. }
{ A measure of the quality of the binary decoding process: the }
{ average difference between the intensity of a data bit versus }
{ the decision threshold. Higher numbers roughly indicate better }
{ decodes. This is a reasonable measure of detection accuracy }
{ only for very small tags-- not effective for larger tags (where }
{ we could have sampled anywhere within a bit cell and still }
{ gotten a good detection.) }
{ The 3x3 homography matrix describing the projection from an }
{ "ideal" tag (with corners at (-1,1), (1,1), (1,-1), and (-1, }
{ -1)) to pixels in the image. This matrix will be freed by }
{ apriltag_detection_destroy. }
{ The center of the detection in image pixel coordinates. }
{ The corners of the tag in image pixel coordinates. These always }
{ wrap counter-clock wise around the tag. }
  Papriltag_detection = ^Tapriltag_detection;
  Tapriltag_detection = record
      family : Papriltag_family_t;
      id : longint;
      hamming : longint;
      decision_margin : single;
      H : Pmatd_t;
      c : array[0..1] of Tdouble;
      p : array[0..3] of array[0..1] of Tdouble;
    end;

{ don't forget to add a family! }

function apriltag_detector_create:Papriltag_detector_t;cdecl;external libapriltag;
{ add a family to the apriltag detector. caller still "owns" the family. }
{ a single instance should only be provided to one apriltag detector instance. }
procedure apriltag_detector_add_family_bits(td:Papriltag_detector_t; fam:Papriltag_family_t; bits_corrected:longint);cdecl;external libapriltag;
{ Tunable, but really, 2 is a good choice. Values of >=3 }
{ consume prohibitively large amounts of memory, and otherwise }
{ you want the largest value possible. }
{xxxxxxxxxxxx
static inline void apriltag_detector_add_family(apriltag_detector_t *td, apriltag_family_t *fam)

    apriltag_detector_add_family_bits(td, fam, 2);

 }
{ does not deallocate the family. }
procedure apriltag_detector_remove_family(td:Papriltag_detector_t; fam:Papriltag_family_t);cdecl;external libapriltag;
{ unregister all families, but does not deallocate the underlying tag family objects. }
procedure apriltag_detector_clear_families(td:Papriltag_detector_t);cdecl;external libapriltag;
{ Destroy the april tag detector (but not the underlying }
{ apriltag_family_t used to initialize it.) }
procedure apriltag_detector_destroy(td:Papriltag_detector_t);cdecl;external libapriltag;
{ Detect tags from an image and return an array of }
{ apriltag_detection_t*. You can use apriltag_detections_destroy to }
{ free the array and the detections it contains, or call }
{ _detection_destroy and zarray_destroy yourself. }
function apriltag_detector_detect(td:Papriltag_detector_t; im_orig:Pimage_u8_t):Pzarray_t;cdecl;external libapriltag;
{ Call this method on each of the tags returned by apriltag_detector_detect }
procedure apriltag_detection_destroy(det:Papriltag_detection_t);cdecl;external libapriltag;
{ destroys the array AND the detections within it. }
procedure apriltag_detections_destroy(detections:Pzarray_t);cdecl;external libapriltag;
{ Renders the apriltag. }
{ Caller is responsible for calling image_u8_destroy on the image }
function apriltag_to_image(fam:Papriltag_family_t; idx:longint):Pimage_u8_t;cdecl;external libapriltag;
{ C++ end of extern C conditionnal removed }

// === Konventiert am: 12-9-26 17:04:36 ===


implementation



end.
