unit MyWidget;

interface

uses
  fp_glib2, fp_GTK4, fp_graphene, fp_pango, fp_cairo, EngineCalc,
  fp_box2d;


type
  TAniData = record
    BodyIds: Tb2BodyIds;
    engine: TEngine;
  end;
  PAniData = ^TAniData;

const
  anyDataKey = 'anyKey';

const
  WORLD_LEFT = -80.0;
  WORLD_TOP = 30.0;
  WORLD_WIDTH = 340.0;
  WORLD_HEIGHT = 230.0;



type
  TMyWidget = record
    parent_instance: TGtkWidget;
    AniData: PAniData;
  end;
  PMyWidget = ^TMyWidget;

  TMyWidgetClass = record
    parent_class: TGtkWidgetClass;
  end;
  PMyWidgetClass = ^TMyWidgetClass;

function my_widget_get_type: TGType;
function my_widget_new(aniData: PAniData): PMyWidget;

function MY_TYPE_WIDGET: TGType;
function MY_WIDGET(obj: Pointer): PMyWidget;
function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
function MY_IS_WIDGET(obj: Pointer): Tgboolean;
function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;

implementation


// ==== private

var
  parent_class: PMyWidgetClass = nil;

procedure drawPolygone(cr: Pcairo_t; shapeId: Tb2ShapeId);
var
  i: integer;
  polygon: Tb2Polygon;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  p: Tb2Vec2;
begin
  polygon := b2Shape_GetPolygon(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);

  if polygon.count > 0 then begin
    p := b2TransformPoint(transform, polygon.vertices[0]);
    cairo_move_to(cr, p.x, p.y);

    for i := 1 to polygon.count - 1 do begin
      p := b2TransformPoint(transform, polygon.vertices[i]);
      cairo_line_to(cr, p.x, p.y);
    end;

    cairo_close_path(cr);
  end;
  cairo_fill(cr);
end;

procedure drawCircleSnapshot(snapshot: PGtkSnapshot; shapeId: Tb2ShapeId);
var
  circle: Tb2Circle;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  center: Tb2Vec2;
  ud: PuserData;
  color: TGdkRGBA;
  rect: Tgraphene_rect_t;
  rounded_rect: TGskRoundedRect;
  radius_size: Tgraphene_size_t;
begin
  // 1. Daten von Box2D holen
  circle := b2Shape_GetCircle(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);
  center := b2TransformPoint(transform, circle.center);

  // 2. Farbe bestimmen (vom UserData oder Fallback Weiß)
  ud := b2Body_GetUserData(bodyId);
  color.red:=ud^.color.r;
  color.green:=ud^.color.g;
  color.blue:=ud^.color.b;
  color.alpha:=1.0;

  // 3. Das Quadrat definieren, das den Kreis umschließt
  graphene_rect_init(@rect,
                     center.x - circle.radius,
                     center.y - circle.radius,
                     circle.radius * 2,
                     circle.radius * 2);

  // 4. Die Eckenradien auf den Kreisradius setzen
  graphene_size_init(@radius_size, circle.radius, circle.radius);

  // 5. Das abgerundete Rechteck (den Kreis) initialisieren
  gsk_rounded_rect_init(@rounded_rect,
                        @rect,
                        @radius_size, @radius_size,
                        @radius_size, @radius_size);

  // 6. Zeichnen: Clip setzen, Fläche füllen, Clip entfernen
  gtk_snapshot_push_rounded_clip(snapshot, @rounded_rect);
  gtk_snapshot_append_color(snapshot, @color, @rect);
  gtk_snapshot_pop(snapshot);
end;


//procedure drawCircle(cr: Pcairo_t; shapeId: Tb2ShapeId);
//var
//  circle: Tb2Circle;
//  bodyId: Tb2BodyId;
//  transform: Tb2Transform;
//  center: Tb2Vec2;
//begin
//  circle := b2Shape_GetCircle(shapeId);
//  bodyId := b2Shape_GetBody(shapeId);
//  transform := b2Body_GetTransform(bodyId);
//  center := b2TransformPoint(transform, circle.center);
//
//  cairo_arc(cr, center.x, center.y, circle.radius, 0, 2 * Pi);
//  cairo_close_path(cr);
//  cairo_fill(cr);
//end;
//
function ArcTan2(dy, dx: double): double;
begin
  if dx > 0 then begin
    Result := ArcTan(dy / dx);
  end else if dx < 0 then begin
    if dy >= 0 then begin
      Result := ArcTan(dy / dx) + Pi;
    end else begin
      Result := ArcTan(dy / dx) - Pi;
    end;
  end else { Fall: dx = 0 } begin
    if dy > 0 then begin
      Result := Pi / 2;
    end else if dy < 0 then begin
      Result := -Pi / 2;
    end else begin
      Result := 0;
    end;
  end;
end;


procedure drawCapsule(cr: Pcairo_t; shapeId: Tb2ShapeId);
var
  capsule: Tb2Capsule;
  bodyId: Tb2BodyId;
  transform: Tb2Transform;
  p1, p2: Tb2Vec2;
  angle: single;
begin
  capsule := b2Shape_GetCapsule(shapeId);
  bodyId := b2Shape_GetBody(shapeId);
  transform := b2Body_GetTransform(bodyId);

  p1 := b2TransformPoint(transform, capsule.center1);
  p2 := b2TransformPoint(transform, capsule.center2);

  angle := b2Atan2(p2.y - p1.y, p2.x - p1.x);

  cairo_arc(cr, p1.x, p1.y, capsule.radius, angle + Pi / 2, angle + 3 * Pi / 2);
  cairo_arc(cr, p2.x, p2.y, capsule.radius, angle - Pi / 2, angle + Pi / 2);

  cairo_close_path(cr);
  cairo_fill(cr);
end;

procedure draw_func(cr: Pcairo_t; snapshot: PGtkSnapshot; anyData: PAniData); cdecl;
var
  i, j: integer;
  shapeCount: longint;
  shapeType: Tb2ShapeType;
  ud: PuserData;
const
  shapesId: array of Tb2ShapeId = nil;
begin
  with anyData^ do begin
    cairo_set_source_rgb(cr, 0.3, 0.3, 0.3);
    cairo_paint(cr);

    for i := 0 to Length(BodyIds) - 1 do begin
      shapeCount := b2Body_GetShapeCount(BodyIds[i]);
      SetLength(shapesId, shapeCount);
      b2Body_GetShapes(BodyIds[i], Pb2ShapeId(shapesId), shapeCount);
      ud := b2Body_GetUserData(BodyIds[i]);
      if ud <> nil then begin
        cairo_set_source_rgb(cr, ud^.color.r, ud^.color.g, ud^.color.b);
      end else begin
        cairo_set_source_rgb(cr, 1.0, 1.0, 1.0);
      end;

      for j := 0 to shapeCount - 1 do begin
        shapeType := b2Shape_GetType(shapesId[j]);
        case shapeType of
          b2_polygonShape: begin
            drawPolygone(cr, shapesId[j]);
          end;
          b2_capsuleShape: begin
            drawCapsule(cr, shapesId[j]);
          end;
          b2_circleShape: begin
            drawCircleSnapshot(snapshot, shapesId[j]);
//            drawCircle(cr, shapesId[j]);
          end;
        end;
      end;
    end;

    cairo_stroke(cr);
  end;
end;

procedure snapshoot_cp(widget: PGtkWidget; snapshot: PGtkSnapshot); cdecl;
var
  self: PMyWidget absolute widget;
var
  r: Tgraphene_rect_t;
  width, height, scX, scY, sc: single;
  p: Tgraphene_point_t;
  cr: Pcairo_t;
begin
  width := gtk_widget_get_width(widget);
  height := gtk_widget_get_height(widget);

  graphene_rect_init(@r, 0, 0, width, height);
  gtk_snapshot_push_clip(snapshot, @r);


  scX := Width / WORLD_WIDTH;
  scY := Height / WORLD_HEIGHT;
  if scX < scY then begin
    sc := scX;
  end else begin
    sc := scY;
  end;


  graphene_point_init(@p, (Width - WORLD_WIDTH * sc) / 2, (Height - WORLD_HEIGHT * sc) / 2);
  gtk_snapshot_translate(snapshot, @p);

  gtk_snapshot_scale(snapshot, sc, -sc);

  graphene_point_init(@p, -WORLD_LEFT, -WORLD_TOP);
  gtk_snapshot_translate(snapshot, @p);


  graphene_rect_init(@r, -10000, -10000, 20000, 20000);
  cr := gtk_snapshot_append_cairo(snapshot, @r);

  cairo_set_line_width(cr, 1.5);

  draw_func(cr,snapshot, self^.AniData);
  cairo_destroy(cr);


  gtk_snapshot_pop(snapshot);
end;



procedure finalize_cp(obj: PGObject); cdecl;
var
  self: PMyWidget absolute obj;
begin
  //  g_free(self^.AniData);
  G_OBJECT_CLASS(parent_class)^.finalize(obj);
end;

function tick_cp(widget: PGtkWidget; frame_clock: PGdkFrameClock; user_data: Tgpointer): Tgboolean; cdecl;
begin
  gtk_widget_queue_draw(widget);
  Result := G_SOURCE_CONTINUE;
end;

procedure init_cp(instance: PGTypeInstance; g_class: Tgpointer); cdecl;
var
  self: PMyWidget absolute instance;
begin
  gtk_widget_add_tick_callback(GTK_WIDGET(self), @tick_cp, nil, nil);
  //  self^.AniData:=g_malloc(SizeOf(TAniData));
end;

procedure my_widget_class_init(g_class: Tgpointer; class_data: Tgpointer); cdecl;
begin
  G_OBJECT_CLASS(g_class)^.finalize := @finalize_cp;
  parent_class := g_type_class_peek_parent(g_class);

  GTK_WIDGET_CLASS(g_class)^.snapshot := @snapshoot_cp;
end;


// ==== public

function my_widget_get_type: TGType;
const
  type_id: TGType = 0;
var
  id: TGType;
begin
  if g_once_init_enter(@type_id) then begin
    id := g_type_register_static_simple(GTK_TYPE_WIDGET, 'MyWidget', SizeOf(TMyWidgetClass), @my_widget_class_init, SizeOf(TMyWidget), @init_cp, 0);
    g_once_init_leave(@type_id, id);
  end;
  Result := type_id;
end;

function my_widget_new(aniData: PAniData): PMyWidget;
begin
  Result := g_object_new(MY_TYPE_WIDGET, nil);
  Result^.AniData := aniData;
end;

// ====

function MY_TYPE_WIDGET: TGType;
begin
  Result := my_widget_get_type;
end;

function MY_WIDGET(obj: Pointer): PMyWidget;
begin
  Result := PMyWidget(g_type_check_instance_cast(obj, MY_TYPE_WIDGET));
end;

function MY_WIDGET_CLASS(klass: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(g_type_check_class_cast(klass, MY_TYPE_WIDGET));
end;

function MY_IS_WIDGET(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, MY_TYPE_WIDGET);
end;

function MY_IS_WIDGET_CLASS(klass: Pointer): Tgboolean;
begin
  Result := g_type_check_class_is_a(klass, MY_TYPE_WIDGET);
end;

function MY_WIDGET_GET_CLASS(obj: Pointer): PMyWidgetClass;
begin
  Result := PMyWidgetClass(PGTypeInstance(obj)^.g_class);
end;


end.
