{$IFDEF read_interface}



procedure mgl_traj_xy(gr: THMGL; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_traj_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_vect_xy(gr: THMGL; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_vect_2d(gr: THMGL; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_vect_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_vect_3d(gr: THMGL; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flow_xy(gr: THMGL; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flow_2d(gr: THMGL; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flow_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flow_3d(gr: THMGL; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flow3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_flow3(gr: THMGL; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_flowp_xy(gr: THMGL; x0: double; y0: double; z0: double; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flowp_2d(gr: THMGL; x0: double; y0: double; z0: double; ax: THCDT; ay: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flowp_xyz(gr: THMGL; x0: double; y0: double; z0: double; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_flowp_3d(gr: THMGL; x0: double; y0: double; z0: double; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_pipe_xy(gr: THMGL; x: THCDT; y: THCDT; ax: THCDT; ay: THCDT; sch: pchar; r0: double; opt: pchar); cdecl; external libmgl;
procedure mgl_pipe_2d(gr: THMGL; ax: THCDT; ay: THCDT; sch: pchar; r0: double; opt: pchar); cdecl; external libmgl;
procedure mgl_pipe_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; r0: double; opt: pchar); cdecl; external libmgl;
procedure mgl_pipe_3d(gr: THMGL; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; r0: double; opt: pchar); cdecl; external libmgl;
procedure mgl_grad_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ph: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_grad_xy(gr: THMGL; x: THCDT; y: THCDT; ph: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_grad(gr: THMGL; ph: THCDT; sch: pchar; opt: pchar); cdecl; external libmgl;
procedure mgl_vect3_xyz(gr: THMGL; x: THCDT; y: THCDT; z: THCDT; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;
procedure mgl_vect3(gr: THMGL; ax: THCDT; ay: THCDT; az: THCDT; sch: pchar; sVal: double; opt: pchar); cdecl; external libmgl;

// === Konventiert am: 26-6-25 19:46:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
