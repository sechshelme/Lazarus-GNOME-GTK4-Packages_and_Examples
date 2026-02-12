unit fp_manifold_obj;

interface

uses
  fp_manifoldc;

type
  TMeshGL=class;
  TMeshGL64=class;
  TPolygons=class;


  { TManifold }

  TManifold=class(TObject)
    private
    Fmem:Pointer;
    Fobj:PManifoldManifold;
    procedure Init;
    public
    property obj:PManifoldManifold read Fobj;

    constructor level_set(sdf: TManifoldSdf; bounds: PManifoldBox; edge_length,level,tolerance: double; ctx: pointer);   // ????
    constructor level_set_seq( sdf: TManifoldSdf; bounds: PManifoldBox; edge_length,level, tolerance: double; ctx: pointer); // ?????
    constructor boolean(a, b: TManifold; op: TManifoldOpType; clean_a: Boolean; clean_b: Boolean);
    constructor batch_boolean( ms: PManifoldManifoldVec; op: TManifoldOpType);   // ????
    constructor union(a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor difference(a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor intersection( a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor trim_by_plane(m: TManifold; normal_x, normal_y, normal_z, offset: double; clean: Boolean);
    constructor hull(m: TManifold; clean: Boolean);
    constructor batch_hull( ms: PManifoldManifoldVec); // ????
    constructor hull_pts(ps: PManifoldVec3; length: Tsize_t); // ????;
    constructor translate(m: TManifold; x, y, z: double; clean: Boolean);
    constructor rotate(m: TManifold; x, y, z: double; clean: Boolean);
    constructor scale(m: TManifold; x, y, z: double; clean: Boolean);
    constructor transform(m: TManifold; x1, y1,z1, x2, y2, z2, x3, y3,z3, x4, y4,z4: double; clean: Boolean);
    constructor mirror(m: TManifold; nx, ny, nz: double; clean: Boolean);
    constructor empty;
    constructor copy(m: TManifold; clean: Boolean);
    constructor tetrahedron;
    constructor warp(m: TManifold; fun: Twarp_func; ctx: pointer; clean: Boolean);
    constructor smooth_by_normals(m: TManifold; normalIdx: longint; clean: Boolean);
    constructor smooth_out(m: TManifold; minSharpAngle, minSmoothness: double; clean: Boolean);
    constructor refine(m: TManifold; refine: longint; clean: Boolean);
    constructor refine_to_length(m: TManifold; length: double; clean: Boolean);
    constructor refine_to_tolerance(m: TManifold; tolerance: double; clean: Boolean);
    constructor manifold_vec_get( ms: PManifoldManifoldVec; idx: Tsize_t);  // ????
    constructor cube(x, y, z: double; center: longint);
    constructor cylinder(height, radius_low,radius_high: double; circular_segments, center: longint);
    constructor sphere(radius: double; circular_segments: longint);
    constructor of_meshgl( mesh: TMeshGL; clean: Boolean);
    constructor of_meshgl64( mesh: TMeshGL64; clean: Boolean);
    constructor smooth( mesh: TMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
    constructor smooth64(mesh: TMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
    constructor extrude( cs: TPolygons; height: double; slices: longint; twist_degrees,scale_x, scale_y: double; clean: Boolean);
    constructor revolve( cs: TPolygons; circular_segments: longint; revolve_degrees: double; clean: Boolean) ;
    constructor compose(ms: PManifoldManifoldVec);  // ????
    constructor decompose( m: TManifold ;clean: Boolean);
    constructor as_original (m: TManifold;clean: Boolean);
    constructor set_properties( m: TManifold; num_prop: longint; fun: Tproperties_func; ctx: pointer; clean: Boolean);
    constructor calculate_curvature(m: TManifold; gaussian_idx,mean_idx: longint; clean: Boolean);
    constructor calculate_normals(m: TManifold; normal_idx: longint;      min_sharp_angle: double; clean: Boolean);

    function is_empty: longint;
    function status: TManifoldError;
    function num_vert: Tsize_t;
    function num_edge: Tsize_t;
    function num_tri: Tsize_t;
    function num_prop: Tsize_t;
    function epsilon: double;
    function genus: longint;
    function surface_area: double;
    function volume: double;
    function original_id: longint;

    destructor Destroy; override;
  end;

  { TMeshGL }

  TMeshGL=class(TObject)
    private
    Fmem:Pointer;
    Fobj:PManifoldMeshGL;
    vpmem,     tvmem ,mfvmem,mtvmen, rimem, roimem,rtmem,fimem,htmem      : array of Byte;

    procedure Init;
    public
    property obj:PManifoldMeshGL read Fobj;
    property mem:Pointer read Fmem;

    constructor meshgl( vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t);
    constructor meshgl_w_tangents(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle);
    constructor get_meshgl(m: TManifold; clean: Boolean);
    constructor meshgl_copy(m: TMeshGL; clean: Boolean);
    constructor meshgl_merge(m: TMeshGL; clean: Boolean);

    function meshgl_num_prop: longint;
    function meshgl_num_vert: longint;
    function meshgl_num_tri: longint;
    function meshgl_vert_properties_length: Tsize_t;
    function meshgl_tri_length: Tsize_t;
    function meshgl_merge_length: Tsize_t;
    function meshgl_run_index_length: Tsize_t;
    function meshgl_run_original_id_length: Tsize_t;
    function meshgl_run_transform_length: Tsize_t;
    function meshgl_face_id_length: Tsize_t;
    function meshgl_tangent_length: Tsize_t;
    function meshgl_vert_properties: Psingle;
    function meshgl_tri_verts: Puint32_t;
    function meshgl_merge_from_vert: Puint32_t;
    function meshgl_merge_to_vert: Puint32_t;
    function meshgl_run_index: Puint32_t;
    function meshgl_run_original_id: Puint32_t;
    function meshgl_run_transform: Psingle;
    function meshgl_face_id: Puint32_t;
    function meshgl_halfedge_tangent: Psingle;

    destructor Destroy; override;
  end;

  { TMeshGL64 }

  TMeshGL64=class(TObject)
    private
    Fmem:Pointer;
    Fobj:PManifoldMeshGL;
    vpmem,     tvmem ,mfvmem,mtvmen, rimem, roimem,rtmem,fimem,htmem      : array of Byte;

    procedure Init;
    public
    property obj:PManifoldMeshGL read Fobj;
    property mem:Pointer read Fmem;

    constructor meshgl( vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t);
    constructor meshgl_w_tangents(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: PDouble);
    constructor get_meshgl(m: TManifold; clean: Boolean);
    constructor meshgl_copy(m: TMeshGL64; clean: Boolean);
    constructor meshgl_merge(m: TMeshGL64; clean: Boolean);

    function num_prop: Tsize_t;
    function num_vert: Tsize_t;
    function num_tri: Tsize_t;
    function vert_properties_length: Tsize_t;
    function tri_length: Tsize_t;
    function merge_length: Tsize_t;
    function run_index_length: Tsize_t;
    function run_original_id_length: Tsize_t;
    function run_transform_length: Tsize_t;
    function face_id_length: Tsize_t;
    function tangent_length: Tsize_t;
    function vert_properties: PDouble;
    function tri_verts: Puint64_t;
    function merge_from_vert: Puint64_t;
    function merge_to_vert: Puint64_t;
    function run_index: Puint64_t;
    function run_original_id: Puint32_t;
    function run_transform: PDouble;
    function face_id: Puint64_t;
    function halfedge_tangent: PDouble;

    destructor Destroy; override;
  end;

  { TPolygons }

  TPolygons=class(TObject)
  private
  Fmem:Pointer;
  Fobj:PManifoldPolygons;
  public
  procedure Init;
  constructor polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);  // ????
  constructor slice( m: TManifold; height: double; clean: Boolean);
  constructor project( m: TManifold; clean: Boolean);
  constructor cross_section_to_polygons(cs: PManifoldCrossSection); // ????

  function polygons_length: Tsize_t;
  function polygons_simple_length(idx: Tsize_t): Tsize_t;
  function polygons_get_point(simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2;
  destructor Destroy; override;
  end;

implementation




{ TManifold }

procedure TManifold.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_manifold_size;
   Getmem(Fmem, m_size);
end;

constructor TManifold.level_set(sdf: TManifoldSdf; bounds: PManifoldBox; edge_length, level, tolerance: double; ctx: pointer);
begin
  Init;
  Fobj:=manifold_level_set(Fmem, sdf, bounds, edge_length,level,tolerance, ctx);
   // if clean  bounds.Free
end;

constructor TManifold.level_set_seq(sdf: TManifoldSdf; bounds: PManifoldBox; edge_length, level, tolerance: double; ctx: pointer);
begin
  Init;
  Fobj:= manifold_level_set_seq(Fmem, sdf,bounds, edge_length, level, tolerance, ctx);
   // if clean  bounds.Free
end;

constructor TManifold.boolean(a, b: TManifold; op: TManifoldOpType; clean_a: Boolean; clean_b: Boolean);
begin
  Init;
  Fobj:=  manifold_boolean(Fmem, a.Fobj, b.Fobj, op);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.batch_boolean(ms: PManifoldManifoldVec; op: TManifoldOpType);
begin
  Init;
  Fobj:= manifold_batch_boolean(Fmem, ms, op);
  // if clean  ms.Free
end;

constructor TManifold.union(a, b: TManifold; clean_a: Boolean; clean_b: Boolean);
begin
  Init;
  Fobj:= manifold_union(Fmem, a.Fobj, b.Fobj);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.difference(a, b: TManifold; clean_a: Boolean; clean_b: Boolean);
begin
   Init;
Fobj:= manifold_difference(Fmem, a.Fobj, b.Fobj);
  if clean_a then a.Free;
  if clean_b then b.Free;
end;

constructor TManifold.intersection(a, b: TManifold; clean_a: Boolean; clean_b: Boolean);
begin
  Init;
  Fobj:=  manifold_intersection(Fmem, a.Fobj, b.Fobj);
 if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.trim_by_plane(m: TManifold; normal_x, normal_y, normal_z, offset: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_trim_by_plane(Fmem, m.Fobj, normal_x, normal_y, normal_z, offset);
 if clean then m.Free;
end;

constructor TManifold.hull(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:= manifold_hull(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.batch_hull(ms: PManifoldManifoldVec);
begin
  Init;
  Fobj:=   manifold_batch_hull(Fmem,ms);
  // if clean  ms.Free
end;

constructor TManifold.hull_pts(ps: PManifoldVec3; length: Tsize_t);
begin
  Init;
  Fobj:=   manifold_hull_pts(Fmem, ps, length);
 // if clean  ms.Free
end;

constructor TManifold.translate(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=      manifold_translate(Fmem, m.Fobj, x, y,z);
  if clean then m.Free;
end;

constructor TManifold.rotate(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=manifold_rotate(Fmem, m.Fobj, x, y,z);
  if clean then m.Free;
end;

constructor TManifold.scale(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=   manifold_scale(Fmem, m.Fobj, x, y, z);
  if clean then m.Free;
end;

constructor TManifold.transform(m: TManifold; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: Boolean);
begin
  Init;
Fobj:=manifold_transform(Fmem, m.Fobj ,x1, y1, z1, x2, y2, z2, x3,y3, z3,x4, y4, z4);
  if clean then m.Free;
end;

constructor TManifold.mirror(m: TManifold; nx, ny, nz: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_mirror(Fmem, m.Fobj, nx,ny, nz);
  if clean then m.Free;
end;

constructor TManifold.empty;
begin
  Init;
Fobj:= manifold_empty(Fmem);
end;

constructor TManifold.copy(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=  manifold_copy(Fmem,m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.tetrahedron;
begin
  Init;
Fobj:= manifold_tetrahedron(Fmem);
end;

constructor TManifold.warp(m: TManifold; fun: Twarp_func; ctx: pointer; clean: Boolean);
begin
  Init;
Fobj:=manifold_warp(Fmem, m.Fobj, fun, ctx);
  if clean then m.Free;
end;

constructor TManifold.smooth_by_normals(m: TManifold; normalIdx: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_smooth_by_normals(Fmem, m.Fobj, normalIdx);
  if clean then m.Free;
end;

constructor TManifold.smooth_out(m: TManifold; minSharpAngle, minSmoothness: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_smooth_out(Fmem, m.Fobj, minSharpAngle, minSmoothness);
  if clean then m.Free;
end;

constructor TManifold.refine(m: TManifold; refine: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine(Fmem, m.Fobj, refine);
  if clean then m.Free;
end;

constructor TManifold.refine_to_length(m: TManifold; length: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine_to_length(Fmem, m.Fobj,length);
  if clean then m.Free;
end;

constructor TManifold.refine_to_tolerance(m: TManifold; tolerance: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine_to_tolerance(Fmem, m.Fobj, tolerance);
  if clean then m.Free;
end;

constructor TManifold.manifold_vec_get(ms: PManifoldManifoldVec; idx: Tsize_t);
begin
  Init;
 Fobj:=manifold_manifold_vec_get(Fmem, ms, idx);
// if clean  ms.Free
end;

constructor TManifold.cube(x, y, z: double; center: longint);
begin
  Init;
Fobj:=  manifold_cube(Fmem, x, y, z,center);
end;

constructor TManifold.cylinder(height, radius_low, radius_high: double; circular_segments, center: longint);
begin
  Init;
Fobj:=manifold_cylinder(Fmem, height, radius_low, radius_high, circular_segments, center);
end;

constructor TManifold.sphere(radius: double; circular_segments: longint);
begin
  Init;
  Fobj:=manifold_sphere(Fmem, radius,circular_segments);
end;

constructor TManifold.of_meshgl(mesh: TMeshGL; clean: Boolean);
begin
  Init;
  Fobj:=manifold_of_meshgl(Fmem, mesh.Fobj);
   if clean then mesh.Free
end;

constructor TManifold.of_meshgl64(mesh: TMeshGL64; clean: Boolean);
begin
  Init;
  Fobj:=manifold_of_meshgl64(Fmem, mesh.Fobj);
   if clean then mesh.Free
end;

constructor TManifold.smooth(mesh: TMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:=manifold_smooth(Fmem,mesh.Fobj, half_edges, smoothness, n_idxs);
   if clean then mesh.Free
end;

constructor TManifold.smooth64(mesh: TMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:= manifold_smooth64(Fmem, mesh.Fobj,half_edges, smoothness, n_idxs);
   if clean then mesh.Free
end;

constructor TManifold.extrude(cs: TPolygons; height: double; slices: longint; twist_degrees, scale_x, scale_y: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_extrude(Fmem, cs.Fobj, height, slices,twist_degrees, scale_x, scale_y);
   if clean then cs.Free
end;

constructor TManifold.revolve(cs: TPolygons; circular_segments: longint; revolve_degrees: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_revolve(Fmem, cs.Fobj, circular_segments, revolve_degrees);
   if clean then cs.Free
end;

constructor TManifold.compose(ms: PManifoldManifoldVec);
begin
  Init;
  Fobj:= manifold_compose(Fmem, ms);
  // if clean  ms.Free
end;

constructor TManifold.decompose(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:= manifold_decompose(Fmem,m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.as_original(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=  manifold_as_original(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.set_properties(m: TManifold; num_prop: longint; fun: Tproperties_func; ctx: pointer; clean: Boolean);
begin
  Init;
Fobj:= manifold_set_properties(Fmem, m.Fobj, num_prop,fun, ctx);
  if clean then m.Free;
end;

constructor TManifold.calculate_curvature(m: TManifold; gaussian_idx, mean_idx: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_calculate_curvature(Fmem, m.Fobj, gaussian_idx,mean_idx);
  if clean then m.Free;
end;

constructor TManifold.calculate_normals(m: TManifold;  normal_idx: longint; min_sharp_angle: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_calculate_normals(Fmem, m.Fobj, normal_idx, min_sharp_angle);
  if clean then m.Free;
end;

function TManifold.is_empty: longint;
begin
  Result:=manifold_is_empty(Fobj);
end;

function TManifold.status: TManifoldError;
begin
  Result:=manifold_status(Fobj);
end;

function TManifold.num_vert: Tsize_t;
begin
  Result:=manifold_num_vert(Fobj);
end;

function TManifold.num_edge: Tsize_t;
begin
  Result:= manifold_num_edge(Fobj);
end;

function TManifold.num_tri: Tsize_t;
begin
  Result:=manifold_num_tri(Fobj);
end;

function TManifold.num_prop: Tsize_t;
begin
  Result:=manifold_num_prop(Fobj);
end;

function TManifold.epsilon: double;
begin
  Result:=manifold_epsilon(Fobj);
end;

function TManifold.genus: longint;
begin
  Result:=manifold_genus(Fobj);
end;

function TManifold.surface_area: double;
begin
  Result:=manifold_surface_area(Fobj);
end;

function TManifold.volume: double;
begin
  Result:=manifold_volume(Fobj);
end;

function TManifold.original_id: longint;
begin
  Result:=manifold_original_id(Fobj);
end;

destructor TManifold.Destroy;
begin
  manifold_destruct_manifold(Fobj);
  Freemem(Fmem);
  inherited Destroy;
end;

{ TMeshGL }

procedure TMeshGL.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
   Getmem(Fmem, m_size);
end;

constructor TMeshGL.meshgl(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t);
begin
  Init;
Fobj:= manifold_meshgl(Fmem, vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGL.meshgl_w_tangents(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle);
begin
  Init;
Fobj:=manifold_meshgl_w_tangents(Fmem, vert_props, n_verts, n_props, tri_verts, n_tris,halfedge_tangent);
end;

constructor TMeshGL.get_meshgl(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=manifold_get_meshgl(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL.meshgl_copy(m: TMeshGL; clean: Boolean);
begin
  Init;
Fobj:= manifold_meshgl_copy(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL.meshgl_merge(m: TMeshGL; clean: Boolean);
begin
  Init;
Fobj:=manifold_meshgl_merge(Fmem, m.Fobj);
  if clean then m.Free;
end;

function TMeshGL.meshgl_num_prop: longint;
begin
Result:=manifold_meshgl_num_prop(Fobj);
end;

function TMeshGL.meshgl_num_vert: longint;
begin
Result:=manifold_meshgl_num_vert(Fobj);
end;

function TMeshGL.meshgl_num_tri: longint;
begin
Result:=manifold_meshgl_num_tri(Fobj);
end;

function TMeshGL.meshgl_vert_properties_length: Tsize_t;
begin
Result:=manifold_meshgl_vert_properties_length(Fobj);
end;

function TMeshGL.meshgl_tri_length: Tsize_t;
begin
Result:=manifold_meshgl_tri_length(Fobj);
end;

function TMeshGL.meshgl_merge_length: Tsize_t;
begin
Result:=manifold_meshgl_merge_length(Fobj);
end;

function TMeshGL.meshgl_run_index_length: Tsize_t;
begin
Result:=manifold_meshgl_run_index_length(Fobj);
end;

function TMeshGL.meshgl_run_original_id_length: Tsize_t;
begin
Result:=manifold_meshgl_run_original_id_length(Fobj);
end;

function TMeshGL.meshgl_run_transform_length: Tsize_t;
begin
Result:=manifold_meshgl_run_transform_length(Fobj);
end;

function TMeshGL.meshgl_face_id_length: Tsize_t;
begin
Result:=manifold_meshgl_face_id_length(Fobj);
end;

function TMeshGL.meshgl_tangent_length: Tsize_t;
begin
Result:=manifold_meshgl_tangent_length(Fobj);
end;

function TMeshGL.meshgl_vert_properties: Psingle;
var
  len: Tsize_t;
begin
len:=meshgl_vert_properties_length;
SetLength(vpmem,  len * SizeOf(Single));
Result:=manifold_meshgl_vert_properties(Pointer( vpmem), Fobj);
end;

function TMeshGL.meshgl_tri_verts: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_tri_length;
  SetLength(tvmem,  len* SizeOf(Tuint32_t));
Result:=manifold_meshgl_tri_verts(Pointer( tvmem), Fobj);
end;

function TMeshGL.meshgl_merge_from_vert: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_merge_length;
SetLength(mfvmem, len * SizeOf(Tuint32_t));
Result:=manifold_meshgl_merge_from_vert(Pointer(mfvmem), Fobj);
end;

function TMeshGL.meshgl_merge_to_vert: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_merge_length;
SetLength(mtvmen, len * SizeOf(Tuint32_t));
Result:=manifold_meshgl_merge_to_vert(Pointer(mtvmen), Fobj);
end;

function TMeshGL.meshgl_run_index: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_run_index_length;
 SetLength(rimem, len * SizeOf(Tuint32_t));
Result:=manifold_meshgl_run_index(Pointer(rimem), Fobj);
end;

function TMeshGL.meshgl_run_original_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_run_original_id_length;
 SetLength(roimem, len * SizeOf(Tuint32_t));
Result:=manifold_meshgl_run_original_id(Pointer( roimem), Fobj);
end;

function TMeshGL.meshgl_run_transform: Psingle;
var
  len: Tsize_t;
begin
  len := meshgl_run_transform_length;
 SetLength(rtmem, len * SizeOf(Single));
Result:=manifold_meshgl_run_transform(Pointer(rtmem), Fobj);
end;

function TMeshGL.meshgl_face_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := meshgl_face_id_length;
   SetLength(fimem, len * SizeOf(UInt32));
Result:=manifold_meshgl_face_id(Pointer( fimem), Fobj);
end;

function TMeshGL.meshgl_halfedge_tangent: Psingle;
var
  len: Tsize_t;
begin
  len := meshgl_tangent_length;
  SetLength(htmem, len* SizeOf(Single));
  Result:=manifold_meshgl_halfedge_tangent(Pointer(htmem), Fobj);
end;

destructor TMeshGL.Destroy;
begin
  manifold_destruct_meshgl(Fobj);
  Freemem(Fmem);
  inherited Destroy;
end;


{ TMeshGL64 }

procedure TMeshGL64.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
   Getmem(Fmem, m_size);
end;

constructor TMeshGL64.meshgl(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t);
begin
  Init;
Fobj:= manifold_meshgl64(Fmem, vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGL64.meshgl_w_tangents(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: PDouble);
begin
  Init;
Fobj:=manifold_meshgl64_w_tangents(Fmem, vert_props, n_verts, n_props, tri_verts, n_tris,halfedge_tangent);
end;

constructor TMeshGL64.get_meshgl(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=manifold_get_meshgl64(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL64.meshgl_copy(m: TMeshGL64; clean: Boolean);
begin
  Init;
Fobj:= manifold_meshgl64_copy(Fmem, m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL64.meshgl_merge(m: TMeshGL64; clean: Boolean);
begin
  Init;
Fobj:=manifold_meshgl64_merge(Fmem, m.Fobj);
  if clean then m.Free;
end;

function TMeshGL64.num_prop: Tsize_t;
begin
Result:=manifold_meshgl64_num_prop(Fobj);
end;

function TMeshGL64.num_vert: Tsize_t;
begin
Result:=manifold_meshgl64_num_vert(Fobj);
end;

function TMeshGL64.num_tri: Tsize_t;
begin
Result:=manifold_meshgl64_num_tri(Fobj);
end;

function TMeshGL64.vert_properties_length: Tsize_t;
begin
Result:=manifold_meshgl64_vert_properties_length(Fobj);
end;

function TMeshGL64.tri_length: Tsize_t;
begin
Result:=manifold_meshgl64_tri_length(Fobj);
end;

function TMeshGL64.merge_length: Tsize_t;
begin
Result:=manifold_meshgl64_merge_length(Fobj);
end;

function TMeshGL64.run_index_length: Tsize_t;
begin
Result:=manifold_meshgl64_run_index_length(Fobj);
end;

function TMeshGL64.run_original_id_length: Tsize_t;
begin
Result:=manifold_meshgl64_run_original_id_length(Fobj);
end;

function TMeshGL64.run_transform_length: Tsize_t;
begin
Result:=manifold_meshgl64_run_transform_length(Fobj);
end;

function TMeshGL64.face_id_length: Tsize_t;
begin
Result:=manifold_meshgl64_face_id_length(Fobj);
end;

function TMeshGL64.tangent_length: Tsize_t;
begin
Result:=manifold_meshgl64_tangent_length(Fobj);
end;

function TMeshGL64.vert_properties: PDouble;
var
  len: Tsize_t;
begin
len:=vert_properties_length;
SetLength(vpmem,  len * SizeOf(Double));
Result:=manifold_meshgl64_vert_properties(Pointer( vpmem), Fobj);
end;

function TMeshGL64.tri_verts: Puint64_t;
var
  len: Tsize_t;
begin
  len := tri_length;
  SetLength(tvmem,  len* SizeOf(Tuint64_t));
Result:=manifold_meshgl64_tri_verts(Pointer( tvmem), Fobj);
end;

function TMeshGL64.merge_from_vert: Puint64_t;
var
  len: Tsize_t;
begin
  len := merge_length;
SetLength(mfvmem, len * SizeOf(Tuint64_t));
Result:=manifold_meshgl64_merge_from_vert(Pointer(mfvmem), Fobj);
end;

function TMeshGL64.merge_to_vert: Puint64_t;
var
  len: Tsize_t;
begin
  len := merge_length;
SetLength(mtvmen, len * SizeOf(Tuint64_t));
Result:=manifold_meshgl64_merge_to_vert(Pointer(mtvmen), Fobj);
end;

function TMeshGL64.run_index: Puint64_t;
var
  len: Tsize_t;
begin
  len := run_index_length;
 SetLength(rimem, len * SizeOf(Tuint64_t));
Result:=manifold_meshgl64_run_index(Pointer(rimem), Fobj);
end;

function TMeshGL64.run_original_id: Puint32_t;
var
  len: Tsize_t;
begin
  len := run_original_id_length;
 SetLength(roimem, len * SizeOf(Tuint64_t));
Result:=manifold_meshgl64_run_original_id(Pointer( roimem), Fobj);
end;

function TMeshGL64.run_transform: PDouble;
var
  len: Tsize_t;
begin
  len := run_transform_length;
 SetLength(rtmem, len * SizeOf(Double));
Result:=manifold_meshgl64_run_transform(Pointer(rtmem), Fobj);
end;

function TMeshGL64.face_id: Puint64_t;
var
  len: Tsize_t;
begin
  len := face_id_length;
   SetLength(fimem, len * SizeOf(UInt64));
Result:=manifold_meshgl64_face_id(Pointer( fimem), Fobj);
end;

function TMeshGL64.halfedge_tangent: PDouble;
var
  len: Tsize_t;
begin
  len := tangent_length;
  SetLength(htmem, len* SizeOf(Double));
  Result:=manifold_meshgl64_halfedge_tangent(Pointer(htmem), Fobj);
end;

destructor TMeshGL64.Destroy;
begin
  manifold_destruct_meshgl(Fobj);
  Freemem(Fmem);
  inherited Destroy;
end;


{ TPolygons }

procedure TPolygons.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_polygons_size;
   Getmem(Fmem, m_size);
end;

constructor TPolygons.polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);
begin
  Init;
  Fobj:=manifold_polygons(Fmem, ps, len);
//  if clean then m.Free;
end;

constructor TPolygons.slice(m: TManifold; height: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_slice(Fmem, m.Fobj, height);
 if clean then m.Free;
end;

constructor TPolygons.project(m: TManifold; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_project(Fmem, m.Fmem);
 if clean then m.Free;
end;

constructor TPolygons.cross_section_to_polygons(cs: PManifoldCrossSection);
begin
  Init;
  Fobj:=manifold_cross_section_to_polygons(Fmem, cs);
// if clean then m.Free;
end;

function TPolygons.polygons_length: Tsize_t;
begin
 Result:=manifold_polygons_length(Fobj);
end;

function TPolygons.polygons_simple_length(idx: Tsize_t): Tsize_t;
begin
Result:=manifold_polygons_simple_length(Fobj, idx);
end;

function TPolygons.polygons_get_point(simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2;
begin
Result:=manifold_polygons_get_point(Fobj, simple_idx, pt_idx);
end;

destructor TPolygons.Destroy;
begin
  manifold_destruct_polygons(Fobj);
  Freemem(Fmem);
  inherited Destroy;
end;



end.


//function manifold_simple_polygon(mem: pointer; ps: PManifoldVec2; length: Tsize_t): PManifoldSimplePolygon; cdecl; external libmanifoldc;
//function manifold_simple_polygon_length(p: PManifoldSimplePolygon): Tsize_t; cdecl; external libmanifoldc;
//function manifold_simple_polygon_get_point(p: PManifoldSimplePolygon; idx: Tsize_t): TManifoldVec2; cdecl; external libmanifoldc;
//function manifold_polygons_get_simple(mem: pointer; ps: PManifoldPolygons; idx: Tsize_t): PManifoldSimplePolygon; cdecl; external libmanifoldc;
//

//
//function manifold_manifold_empty_vec(mem: pointer): PManifoldManifoldVec; cdecl; external libmanifoldc;
//function manifold_manifold_vec(mem: pointer; sz: Tsize_t): PManifoldManifoldVec; cdecl; external libmanifoldc;
//procedure manifold_manifold_vec_reserve(ms: PManifoldManifoldVec; sz: Tsize_t); cdecl; external libmanifoldc;
//function manifold_manifold_vec_length(ms: PManifoldManifoldVec): Tsize_t; cdecl; external libmanifoldc;
//procedure manifold_manifold_vec_set(ms: PManifoldManifoldVec; idx: Tsize_t; m: PManifoldManifold); cdecl; external libmanifoldc;
//procedure manifold_manifold_vec_push_back(ms: PManifoldManifoldVec; m: PManifoldManifold); cdecl; external libmanifoldc;
//


//function manifold_split(mem_first: pointer; mem_second: pointer; a: PManifoldManifold; b: PManifoldManifold): TManifoldManifoldPair; cdecl; external libmanifoldc;
//function manifold_split_by_plane(mem_first: pointer; mem_second: pointer; m: PManifoldManifold; normal_x: double; normal_y: double; normal_z: double; offset: double): TManifoldManifoldPair; cdecl; external libmanifoldc;
//
//
//

//function manifold_get_circular_segments(radius: double): longint; cdecl; external libmanifoldc;
//function manifold_reserve_ids(n: Tuint32_t): Tuint32_t; cdecl; external libmanifoldc;
//



//function manifold_min_gap(m: PManifoldManifold; other: PManifoldManifold; searchLength: double): double; cdecl; external libmanifoldc;


//
//function manifold_cross_section_empty(mem: pointer): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_copy(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_of_simple_polygon(mem: pointer; p: PManifoldSimplePolygon; fr: TManifoldFillRule): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_of_polygons(mem: pointer; p: PManifoldPolygons; fr: TManifoldFillRule): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_square(mem: pointer; x: double; y: double; center: longint): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_circle(mem: pointer; radius: double; circular_segments: longint): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_compose(mem: pointer; csv: PManifoldCrossSectionVec): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_decompose(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSectionVec; cdecl; external libmanifoldc;
//
//function manifold_cross_section_empty_vec(mem: pointer): PManifoldCrossSectionVec; cdecl; external libmanifoldc;
//function manifold_cross_section_vec(mem: pointer; sz: Tsize_t): PManifoldCrossSectionVec; cdecl; external libmanifoldc;
//procedure manifold_cross_section_vec_reserve(csv: PManifoldCrossSectionVec; sz: Tsize_t); cdecl; external libmanifoldc;
//function manifold_cross_section_vec_length(csv: PManifoldCrossSectionVec): Tsize_t; cdecl; external libmanifoldc;
//function manifold_cross_section_vec_get(mem: pointer; csv: PManifoldCrossSectionVec; idx: Tsize_t): PManifoldCrossSection; cdecl; external libmanifoldc;
//procedure manifold_cross_section_vec_set(csv: PManifoldCrossSectionVec; idx: Tsize_t; cs: PManifoldCrossSection); cdecl; external libmanifoldc;
//procedure manifold_cross_section_vec_push_back(csv: PManifoldCrossSectionVec; cs: PManifoldCrossSection); cdecl; external libmanifoldc;
//
//function manifold_cross_section_boolean(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection; op: TManifoldOpType): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_batch_boolean(mem: pointer; csv: PManifoldCrossSectionVec; op: TManifoldOpType): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_union(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_difference(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_intersection(mem: pointer; a: PManifoldCrossSection; b: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
//
//function manifold_cross_section_hull(mem: pointer; cs: PManifoldCrossSection): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_batch_hull(mem: pointer; css: PManifoldCrossSectionVec): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_hull_simple_polygon(mem: pointer; ps: PManifoldSimplePolygon): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_hull_polygons(mem: pointer; ps: PManifoldPolygons): PManifoldCrossSection; cdecl; external libmanifoldc;
//
//function manifold_cross_section_translate(mem: pointer; cs: PManifoldCrossSection; x: double; y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_rotate(mem: pointer; cs: PManifoldCrossSection; deg: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_scale(mem: pointer; cs: PManifoldCrossSection; x: double; y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_mirror(mem: pointer; cs: PManifoldCrossSection; ax_x: double; ax_y: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_transform(mem: pointer; cs: PManifoldCrossSection; x1: double; y1: double; x2: double; y2: double; x3: double; y3: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//
//type
//  Tsection_warp_func = function(para1: double; para2: double): TManifoldVec2; cdecl;
//  Twarp_context_func = function(para1: double; para2: double; para3: pointer): TManifoldVec2; cdecl;
//
//function manifold_cross_section_warp(mem: pointer; cs: PManifoldCrossSection; fun: Tsection_warp_func): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_warp_context(mem: pointer; cs: PManifoldCrossSection; fun: Twarp_context_func; ctx: pointer): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_simplify(mem: pointer; cs: PManifoldCrossSection; epsilon: double): PManifoldCrossSection; cdecl; external libmanifoldc;
//function manifold_cross_section_offset(mem: pointer; cs: PManifoldCrossSection; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint): PManifoldCrossSection; cdecl; external libmanifoldc;
//
//function manifold_cross_section_area(cs: PManifoldCrossSection): double; cdecl; external libmanifoldc;
//function manifold_cross_section_num_vert(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
//function manifold_cross_section_num_contour(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
//function manifold_cross_section_is_empty(cs: PManifoldCrossSection): longint; cdecl; external libmanifoldc;
//function manifold_cross_section_bounds(mem: pointer; cs: PManifoldCrossSection): PManifoldRect; cdecl; external libmanifoldc;
//
//function manifold_rect(mem: pointer; x1: double; y1: double; x2: double; y2: double): PManifoldRect; cdecl; external libmanifoldc;
//function manifold_rect_min(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
//function manifold_rect_max(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
//function manifold_rect_dimensions(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
//function manifold_rect_center(r: PManifoldRect): TManifoldVec2; cdecl; external libmanifoldc;
//function manifold_rect_scale(r: PManifoldRect): double; cdecl; external libmanifoldc;
//function manifold_rect_contains_pt(r: PManifoldRect; x: double; y: double): longint; cdecl; external libmanifoldc;
//function manifold_rect_contains_rect(a: PManifoldRect; b: PManifoldRect): longint; cdecl; external libmanifoldc;
//procedure manifold_rect_include_pt(r: PManifoldRect; x: double; y: double); cdecl; external libmanifoldc;
//function manifold_rect_union(mem: pointer; a: PManifoldRect; b: PManifoldRect): PManifoldRect; cdecl; external libmanifoldc;
//function manifold_rect_transform(mem: pointer; r: PManifoldRect; x1: double; y1: double; x2: double; y2: double; x3: double; y3: double): PManifoldRect; cdecl; external libmanifoldc;
//function manifold_rect_translate(mem: pointer; r: PManifoldRect; x: double; y: double): PManifoldRect; cdecl; external libmanifoldc;
//function manifold_rect_mul(mem: pointer; r: PManifoldRect; x: double; y: double): PManifoldRect; cdecl; external libmanifoldc;
//function manifold_rect_does_overlap_rect(a: PManifoldRect; r: PManifoldRect): longint; cdecl; external libmanifoldc;
//function manifold_rect_is_empty(r: PManifoldRect): longint; cdecl; external libmanifoldc;
//function manifold_rect_is_finite(r: PManifoldRect): longint; cdecl; external libmanifoldc;



//function manifold_box(mem: pointer; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double): PManifoldBox; cdecl; external libmanifoldc;
//function manifold_bounding_box(mem: pointer; m: PManifoldManifold): PManifoldBox; cdecl; external libmanifoldc;
//function manifold_box_union(mem: pointer; a: PManifoldBox; b: PManifoldBox): PManifoldBox; cdecl; external libmanifoldc;
//function manifold_box_translate(mem: pointer; b: PManifoldBox; x: double; y: double; z: double): PManifoldBox; cdecl; external libmanifoldc;
//function manifold_box_mul(mem: pointer; b: PManifoldBox; x: double; y: double; z: double): PManifoldBox; cdecl; external libmanifoldc;
//
//function manifold_box_min(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
//function manifold_box_max(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
//function manifold_box_dimensions(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
//function manifold_box_center(b: PManifoldBox): TManifoldVec3; cdecl; external libmanifoldc;
//function manifold_box_scale(b: PManifoldBox): double; cdecl; external libmanifoldc;
//function manifold_box_contains_pt(b: PManifoldBox; x: double; y: double; z: double): longint; cdecl; external libmanifoldc;
//function manifold_box_contains_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;
//procedure manifold_box_include_pt(b: PManifoldBox; x: double; y: double; z: double); cdecl; external libmanifoldc;
//function manifold_box_transform(mem: pointer; b: PManifoldBox; x1: double; y1: double; z1: double; x2: double; y2: double; z2: double; x3: double; y3: double; z3: double; x4: double; y4: double; z4: double): PManifoldBox; cdecl; external libmanifoldc;
//function manifold_box_does_overlap_pt(b: PManifoldBox; x: double; y: double; z: double): longint; cdecl; external libmanifoldc;
//function manifold_box_does_overlap_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;
//function manifold_box_is_finite(b: PManifoldBox): longint; cdecl; external libmanifoldc;


//
//procedure manifold_set_min_circular_angle(degrees: double); cdecl; external libmanifoldc;
//procedure manifold_set_min_circular_edge_length(length: double); cdecl; external libmanifoldc;
//procedure manifold_set_circular_segments(number: longint); cdecl; external libmanifoldc;
//procedure manifold_reset_to_circular_defaults; cdecl; external libmanifoldc;
//

//
//function manifold_triangulate(mem: pointer; ps: PManifoldPolygons; epsilon: double): PManifoldTriangulation; cdecl; external libmanifoldc;
//function manifold_triangulation_num_tri(m: PManifoldTriangulation): Tsize_t; cdecl; external libmanifoldc;
//function manifold_triangulation_tri_verts(mem: pointer; m: PManifoldTriangulation): Plongint; cdecl; external libmanifoldc;
//
//
//function manifold_material(mem: pointer): PManifoldMaterial; cdecl; external libmanifoldc;
//procedure manifold_material_set_roughness(mat: PManifoldMaterial; roughness: double); cdecl; external libmanifoldc;
//procedure manifold_material_set_metalness(mat: PManifoldMaterial; metalness: double); cdecl; external libmanifoldc;
//procedure manifold_material_set_color(mat: PManifoldMaterial; color: TManifoldVec3); cdecl; external libmanifoldc;
//function manifold_export_options(mem: pointer): PManifoldExportOptions; cdecl; external libmanifoldc;
//procedure manifold_export_options_set_faceted(options: PManifoldExportOptions; faceted: longint); cdecl; external libmanifoldc;
//procedure manifold_export_options_set_material(options: PManifoldExportOptions; mat: PManifoldMaterial); cdecl; external libmanifoldc;
//procedure manifold_export_meshgl(filename: pchar; mesh: PManifoldMeshGL; options: PManifoldExportOptions); cdecl; external libmanifoldc;
//function manifold_import_meshgl(mem: pointer; filename: pchar; force_cleanup: longint): PManifoldMeshGL; cdecl; external libmanifoldc;
//function manifold_material_size: Tsize_t; cdecl; external libmanifoldc;
//function manifold_export_options_size: Tsize_t; cdecl; external libmanifoldc;
//procedure manifold_destruct_material(m: PManifoldMaterial); cdecl; external libmanifoldc;
//procedure manifold_destruct_export_options(options: PManifoldExportOptions); cdecl; external libmanifoldc;
//procedure manifold_delete_material(m: PManifoldMaterial); cdecl; external libmanifoldc;
//procedure manifold_delete_export_options(options: PManifoldExportOptions); cdecl; external libmanifoldc;




