
void  mgl_triplot_xyzc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_triplot_xyz(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_triplot_xy(HMGL gr, HCDT nums, HCDT x, HCDT y, const char *sch, const char *opt);

void  mgl_quadplot_xyzc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_quadplot_xyz(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_quadplot_xy(HMGL gr, HCDT nums, HCDT x, HCDT y, const char *sch, const char *opt);

void  mgl_tricont_xyzcv(HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_tricont_xycv(HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_tricont_xyzc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_tricont_xyc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);

void  mgl_tricontv_xyzcv(HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_tricontv_xycv(HMGL gr, HCDT v, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_tricontv_xyzc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_tricontv_xyc(HMGL gr, HCDT nums, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);

void  mgl_dots(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_dots_a(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT a, const char *sch, const char *opt);
void  mgl_dots_ca(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT c, HCDT a, const char *sch, const char *opt);

void  mgl_crust(HMGL gr, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);

void  mgl_dens_x(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_dens_y(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_dens_z(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_cont_x(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_cont_y(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_cont_z(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_cont_x_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_cont_y_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_cont_z_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_contf_x(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_contf_y(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_contf_z(HMGL graph, HCDT a, const char *stl, double sVal, const char *opt);

void  mgl_contf_x_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_contf_y_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);
void  mgl_contf_z_val(HMGL graph, HCDT v, HCDT a, const char *stl, double sVal, const char *opt);

