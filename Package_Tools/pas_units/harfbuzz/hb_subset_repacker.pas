unit hb_subset_repacker;

interface

uses
  fp_glib2, hb_common, hb_blob;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  Thb_link_t = record
    Width: dword;
    position: dword;
    objidx: dword;
  end;
  Phb_link_t = ^Thb_link_t;

  Thb_object_t = record
    head: pchar;
    tail: pchar;
    num_real_links: dword;
    real_links: Phb_link_t;
    num_virtual_links: dword;
    virtual_links: Phb_link_t;
  end;
  Phb_object_t = ^Thb_object_t;


function hb_subset_repack_or_fail(table_tag: Thb_tag_t; hb_objects: Phb_object_t; num_hb_objs: dword): Phb_blob_t; cdecl; external libharfbuzzsubset;

// === Konventiert am: 27-12-24 15:19:13 ===


implementation



end.
