unit gmime_filter_openpgp;

interface

uses
  fp_glib2, fp_gmime3, gmime_filter;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PGMimeOpenPGPData = ^TGMimeOpenPGPData;
  TGMimeOpenPGPData = longint;

const
  GMIME_OPENPGP_DATA_NONE = 0;
  GMIME_OPENPGP_DATA_ENCRYPTED = 1;
  GMIME_OPENPGP_DATA_SIGNED = 2;
  GMIME_OPENPGP_DATA_PUBLIC_KEY = 3;
  GMIME_OPENPGP_DATA_PRIVATE_KEY = 4;

type
  PGMimeOpenPGPState = ^TGMimeOpenPGPState;
  TGMimeOpenPGPState = longint;

const
  GMIME_OPENPGP_NONE = 0;
  GMIME_OPENPGP_BEGIN_PGP_MESSAGE = 1 shl 0;
  GMIME_OPENPGP_END_PGP_MESSAGE = (1 shl 1) or (1 shl 0);
  GMIME_OPENPGP_BEGIN_PGP_SIGNED_MESSAGE = 1 shl 2;
  GMIME_OPENPGP_BEGIN_PGP_SIGNATURE = (1 shl 3) or (1 shl 2);
  GMIME_OPENPGP_END_PGP_SIGNATURE = ((1 shl 4) or (1 shl 3)) or (1 shl 2);
  GMIME_OPENPGP_BEGIN_PGP_PUBLIC_KEY_BLOCK = 1 shl 5;
  GMIME_OPENPGP_END_PGP_PUBLIC_KEY_BLOCK = (1 shl 6) or (1 shl 5);
  GMIME_OPENPGP_BEGIN_PGP_PRIVATE_KEY_BLOCK = 1 shl 7;
  GMIME_OPENPGP_END_PGP_PRIVATE_KEY_BLOCK = (1 shl 8) or (1 shl 7);

type
  TGMimeOpenPGPMarker = record
    marker: pchar;
    len: Tsize_t;
    before: TGMimeOpenPGPState;
    after: TGMimeOpenPGPState;
    is_end_marker: Tgboolean;
  end;
  PGMimeOpenPGPMarker = ^TGMimeOpenPGPMarker;

  TGMimeFilterOpenPGP = record
    parent_object: TGMimeFilter;
    state: TGMimeOpenPGPState;
    seen_end_marker: Tgboolean;
    midline: Tgboolean;
    begin_offset: Tgint64;
    end_offset: Tgint64;
    position: Tgint64;
    next: Tguint;
  end;
  PGMimeFilterOpenPGP = ^TGMimeFilterOpenPGP;

  TGMimeFilterOpenPGPClass = record
    parent_class: TGMimeFilterClass;
  end;
  PGMimeFilterOpenPGPClass = ^TGMimeFilterOpenPGPClass;

function g_mime_filter_openpgp_get_type: TGType; cdecl; external libgmime3;
function g_mime_filter_openpgp_new: PGMimeFilter; cdecl; external libgmime3;
function g_mime_filter_openpgp_get_data_type(openpgp: PGMimeFilterOpenPGP): TGMimeOpenPGPData; cdecl; external libgmime3;
function g_mime_filter_openpgp_get_begin_offset(openpgp: PGMimeFilterOpenPGP): Tgint64; cdecl; external libgmime3;
function g_mime_filter_openpgp_get_end_offset(openpgp: PGMimeFilterOpenPGP): Tgint64; cdecl; external libgmime3;

// === Konventiert am: 18-9-25 15:28:00 ===

function GMIME_TYPE_FILTER_OPENPGP: TGType;
function GMIME_FILTER_OPENPGP(obj: Pointer): PGMimeFilterOpenPGP;
function GMIME_FILTER_OPENPGP_CLASS(klass: Pointer): PGMimeFilterOpenPGPClass;
function GMIME_IS_FILTER_OPENPGP(obj: Pointer): Tgboolean;
function GMIME_IS_FILTER_OPENPGP_CLASS(klass: Pointer): Tgboolean;
function GMIME_FILTER_OPENPGP_GET_CLASS(obj: Pointer): PGMimeFilterOpenPGPClass;

implementation

function GMIME_TYPE_FILTER_OPENPGP: TGType;
begin
  GMIME_TYPE_FILTER_OPENPGP := g_mime_filter_openpgp_get_type;
end;

function GMIME_FILTER_OPENPGP(obj: Pointer): PGMimeFilterOpenPGP;
begin
  Result := PGMimeFilterOpenPGP(g_type_check_instance_cast(obj, GMIME_TYPE_FILTER_OPENPGP));
end;

function GMIME_FILTER_OPENPGP_CLASS(klass: Pointer): PGMimeFilterOpenPGPClass;
begin
  Result := PGMimeFilterOpenPGPClass(g_type_check_class_cast(klass, GMIME_TYPE_FILTER_OPENPGP));
end;

function GMIME_IS_FILTER_OPENPGP(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GMIME_TYPE_FILTER_OPENPGP);
end;

function GMIME_IS_FILTER_OPENPGP_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, GMIME_TYPE_FILTER_OPENPGP);
end;

function GMIME_FILTER_OPENPGP_GET_CLASS(obj: Pointer): PGMimeFilterOpenPGPClass;
begin
  Result := PGMimeFilterOpenPGPClass(PGTypeInstance(obj)^.g_class);
end;



end.
