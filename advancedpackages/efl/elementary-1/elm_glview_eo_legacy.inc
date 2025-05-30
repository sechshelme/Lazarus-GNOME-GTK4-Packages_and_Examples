{$IFDEF read_interface}


type
  PElm_Glview = ^TElm_Glview;
  TElm_Glview = TEo;

type
  PElm_GLView_Mode = ^TElm_GLView_Mode;
  TElm_GLView_Mode = longint;

const
  ELM_GLVIEW_NONE = 0;
  ELM_GLVIEW_ALPHA = 2;
  ELM_GLVIEW_DEPTH = 4;
  ELM_GLVIEW_STENCIL = 8;
  ELM_GLVIEW_DIRECT = 16;
  ELM_GLVIEW_CLIENT_SIDE_ROTATION = 32;
  ELM_GLVIEW_DEPTH_8 = 68;
  ELM_GLVIEW_DEPTH_16 = 132;
  ELM_GLVIEW_DEPTH_24 = 196;
  ELM_GLVIEW_DEPTH_32 = 260;
  ELM_GLVIEW_STENCIL_1 = 520;
  ELM_GLVIEW_STENCIL_2 = 1032;
  ELM_GLVIEW_STENCIL_4 = 1544;
  ELM_GLVIEW_STENCIL_8 = 2056;
  ELM_GLVIEW_STENCIL_16 = 2568;
  ELM_GLVIEW_MULTISAMPLE_LOW = 4096;
  ELM_GLVIEW_MULTISAMPLE_MED = 8192;
  ELM_GLVIEW_MULTISAMPLE_HIGH = 12288;

type
  PElm_GLView_Resize_Policy = ^TElm_GLView_Resize_Policy;
  TElm_GLView_Resize_Policy = longint;

const
  ELM_GLVIEW_RESIZE_POLICY_RECREATE = 1;
  ELM_GLVIEW_RESIZE_POLICY_SCALE = 2;

type
  PElm_GLView_Render_Policy = ^TElm_GLView_Render_Policy;
  TElm_GLView_Render_Policy = longint;

const
  ELM_GLVIEW_RENDER_POLICY_ON_DEMAND = 1;
  ELM_GLVIEW_RENDER_POLICY_ALWAYS = 2;

{$ENDIF read_interface}


{$IFDEF read_implementation}


function elm_glview_resize_policy_set(obj: PElm_Glview; policy: TElm_GLView_Resize_Policy): TEina_Bool; cdecl; external libelementary;
function elm_glview_render_policy_set(obj: PElm_Glview; policy: TElm_GLView_Render_Policy): TEina_Bool; cdecl; external libelementary;
function elm_glview_mode_set(obj: PElm_Glview; mode: TElm_GLView_Mode): TEina_Bool; cdecl; external libelementary;
function elm_glview_gl_api_get(obj: PElm_Glview): PEvas_GL_API; cdecl; external libelementary;
function elm_glview_evas_gl_get(obj: PElm_Glview): PEvas_GL; cdecl; external libelementary;
function elm_glview_rotation_get(obj: PElm_Glview): longint; cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:57:10 ===

{$ENDIF read_implementation}
