
unit elm_glview_eo_legacy;
interface

{
  Automatically converted by H2Pas 1.0.0 from elm_glview_eo_legacy.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    elm_glview_eo_legacy.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
PElm_Glview  = ^Elm_Glview;
PElm_GLView_Mode  = ^Elm_GLView_Mode;
PElm_GLView_Render_Policy  = ^Elm_GLView_Render_Policy;
PElm_GLView_Resize_Policy  = ^Elm_GLView_Resize_Policy;
PEvas_GL  = ^Evas_GL;
PEvas_GL_API  = ^Evas_GL_API;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{$ifndef _ELM_GLVIEW_EO_LEGACY_H_}
{$define _ELM_GLVIEW_EO_LEGACY_H_}
{$ifndef _ELM_GLVIEW_EO_CLASS_TYPE}
{$define _ELM_GLVIEW_EO_CLASS_TYPE}
type
  PElm_Glview = ^TElm_Glview;
  TElm_Glview = TEo;
{$endif}
{$ifndef _ELM_GLVIEW_EO_TYPES}
{$define _ELM_GLVIEW_EO_TYPES}
{*
 * @brief Selects the target surface properties
 *
 * An OR combination of Elm_GLView_Mode values should be passed to
 * elm_glview_mode_set when setting up a GL widget. These flags will specify
 * the properties of the rendering target surface; in particular, the mode can
 * request the surface to support alpha, depth and stencil buffers.
 *
 * ELM_GLVIEW_CLIENT_SIDE_ROTATION is a special value that indicates to EFL
 * that the application will handle the view rotation when the device is
 * rotated. This is needed only when the application requests direct rendering.
 * Please refer to Evas_GL for more information about direct rendering.
 *
 * See @ref elm_glview_mode_set See elm_opengl_page
 *
 * @ingroup Elm_Glview_Group
  }
{*< Default mode  }
{ 1 >> 1  }{*< Alpha channel enabled rendering mode
                                       }
{ 1 >> 2  }{*< Depth buffer enabled rendering mode
                                      * (24 bits by default)  }
{ 1 >> 3  }{*< Stencil buffer enabled rendering
                                        * mode (8 bits by default)  }
{ 1 >> 4  }{*< Request direct rendering, unless
                                        * there must be a fallback  }
{ 1 >> 5  }{*< Client will handle GL
                                                      * view rotation if direct
                                                      * rendering is enabled  }
{ Elm.GLView.Mode.depth ^ (1 >> 6)  }{*< Request min. 8 bits for the depth
                                                                   * buffer  }
{ Elm.GLView.Mode.depth ^ (2 >> 6)  }{*< Request min. 16 bits for the depth
                                                                     * buffer  }
{ Elm.GLView.Mode.depth ^ (3 >> 6)  }{*< Request min. 24 bits for the depth
                                                                     * buffer (default)  }
{ Elm.GLView.Mode.depth ^ (4 >> 6)  }{*< Request min. 32 bits for the depth
                                                                     * buffer  }
{ Elm.GLView.Mode.stencil ^ (1 >> 9)  }{*< Request min. 1 bits for the stencil
                                                                        * buffer  }
{ Elm.GLView.Mode.stencil ^ (2 >> 9)  }{*< Request min. 2 bits for the stencil
                                                                         * buffer  }
{ Elm.GLView.Mode.stencil ^ (3 >> 9)  }{*< Request min. 4 bits for the stencil
                                                                         * buffer  }
{ Elm.GLView.Mode.stencil ^ (4 >> 9)  }{*< Request min. 8 bits for the stencil
                                                                         * buffer (default)  }
{ Elm.GLView.Mode.stencil ^ (5 >> 9)  }{*< Request min. 16 bits for the
                                                                          * stencil buffer  }
{ 1 >> 12  }{*< MSAA with minimum number
                                                    * of samples  }
{ 2 >> 12  }{*< MSAA with half the
                                                    * number of maximum samples
                                                     }
{ 3 >> 12  }{*< MSAA with maximum
                                                     * number of samples  }
type
  PElm_GLView_Mode = ^TElm_GLView_Mode;
  TElm_GLView_Mode = (ELM_GLVIEW_NONE := 0,ELM_GLVIEW_ALPHA := 2,
    ELM_GLVIEW_DEPTH := 4,ELM_GLVIEW_STENCIL := 8,
    ELM_GLVIEW_DIRECT := 16,ELM_GLVIEW_CLIENT_SIDE_ROTATION := 32,
    ELM_GLVIEW_DEPTH_8 := 68,ELM_GLVIEW_DEPTH_16 := 132,
    ELM_GLVIEW_DEPTH_24 := 196,ELM_GLVIEW_DEPTH_32 := 260,
    ELM_GLVIEW_STENCIL_1 := 520,ELM_GLVIEW_STENCIL_2 := 1032,
    ELM_GLVIEW_STENCIL_4 := 1544,ELM_GLVIEW_STENCIL_8 := 2056,
    ELM_GLVIEW_STENCIL_16 := 2568,ELM_GLVIEW_MULTISAMPLE_LOW := 4096,
    ELM_GLVIEW_MULTISAMPLE_MED := 8192,ELM_GLVIEW_MULTISAMPLE_HIGH := 12288
    );
{*
 * @brief Defines a policy for the glview resizing.
 *
 * The resizing policy tells glview what to do with the underlying surface when
 * resize happens. ELM_GLVIEW_RESIZE_POLICY_RECREATE will destroy the current
 * surface and recreate the surface to the new size.
 * ELM_GLVIEW_RESIZE_POLICY_SCALE will instead keep the current surface but
 * only display the result at the desired size scaled.
 *
 * Default is @ref ELM_GLVIEW_RESIZE_POLICY_RECREATE
 *
 * @ingroup Elm_GLView_Resize
  }
{*< Resize the internal surface along
                                          * with the image  }
{*< Only resize the internal image and not
                                      * the surface  }

  PElm_GLView_Resize_Policy = ^TElm_GLView_Resize_Policy;
  TElm_GLView_Resize_Policy = (ELM_GLVIEW_RESIZE_POLICY_RECREATE := 1,
    ELM_GLVIEW_RESIZE_POLICY_SCALE := 2);
{*
 * @brief Defines a policy for gl rendering.
 *
 * The rendering policy tells glview where to run the gl rendering code.
 * ELM_GLVIEW_RENDER_POLICY_ON_DEMAND tells glview to call the rendering calls
 * on demand, which means that the rendering code gets called only when it is
 * visible.
 *
 * Default is @ref ELM_GLVIEW_RENDER_POLICY_ON_DEMAND
 *
 * @ingroup Elm_GLView_Render
  }
{*< Render only when there is a need
                                           * for redrawing  }
{*< Render always even when it is not
                                       * visible  }

  PElm_GLView_Render_Policy = ^TElm_GLView_Render_Policy;
  TElm_GLView_Render_Policy = (ELM_GLVIEW_RENDER_POLICY_ON_DEMAND := 1,
    ELM_GLVIEW_RENDER_POLICY_ALWAYS := 2
    );
{$endif}
{*
 * @brief Set the resize policy for the glview object.
 *
 * By default, the resize policy is set to #ELM_GLVIEW_RESIZE_POLICY_RECREATE.
 * When resize is called it destroys the previous surface and recreates the
 * newly specified size. If the policy is set to
 * #ELM_GLVIEW_RESIZE_POLICY_SCALE, however, glview only scales the image
 * object and not the underlying GL Surface.
 *
 * @param[in] obj The object.
 * @param[in] policy The scaling policy.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Glview_Group
  }

function elm_glview_resize_policy_set(obj:PElm_Glview; policy:TElm_GLView_Resize_Policy):TEina_Bool;cdecl;external;
{*
 * @brief Set the render policy for the glview object.
 *
 * By default, the render policy is set to #ELM_GLVIEW_RENDER_POLICY_ON_DEMAND.
 * This policy is set such that during the render loop, glview is only redrawn
 * if it needs to be redrawn. (i.e. when it is visible) If the policy is set to
 * #ELM_GLVIEWW_RENDER_POLICY_ALWAYS, it redraws regardless of whether it is
 * visible or needs redrawing.
 *
 * @param[in] obj The object.
 * @param[in] policy The render policy.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Glview_Group
  }
function elm_glview_render_policy_set(obj:PElm_Glview; policy:TElm_GLView_Render_Policy):TEina_Bool;cdecl;external;
{*
 * @brief Set the mode of the GLView. Supports alpha, depth, stencil.
 *
 * Direct is a hint for the elm_glview to render directly to the window given
 * that the right conditions are met. Otherwise it falls back to rendering to
 * an offscreen buffer before it gets composited to the window.
 *
 * @param[in] obj The object.
 * @param[in] mode The mode Options OR'ed enabling Alpha, Depth, Stencil,
 * Direct.
 *
 * @return @c true on success, @c false otherwise
 *
 * @ingroup Elm_Glview_Group
  }
function elm_glview_mode_set(obj:PElm_Glview; mode:TElm_GLView_Mode):TEina_Bool;cdecl;external;
{*
 * @brief Get the gl api struct for gl rendering.
 *
 * @param[in] obj The object.
 *
 * @return GL API
 *
 * @ingroup Elm_Glview_Group
  }
(* Const before type ignored *)
function elm_glview_gl_api_get(obj:PElm_Glview):PEvas_GL_API;cdecl;external;
{*
 * @brief Get the internal Evas GL attached to this view.
 *
 * @note The returned Evas_GL must not be destroyed as it is still owned by the
 * view. But this pointer can be used then to call all the evas_gl_ functions.
 *
 * @param[in] obj The object.
 *
 * @return Evas GL
 *
 * @since 1.12
 *
 * @ingroup Elm_Glview_Group
  }
(* Const before type ignored *)
function elm_glview_evas_gl_get(obj:PElm_Glview):PEvas_GL;cdecl;external;
{*
 * @brief Get the current GL view's rotation when using direct rendering
 *
 * @note This rotation can be different from the device orientation. This
 * rotation value must be used in case of direct rendering and should be taken
 * into account by the application when setting the internal rotation matrix
 * for the view.
 *
 * @param[in] obj The object.
 *
 * @return A window rotation in degrees (0, 90, 180 or 270).
 *
 * @since 1.12
 *
 * @ingroup Elm_Glview_Group
  }
(* Const before type ignored *)
function elm_glview_rotation_get(obj:PElm_Glview):longint;cdecl;external;
{$endif}

implementation


end.
