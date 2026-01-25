unit render_gl;

interface

uses
  fp_mpv, client;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  Tmpv_opengl_init_params = record
    get_proc_address: function(ctx: pointer; name: pchar): pointer; cdecl;
    get_proc_address_ctx: pointer;
  end;
  Pmpv_opengl_init_params = ^Tmpv_opengl_init_params;

  Tmpv_opengl_fbo = record
    fbo: longint;
    w: longint;
    h: longint;
    internal_format: longint;
  end;
  Pmpv_opengl_fbo = ^Tmpv_opengl_fbo;

  Tmpv_opengl_drm_params = record
    fd: longint;
    crtc_id: longint;
    connector_id: longint;
    atomic_request_ptr: ^PdrmModeAtomicReq;
    render_fd: longint;
  end;
  Pmpv_opengl_drm_params = ^Tmpv_opengl_drm_params;

  Tmpv_opengl_drm_draw_surface_size = record
    width: longint;
    height: longint;
  end;
  Pmpv_opengl_drm_draw_surface_size = ^Tmpv_opengl_drm_draw_surface_size;

  Tmpv_opengl_drm_params_v2 = record
    fd: longint;
    crtc_id: longint;
    connector_id: longint;
    atomic_request_ptr: ^PdrmModeAtomicReq;
    render_fd: longint;
  end;
  Pmpv_opengl_drm_params_v2 = ^Tmpv_opengl_drm_params_v2;

type
  Tmpv_opengl_drm_osd_size = Tmpv_opengl_drm_draw_surface_size;

  // === Konventiert am: 25-1-26 13:13:36 ===


implementation



end.
