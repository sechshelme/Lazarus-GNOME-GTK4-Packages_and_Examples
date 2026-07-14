{$IFDEF read_interface}


type
  PGstTypeFindData = type Pointer;

function gst_type_find_data_new(obj: PGstObject; data: Pguint8; size: Tgsize): PGstTypeFindData; cdecl; external libgstbase;
function gst_type_find_data_get_caps(data: PGstTypeFindData): PGstCaps; cdecl; external libgstbase;
function gst_type_find_data_get_probability(data: PGstTypeFindData): TGstTypeFindProbability; cdecl; external libgstbase;
function gst_type_find_data_get_typefind(data: PGstTypeFindData): PGstTypeFind; cdecl; external libgstbase;
procedure gst_type_find_data_free(data: PGstTypeFindData); cdecl; external libgstbase;
function gst_type_find_helper(src: PGstPad; size: Tguint64): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data(obj: PGstObject; data: Pguint8; size: Tgsize; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data_with_extension(obj: PGstObject; data: Pguint8; size: Tgsize; extension: Pgchar; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data_with_caps(obj: PGstObject; data: Pguint8; size: Tgsize; caps: PGstCaps; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_buffer(obj: PGstObject; buf: PGstBuffer; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_buffer_with_extension(obj: PGstObject; buf: PGstBuffer; extension: Pgchar; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_buffer_with_caps(obj: PGstObject; buf: PGstBuffer; caps: PGstCaps; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_extension(obj: PGstObject; extension: Pgchar): PGstCaps; cdecl; external libgstbase;
function gst_type_find_list_factories_for_caps(obj: PGstObject; caps: PGstCaps): PGList; cdecl; external libgstbase;

type
  TGstTypeFindHelperGetRangeFunction = function(obj: PGstObject; parent: PGstObject; offset: Tguint64; length: Tguint; buffer: PPGstBuffer): TGstFlowReturn; cdecl;

function gst_type_find_helper_get_range(obj: PGstObject; parent: PGstObject; func: TGstTypeFindHelperGetRangeFunction; size: Tguint64; extension: Pgchar;
  prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_get_range_full(obj: PGstObject; parent: PGstObject; func: TGstTypeFindHelperGetRangeFunction; size: Tguint64; extension: Pgchar;
  caps: PPGstCaps; prob: PGstTypeFindProbability): TGstFlowReturn; cdecl; external libgstbase;

// === Konventiert am: 13-7-26 19:20:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
