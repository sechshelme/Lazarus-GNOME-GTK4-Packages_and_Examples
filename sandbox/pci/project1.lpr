program project1;

uses
  pci,
  config,
  header,
  types;

  function printf(__format: pchar): longint; cdecl; varargs; external 'c';

  procedure main;
  begin
     printf('libpci Version: %s'#10, PCI_LIB_VERSION);
  end;

begin
  main;
end.
