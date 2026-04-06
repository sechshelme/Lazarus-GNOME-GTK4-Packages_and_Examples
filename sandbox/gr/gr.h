#ifndef _GR_H_
#define _GR_H_

#ifdef _WIN32

#define HAVE_BOOLEAN


#ifdef __cplusplus
extern "C" {
#endif

typedef enum
{
  GR_PROJECTION_DEFAULT,
  GR_PROJECTION_ORTHOGRAPHIC,
  GR_PROJECTION_PERSPECTIVE
} projection_type_t;

typedef enum
{
  GR_VOLUME_WITHOUT_BORDER,
  GR_VOLUME_WITH_BORDER
} volume_border_calculation_t;

typedef enum
{
  GR_VOLUME_EMISSION,
  GR_VOLUME_ABSORPTION,
  GR_VOLUME_MIP
} volume_rendering_model_t;

typedef enum
{
  GR_TEXT_USE_WC = 1u << 0u,
  GR_TEXT_ENABLE_INLINE_MATH = 1u << 1u
} textx_option_t;

typedef enum
{
  GR_2PASS_CLEANUP = 1,
  GR_2PASS_RENDER
} f2pass_option_t;

#define GR_MAX_CONTEXT 8192

#define GR_DEFAULT_MATH_FONT 232

#define GR_COLORMAP_DEFAULT 0
#define GR_COLORMAP_TEMPERATURE 1
#define GR_COLORMAP_GRAYSCALE 2
#define GR_COLORMAP_GLOWING 3
#define GR_COLORMAP_RAINBOWLIKE 4
#define GR_COLORMAP_GEOLOGIC 5
#define GR_COLORMAP_GREENSCALE 6
#define GR_COLORMAP_CYANSCALE 7
#define GR_COLORMAP_BLUESCALE 8
#define GR_COLORMAP_MAGENTASCALE 9
#define GR_COLORMAP_REDSCALE 10
#define GR_COLORMAP_FLAME 11
#define GR_COLORMAP_BROWNSCALE 12
#define GR_COLORMAP_PILATUS 13
#define GR_COLORMAP_AUTUMN 14
#define GR_COLORMAP_BONE 15
#define GR_COLORMAP_COOL 16
#define GR_COLORMAP_COPPER 17
#define GR_COLORMAP_GRAY 18
#define GR_COLORMAP_HOT 19
#define GR_COLORMAP_HSV 20
#define GR_COLORMAP_JET 21
#define GR_COLORMAP_PINK 22
#define GR_COLORMAP_SPECTRAL 23
#define GR_COLORMAP_SPRING 24
#define GR_COLORMAP_SUMMER 25
#define GR_COLORMAP_WINTER 26
#define GR_COLORMAP_GIST_EARTH 27
#define GR_COLORMAP_GIST_HEAT 28
#define GR_COLORMAP_GIST_NCAR 29
#define GR_COLORMAP_GIST_RAINBOW 30
#define GR_COLORMAP_GIST_STERN 31
#define GR_COLORMAP_AFMHOT 32
#define GR_COLORMAP_BRG 33
#define GR_COLORMAP_BWR 34
#define GR_COLORMAP_COOLWARM 35
#define GR_COLORMAP_CMRMAP 36
#define GR_COLORMAP_CUBEHELIX 37
#define GR_COLORMAP_GNUPLOT 38
#define GR_COLORMAP_GNUPLOT2 39
#define GR_COLORMAP_OCEAN 40
#define GR_COLORMAP_RAINBOW 41
#define GR_COLORMAP_SEISMIC 42
#define GR_COLORMAP_TERRAIN 43
#define GR_COLORMAP_VIRIDIS 44
#define GR_COLORMAP_INFERNO 45
#define GR_COLORMAP_PLASMA 46
#define GR_COLORMAP_MAGMA 47
#define GR_COLORMAP_UNIFORM 48

#define GR_COLOR_RED 236
#define GR_COLOR_GREEN 237
#define GR_COLOR_YELLOW 238
#define GR_COLOR_BLUE 239
#define GR_COLOR_ORANGE 240
#define GR_COLOR_PURPLE 241
#define GR_COLOR_CYAN 242
#define GR_COLOR_MAGENTA 243
#define GR_COLOR_LIME 244
#define GR_COLOR_PINK 245
#define GR_COLOR_TEAL 246
#define GR_COLOR_LAVENDER 247
#define GR_COLOR_BROWN 248
#define GR_COLOR_BEIGE 249
#define GR_COLOR_MAROON 250
#define GR_COLOR_MINT 251
#define GR_COLOR_OLIVE 252
#define GR_COLOR_APRICOT 253
#define GR_COLOR_NAVY 254
#define GR_COLOR_GREY 255

typedef enum
{
  GR_OPTION_X_LOG = 1u << 0u,
  GR_OPTION_Y_LOG = 1u << 1u,
  GR_OPTION_Z_LOG = 1u << 2u,

  GR_OPTION_FLIP_X = 1u << 3u,
  GR_OPTION_FLIP_Y = 1u << 4u,
  GR_OPTION_FLIP_Z = 1u << 5u,

  /* for use within GR.jl */
  GR_OPTION_X_LOG2 = 1u << 6u,
  GR_OPTION_Y_LOG2 = 1u << 7u,
  GR_OPTION_Z_LOG2 = 1u << 8u,
  GR_OPTION_X_LN = 1u << 9u,
  GR_OPTION_Y_LN = 1u << 10u,
  GR_OPTION_Z_LN = 1u << 11u
} scale_option_t;

typedef enum
{
  GR_SPEC_LINE = 1u << 0u,
  GR_SPEC_MARKER = 1u << 1u,
  GR_SPEC_COLOR = 1u << 2u
} linespec_t;

typedef enum
{
  GR_OPTION_LINES,
  GR_OPTION_MESH,
  GR_OPTION_FILLED_MESH,
  GR_OPTION_Z_SHADED_MESH,
  GR_OPTION_COLORED_MESH,
  GR_OPTION_CELL_ARRAY,
  GR_OPTION_SHADED_MESH,
  GR_OPTION_3D_MESH /* for GR3 */
} surface_option_t;

typedef enum
{
  GR_MODEL_RGB,
  GR_MODEL_HSV
} color_model_t;

typedef enum
{
  GR_STOP,
  GR_MOVETO,
  GR_LINETO,
  GR_CURVE3,
  GR_CURVE4,
  GR_CLOSEPOLY = 0x4f
} path_code_t;

typedef enum
{
  GR_XFORM_BOOLEAN,
  GR_XFORM_LINEAR,
  GR_XFORM_LOG,
  GR_XFORM_LOGLOG,
  GR_XFORM_CUBIC,
  GR_XFORM_EQUALIZED
} xform_types_t;

typedef enum
{
  GR_INTERP2_NEAREST,
  GR_INTERP2_LINEAR,
  GR_INTERP2_SPLINE,
  GR_INTERP2_CUBIC
} interp2_method_t;

typedef struct
{
  double x, y;
} vertex_t;

/*! Three-dimensional coordinate */
typedef struct
{
  double x, y, z;
} point3d_t;

/*! Data point for `gr_volume_nogrid` */
typedef struct
{
  point3d_t pt; /*!< Coordinates of data point */
  double data;  /*!< Intensity of data point */
} data_point3d_t;

/*! Provides optional extra data for `gr_volume_interp_gauss` */
typedef struct
{
  double sqrt_det;                                 /*!< Square root of determinant of covariance matrix */
  point3d_t gauss_sig_1, gauss_sig_2, gauss_sig_3; /*!< \f$\Sigma^{-\frac{1}{2}}\f$ encoded as three column vectors */
} gauss_t;

/*! Provides optional extra data for `gr_volume_interp_tri_linear` */
typedef struct
{
  double grid_x_re; /*!< Reciproke of interpolation kernel extent in x-direction */
  double grid_y_re; /*!< Reciproke of interpolation kernel extent in y-direction */
  double grid_z_re; /*!< Reciproke of interpolation kernel extent in z-direction */
} tri_linear_t;

typedef struct cpubasedvolume_2pass_priv cpubasedvolume_2pass_priv_t;
typedef struct
{
  double dmin;
  double dmax;
  int action;
  cpubasedvolume_2pass_priv_t *priv;
} cpubasedvolume_2pass_t;

typedef struct hexbin_2pass_priv hexbin_2pass_priv_t;
typedef struct
{
  int nc;
  int cntmax;
  int action;
  hexbin_2pass_priv_t *priv;
} hexbin_2pass_t;

typedef struct
{
  int scientific;
  int decimal_digits;
} format_reference_t;

typedef struct
{
  double value;
  int is_major;
} tick_t;

typedef struct
{
  double tick;
  char *label;
  double width;
} tick_label_t;

typedef struct
{
  double min, max;
  double tick, org;
  double position;
  int major_count;
  int num_ticks;
  tick_t *ticks;
  double tick_size;
  int num_tick_labels;
  tick_label_t *tick_labels;
  double label_position;
  int draw_axis_line;
  int label_orientation;
} axis_t;

#define GR_AXES_SIMPLE_AXES (1 << 0)
#define GR_AXES_TWIN_AXES (1 << 1)
#define GR_AXES_WITH_GRID (1 << 2)

extern void gr_initgr(void);
extern int gr_debug(void);
extern void gr_opengks(void);
extern void gr_closegks(void);
extern void gr_inqdspsize(double *, double *, int *, int *);
extern void gr_openws(int, char *, int);
extern void gr_closews(int);
extern void gr_activatews(int);
extern void gr_deactivatews(int);
extern void gr_configurews(void);
extern void gr_clearws(void);
extern void gr_updatews(void);
extern void gr_polyline(int, double *, double *);
extern void gr_polymarker(int, double *, double *);
extern void gr_text(double, double, char *);
extern void gr_textx(double, double, char *, int);
extern void gr_inqtext(double, double, char *, double *, double *);
extern void gr_inqtextx(double, double, char *, int, double *, double *);
extern void gr_fillarea(int, double *, double *);
extern void gr_cellarray(double, double, double, double, int, int, int, int, int, int, int *);
extern void gr_nonuniformcellarray(double *, double *, int, int, int, int, int, int, int *);
extern void gr_polarcellarray(double, double, double, double, double, double, int, int, int, int, int, int, int *);
extern void gr_nonuniformpolarcellarray(double, double, double *, double *, int, int, int, int, int, int, int *);
extern void gr_gdp(int, double *, double *, int, int, int *);
extern void gr_spline(int, double *, double *, int, int);
extern void gr_gridit(int, double *, double *, double *, int, int, double *, double *, double *);
extern void gr_setlinetype(int);
extern void gr_inqlinetype(int *);
extern void gr_setlinewidth(double);
extern void gr_inqlinewidth(double *);
extern void gr_setlinecolorind(int);
extern void gr_inqlinecolorind(int *);
extern void gr_setmarkertype(int);
extern void gr_inqmarkertype(int *);
extern void gr_setmarkersize(double);
extern void gr_inqmarkersize(double *);
extern void gr_setmarkercolorind(int);
extern void gr_inqmarkercolorind(int *);
extern void gr_settextfontprec(int, int);
extern void gr_setcharexpan(double);
extern void gr_setcharspace(double);
extern void gr_settextcolorind(int);
extern void gr_inqtextcolorind(int *);
extern void gr_setcharheight(double);
extern void gr_setwscharheight(double chh, double height);
extern void gr_inqcharheight(double *);
extern void gr_setcharup(double, double);
extern void gr_settextpath(int);
extern void gr_settextalign(int, int);
extern void gr_setfillintstyle(int);
extern void gr_inqfillintstyle(int *);
extern void gr_setfillstyle(int);
extern void gr_inqfillstyle(int *);
extern void gr_setfillcolorind(int);
extern void gr_inqfillcolorind(int *);
extern void gr_setnominalsize(double);
extern void gr_inqnominalsize(double *);
extern void gr_setcolorrep(int, double, double, double);
extern void gr_setwindow(double, double, double, double);
extern void gr_inqwindow(double *, double *, double *, double *);
extern void gr_setviewport(double, double, double, double);
extern void gr_inqviewport(double *, double *, double *, double *);
extern void gr_selntran(int);
extern void gr_setclip(int);
extern void gr_setwswindow(double, double, double, double);
extern void gr_setwsviewport(double, double, double, double);
extern void gr_createseg(int);
extern void gr_copysegws(int);
extern void gr_redrawsegws(void);
extern void gr_setsegtran(int, double, double, double, double, double, double, double);
extern void gr_closeseg(void);
extern void gr_samplelocator(double *, double *, int *);
extern void gr_emergencyclosegks(void);
extern void gr_updategks(void);
extern int gr_setspace(double, double, int, int);
extern void gr_inqspace(double *, double *, int *, int *);
extern int gr_setscale(int);
extern void gr_inqscale(int *);
extern int gr_textext(double, double, char *);
extern void gr_inqtextext(double, double, char *, double *, double *);
extern void gr_setscientificformat(int);
extern void gr_axes(double, double, double, double, int, int, double);
extern void gr_axeslbl(double, double, double, double, int, int, double,
                          void (*)(double, double, const char *, double),
                          void (*)(double, double, const char *, double));
extern void gr_axis(char, axis_t *);
extern void gr_drawaxis(char, axis_t *);
extern void gr_drawaxes(axis_t *, axis_t *, int);
extern void gr_freeaxis(axis_t *);
extern void gr_grid(double, double, double, double, int, int);
extern void gr_grid3d(double, double, double, double, double, double, int, int, int);
extern void gr_verrorbars(int, double *, double *, double *, double *);
extern void gr_herrorbars(int, double *, double *, double *, double *);
extern void gr_polyline3d(int, double *, double *, double *);
extern void gr_polymarker3d(int, double *, double *, double *);
extern void gr_axes3d(double, double, double, double, double, double, int, int, int, double);
extern void gr_titles3d(char *, char *, char *);
extern void gr_settitles3d(char *, char *, char *);
extern void gr_surface(int, int, double *, double *, double *, int);
extern void gr_contour(int, int, int, double *, double *, double *, double *, int);
extern void gr_contourf(int, int, int, double *, double *, double *, double *, int);
extern void gr_tricontour(int, double *, double *, double *, int, double *);
extern int gr_hexbin(int, double *, double *, int);
extern const hexbin_2pass_t *gr_hexbin_2pass(int, double *, double *, int, const hexbin_2pass_t *);
extern void gr_setcolormap(int);
extern void gr_inqcolormap(int *);
extern void gr_setcolormapfromrgb(int n, double *r, double *g, double *b, double *x);
extern void gr_inqcolormapinds(int *, int *);
extern void gr_colorbar(void);
extern void gr_inqcolor(int, int *);
extern int gr_inqcolorfromrgb(double, double, double);
extern void gr_hsvtorgb(double h, double s, double v, double *r, double *g, double *b);
extern double gr_tick(double, double);
extern int gr_validaterange(double, double);
extern void gr_adjustlimits(double *, double *);
extern void gr_adjustrange(double *, double *);
extern void gr_beginprint(char *);
extern void gr_beginprintext(char *, char *, char *, char *);
extern void gr_endprint(void);
extern void gr_ndctowc(double *, double *);
extern void gr_wctondc(double *, double *);
extern void gr_wc3towc(double *, double *, double *);
extern void gr_drawrect(double, double, double, double);
extern void gr_fillrect(double, double, double, double);
extern void gr_drawarc(double, double, double, double, double, double);
extern void gr_fillarc(double, double, double, double, double, double);
extern void gr_drawpath(int, vertex_t *, unsigned char *, int);
extern void gr_setarrowstyle(int);
extern void gr_setarrowsize(double);
extern void gr_drawarrow(double, double, double, double);
extern int gr_readimage(char *, int *, int *, int **);
extern void gr_drawimage(double, double, double, double, int, int, int *, int);
extern int gr_importgraphics(char *);
extern void gr_setshadow(double, double, double);
extern void gr_settransparency(double);
extern void gr_inqtransparency(double *);
extern void gr_setcoordxform(double[3][2]);
extern void gr_begingraphics(char *);
extern void gr_endgraphics(void);
extern char *gr_getgraphics(void);
extern int gr_drawgraphics(char *);
extern int gr_startlistener(void);
extern int gr_inqgrplotport(void);
extern int gr_setgrplotport(int);
extern void gr_mathtex(double, double, char *);
extern void gr_inqmathtex(double, double, char *, double *, double *);
extern void gr_mathtex3d(double, double, double, char *, int);
extern void gr_inqmathtex3d(double, double, double, char *, int, double *, double *, double *, double *);
extern void gr_beginselection(int, int);
extern void gr_endselection(void);
extern void gr_setbboxcallback(int, void (*)(int, double, double, double, double),
                                  void (*)(unsigned int, unsigned int, unsigned int *));
extern void gr_cancelbboxcallback(void);
extern void gr_beginpartial(int,
                               void (*)(int, unsigned int, unsigned int, unsigned int, unsigned int, unsigned int *));
extern void gr_endpartial(int);
extern void gr_moveselection(double, double);
extern void gr_resizeselection(int, double, double);
extern void gr_inqbbox(double *, double *, double *, double *);
extern void gr_setbackground(double, double, double, double);
extern void gr_clearbackground(void);
extern double gr_precision(void);
extern int gr_text_maxsize(void);
extern void gr_setregenflags(int);
extern int gr_inqregenflags(void);
extern void gr_savestate(void);
extern void gr_restorestate(void);
extern void gr_savecontext(int);
extern void gr_selectcontext(int);
extern void gr_destroycontext(int);
extern void gr_unselectcontext(void);
extern int gr_uselinespec(char *);
extern void gr_delaunay(int, const double *, const double *, int *, int **);
extern void gr_reducepoints(int, const double *, const double *, int, double *, double *);
extern void gr_trisurface(int, double *, double *, double *);
extern void gr_gradient(int, int, double *, double *, double *, double *, double *);
extern void gr_quiver(int, int, double *, double *, double *, double *, int);
extern void gr_interp2(int nx, int ny, const double *x, const double *y, const double *z, int nxq, int nyq,
                          const double *xq, const double *yq, double *zq, interp2_method_t method, double extrapval);
extern const char *gr_version(void);
extern void gr_shade(int, double *, double *, int, int, double *, int, int, int *);
extern void gr_shadepoints(int, double *, double *, int, int, int);
extern void gr_shadelines(int, double *, double *, int, int, int);
extern void gr_panzoom(double, double, double, double, double *, double *, double *, double *);
extern int gr_findboundary(int, double *, double *, double, double (*)(double, double), int, int *);
extern void gr_setresamplemethod(unsigned int);
extern void gr_inqresamplemethod(unsigned int *);
extern void gr_path(int, double *, double *, const char *);
extern void gr_setborderwidth(double);
extern void gr_inqborderwidth(double *);
extern void gr_setbordercolorind(int);
extern void gr_inqbordercolorind(int *);
extern void gr_selectclipxform(int);
extern void gr_inqclipxform(int *);
extern void gr_inqclip(int *, double *);
extern void gr_setprojectiontype(int);
extern void gr_inqprojectiontype(int *);
extern void gr_setperspectiveprojection(double, double, double);
extern void gr_inqperspectiveprojection(double *, double *, double *);
extern void gr_settransformationparameters(double, double, double, double, double, double, double, double, double);
extern void gr_inqtransformationparameters(double *, double *, double *, double *, double *, double *, double *,
                                              double *, double *);
extern void gr_setorthographicprojection(double, double, double, double, double, double);
extern void gr_inqorthographicprojection(double *, double *, double *, double *, double *, double *);
extern void gr_camerainteraction(double, double, double, double);
extern void gr_setwindow3d(double, double, double, double, double, double);
extern void gr_inqwindow3d(double *, double *, double *, double *, double *, double *);
extern void gr_setscalefactors3d(double, double, double);
extern void gr_inqscalefactors3d(double *, double *, double *);
extern void gr_setspace3d(double, double, double, double);
extern void gr_inqspace3d(int *, double *, double *, double *, double *);
extern void gr_text3d(double, double, double, char *, int axis);
extern void gr_inqtext3d(double, double, double, char *, int axis, double *, double *);
extern void gr_settextencoding(int);
extern void gr_inqtextencoding(int *);
extern void gr_loadfont(char *, int *);
extern void gr_setcallback(char *(*)(const char *));
extern void gr_setthreadnumber(int);
extern void gr_setpicturesizeforvolume(int, int);
extern void gr_setvolumebordercalculation(int);
extern void gr_setapproximativecalculation(int);
extern void gr_inqvolumeflags(int *, int *, int *, int *, int *);
extern void gr_cpubasedvolume(int, int, int, double *, int, double *, double *, double *, double *);
extern const cpubasedvolume_2pass_t *gr_cpubasedvolume_2pass(int, int, int, double *, int, double *, double *,
                                                                double *, double *, const cpubasedvolume_2pass_t *);
extern void gr_inqvpsize(int *, int *, double *);
extern void gr_polygonmesh3d(int, const double *, const double *, const double *, int, const int *, const int *);

typedef double (*kernel_f)(const data_point3d_t *, const void *, const point3d_t *, const point3d_t *);
typedef double (*radius_f)(const data_point3d_t *, const void *);

extern void gr_volume_nogrid(unsigned long, const data_point3d_t *, const void *, int, kernel_f, double *, double *,
                                double, radius_f);

extern void gr_volume_interp_tri_linear_init(double, double, double);
extern void gr_volume_interp_gauss_init(double, double *);
extern double gr_volume_interp_tri_linear(const data_point3d_t *, const void *, const point3d_t *,
                                             const point3d_t *);
extern double gr_volume_interp_gauss(const data_point3d_t *, const void *, const point3d_t *, const point3d_t *);
extern void gr_setmathfont(int font);
extern void gr_inqmathfont(int *font);
extern void gr_setclipregion(int region);
extern void gr_inqclipregion(int *region);
extern void gr_setclipsector(double start_angle, double end_angle);
extern void gr_inqclipsector(double *start_angle, double *end_angle);
extern void gr_settextoffset(double xoff, double yoff);
extern char *gr_ftoa(char *string, double value, format_reference_t *reference);
extern void gr_getformat(format_reference_t *result, double origin, double min, double max, double tick_width,
                            int major);

#ifdef __cplusplus
}
#endif

#endif
