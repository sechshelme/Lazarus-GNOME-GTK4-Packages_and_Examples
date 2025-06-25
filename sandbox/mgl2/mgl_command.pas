unit mgl_command;


interface

const
  {$ifdef linux}
  libmgl = 'libmgl';
  {$endif}

  {$ifdef windows}
  libmgl = 'mgl.dll'; // ???
  {$endif}

  {$ifdef darwin}
  libmgl = 'libmgldylib';   // ???
  {$endif}


implementation

end.
