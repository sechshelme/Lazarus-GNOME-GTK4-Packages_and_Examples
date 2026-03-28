program project1;

{$mode objfpc}{$H+}

uses
  ctypes, sysutils;

const
  // Der Linker sucht automatisch nach libjoltc.so in /usr/local/lib
  JoltLib = 'joltc';

// 1. Die C-Funktionen deklarieren (cdecl ist wichtig!)
procedure JPC_RegisterDefaultAllocator(); cdecl; external JoltLib;
procedure JPC_FactoryInit(); cdecl; external JoltLib;
procedure JPC_RegisterTypes(); cdecl; external JoltLib;

// Da wir ein Handle (Pointer) zurückbekommen:
function JPC_PhysicsSystem_new(): Pointer; cdecl; external JoltLib;
procedure JPC_PhysicsSystem_delete(system: Pointer); cdecl; external JoltLib;

// Die Init-Funktion mit den 8 Argumenten, die wir im C-Header gesehen haben
procedure JPC_PhysicsSystem_Init(
  system: Pointer;
  maxBodies: cuint32;
  numMutexes: cuint32;
  maxPairs: cuint32;
  maxConstraints: cuint32;
  bpLayerInterface: Pointer;
  objVsBpFilter: Pointer;
  objPairFilter: Pointer
); cdecl; external JoltLib;

var
  PhysicsSystem: Pointer;

begin
  try
    writeln('Initialisiere Jolt Physik...');

    // Engine-Setup
    JPC_RegisterDefaultAllocator();
    JPC_FactoryInit();
    JPC_RegisterTypes();

    // System erstellen
    PhysicsSystem := JPC_PhysicsSystem_new();

    if PhysicsSystem <> nil then
    begin
      // Initialisierung mit Standardwerten
      JPC_PhysicsSystem_Init(PhysicsSystem, 1024, 0, 1024, 1024, nil, nil, nil);

      writeln('Jolt Physik System erfolgreich erstellt!');

      // Aufräumen
      JPC_PhysicsSystem_delete(PhysicsSystem);
      writeln('System gelöscht. Erfolg!');
    end
    else
      writeln('Fehler: PhysicsSystem konnte nicht erstellt werden.');

  except
    on E: Exception do
      writeln('Fehler: ', E.Message);
  end;
end.

