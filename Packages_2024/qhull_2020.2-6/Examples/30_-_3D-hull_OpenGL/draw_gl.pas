unit draw_gl;

interface

uses
  fp_glew,
  fp_qhull_r;

var
  is3D: boolean = False;

procedure InitPoints(count: integer);
procedure InitScene_Qc;
procedure draw;
procedure CloseScene;


implementation

type
  TVector4f = array[0..3] of single;

  TVector3d = array[0..2] of double;

var
  points: array of TVector3d = nil;
  ListeID: TGLuint;

procedure InitPoints(count: integer);
var
  i: integer;
const
  len = 2.5;
begin
  Randomize;
  SetLength(points, count);
  for i := 0 to count - 1 do begin
    points[i, 0] := Random * (2 * len) - len;
    points[i, 1] := Random * (2 * len) - len;
    points[i, 2] := Random * (2 * len) - len;
  end;
end;

procedure InitScene_Qc;
var
  qh: PqhT;
  i, j: integer;
  facet: PfacetT;
  curlong, totlong, id: longint;
  vertex: PvertexT;
begin
  ListeID := glGenLists(1);
  glNewList(ListeID, GL_COMPILE);

  glPointSize(5.0);
  glBegin(GL_POINTS);
  glColor3f(0, 1, 0);
  for  i := 0 to Length(points) - 1 do begin
    glVertex3dv(points[i]);
  end;
  glEnd;

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, fp_qhull_r.stdout);
  exitcode := qh_new_qhull(qh, 3, Length(points), PcoordT(points), False, 'qhull Qc', fp_qhull_r.stdout, fp_qhull_r.stdout);
  if exitcode = 0 then begin
    WriteLn('Input: ', qh^.input_dim, 'D  Output: ', qh^.hull_dim, 'D');

    // --- vertex_list
    glPointSize(10.0);
    glBegin(GL_POINTS);
    glColor3f(1, 0, 0);
    vertex := qh^.vertex_list;
    WriteLn(#10'--- Vertex-List ---  (', qh^.num_vertices, ')');
    while (vertex <> nil) and (vertex^.next <> nil) do begin
      id := qh_pointid(qh, vertex^.point);
      WriteLn('  pid: ', id: 4, '  vid: ', vertex^.id: 3, '.    ', vertex^.point[0]: 2: 1, ' ', vertex^.point[1]: 2: 1);
      glVertex3dv(vertex^.point);
      vertex := vertex^.next;
    end;
    glEnd;

    WriteLn;

    // --- facet_list
    glBegin(GL_TRIANGLES);
    glColor3f(1, 1, 1);
    facet := qh^.facet_list;
    WriteLn('--- Facet_List ---  (', qh^.num_facets, ')');
    while (facet <> nil) and (facet^.next <> nil) do begin
      if facet^.vertices <> nil then begin
        for i := 0 to qh_setsize(qh, facet^.vertices) - 1 do begin;
          vertex := facet^.vertices^.e[i].p;
          Write('  pid: ', id, '  vid: ', vertex^.id: 3, '.    ');
          for j := 0 to qh^.hull_dim - 1 do begin
            Write(vertex^.point[j]: 2: 1, ' ');
          end;
          WriteLn;
          glVertex3dv(vertex^.point);
        end;
        WriteLn();
      end;

      facet := facet^.next;
    end;
    glEnd;
  end;
  qh_freeqhull(qh, qh_ALL);
  qh_memfreeshort(qh, @curlong, @totlong);
  qh_free(qh);

  glEndList();
end;

procedure draw;
const
  scale = 2.0;
  w: single = 0;
var
  sun_direction: TVector4f = (1.0, 1.0, 1.0, 0.0);
  sun_diffuse: TVector4f = (1.0, 1.0, 1.0, 1.0);
  sun_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);

  mat_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);
  mat_shininess: single = 110.0;

  meineObjektFarbe: TVector4f = (0.8, 0.8, 0.8, 1.0);
  mat_emission: TVector4f = (0.2, 0.0, 0.0, 1.0);

begin
  glClearColor(0.05, 0.05, 0.1, 1.0);
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

  glEnable(GL_DEPTH_TEST);
  glEnable(GL_NORMALIZE);
  glShadeModel(GL_SMOOTH);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

  glLightfv(GL_LIGHT0, GL_POSITION, @sun_direction);
  glLightfv(GL_LIGHT0, GL_DIFFUSE, @sun_diffuse);
  glLightfv(GL_LIGHT0, GL_SPECULAR, @sun_specular);

  glEnable(GL_LIGHTING);
  glEnable(GL_LIGHT0);

  glMaterialfv(GL_FRONT, GL_AMBIENT, @meineObjektFarbe);
  glMaterialfv(GL_FRONT, GL_DIFFUSE, @meineObjektFarbe);
  glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  glMaterialf(GL_FRONT, GL_SHININESS, mat_shininess);
  glMaterialfv(GL_FRONT, GL_EMISSION, @mat_emission);

  glTranslatef(0, 0, -30);
  glScalef(scale, scale, scale);

  if is3D then begin
    glRotatef(w, 1.0, 0.8, 0.3);
    w := w + 0.8;
  end;

  glCallList(ListeID);
end;

procedure CloseScene;
begin
  glDeleteLists(ListeID, 1);
end;


end.
