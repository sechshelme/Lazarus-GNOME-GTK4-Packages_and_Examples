unit draw_gl;

interface

uses
  fp_glew,
  fp_qhull_r;

procedure InitPoints(count: integer);
procedure InitScene_Qc;
procedure InitScene_d_QT;
procedure draw;
procedure CloseScene;


implementation

type
  TVector2f = array[0..1] of single;
  TVector3f = array[0..2] of single;
  TVector4f = array[0..3] of single;

  TVector2d = array[0..1] of double;


var
  points: array of TVector2d = nil;
  ListeID: TGLuint;

procedure InitPoints(count: integer);
var
  i: integer;
begin
  Randomize;
  SetLength(points, count);
  for i := 0 to count - 1 do begin
    points[i, 0] := Random * 5 - 2.5;
    points[i, 1] := Random * 5 - 2.5;
  end;
end;

procedure InitScene_Qc;

var
  // Opengl
  v: TVector2f;

  // qh
  qh: PqhT;
  i, j: integer;
  facet: PfacetT;
  num_vertices, curlong, totlong, id: longint;
  vertex: PvertexT;

begin
  ListeID := glGenLists(1);
  glNewList(ListeID, GL_COMPILE);

  glPointSize(5.0);

  glBegin(GL_POINTS);
  glColor3f(0, 1, 0);
  for  i := 0 to Length(points) - 1 do begin
    v[0] := points[i][0];
    v[1] := points[i][1];
    glVertex2fv(@v);
  end;
  glEnd;

  // ==== qh

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, fp_qhull_r.stdout);
  exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull Qc', fp_qhull_r.stdout, fp_qhull_r.stdout);
  WriteLn('Eingabe-Dimension: ', qh^.input_dim); // Sollte 2 sein
  WriteLn('Rechen-Dimension (Z-Achse): ', qh^.hull_dim); // Sollte 3 sein
  if exitcode = 0 then begin

    // --- vertex_list
    glPointSize(10.0);
    glBegin(GL_POINTS);
    glColor3f(1, 0, 0);
    vertex := qh^.vertex_list;
    WriteLn(#10'--- Vertex-List ---  (', qh^.num_vertices, ')');
    while (vertex <> nil) and (vertex^.next <> nil) do begin

      id := qh_pointid(qh, vertex^.point);
      v[0] := vertex^.point[0];
      v[1] := vertex^.point[1];
      WriteLn('  pid: ', id: 4, '  vid: ', vertex^.id: 3, '.    ', v[0]: 2: 1, ' ', v[1]: 2: 1);
      glVertex2fv(@v);

      vertex := vertex^.next;
    end;
    glEnd;

    WriteLn;

    // --- facet_list
    glBegin(GL_LINES);
    glColor3f(1, 1, 1);
    facet := qh^.facet_list;
    WriteLn('--- Facet_List ---  (', qh^.num_facets, ')');
    while (facet <> nil) and (facet^.next <> nil) do begin

      if facet^.vertices <> nil then begin
        num_vertices := qh_setsize(qh, facet^.vertices);

        for i := 0 to num_vertices - 1 do begin;
          vertex := facet^.vertices^.e[i].p;
          Write('  pid: ', id, '  vid: ', vertex^.id: 3, '.    ');
          for j := 0 to qh^.hull_dim - 1 do begin
            v[j] := vertex^.point[j];
            Write(v[j]: 2: 1, ' ');
          end;
          WriteLn;
          glVertex2fv(@v);
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

  // === OpenGL

  glEndList();
end;

procedure InitScene_d_QT;
var
  // Opengl
  v: TVector3f;

  // qh
  qh: PqhT;
  i: integer;
  facet: PfacetT;
  num_vertices, curlong, totlong, id: longint;
  vertex: PvertexT;

begin
  ListeID := glGenLists(1);
  glNewList(ListeID, GL_COMPILE);

  glPointSize(5.0);

  glBegin(GL_POINTS);
  glColor3f(0, 1, 0);
  for  i := 0 to Length(points) - 1 do begin
    v[0] := points[i][0];
    v[1] := points[i][1];
    glVertex2fv(@v);
  end;
  glEnd;

  // ==== qh

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, fp_qhull_r.stdout);
  exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull d Qt', fp_qhull_r.stdout, fp_qhull_r.stdout);
  if exitcode = 0 then begin
    WriteLn('Eingabe-Dimension: ', qh^.input_dim); // Sollte 2 sein
    WriteLn('Rechen-Dimension (Z-Achse): ', qh^.hull_dim); // Sollte 3 sein

    // --- vertex_list
    glPointSize(10.0);
    glBegin(GL_POINTS);
    glColor3f(1, 0, 0);
    vertex := qh^.vertex_list;
    WriteLn(#10'--- Vertex-List ---  (', qh^.num_vertices, ')');
    while (vertex <> nil) and (vertex^.next <> nil) do begin
      id := qh_pointid(qh, vertex^.point);

      Write('  pid: ', id: 4, '  vid: ', vertex^.id: 3, '.    ');
      for i := 0 to qh^.hull_dim - 1 do begin
        v[i] := vertex^.point[i];
        Write(v[i]: 2: 1, ' ');
      end;
      WriteLn;
      if qh^.hull_dim = 2 then  begin
        glVertex2fv(@v);
      end else begin
        glVertex3fv(@v);
      end;
      vertex := vertex^.next;
    end;
    glEnd;

    WriteLn;

    // --- facet_list
    facet := qh^.facet_list;
    WriteLn('--- Facet_List ---  (', qh^.num_facets, ')');
    while (facet <> nil) and (facet^.next <> nil) do begin

      if facet^.upperdelaunay = 0 then begin
        if facet^.vertices <> nil then begin
          num_vertices := qh_setsize(qh, facet^.vertices);

          glBegin(GL_LINE_LOOP);
          for i := 0 to num_vertices - 1 do begin;
            glColor3f(1, 1, 1);
            vertex := facet^.vertices^.e[i].p;
            v[0] := vertex^.point[0];
            v[1] := vertex^.point[1];
            v[2] := vertex^.point[2];
            WriteLn('  ', vertex^.id: 3, '.  ', v[0]: 2: 1, ' ', v[1]: 2: 1, ' ', v[2]: 2: 1);
            if qh^.hull_dim = 2 then  begin
              glVertex2fv(@v);
            end else begin
              glVertex3fv(@v);
            end;

          end;
          glEnd;
          WriteLn();
        end;
      end;
      facet := facet^.next;
    end;
  end;
  qh_freeqhull(qh, qh_ALL);
  qh_memfreeshort(qh, @curlong, @totlong);
  qh_free(qh);


  // === OpenGL

  glEndList();
end;

procedure draw;
const
  scale = 6.0;
  w: single = 0;
var
  sun_direction: TVector4f = (1.0, 1.0, 1.0, 0.0);
  sun_diffuse: TVector4f = (1.0, 1.0, 1.0, 1.0);
  sun_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);

  mat_specular: TVector4f = (1.0, 1.0, 1.0, 1.0);
  mat_shininess: single = 110.0;

  meineObjektFarbe: TVector4f = (0.8, 0.0, 0.0, 1.0);
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

  //glLightfv(GL_LIGHT0, GL_POSITION, @sun_direction);
  //glLightfv(GL_LIGHT0, GL_DIFFUSE, @sun_diffuse);
  //glLightfv(GL_LIGHT0, GL_SPECULAR, @sun_specular);
  //
  //glEnable(GL_LIGHTING);
  //glEnable(GL_LIGHT0);
  //
  //glMaterialfv(GL_FRONT, GL_AMBIENT, @meineObjektFarbe);
  //glMaterialfv(GL_FRONT, GL_DIFFUSE, @meineObjektFarbe);
  //glMaterialfv(GL_FRONT, GL_SPECULAR, @mat_specular);
  //glMaterialf(GL_FRONT, GL_SHININESS, mat_shininess);
  //glMaterialfv(GL_FRONT, GL_EMISSION, @mat_emission);

  glTranslatef(0, 0, -30);
  glScalef(scale, scale, scale);

    glRotatef(w, 1.0, 0.8, 0.3);
  w := w + 0.8;

  glCallList(ListeID);
end;

procedure CloseScene;
begin
  glDeleteLists(ListeID, 1);
end;


end.
