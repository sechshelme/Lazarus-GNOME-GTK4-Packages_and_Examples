
{$IFDEF read_interface}

type
  TGstTypeFindData = record
  end;
  PGstTypeFindData = ^TGstTypeFindData;

function gst_type_find_data_new(obj: PGstObject; Data: Pguint8; size: Tgsize): PGstTypeFindData; cdecl; external libgstbase;
function gst_type_find_data_get_caps(Data: PGstTypeFindData): PGstCaps; cdecl; external libgstbase;
function gst_type_find_data_get_probability(Data: PGstTypeFindData): TGstTypeFindProbability; cdecl; external libgstbase;
function gst_type_find_data_get_typefind(Data: PGstTypeFindData): PGstTypeFind; cdecl; external libgstbase;
procedure gst_type_find_data_free(Data: PGstTypeFindData); cdecl; external libgstbase;
function gst_type_find_helper(src: PGstPad; size: Tguint64): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data(obj: PGstObject; Data: Pguint8; size: Tgsize; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data_with_extension(obj: PGstObject; Data: Pguint8; size: Tgsize; extension: Pgchar; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
function gst_type_find_helper_for_data_with_caps(obj: PGstObject; Data: Pguint8; size: Tgsize; caps: PGstCaps; prob: PGstTypeFindProbability): PGstCaps; cdecl; external libgstbase;
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

// === Konventiert am: 28-9-24 14:46:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
