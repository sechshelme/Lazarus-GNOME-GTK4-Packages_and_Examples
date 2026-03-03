unit lsmutils;

interface

uses
  fp_glib2, fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TLsmExtents = record
    x1: double;
    y1: double;
    x2: double;
    y2: double;
  end;
  PLsmExtents = ^TLsmExtents;

function lsm_extents_get_type: TGType; cdecl; external liblasem;

type
  TLsmBox = record
    x: double;
    y: double;
    width: double;
    height: double;
  end;
  PLsmBox = ^TLsmBox;

function lsm_box_get_type: TGType; cdecl; external liblasem;

// === Konventiert am: 3-3-26 17:12:36 ===

function LSM_TYPE_BOX: TGType;
function LSM_TYPE_EXTENTS: TGType;

implementation

function LSM_TYPE_EXTENTS: TGType;
begin
  LSM_TYPE_EXTENTS := lsm_extents_get_type;
end;


function LSM_TYPE_BOX: TGType;
begin
  LSM_TYPE_BOX := lsm_box_get_type;
end;


end.
