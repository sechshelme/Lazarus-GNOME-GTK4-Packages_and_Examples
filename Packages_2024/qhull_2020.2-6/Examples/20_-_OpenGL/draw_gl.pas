unit draw_gl;

interface

uses
  fp_glew,
  fp_qhull_r;

var
  is3D: boolean = False;

procedure InitPoints(count: integer);
procedure InitScene_Qc;
procedure InitScene_d_QT;
procedure InitScene_v_Qbb;
procedure draw;
procedure CloseScene;


implementation

type
  TVector2d = array[0..1] of double;

var
  points: array of TVector2d = nil;
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
    glVertex2dv(points[i]);
  end;
  glEnd;

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, stdout);
  exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull Qc', stdout, stdout);
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
      glVertex2dv(vertex^.point);
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
        for i := 0 to qh_setsize(qh, facet^.vertices) - 1 do begin;
          vertex := facet^.vertices^.e[i].p;
          Write('  pid: ', id, '  vid: ', vertex^.id: 3, '.    ');
          for j := 0 to qh^.hull_dim - 1 do begin
            Write(vertex^.point[j]: 2: 1, ' ');
          end;
          WriteLn;
          glVertex2dv(vertex^.point);
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

procedure InitScene_d_QT;
var
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
    glVertex2dv(points[i]);
  end;
  glEnd;

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, fp_qhull_r.stdout);
  exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull d Qt', fp_qhull_r.stdout, fp_qhull_r.stdout);
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

      Write('  pid: ', id: 4, '  vid: ', vertex^.id: 3, '.    ');
      for i := 0 to qh^.hull_dim - 1 do begin
        Write(vertex^.point[i]: 2: 1, ' ');
      end;
      WriteLn;

      if is3D then  begin
        glVertex3dv(vertex^.point);
      end else begin
        glVertex2dv(vertex^.point);
      end;
      vertex := vertex^.next;
    end;
    glEnd;

    WriteLn;

    // --- facet_list
    facet := qh^.facet_list;
    WriteLn('--- Facet_List ---  (', qh^.num_facets, ')');
    while (facet <> nil) and (facet^.next <> nil) do begin
      if (is3D) or (facet^.upperdelaunay = 0) then begin
        if facet^.vertices <> nil then begin
          num_vertices := qh_setsize(qh, facet^.vertices);

          Write('  normal:  ');
          for j := 0 to 2 do begin
            Write(facet^.normal[j]: 4: 2, ' ');
          end;
          WriteLn;

          glBegin(GL_LINE_LOOP);
          for i := 0 to num_vertices - 1 do begin;
            glColor3f(1, 1, 1);
            vertex := facet^.vertices^.e[i].p;

            Write('  ', vertex^.id: 3, '.  ');
            for j := 0 to 2 do begin
              Write(vertex^.point[j]: 2: 1, ' ');
            end;
            WriteLn;

            if is3D then  begin
              glVertex3dv(vertex^.point);
            end else begin
              glVertex2dv(vertex^.point);
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

  glEndList();
end;

procedure InitScene_v_Qbb;
// Voronoi-Diagramm
var
  qh: PqhT;
  i: integer;
  facet: PfacetT;
  curlong, totlong, id: longint;
  vertex: PvertexT;
  cA, cB: PpointT;
  neighborp: PPfacetT;
  p: TVector2d;

const
  len = 10;

begin
  ListeID := glGenLists(1);
  glNewList(ListeID, GL_COMPILE);

  for i := 0 to 3 do begin // Temporär 4 Eckpunkte einfügen
    p[0] := (i div 2) * len - (len / 2);
    p[1] := (i mod 2) * len - (len / 2);
    Insert(p, points, Length(points));
  end;

  qh := qh_malloc(SizeOf(TqhT));
  qh_zero(qh, fp_qhull_r.stdout);
  exitcode := qh_new_qhull(qh, 2, Length(points), PcoordT(points), False, 'qhull v Qbb Qz', fp_qhull_r.stdout, fp_qhull_r.stdout);

  Delete(points, Length(points) - 4, 4);

  WriteLn('Input: ', qh^.input_dim, 'D  Output: ', qh^.hull_dim, 'D');
  if exitcode = 0 then begin
    glPointSize(5.0);
    glBegin(GL_POINTS);
    glColor3f(0, 1, 0);
    for  i := 0 to Length(points) - 1 do begin
      glVertex2dv(points[i]);
    end;
    glEnd;

    // --- vertex_list
    glPointSize(10.0);
    glBegin(GL_POINTS);
    glColor3f(1, 0, 0);
    vertex := qh^.vertex_list;
    WriteLn(#10'--- Vertex-List ---  (', qh^.num_vertices, ')');
    while (vertex <> nil) and (vertex^.next <> nil) do begin
      id := qh_pointid(qh, vertex^.point);
      if (id >= 0) and (id < Length(points)) then begin
        WriteLn('  pid: ', id: 4, '  vid: ', vertex^.id: 3, '.    ', vertex^.point[0]: 2: 1, ' ', vertex^.point[1]: 2: 1);
        glVertex2dv(vertex^.point);
      end;
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
      if facet^.upperdelaunay = 0 then begin
        if facet^.neighbors <> nil then begin
          cA := qh_facetcenter(qh, facet^.vertices);
          neighborp := PPfacetT(@facet^.neighbors^.e[0]);
          while neighborp^ <> nil do begin
            if neighborp^^.upperdelaunay = 0 then begin
              cB := qh_facetcenter(qh, neighborp^^.vertices);
              WriteLn('Liniel: ', cA[0]: 4: 2, ' ', cA[1]: 4: 2, ' -> ', cB[0]: 4: 2, ' ', cB[1]: 4: 2);
              glColor3f(1, 0, 0);
              glVertex2dv(cA);
              glVertex2dv(cB);
              qh_memfree(qh, cB, qh^.normal_size);
            end;
            Inc(neighborp);
          end;
          qh_memfree(qh, cA, qh^.normal_size);
        end;
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
  scale = 6.0;
  w: single = 0;
begin
  glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

  glMatrixMode(GL_PROJECTION);
  glLoadIdentity();
  glFrustum(-1.0, 1.0, -1.0, 1.0, 1.5, 100.0);

  glMatrixMode(GL_MODELVIEW);
  glLoadIdentity();

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
