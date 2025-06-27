
void  mgl_fsurf(HMGL graph, const char *fz, const char *stl, const char *opt);
void  mgl_fsurf_xyz(HMGL graph, const char *fx, const char *fy, const char *fz, const char *stl, const char *opt);

void  mgl_grid_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *stl, const char *opt);
void  mgl_grid(HMGL graph, HCDT a,const char *stl, const char *opt);

void  mgl_mesh_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_mesh(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_fall_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_fall(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_belt_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_belt(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_beltc_xy(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_beltc(HMGL graph, HCDT z, HCDT c, const char *sch, const char *opt);

void  mgl_surf_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_surf(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_dens_xy(HMGL graph, HCDT x, HCDT y, HCDT c, const char *sch, const char *opt);
void  mgl_dens(HMGL graph, HCDT c, const char *sch, const char *opt);

void  mgl_boxs_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_boxs(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_tile_xyc(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_tile_xy(HMGL graph, HCDT x, HCDT y, HCDT z, const char *sch, const char *opt);
void  mgl_tile(HMGL graph, HCDT z, const char *sch, const char *opt);

void  mgl_tiles_xyc(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, HCDT c, const char *sch, const char *opt);
void  mgl_tiles_xy(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT r, const char *sch, const char *opt);
void  mgl_tiles(HMGL graph, HCDT z, HCDT r, const char *sch, const char *opt);

void  mgl_surfc_xy(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_surfc(HMGL graph, HCDT z, HCDT c, const char *sch, const char *opt);

void  mgl_surfa_xy(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT c, const char *sch, const char *opt);
void  mgl_surfa(HMGL graph, HCDT z, HCDT c, const char *sch, const char *opt);

void  mgl_surfca_xy(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT c, HCDT a, const char *sch, const char *opt);
void  mgl_surfca(HMGL gr, HCDT z, HCDT c, HCDT a, const char *sch, const char *opt);

void  mgl_stfa_xy(HMGL graph, HCDT x, HCDT y, HCDT re, HCDT im, int dn, const char *sch, const char *opt);
void  mgl_stfa(HMGL graph, HCDT re, HCDT im, int dn, const char *sch, const char *opt);

void  mgl_map_xy(HMGL graph, HCDT x, HCDT y, HCDT a, HCDT b, const char *sch, const char *opt);
void  mgl_map(HMGL graph, HCDT a, HCDT b, const char *sch, const char *opt);

