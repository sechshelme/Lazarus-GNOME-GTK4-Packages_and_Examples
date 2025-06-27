void  mgl_surf3_xyz_val(HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, const char *stl, const char *opt);
void  mgl_surf3_val(HMGL graph, double Val, HCDT a, const char *stl, const char *opt);
void  mgl_surf3_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, const char *stl, const char *opt);
void  mgl_surf3(HMGL graph, HCDT a, const char *stl, const char *opt);

void  mgl_surf3a_xyz_val(HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3a_val(HMGL graph, double Val, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3a_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3a(HMGL graph, HCDT a, HCDT b, const char *stl, const char *opt);

void  mgl_surf3c_xyz_val(HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3c_val(HMGL graph, double Val, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3c_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, HCDT b, const char *stl, const char *opt);
void  mgl_surf3c(HMGL graph, HCDT a, HCDT b, const char *stl, const char *opt);

void  mgl_surf3ca_xyz_val(HMGL graph, double Val, HCDT x, HCDT y, HCDT z, HCDT a, HCDT c, HCDT b, const char *stl, const char *opt);
void  mgl_surf3ca_val(HMGL graph, double Val, HCDT a, HCDT c, HCDT b, const char *stl, const char *opt);
void  mgl_surf3ca_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, HCDT c, HCDT b, const char *stl, const char *opt);
void  mgl_surf3ca(HMGL graph, HCDT a, HCDT c, HCDT b, const char *stl, const char *opt);

void  mgl_cloud_xyz(HMGL graph, HCDT x, HCDT y, HCDT z, HCDT a, const char *stl, const char *opt);
void  mgl_cloud(HMGL graph, HCDT a, const char *stl, const char *opt);

void  mgl_beam_val(HMGL graph, double Val, HCDT tr, HCDT g1, HCDT g2, HCDT a, double r, const char *stl, int norm);
void  mgl_beam(HMGL graph, HCDT tr, HCDT g1, HCDT g2, HCDT a, double r, const char *stl, int norm, int num);

