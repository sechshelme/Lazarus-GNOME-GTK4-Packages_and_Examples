void  mgl_traj_xy(HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_traj_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);

void  mgl_vect_xy(HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_vect_2d(HMGL gr, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_vect_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);
void  mgl_vect_3d(HMGL gr, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);

void  mgl_flow_xy(HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_flow_2d(HMGL gr, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_flow_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);
void  mgl_flow_3d(HMGL gr, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);

void  mgl_flow3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, double sVal, const char *opt);
void  mgl_flow3(HMGL gr, HCDT ax, HCDT ay, HCDT az, const char *sch, double sVal, const char *opt);

void  mgl_flowp_xy(HMGL gr, double x0, double y0, double z0, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_flowp_2d(HMGL gr, double x0, double y0, double z0, HCDT ax, HCDT ay, const char *sch, const char *opt);
void  mgl_flowp_xyz(HMGL gr, double x0, double y0, double z0, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);
void  mgl_flowp_3d(HMGL gr, double x0, double y0, double z0, HCDT ax, HCDT ay, HCDT az, const char *sch, const char *opt);

void  mgl_pipe_xy(HMGL gr, HCDT x, HCDT y, HCDT ax, HCDT ay, const char *sch, double r0, const char *opt);
void  mgl_pipe_2d(HMGL gr, HCDT ax, HCDT ay, const char *sch, double r0, const char *opt);
void  mgl_pipe_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, double r0, const char *opt);
void  mgl_pipe_3d(HMGL gr, HCDT ax, HCDT ay, HCDT az, const char *sch, double r0, const char *opt);

void  mgl_grad_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ph, const char *sch, const char *opt);
void  mgl_grad_xy(HMGL gr, HCDT x, HCDT y, HCDT ph, const char *sch, const char *opt);
void  mgl_grad(HMGL gr, HCDT ph, const char *sch, const char *opt);

void  mgl_vect3_xyz(HMGL gr, HCDT x, HCDT y, HCDT z, HCDT ax, HCDT ay, HCDT az, const char *sch, double sVal, const char *opt);
void  mgl_vect3(HMGL gr, HCDT ax, HCDT ay, HCDT az, const char *sch, double sVal, const char *opt);

