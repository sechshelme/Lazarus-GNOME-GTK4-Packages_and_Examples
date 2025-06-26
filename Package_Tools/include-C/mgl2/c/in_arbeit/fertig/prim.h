
void  mgl_mark(HMGL gr, double x,double y,double z,const char *mark);
void  mgl_ball(HMGL gr, double x,double y,double z);

void  mgl_line(HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, const char *pen,int n);
void  mgl_curve(HMGL gr, double x1, double y1, double z1, double dx1, double dy1, double dz1, double x2, double y2, double z2, double dx2, double dy2, double dz2, const char *pen,int n);

void  mgl_error_box(HMGL gr, double x, double y, double z, double ex, double ey, double ez, const char *pen);

void  mgl_face(HMGL gr, double x0, double y0, double z0, double x1, double y1, double z1, double x2, double y2, double z2, double x3, double y3, double z3, const char *stl);
void  mgl_facex(HMGL gr, double x0, double y0, double z0, double wy, double wz, const char *stl, double dx, double dy);
void  mgl_facey(HMGL gr, double x0, double y0, double z0, double wx, double wz, const char *stl, double dx, double dy);
void  mgl_facez(HMGL gr, double x0, double y0, double z0, double wx, double wy, const char *stl, double dx, double dy);

void  mgl_sphere(HMGL gr, double x, double y, double z, double r, const char *stl);
void  mgl_drop(HMGL gr, double x, double y, double z, double dx, double dy, double dz, double r, const char *stl, double shift, double ap);
void  mgl_cone(HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r1, double r2, const char *stl);
void  mgl_ellipse(HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r, const char *stl);
void  mgl_rhomb(HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, double r, const char *stl);
void  mgl_polygon(HMGL gr, double x1, double y1, double z1, double x2, double y2, double z2, int n, const char *stl);
void  mgl_arc_ext(HMGL gr, double x0, double y0, double z0, double xr, double yr, double zr, double x1, double y1, double z1, double a, const char *stl);
void  mgl_arc(HMGL gr, double x0, double y0, double x1, double y1, double a, const char *stl);

void  mgl_cones_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, const char *pen, const char *opt);
void  mgl_cones_xz(HMGL graph, HCDT x, HCDT z, const char *pen, const char *opt);
void  mgl_cones(HMGL graph, HCDT z,	const char *pen, const char *opt);

void  mgl_dew_xy(HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_dew_2d(HMGL gr, HCDT ax, HCDT ay, const char *sch, const char *optl);

void  mgl_puts(HMGL graph, double x, double y, double z,const char *text, const char *font, double size);
void  mgl_putsw(HMGL graph, double x, double y, double z,const wchar_t *text, const char *font, double size);

void  mgl_puts_dir(HMGL graph, double x, double y, double z, double dx, double dy, double dz, const char *text, const char *font, double size);
void  mgl_putsw_dir(HMGL graph, double x, double y, double z, double dx, double dy, double dz, const wchar_t *text, const char *font, double size);

void  mgl_symbol(HMGL gr, double x, double y, double z, char id, const char *how, double size);
void  mgl_symbol_dir(HMGL gr, double x, double y, double z, double dx, double dy, double dz, char id, const char *how, double size);

void  mgl_textmark_xyzr(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const char *text, const char *fnt, const char *opt);
void  mgl_textmarkw_xyzr(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const wchar_t *text, const char *fnt, const char *opt);
void  mgl_textmark_xyr(HMGL graph, HCDT x, HCDT y, HCDT r, const char *text, const char *fnt, const char *opt);
void  mgl_textmarkw_xyr(HMGL graph, HCDT x, HCDT y, HCDT r, const wchar_t *text, const char *fnt, const char *opt);
void  mgl_textmark_yr(HMGL graph, HCDT y, HCDT r, const char *text, const char *fnt, const char *opt);
void  mgl_textmarkw_yr(HMGL graph, HCDT y, HCDT r, const wchar_t *text, const char *fnt, const char *opt);
void  mgl_textmark(HMGL graph, HCDT y, const char *text, const char *fnt, const char *opt);
void  mgl_textmarkw(HMGL graph, HCDT y, const wchar_t *text, const char *fnt, const char *opt);

void  mgl_label_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, const char *text, const char *fnt, const char *opt);
void  mgl_labelw_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, const wchar_t *text, const char *fnt, const char *opt);
void  mgl_label_xy(HMGL graph, HCDT x, HCDT y, const char *text, const char *fnt, const char *opt);
void  mgl_labelw_xy(HMGL graph, HCDT x, HCDT y, const wchar_t *text, const char *fnt, const char *opt);
void  mgl_label_y(HMGL graph, HCDT y, const char *text, const char *fnt, const char *opt);
void  mgl_labelw_y(HMGL graph, HCDT y, const wchar_t *text, const char *fnt, const char *opt);

void  mgl_table(HMGL gr, double x, double y, HCDT val, const char *text, const char *fnt, const char *opt);
void  mgl_tablew(HMGL gr, double x, double y, HCDT val, const wchar_t *text, const char *fnt, const char *opt);

void  mgl_logo(HMGL gr, long w, long h, const unsigned char *rgba, int smooth, const char *opt);
void  mgl_logo_file(HMGL gr, const char *fname, int smooth, const char *opt);

void  mgl_lamerey(HMGL gr, double x0, double (*f)(double,void *), void *par, const char *stl, const char *opt);
void  mgl_lamerey_dat(HMGL gr, double x0, HCDT f, const char *stl, const char *opt);
void  mgl_lamerey_str(HMGL gr, double x0, const char *f, const char *stl, const char *opt);

void  mgl_bifurcation(HMGL gr, double dx, double (*f)(double,double,void *), void *par, const char *stl, const char *opt);
void  mgl_bifurcation_dat(HMGL gr, double dx, HCDT f, const char *stl, const char *opt);
void  mgl_bifurcation_str(HMGL gr, double dx, const char *f, const char *stl, const char *opt);

void  mgl_iris(HMGL gr, HCDT dats, HCDT ranges, const char *ids, const char *stl, const char *opt);
void  mgl_iris_1(HMGL gr, HCDT dats, const char *ids, const char *stl, const char *opt);
void  mgl_irisw(HMGL gr, HCDT dats, HCDT ranges, const wchar_t *ids, const char *stl, const char *opt);
void  mgl_irisw_1(HMGL gr, HCDT dats, const wchar_t *ids, const char *stl, const char *opt);


