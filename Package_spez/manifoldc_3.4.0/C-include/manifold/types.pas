unit types;

interface

uses
  ctypes;

{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright 2023 The Manifold Authors. }
{ }
{ Licensed under the Apache License, Version 2.0 (the "License"); }
{ you may not use this file except in compliance with the License. }
{ You may obtain a copy of the License at }
{ }
{      http://www.apache.org/licenses/LICENSE-2.0 }
{ }
{ Unless required by applicable law or agreed to in writing, software }
{ distributed under the License is distributed on an "AS IS" BASIS, }
{ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. }
{ See the License for the specific language governing permissions and }
{ limitations under the License. }
(** unsupported pragma#pragma once*)
{$include <stddef.h>}
{$include <stdint.h>}
{ opaque pointers }
type
{ structs }

  PManifoldManifoldPair = ^TManifoldManifoldPair;
  TManifoldManifoldPair = record
      first : PManifoldManifold;
      second : PManifoldManifold;
    end;

  PManifoldVec2 = ^TManifoldVec2;
  TManifoldVec2 = record
      x : Tdouble;
      y : Tdouble;
    end;

  PManifoldVec3 = ^TManifoldVec3;
  TManifoldVec3 = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
    end;

  PManifoldIVec3 = ^TManifoldIVec3;
  TManifoldIVec3 = record
      x : longint;
      y : longint;
      z : longint;
    end;

  PManifoldVec4 = ^TManifoldVec4;
  TManifoldVec4 = record
      x : Tdouble;
      y : Tdouble;
      z : Tdouble;
      w : Tdouble;
    end;

  PManifoldProperties = ^TManifoldProperties;
  TManifoldProperties = record
      surface_area : Tdouble;
      volume : Tdouble;
    end;

  PManifoldMeshGLOptions = ^TManifoldMeshGLOptions;
  TManifoldMeshGLOptions = record
      run_indices : Puint32_t;
      run_indices_length : Tsize_t;
      run_original_ids : Puint32_t;
      run_original_ids_length : Tsize_t;
      merge_from_vert : Puint32_t;
      merge_to_vert : Puint32_t;
      merge_verts_length : Tsize_t;
      halfedge_tangents : Psingle;
    end;

  PManifoldMeshGL64Options = ^TManifoldMeshGL64Options;
  TManifoldMeshGL64Options = record
      run_indices : Puint64_t;
      run_indices_length : Tsize_t;
      run_original_ids : Puint32_t;
      run_original_ids_length : Tsize_t;
      merge_from_vert : Puint64_t;
      merge_to_vert : Puint64_t;
      merge_verts_length : Tsize_t;
      halfedge_tangents : Pdouble;
    end;
{ enums }

  PManifoldOpType = ^TManifoldOpType;
  TManifoldOpType =  Longint;
  Const
    MANIFOLD_ADD = 0;
    MANIFOLD_SUBTRACT = 1;
    MANIFOLD_INTERSECT = 2;
;
type
  PManifoldError = ^TManifoldError;
  TManifoldError =  Longint;
  Const
    MANIFOLD_NO_ERROR = 0;
    MANIFOLD_NON_FINITE_VERTEX = 1;
    MANIFOLD_NOT_MANIFOLD = 2;
    MANIFOLD_VERTEX_INDEX_OUT_OF_BOUNDS = 3;
    MANIFOLD_PROPERTIES_WRONG_LENGTH = 4;
    MANIFOLD_MISSING_POSITION_PROPERTIES = 5;
    MANIFOLD_MERGE_VECTORS_DIFFERENT_LENGTHS = 6;
    MANIFOLD_MERGE_INDEX_OUT_OF_BOUNDS = 7;
    MANIFOLD_TRANSFORM_WRONG_LENGTH = 8;
    MANIFOLD_RUN_INDEX_WRONG_LENGTH = 9;
    MANIFOLD_FACE_ID_WRONG_LENGTH = 10;
    MANIFOLD_INVALID_CONSTRUCTION = 11;
    MANIFOLD_RESULT_TOO_LARGE = 12;
;
type
  PManifoldFillRule = ^TManifoldFillRule;
  TManifoldFillRule =  Longint;
  Const
    MANIFOLD_FILL_RULE_EVEN_ODD = 0;
    MANIFOLD_FILL_RULE_NON_ZERO = 1;
    MANIFOLD_FILL_RULE_POSITIVE = 2;
    MANIFOLD_FILL_RULE_NEGATIVE = 3;
;
type
  PManifoldJoinType = ^TManifoldJoinType;
  TManifoldJoinType =  Longint;
  Const
    MANIFOLD_JOIN_TYPE_SQUARE = 0;
    MANIFOLD_JOIN_TYPE_ROUND = 1;
    MANIFOLD_JOIN_TYPE_MITER = 2;
    MANIFOLD_JOIN_TYPE_BEVEL = 3;
;
{ function pointer }
type

  TManifoldSdf = function (para1:Tdouble; para2:Tdouble; para3:Tdouble; para4:pointer):Tdouble;cdecl;

// === Konventiert am: 1-3-26 15:50:05 ===


implementation



end.
