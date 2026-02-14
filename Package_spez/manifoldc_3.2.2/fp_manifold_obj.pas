unit fp_manifold_obj;

interface

uses
  fp_manifoldc;

type
  TMeshGL=class;
  TMeshGL64=class;
  TPolygons=class;
  TBox=class;
  TManifoldVec=class;

  { TManifold }

  TManifold=class(TObject)
    private
    Fmem:array of Byte;
    Fobj:PManifoldManifold;
    procedure Init;
    public
    property obj:PManifoldManifold read Fobj;

    constructor level_set(sdf: TManifoldSdf; bounds: TBox; edge_length,level,tolerance: double; ctx: pointer; clean: Boolean);
    constructor level_set_seq( sdf: TManifoldSdf; bounds: TBox; edge_length,level, tolerance: double; ctx: pointer; clean: Boolean);
    constructor boolean(a, b: TManifold; op: TManifoldOpType; clean_a,clean_b: Boolean);
    constructor batch_boolean(ms: TManifoldVec; op: TManifoldOpType; clean: Boolean);
    constructor union(a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor difference(a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor intersection( a, b: TManifold; clean_a: Boolean;      clean_b: Boolean);
    constructor trim_by_plane(m: TManifold; normal_x, normal_y, normal_z, offset: double; clean: Boolean);
    constructor hull(m: TManifold; clean: Boolean);
    constructor batch_hull( ms: TManifoldVec; clean: Boolean);
    constructor hull_pts(ps: PManifoldVec3; length: Tsize_t);
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
    constructor manifold_vec_get( ms: TManifoldVec; idx: Tsize_t; clean: Boolean);
    constructor cube(x, y, z: double; center: longint);
    constructor cylinder(height, radius_low,radius_high: double; circular_segments, center: longint);
    constructor sphere(radius: double; circular_segments: longint);
    constructor of_meshgl( mesh: TMeshGL; clean: Boolean);
    constructor of_meshgl64( mesh: TMeshGL64; clean: Boolean);
    constructor smooth( mesh: TMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
    constructor smooth64(mesh: TMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
    constructor extrude( cs: TPolygons; height: double; slices: longint; twist_degrees,scale_x, scale_y: double; clean: Boolean);
    constructor revolve( cs: TPolygons; circular_segments: longint; revolve_degrees: double; clean: Boolean) ;
    constructor compose(ms: TManifoldVec; clean: Boolean);
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
    Fmem:array of Byte;
    Fobj:PManifoldMeshGL;
    vpmem,     tvmem ,mfvmem,mtvmem, rimem, roimem,rtmem,fimem,htmem      : array of Byte;
    procedure Init;
    public
    property obj:PManifoldMeshGL read Fobj;

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
    Fmem   : array of Byte;
    Fobj:PManifoldMeshGL64;
    vpmem,     tvmem ,mfvmem,mtvmem, rimem, roimem,rtmem,fimem,htmem      : array of Byte;
    procedure Init;
    public
    property obj:PManifoldMeshGL64 read Fobj;

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
  Fmem:array of Byte;
  Fobj:PManifoldPolygons;
  procedure Init;
  public
  property obj:PManifoldPolygons read Fobj;

  constructor polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);  // ????
  constructor slice( m: TManifold; height: double; clean: Boolean);
  constructor project( m: TManifold; clean: Boolean);
  constructor cross_section_to_polygons(cs: PManifoldCrossSection); // ????

  function polygons_length: Tsize_t;
  function polygons_simple_length(idx: Tsize_t): Tsize_t;
  function polygons_get_point(simple_idx: Tsize_t; pt_idx: Tsize_t): TManifoldVec2;

  destructor Destroy; override;
  end;

  { TBox }

  TBox=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldBox;
  procedure Init;
  public
  property obj:PManifoldBox read Fobj;

  constructor box(x1,y1,z1,x2, y2,z2: double);
  constructor bounding_box( m: TManifold; clean: Boolean);
  constructor box_union(a: TBox; b: TBox; clean_a: Boolean;      clean_b: Boolean);
  constructor translate(b: TBox; x, y, z: double; clean: Boolean);
  constructor box_mul(b: TBox; x, y, z: double; clean: Boolean);
  constructor box_transform(b: TBox; x1, y1, z1, x2,y2, z2, x3, y3, z3, x4, y4, z4: double; clean: Boolean);

  function box_min: TManifoldVec3;
  function box_max: TManifoldVec3;
  function box_dimensions: TManifoldVec3;
  function box_center: TManifoldVec3;
  function box_scale: double;
  function box_contains_pt(x, y,z: double): longint;
  procedure box_include_pt(x, y, z: double);
  function box_does_overlap_pt(x,y, z: double): longint;
  function box_is_finite: longint;

  destructor Destroy; override;
  end;

  { TTriangulation }

  TTriangulation=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldTriangulation;
   tvmem    : array of Byte;
  procedure Init;
  public
  property obj:PManifoldTriangulation read Fobj;

  constructor triangulate(ps: TPolygons; epsilon: double;   clean: Boolean);

  function triangulation_num_tri: Tsize_t;
  function triangulation_tri_verts: Plongint;

  destructor Destroy; override;
  end;

  { TRect }

  TRect=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldRect;
  procedure Init;
  public
  property obj:PManifoldRect read Fobj;

constructor cross_section_bounds( cs: PManifoldCrossSection); // ???
constructor rect( x1, y1, x2, y2: double);
constructor rect_union( a,b: TRect;  clean_a,clean_b: Boolean);
constructor rect_transform( r: TRect; x1, y1, x2, y2, x3, y3: double;  clean: Boolean);
constructor rect_translate( r: TRect; x, y: double ; clean: Boolean);
constructor rect_mul( r: TRect; x, y: double;  clean: Boolean);

function rect_min: TManifoldVec2;
function rect_max: TManifoldVec2;
function rect_dimensions: TManifoldVec2;
function rect_center: TManifoldVec2;
function rect_scale: double;
function rect_contains_pt( x, y: double): longint;
procedure rect_include_pt( x, y: double);
function rect_is_empty: longint;
function rect_is_finite: longint;

  destructor Destroy; override;
  end;


  { TCrossSectionVec }

  TCrossSectionVec=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldCrossSectionVec;
  procedure Init;
  public
  property obj:PManifoldCrossSectionVec read Fobj;

  constructor cross_section_decompose(cs: PManifoldCrossSection); // ????
  constructor cross_section_empty_vec;
  constructor cross_section_vec( sz: Tsize_t);

  procedure cross_section_vec_reserve( sz: Tsize_t);
  function cross_section_vec_length: Tsize_t;
  procedure cross_section_vec_set( idx: Tsize_t; cs: PManifoldCrossSection); // ????
  procedure cross_section_vec_push_back( cs: PManifoldCrossSection); // ????

  destructor Destroy; override;
  end;

  { TSimplePolygon }

  TSimplePolygon=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldSimplePolygon;
  procedure Init;
  public
  property obj:PManifoldSimplePolygon read Fobj;

  constructor simple_polygon(ps: PManifoldVec2; len: Tsize_t);
  constructor polygons_get_simple( ps: TPolygons; idx: Tsize_t; clean: Boolean);

  function simple_polygon_length: Tsize_t;
  function simple_polygon_get_point( idx: Tsize_t): TManifoldVec2;

  destructor Destroy; override;
  end;


  { TManifoldVec }

  TManifoldVec=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldManifoldVec;
  procedure Init;
  public
  property obj:PManifoldManifoldVec read Fobj;

  constructor manifold_empty_vec;
  constructor manifold_vec( sz: Tsize_t);

  procedure manifold_vec_reserve( sz: Tsize_t);
  function manifold_vec_length: Tsize_t;
  procedure manifold_vec_set( idx: Tsize_t; m: TManifold; clean: Boolean);
  procedure manifold_vec_push_back( m: TManifold; clean: Boolean);

  destructor Destroy; override;
  end;

  { TCrossSection }

  TCrossSection=class(TObject)
  private
  Fmem:array of Byte;
  Fobj:PManifoldCrossSection;
  procedure Init;
  public
  property obj:PManifoldCrossSection read Fobj;

  constructor  cross_section_empty;
  constructor  cross_section_copy( cs: TCrossSection; clean: Boolean);
  constructor  cross_section_of_simple_polygon( p: TSimplePolygon; fr: TManifoldFillRule; clean: Boolean);
  constructor  cross_section_of_polygons( p: TPolygons; fr: TManifoldFillRule; clean: Boolean);
  constructor  cross_section_square( x,y: double; center: longint);
  constructor  cross_section_circle( radius: double; circular_segments: longint);
  constructor  cross_section_compose( csv: TCrossSectionVec; clean: Boolean);
  constructor  cross_section_vec_get( csv: TCrossSectionVec; idx: Tsize_t; clean: Boolean);
  constructor  cross_section_boolean( a: TCrossSection; b: TCrossSection; op: TManifoldOpType; clean_a,clean_b: Boolean);
  constructor  cross_section_batch_boolean( csv: TCrossSectionVec; op: TManifoldOpType; clean: Boolean);
  constructor  cross_section_union( a: TCrossSection; b: TCrossSection; clean_a,clean_b: Boolean);
  constructor  cross_section_difference( a: TCrossSection; b: TCrossSection; clean_a,clean_b: Boolean);
  constructor  cross_section_intersection( a: TCrossSection; b: TCrossSection; clean_a,clean_b: Boolean);
  constructor  cross_section_hull( cs: TCrossSection; clean: Boolean);
  constructor  cross_section_batch_hull( css: TCrossSectionVec; clean: Boolean);
  constructor  cross_section_hull_simple_polygon( ps: TSimplePolygon; clean: Boolean);
  constructor  cross_section_hull_polygons( ps: TPolygons; clean: Boolean);
  constructor  cross_section_translate( cs: TCrossSection; x,y: double; clean: Boolean);
  constructor  cross_section_rotate( cs: TCrossSection; deg: double; clean: Boolean);
  constructor  cross_section_scale( cs: TCrossSection; x,y: double; clean: Boolean);
  constructor  cross_section_mirror( cs: TCrossSection; ax_x,ax_y: double; clean: Boolean);
  constructor  cross_section_transform( cs: TCrossSection; x1, y1,x2, y2, x3, y3: double; clean: Boolean);
  constructor  cross_section_warp( cs: TCrossSection; fun: Tsection_warp_func; clean: Boolean);
  constructor  cross_section_warp_context( cs: TCrossSection; fun: Twarp_context_func; ctx: pointer; clean: Boolean);
  constructor  cross_section_simplify( cs: TCrossSection; epsilon: double; clean: Boolean);
  constructor  cross_section_offset( cs: TCrossSection; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint; clean: Boolean);

  //function manifold_cross_section_area(cs: PManifoldCrossSection): double; cdecl; external libmanifoldc;
  //function manifold_cross_section_num_vert(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
  //function manifold_cross_section_num_contour(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
  //function manifold_cross_section_is_empty(cs: PManifoldCrossSection): longint; cdecl; external libmanifoldc;


  //function manifold_cross_section_area(cs: PManifoldCrossSection): double; cdecl; external libmanifoldc;
  //function manifold_cross_section_num_vert(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
  //function manifold_cross_section_num_contour(cs: PManifoldCrossSection): Tsize_t; cdecl; external libmanifoldc;
  //function manifold_cross_section_is_empty(cs: PManifoldCrossSection): longint; cdecl; external libmanifoldc;


  destructor Destroy; override;
  end;


  implementation

{ TCrossSection }


procedure TCrossSection.Init;
  var
    m_size: Tsize_t;
  begin
    m_size := manifold_cross_section_size();
     SetLength(Fmem, m_size);
end;

constructor TCrossSection.cross_section_empty;
begin
  Init;
  Fobj:= manifold_cross_section_empty(Pointer(Fmem));
end;

constructor TCrossSection.cross_section_copy(cs: TCrossSection; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_copy(Pointer(Fmem), cs.Fobj);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_of_simple_polygon(p: TSimplePolygon; fr: TManifoldFillRule; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_of_simple_polygon(Pointer(Fmem), p.Fobj, fr);
  if clean then p.Free;
end;

constructor TCrossSection.cross_section_of_polygons(p: TPolygons; fr: TManifoldFillRule; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_of_polygons(Pointer(Fmem), p.Fobj, fr);
  if clean then p.Free;
end;

constructor TCrossSection.cross_section_square(x, y: double; center: longint);
begin
  Init;
  Fobj:= manifold_cross_section_square(Pointer(Fmem), x,y, center);
end;

constructor TCrossSection.cross_section_circle(radius: double; circular_segments: longint);
begin
   Init;
 Fobj:= manifold_cross_section_circle(Pointer(Fmem), radius, circular_segments);
end;

constructor TCrossSection.cross_section_compose(csv: TCrossSectionVec; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_compose(Pointer(Fmem), csv.Fobj);
  if clean then csv.Free;
end;

constructor TCrossSection.cross_section_vec_get(csv: TCrossSectionVec; idx: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_vec_get(Pointer(Fmem), csv.Fobj, idx);
  if clean then csv.Free;
end;

constructor TCrossSection.cross_section_boolean(a: TCrossSection; b: TCrossSection; op: TManifoldOpType; clean_a, clean_b: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_boolean(Pointer(Fmem), a.Fobj, b.Fobj, op);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TCrossSection.cross_section_batch_boolean(csv: TCrossSectionVec; op: TManifoldOpType; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_batch_boolean(Pointer(Fmem), csv.Fobj, op);
  if clean then csv.Free;
end;

constructor TCrossSection.cross_section_union(a: TCrossSection; b: TCrossSection; clean_a, clean_b: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_union(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TCrossSection.cross_section_difference(a: TCrossSection; b: TCrossSection; clean_a, clean_b: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_difference(Pointer(Fmem), a.Fobj, b.Fobj);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TCrossSection.cross_section_intersection(a: TCrossSection; b: TCrossSection; clean_a, clean_b: Boolean);
begin
  Init;
  Fobj:=manifold_cross_section_intersection(Pointer(Fmem), a.Fobj,b.Fobj);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TCrossSection.cross_section_hull(cs: TCrossSection; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_hull(Pointer(Fmem), cs.Fobj);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_batch_hull(css: TCrossSectionVec; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_batch_hull(Pointer(Fmem), css.Fobj);
  if clean then css.Free;
end;

constructor TCrossSection.cross_section_hull_simple_polygon(ps: TSimplePolygon; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_hull_simple_polygon(Pointer(Fmem), ps.Fobj);
  if clean then ps.Free;
end;

constructor TCrossSection.cross_section_hull_polygons(ps: TPolygons; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_hull_polygons(Pointer(Fmem), ps.Fobj);
  if clean then ps.Free;
end;

constructor TCrossSection.cross_section_translate(cs: TCrossSection; x, y: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_translate(Pointer(Fmem), cs.Fobj, x,y);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_rotate(cs: TCrossSection; deg: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_rotate(Pointer(Fmem), cs.Fobj, deg);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_scale(cs: TCrossSection; x, y: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_scale(Pointer(Fmem), cs.Fobj, x, y);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_mirror(cs: TCrossSection; ax_x, ax_y: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_mirror(Pointer(Fmem), cs.Fobj, ax_x, ax_y);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_transform(cs: TCrossSection; x1, y1, x2, y2, x3, y3: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_transform(Pointer(Fmem), cs.Fobj, x1, y1, x2, y2, x3,y3);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_warp(cs: TCrossSection; fun: Tsection_warp_func; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_warp(Pointer(Fmem), cs.Fobj,fun);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_warp_context(cs: TCrossSection; fun: Twarp_context_func; ctx: pointer; clean: Boolean);
begin
  Init;
//  Fobj:= manifold_cross_section_warp_context(Pointer(Fmem), cs.Fobj, fun, ctx);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_simplify(cs: TCrossSection; epsilon: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_simplify(Pointer(Fmem), cs.Fobj, epsilon);
  if clean then cs.Free;
end;

constructor TCrossSection.cross_section_offset(cs: TCrossSection; delta: double; jt: TManifoldJoinType; miter_limit: double; circular_segments: longint; clean: Boolean);
begin
  Init;
  Fobj:= manifold_cross_section_offset(Pointer(Fmem), cs.Fobj, delta, jt, miter_limit, circular_segments);
  if clean then cs.Free;
end;

destructor TCrossSection.Destroy;
begin
  manifold_destruct_cross_section(Fobj);
  inherited Destroy;
end;









{ TManifold }

procedure TManifold.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_manifold_size;
   SetLength(Fmem, m_size);
end;

constructor TManifold.level_set(sdf: TManifoldSdf; bounds: TBox; edge_length, level, tolerance: double; ctx: pointer; clean: Boolean);
begin
  Init;
  Fobj:=manifold_level_set(Pointer( Fmem), sdf, bounds.Fobj, edge_length,level,tolerance, ctx);
   if clean then bounds.Free
end;

constructor TManifold.level_set_seq(sdf: TManifoldSdf; bounds: TBox; edge_length, level, tolerance: double; ctx: pointer; clean: Boolean);
begin
  Init;
  Fobj:= manifold_level_set_seq(Pointer( Fmem), sdf,bounds.Fobj, edge_length, level, tolerance, ctx);
   if clean then bounds.Free
end;

constructor TManifold.boolean(a, b: TManifold; op: TManifoldOpType; clean_a,clean_b: Boolean);
begin
  Init;
  Fobj:=  manifold_boolean(Pointer( Fmem), a.Fobj, b.Fobj, op);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.batch_boolean(ms: TManifoldVec; op: TManifoldOpType; clean: Boolean);
begin
  Init;
  Fobj:= manifold_batch_boolean(Pointer( Fmem), ms.Fobj, op);
   if clean then ms.Free
end;

constructor TManifold.union(a, b: TManifold; clean_a,clean_b: Boolean);
begin
  Init;
  Fobj:= manifold_union(Pointer( Fmem), a.Fobj, b.Fobj);
  if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.difference(a, b: TManifold; clean_a,clean_b: Boolean);
begin
   Init;
Fobj:= manifold_difference(Pointer( Fmem), a.Fobj, b.Fobj);
  if clean_a then a.Free;
  if clean_b then b.Free;
end;

constructor TManifold.intersection(a, b: TManifold; clean_a,clean_b: Boolean);
begin
  Init;
  Fobj:=  manifold_intersection(Pointer( Fmem), a.Fobj, b.Fobj);
 if clean_a then a.Free;
 if clean_b then b.Free;
end;

constructor TManifold.trim_by_plane(m: TManifold; normal_x, normal_y, normal_z, offset: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_trim_by_plane(Pointer( Fmem), m.Fobj, normal_x, normal_y, normal_z, offset);
 if clean then m.Free;
end;

constructor TManifold.hull(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:= manifold_hull(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.batch_hull(ms: TManifoldVec; clean: Boolean);
begin
  Init;
  Fobj:=   manifold_batch_hull(Pointer( Fmem),ms.Fobj);
   if clean then ms.Free
end;

constructor TManifold.hull_pts(ps: PManifoldVec3; length: Tsize_t);
begin
  Init;
  Fobj:=   manifold_hull_pts(Pointer( Fmem), ps, length);
end;

constructor TManifold.translate(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=      manifold_translate(Pointer( Fmem), m.Fobj, x, y,z);
  if clean then m.Free;
end;

constructor TManifold.rotate(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=manifold_rotate(Pointer( Fmem), m.Fobj, x, y,z);
  if clean then m.Free;
end;

constructor TManifold.scale(m: TManifold; x, y, z: double; clean: Boolean);
begin
  Init;
Fobj:=   manifold_scale(Pointer( Fmem), m.Fobj, x, y, z);
  if clean then m.Free;
end;

constructor TManifold.transform(m: TManifold; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: Boolean);
begin
  Init;
Fobj:=manifold_transform(Pointer( Fmem), m.Fobj ,x1, y1, z1, x2, y2, z2, x3,y3, z3,x4, y4, z4);
  if clean then m.Free;
end;

constructor TManifold.mirror(m: TManifold; nx, ny, nz: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_mirror(Pointer( Fmem), m.Fobj, nx,ny, nz);
  if clean then m.Free;
end;

constructor TManifold.empty;
begin
  Init;
Fobj:= manifold_empty(Pointer( Fmem));
end;

constructor TManifold.copy(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=  manifold_copy(Pointer( Fmem),m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.tetrahedron;
begin
  Init;
Fobj:= manifold_tetrahedron(Pointer( Fmem));
end;

constructor TManifold.warp(m: TManifold; fun: Twarp_func; ctx: pointer; clean: Boolean);
begin
  Init;
Fobj:=manifold_warp(Pointer( Fmem), m.Fobj, fun, ctx);
  if clean then m.Free;
end;

constructor TManifold.smooth_by_normals(m: TManifold; normalIdx: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_smooth_by_normals(Pointer( Fmem), m.Fobj, normalIdx);
  if clean then m.Free;
end;

constructor TManifold.smooth_out(m: TManifold; minSharpAngle, minSmoothness: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_smooth_out(Pointer( Fmem), m.Fobj, minSharpAngle, minSmoothness);
  if clean then m.Free;
end;

constructor TManifold.refine(m: TManifold; refine: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine(Pointer( Fmem), m.Fobj, refine);
  if clean then m.Free;
end;

constructor TManifold.refine_to_length(m: TManifold; length: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine_to_length(Pointer( Fmem), m.Fobj,length);
  if clean then m.Free;
end;

constructor TManifold.refine_to_tolerance(m: TManifold; tolerance: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_refine_to_tolerance(Pointer( Fmem), m.Fobj, tolerance);
  if clean then m.Free;
end;

constructor TManifold.manifold_vec_get(ms: TManifoldVec; idx: Tsize_t; clean: Boolean);
begin
  Init;
 Fobj:=manifold_manifold_vec_get(Pointer( Fmem), ms.Fobj, idx);
 if clean then ms.Free
end;

constructor TManifold.cube(x, y, z: double; center: longint);
begin
  Init;
Fobj:=  manifold_cube(Pointer( Fmem), x, y, z,center);
end;

constructor TManifold.cylinder(height, radius_low, radius_high: double; circular_segments, center: longint);
begin
  Init;
Fobj:=manifold_cylinder(Pointer( Fmem), height, radius_low, radius_high, circular_segments, center);
end;

constructor TManifold.sphere(radius: double; circular_segments: longint);
begin
  Init;
  Fobj:=manifold_sphere(Pointer( Fmem), radius,circular_segments);
end;

constructor TManifold.of_meshgl(mesh: TMeshGL; clean: Boolean);
begin
  Init;
  Fobj:=manifold_of_meshgl(Pointer( Fmem), mesh.Fobj);
   if clean then mesh.Free
end;

constructor TManifold.of_meshgl64(mesh: TMeshGL64; clean: Boolean);
begin
  Init;
  Fobj:=manifold_of_meshgl64(Pointer( Fmem), mesh.Fobj);
   if clean then mesh.Free
end;

constructor TManifold.smooth(mesh: TMeshGL; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:=manifold_smooth(Pointer( Fmem),mesh.Fobj, half_edges, smoothness, n_idxs);
   if clean then mesh.Free
end;

constructor TManifold.smooth64(mesh: TMeshGL64; half_edges: Psize_t; smoothness: Pdouble; n_idxs: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:= manifold_smooth64(Pointer( Fmem), mesh.Fobj,half_edges, smoothness, n_idxs);
   if clean then mesh.Free
end;

constructor TManifold.extrude(cs: TPolygons; height: double; slices: longint; twist_degrees, scale_x, scale_y: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_extrude(Pointer( Fmem), cs.Fobj, height, slices,twist_degrees, scale_x, scale_y);
   if clean then cs.Free
end;

constructor TManifold.revolve(cs: TPolygons; circular_segments: longint; revolve_degrees: double; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_revolve(Pointer( Fmem), cs.Fobj, circular_segments, revolve_degrees);
   if clean then cs.Free
end;

constructor TManifold.compose(ms: TManifoldVec; clean: Boolean);
begin
  Init;
  Fobj:= manifold_compose(Pointer( Fmem), ms.Fobj);
  if clean then ms.Free
end;

constructor TManifold.decompose(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:= manifold_decompose(Pointer( Fmem),m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.as_original(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=  manifold_as_original(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TManifold.set_properties(m: TManifold; num_prop: longint; fun: Tproperties_func; ctx: pointer; clean: Boolean);
begin
  Init;
Fobj:= manifold_set_properties(Pointer( Fmem), m.Fobj, num_prop,fun, ctx);
  if clean then m.Free;
end;

constructor TManifold.calculate_curvature(m: TManifold; gaussian_idx, mean_idx: longint; clean: Boolean);
begin
  Init;
Fobj:= manifold_calculate_curvature(Pointer( Fmem), m.Fobj, gaussian_idx,mean_idx);
  if clean then m.Free;
end;

constructor TManifold.calculate_normals(m: TManifold;  normal_idx: longint; min_sharp_angle: double; clean: Boolean);
begin
  Init;
Fobj:= manifold_calculate_normals(Pointer( Fmem), m.Fobj, normal_idx, min_sharp_angle);
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
  inherited Destroy;
end;

{ TMeshGL }

procedure TMeshGL.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
   SetLength(Fmem, m_size);
end;

constructor TMeshGL.meshgl(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t);
begin
  Init;
Fobj:= manifold_meshgl(Pointer( Fmem), vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGL.meshgl_w_tangents(vert_props: Psingle; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint32_t; n_tris: Tsize_t; halfedge_tangent: Psingle);
begin
  Init;
Fobj:=manifold_meshgl_w_tangents(Pointer( Fmem), vert_props, n_verts, n_props, tri_verts, n_tris,halfedge_tangent);
end;

constructor TMeshGL.get_meshgl(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=manifold_get_meshgl(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL.meshgl_copy(m: TMeshGL; clean: Boolean);
begin
  Init;
Fobj:= manifold_meshgl_copy(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL.meshgl_merge(m: TMeshGL; clean: Boolean);
begin
  Init;
Fobj:=manifold_meshgl_merge(Pointer( Fmem), m.Fobj);
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
SetLength(mtvmem, len * SizeOf(Tuint32_t));
Result:=manifold_meshgl_merge_to_vert(Pointer(mtvmem), Fobj);
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
  inherited Destroy;
end;


{ TMeshGL64 }

procedure TMeshGL64.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_meshgl_size;
   SetLength( Fmem, m_size);
end;

constructor TMeshGL64.meshgl(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t);
begin
  Init;
Fobj:= manifold_meshgl64(Pointer( Fmem), vert_props, n_verts, n_props, tri_verts, n_tris);
end;

constructor TMeshGL64.meshgl_w_tangents(vert_props: PDouble; n_verts: Tsize_t; n_props: Tsize_t; tri_verts: Puint64_t; n_tris: Tsize_t; halfedge_tangent: PDouble);
begin
  Init;
Fobj:=manifold_meshgl64_w_tangents(Pointer( Fmem), vert_props, n_verts, n_props, tri_verts, n_tris,halfedge_tangent);
end;

constructor TMeshGL64.get_meshgl(m: TManifold; clean: Boolean);
begin
  Init;
Fobj:=manifold_get_meshgl64(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL64.meshgl_copy(m: TMeshGL64; clean: Boolean);
begin
  Init;
Fobj:= manifold_meshgl64_copy(Pointer( Fmem), m.Fobj);
  if clean then m.Free;
end;

constructor TMeshGL64.meshgl_merge(m: TMeshGL64; clean: Boolean);
begin
  Init;
Fobj:=manifold_meshgl64_merge(Pointer( Fmem), m.Fobj);
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
SetLength(mtvmem, len * SizeOf(Tuint64_t));
Result:=manifold_meshgl64_merge_to_vert(Pointer(mtvmem), Fobj);
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
  manifold_destruct_meshgl64(Fobj);
  inherited Destroy;
end;


{ TPolygons }

procedure TPolygons.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_polygons_size;
   SetLength(Fmem, m_size);
end;

constructor TPolygons.polygons(ps: PPManifoldSimplePolygon; len: Tsize_t);
begin
  Init;
  Fobj:=manifold_polygons(Pointer( Fmem), ps, len);
//  if clean then m.Free;
end;

constructor TPolygons.slice(m: TManifold; height: double; clean: Boolean);
begin
  Init;
  Fobj:= manifold_slice(Pointer( Fmem), m.Fobj, height);
 if clean then m.Free;
end;

constructor TPolygons.project(m: TManifold; clean: Boolean);
begin
  Init;
  Fobj:=  manifold_project(Pointer( Fmem), m.Fobj);
 if clean then m.Free;
end;

constructor TPolygons.cross_section_to_polygons(cs: PManifoldCrossSection);
begin
  Init;
  Fobj:=manifold_cross_section_to_polygons(Pointer( Fmem), cs);
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
  inherited Destroy;
end;

{ TBox }

procedure TBox.Init;
var
  m_size: Tsize_t;
begin
 m_size := manifold_box_size;
  SetLength(Fmem, m_size);
end;

constructor TBox.box(x1, y1, z1, x2, y2, z2: double);
begin
 Init;
 Fobj:=manifold_box(Pointer( Fmem) ,x1, y1,z1, x2, y2,z2);
end;

constructor TBox.bounding_box(m: TManifold; clean: Boolean);
begin
 Init;
 Fobj:=manifold_bounding_box(Pointer( Fmem), m.Fobj);
 if clean then m.Free;
 end;

constructor TBox.box_union(a: TBox; b: TBox; clean_a,clean_b: Boolean);
begin
 Init;
 Fobj:= manifold_box_union(Pointer( Fmem) ,a.Fobj, b.Fobj);
 if clean_a then a.Free;
if clean_b then b.Free;
end;

constructor TBox.translate(b: TBox; x, y, z: double; clean: Boolean);
begin
 Init;
 Fobj:= manifold_box_translate(Pointer( Fmem) ,b.Fobj, x, y, z);
 if clean then b.Free;
end;

constructor TBox.box_mul(b: TBox; x, y, z: double; clean: Boolean);
begin
 Init;
 Fobj:=manifold_box_mul(Pointer( Fmem),b.Fobj, x, y, z);
 if clean then b.Free;
end;

constructor TBox.box_transform(b: TBox; x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4: double; clean: Boolean);
begin
 Init;
 Fobj:= manifold_box_transform(Pointer( Fmem), b.Fobj, x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);
 if clean then b.Free;
end;

function TBox.box_min: TManifoldVec3;
begin
Result:=manifold_box_min(Fobj);
end;

function TBox.box_max: TManifoldVec3;
begin
 Result:=manifold_box_max(Fobj);
end;

function TBox.box_dimensions: TManifoldVec3;
begin
 Result:= manifold_box_dimensions(Fobj);
end;

function TBox.box_center: TManifoldVec3;
begin
 Result:= manifold_box_center(Fobj);
end;

function TBox.box_scale: double;
begin
 Result:=manifold_box_scale(Fobj);
end;

function TBox.box_contains_pt(x, y, z: double): longint;
begin
 Result:= manifold_box_contains_pt(Fobj,x, y,z);
end;

procedure TBox.box_include_pt(x, y, z: double);
begin
manifold_box_include_pt(Fobj, x, y, z);
end;

function TBox.box_does_overlap_pt(x, y, z: double): longint;
begin
 Result:= manifold_box_does_overlap_pt(Fobj, x, y, z);
end;

function TBox.box_is_finite: longint;
begin
 Result:= manifold_box_is_finite(Fobj);
end;

destructor TBox.Destroy;
begin
 manifold_destruct_box(Fobj);
 inherited Destroy;
end;

{ TTriangulation }

procedure TTriangulation.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_triangulation_size;
   SetLength(Fmem, m_size);
end;

constructor TTriangulation.triangulate(ps: TPolygons; epsilon: double; clean: Boolean);
begin
 Init;
 Fobj:=  manifold_triangulate(Pointer( Fmem), ps.Fobj,epsilon);
  if clean then ps.Free
end;

function TTriangulation.triangulation_num_tri: Tsize_t;
begin
Result:=manifold_triangulation_num_tri(Pointer(Fmem));
end;

function TTriangulation.triangulation_tri_verts: Plongint;
var
  len: Tsize_t;
begin
  len := triangulation_num_tri;
SetLength(tvmem, len * 3* SizeOf(Longint));
Result:=manifold_triangulation_tri_verts(Pointer( tvmem),  Fobj);
end;

destructor TTriangulation.Destroy;
begin
 manifold_destruct_triangulation(Fobj);
  inherited Destroy;
end;

{ TRect }

procedure TRect.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_rect_size;
   SetLength(Fmem, m_size);
end;

constructor TRect.cross_section_bounds(cs: PManifoldCrossSection);
begin
  Init;
  Fobj:=manifold_cross_section_bounds(Pointer( Fmem), cs);
 //  if clean then bounds.Free
end;

constructor TRect.rect(x1, y1, x2, y2: double);
begin
  Init;
  Fobj:=manifold_rect(Pointer( Fmem), x1, y1, x2, y2);
end;

constructor TRect.rect_union(a, b: TRect; clean_a, clean_b: Boolean);
begin
  Init;
  Fobj:=manifold_rect_union(Pointer( Fmem), a.Fobj,b.Fobj);
  if clean_a then a.Free;
  if clean_b then b.Free ;
end;

constructor TRect.rect_transform(r: TRect; x1, y1, x2, y2, x3, y3: double; clean: Boolean);
begin
  Init;
  Fobj:=manifold_rect_transform(Pointer( Fmem), r.Fobj, x1, y1, x2,y2, x3, y3);
   if clean then r.Free;
end;

constructor TRect.rect_translate(r: TRect; x, y: double; clean: Boolean);
begin
  Init;
  Fobj:=     manifold_rect_translate(Pointer( Fmem), r.Fobj, x, y);
   if clean then r.Free ;
end;

constructor TRect.rect_mul(r: TRect; x, y: double; clean: Boolean);
begin
  Init;
  Fobj:=     manifold_rect_mul(Pointer( Fmem), r.Fobj, x, y);
   if clean then r.Free  ;
end;

function TRect.rect_min: TManifoldVec2;
begin
Result:=  manifold_rect_min(Fobj);
end;

function TRect.rect_max: TManifoldVec2;
begin
  Result:=  manifold_rect_max(Fobj);
end;

function TRect.rect_dimensions: TManifoldVec2;
begin
  Result:=  manifold_rect_dimensions(Fobj);
end;

function TRect.rect_center: TManifoldVec2;
begin
  Result:=  manifold_rect_center(Fobj);
end;

function TRect.rect_scale: double;
begin
  Result:=  manifold_rect_scale(Fobj);
end;

function TRect.rect_contains_pt(x, y: double): longint;
begin
  Result:=  manifold_rect_contains_pt(Fobj, x, y);
end;

procedure TRect.rect_include_pt(x, y: double);
begin
  manifold_rect_include_pt(Fobj, x, y);
end;

function TRect.rect_is_empty: longint;
begin
  Result:=  manifold_rect_is_empty(Fobj);
end;

function TRect.rect_is_finite: longint;
begin
  Result:=  manifold_rect_is_finite(Fobj);
end;

destructor TRect.Destroy;
begin
  manifold_destruct_rect(Fobj);
  inherited Destroy;
end;

{ TCrossSectionVec }

procedure TCrossSectionVec.Init;
var
  m_size: Tsize_t;
begin
  m_size := manifold_cross_section_vec_size;
   SetLength(Fmem, m_size);
end;

constructor TCrossSectionVec.cross_section_decompose(cs: PManifoldCrossSection);
begin
  Init;
  Fobj:=   manifold_cross_section_decompose(Pointer( Fmem), cs);
//   if clean then bounds.Free
end;

constructor TCrossSectionVec.cross_section_empty_vec;
begin
  Init;
  Fobj:=  manifold_cross_section_empty_vec(Pointer( Fmem));
end;

constructor TCrossSectionVec.cross_section_vec(sz: Tsize_t);
begin
  Init;
  Fobj:= manifold_cross_section_vec(Pointer( Fmem), sz);
end;

procedure TCrossSectionVec.cross_section_vec_reserve(sz: Tsize_t);
begin
 manifold_cross_section_vec_reserve(Fobj, sz);
end;

function TCrossSectionVec.cross_section_vec_length: Tsize_t;
begin
Result:= manifold_cross_section_vec_length(Fobj);
end;

procedure TCrossSectionVec.cross_section_vec_set(idx: Tsize_t; cs: PManifoldCrossSection);
begin
manifold_cross_section_vec_set(Fobj,idx,cs);
end;

procedure TCrossSectionVec.cross_section_vec_push_back(cs: PManifoldCrossSection);
begin
 manifold_cross_section_vec_push_back(Fobj,cs);
end;

destructor TCrossSectionVec.Destroy;
begin
  manifold_destruct_cross_section_vec(Fobj);
  inherited Destroy;
end;

{ TSimplePolygon }

procedure TSimplePolygon.Init;
  var
    m_size: Tsize_t;
  begin
    m_size := manifold_simple_polygon_size;
     SetLength(Fmem, m_size);
end;

constructor TSimplePolygon.simple_polygon(ps: PManifoldVec2; len: Tsize_t);
begin
  Init;
  Fobj:= manifold_simple_polygon(Pointer( Fmem), ps, len);
end;

constructor TSimplePolygon.polygons_get_simple(ps: TPolygons; idx: Tsize_t; clean: Boolean);
begin
  Init;
  Fobj:=manifold_polygons_get_simple(Pointer( Fmem), ps.Fobj, idx);
   if clean then ps.Free
end;

function TSimplePolygon.simple_polygon_length: Tsize_t;
begin
 Result:=manifold_simple_polygon_length(Fobj);
end;

function TSimplePolygon.simple_polygon_get_point(idx: Tsize_t): TManifoldVec2;
begin
Result:=manifold_simple_polygon_get_point(Fobj ,idx);
end;

destructor TSimplePolygon.Destroy;
begin
  manifold_destruct_simple_polygon(Fobj);
  inherited Destroy;
end;

{ TManifoldVec }

procedure TManifoldVec.Init;
  var
    m_size: Tsize_t;
  begin
    m_size := manifold_manifold_vec_size;
     SetLength(Fmem, m_size);
end;

constructor TManifoldVec.manifold_empty_vec;
begin
  Init;
  Fobj:=manifold_manifold_empty_vec(Pointer( Fmem));
end;

constructor TManifoldVec.manifold_vec(sz: Tsize_t);
begin
  Init;
  Fobj:=manifold_manifold_vec(Pointer( Fmem), sz);
end;

procedure TManifoldVec.manifold_vec_reserve(sz: Tsize_t);
begin
  manifold_manifold_vec_reserve(Fobj, sz);
end;

function TManifoldVec.manifold_vec_length: Tsize_t;
begin
 Result:=manifold_manifold_vec_length(Fobj);
end;

procedure TManifoldVec.manifold_vec_set(idx: Tsize_t; m: TManifold; clean: Boolean);
begin
  manifold_manifold_vec_set(Fobj, idx,m.Fobj);
   if clean then m.Free
end;

procedure TManifoldVec.manifold_vec_push_back(m: TManifold; clean: Boolean);
begin
manifold_manifold_vec_push_back(Fobj, m.Fobj);
   if clean then m.Free
end;

destructor TManifoldVec.Destroy;
begin
  manifold_destruct_manifold_vec(Fobj);
  inherited Destroy;
end;



end.






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


//




//function manifold_rect_contains_rect(a: PManifoldRect; b: PManifoldRect): longint; cdecl; external libmanifoldc;
//function manifold_rect_does_overlap_rect(a: PManifoldRect; r: PManifoldRect): longint; cdecl; external libmanifoldc;


//function manifold_box_contains_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;
//function manifold_box_does_overlap_box(a: PManifoldBox; b: PManifoldBox): longint; cdecl; external libmanifoldc;



//
//procedure manifold_set_min_circular_angle(degrees: double); cdecl; external libmanifoldc;
//procedure manifold_set_min_circular_edge_length(length: double); cdecl; external libmanifoldc;
//procedure manifold_set_circular_segments(number: longint); cdecl; external libmanifoldc;
//procedure manifold_reset_to_circular_defaults; cdecl; external libmanifoldc;
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




