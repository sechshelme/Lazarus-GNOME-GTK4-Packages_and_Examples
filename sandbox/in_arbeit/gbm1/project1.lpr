program project1;

uses
   fp_fcntl,
   fp_unistd,
  fp_gbm;

  procedure main;
  var
    drm_fd: LongInt;
    gbm: Pgbm_device;
    bo: Pgbm_bo;
  begin
    drm_fd := open('/dev/dri/renderD128', O_RDWR);
    if drm_fd < 0 then begin
        WriteLn('open');
        Exit;
    end;

    gbm := gbm_create_device(drm_fd);
    if gbm=nil then begin
        WriteLn('gbm_create_device failed');
        close(drm_fd);
        Exit;
    end;

     bo := gbm_bo_create(gbm, 640, 480, GBM_FORMAT_XRGB8888, GBM_BO_USE_RENDERING);
     WriteLn(GBM_FORMAT_XRGB8888);
    if bo=nil then begin
        WriteLn('gbm_bo_create failed');
        gbm_device_destroy(gbm);
        close(drm_fd);
        Exit;
    end;

    WriteLn('GBM Buffer erfolgreich erstellt!');

    gbm_bo_destroy(bo);
    gbm_device_destroy(gbm);
    close(drm_fd);
  end;


begin
  main;
end.
