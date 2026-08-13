unit gegl_types;

{$DEFINE read_enum}{$DEFINE read_struct}{$DEFINE read_function}

interface

uses
  fp_glib2, fp_gegl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


  {$IFDEF read_enum}
const
  GEGL_AUTO_ROWSTRIDE = 0;

type
  PGeglPadType = ^TGeglPadType;
  TGeglPadType = longint;
const
  GEGL_PARAM_PAD_OUTPUT = 1 shl G_PARAM_USER_SHIFT;
  GEGL_PARAM_PAD_INPUT = 1 shl (G_PARAM_USER_SHIFT + 1);

type
  PGeglBlitFlags = ^TGeglBlitFlags;
  TGeglBlitFlags = longint;
const
  GEGL_BLIT_DEFAULT = 0;
  GEGL_BLIT_CACHE = 1 shl 0;
  GEGL_BLIT_DIRTY = 1 shl 1;

type
  PGeglSplitStrategy = ^TGeglSplitStrategy;
  TGeglSplitStrategy = longint;
const
  GEGL_SPLIT_STRATEGY_AUTO = 0;
  GEGL_SPLIT_STRATEGY_HORIZONTAL = 1;
  GEGL_SPLIT_STRATEGY_VERTICAL = 2;
  {$ENDIF read_enum}

  {$IFDEF read_struct}
type
  PGeglConfig = type Pointer;
  PGeglStats = type Pointer;
  PGeglOperation = type Pointer;
  PGeglNode = type Pointer;
  PPGeglNode = ^PGeglNode;
  PPPGeglNode = ^PPGeglNode;
  PGeglProcessor = type Pointer;
  {$ENDIF read_struct}

{$IFDEF read_function}
function gegl_config_get_type: TGType; cdecl; external libgegl;
function gegl_stats_get_type: TGType; cdecl; external libgegl;
function gegl_operation_get_type: TGType; cdecl; external libgegl;
function gegl_node_get_type: TGType; cdecl; external libgegl;
function gegl_processor_get_type: TGType; cdecl; external libgegl;
function gegl_random_get_type: TGType; cdecl; external libgegl;

// === Konventiert am: 12-8-26 17:16:31 ===

function GEGL_TYPE_CONFIG: TGType;
function GEGL_CONFIG(obj: Pointer): PGeglConfig;
function GEGL_IS_CONFIG(obj: Pointer): Tgboolean;

function GEGL_TYPE_STATS: TGType;
function GEGL_STATS(obj: Pointer): PGeglStats;
function GEGL_IS_STATS(obj: Pointer): Tgboolean;

function GEGL_TYPE_OPERATION: TGType;
function GEGL_OPERATION(obj: Pointer): PGeglOperation;
function GEGL_IS_OPERATION(obj: Pointer): Tgboolean;

function GEGL_TYPE_NODE: TGType;
function GEGL_NODE(obj: Pointer): PGeglNode;
function GEGL_IS_NODE(obj: Pointer): Tgboolean;

function GEGL_TYPE_PROCESSOR: TGType;
function GEGL_PROCESSOR(obj: Pointer): PGeglProcessor;
function GEGL_IS_PROCESSOR(obj: Pointer): Tgboolean;

function GEGL_TYPE_RANDOM: TGType;
{$ENDIF read_function}

implementation

function GEGL_TYPE_CONFIG: TGType;
begin
  GEGL_TYPE_CONFIG := gegl_config_get_type;
end;

function GEGL_CONFIG(obj: Pointer): PGeglConfig;
begin
  Result := PGeglConfig(g_type_check_instance_cast(obj, GEGL_TYPE_CONFIG));
end;

function GEGL_IS_CONFIG(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_CONFIG);
end;


function GEGL_TYPE_STATS: TGType;
begin
  Result := gegl_stats_get_type;
end;

function GEGL_STATS(obj: Pointer): PGeglStats;
begin
  Result := PGeglStats(g_type_check_instance_cast(obj, GEGL_TYPE_STATS));
end;

function GEGL_IS_STATS(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_STATS);
end;


function GEGL_TYPE_OPERATION: TGType;
begin
  Result := gegl_operation_get_type;
end;

function GEGL_OPERATION(obj: Pointer): PGeglOperation;
begin
  Result := PGeglOperation(g_type_check_instance_cast(obj, GEGL_TYPE_OPERATION));
end;

function GEGL_IS_OPERATION(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_OPERATION);
end;


function GEGL_TYPE_NODE: TGType;
begin
  Result := gegl_node_get_type;
end;

function GEGL_NODE(obj: Pointer): PGeglNode;
begin
  Result := PGeglNode(g_type_check_instance_cast(obj, GEGL_TYPE_NODE));
end;

function GEGL_IS_NODE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_NODE);
end;


function GEGL_TYPE_PROCESSOR: TGType;
begin
  Result := gegl_processor_get_type;
end;

function GEGL_PROCESSOR(obj: Pointer): PGeglProcessor;
begin
  Result := PGeglProcessor(g_type_check_instance_cast(obj, GEGL_TYPE_PROCESSOR));
end;

function GEGL_IS_PROCESSOR(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, GEGL_TYPE_PROCESSOR);
end;


function GEGL_TYPE_RANDOM: TGType;
begin
  Result := gegl_random_get_type;
end;

end.
