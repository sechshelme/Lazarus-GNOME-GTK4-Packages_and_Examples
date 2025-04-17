program project1;

uses
tk_tcl_common,
tclPlatDecls,
tkPlatDecls,
tclDecls,
tcl,
tkDecls,
tk;


// Funktion zum Auslesen und Ausgeben des ausgewählten Elements aus der Listbox
//int printSelection(ClientData clientData, Tcl_Interp *interp, int argc, const char *argv[]) {
//    const char *selectedIndex;
//    const char *selectedItem;
//
//    // Hole den Index des ausgewählten Elements
//    if (Tcl_Eval(interp, "set selectedIndex [.listbox curselection]") != TCL_OK) {
//        fprintf(stderr, "Fehler beim Auslesen der Auswahl: %s\n", Tcl_GetStringResult(interp));
//        return TCL_ERROR;
//    }
//    selectedIndex = Tcl_GetVar(interp, "selectedIndex", TCL_GLOBAL_ONLY);
//
//    // Hole den Text des ausgewählten Elements
//    if (Tcl_Eval(interp, "set selectedItem [.listbox get $selectedIndex]") != TCL_OK) {
//        fprintf(stderr, "Fehler beim Auslesen des Elements: %s\n", Tcl_GetStringResult(interp));
//        return TCL_ERROR;
//    }
//    selectedItem = Tcl_GetVar(interp, "selectedItem", TCL_GLOBAL_ONLY);
//
//    // Gib das ausgewählte Element aus
//    printf("Ausgewähltes Element: %s\n", selectedItem);
//    return TCL_OK;
//}

function main(argc:Integer; argv:PPChar):Integer ;
var
  interp: PTcl_Interp;
  mainWindow: TTk_Window;
begin
    interp := Tcl_CreateInterp();
    if Tcl_Init(interp) = TCL_ERROR then begin
        WriteLn('Tcl_Init Fehler: ', Tcl_GetStringResult(interp));
        Exit(1);
    end;

    if Tk_Init(interp) =TCL_ERROR then begin
        WriteLn('Tk_Init Fehler: ', Tcl_GetStringResult(interp));
        Exit(1);
    end;

    mainWindow := Tk_MainWindow(interp);
    if (!mainWindow) {
        fprintf(stderr, "Fehler beim Erstellen des Hauptfensters: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }
    Tk_SetAppName(mainWindow, "Listbox Beispiel");

    // Erstelle die Listbox
    if (Tcl_Eval(interp,
                 "listbox .listbox -height 10 -selectmode browse; "
                 "pack .listbox -side top -padx 10 -pady 10") != TCL_OK) {
        fprintf(stderr, "Fehler beim Erstellen der Listbox: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }

    // Füge Elemente zur Listbox hinzu
    if (Tcl_Eval(interp,
                 ".listbox insert end \"Apfel\" \"Orange\" \"Banane\" \"Pfirsich\" \"Traube\"") != TCL_OK) {
        fprintf(stderr, "Fehler beim Hinzufügen von Elementen: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }

    // Registriere die Funktion `printSelection` als Tcl-Befehl
    if (Tcl_CreateCommand(interp, "printSelection", printSelection,
                          NULL, NULL) == NULL) {
        fprintf(stderr, "Fehler beim Registrieren der printSelection-Funktion.\n");
        Exit(1);
    }

    // Erstelle den Button zum Beenden der Anwendung
    if (Tcl_Eval(interp,
                 "button .quit -text \"Quit\" -command {exit}; "
                 "pack .quit -side left -padx 10 -pady 10") != TCL_OK) {
        fprintf(stderr, "Fehler beim Erstellen des Quit-Buttons: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }

    // Erstelle den Button zum Ausgeben der Auswahl
    if (Tcl_Eval(interp,
                 "button .print -text \"Print Selection\" -command printSelection; "
                 "pack .print -side left -padx 10 -pady 10") != TCL_OK) {
        fprintf(stderr, "Fehler beim Erstellen des Print-Buttons: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }

// ================

// Funktion zum Auslesen und Ausgeben des Textes aus dem Eingabefeld



  // Erstelle ein Eingabefeld
    if (Tcl_Eval(interp,
                 "entry .entry -width 30; "
                 "pack .entry -side top -padx 10 -pady 10") != TCL_OK) {
        fprintf(stderr, "Fehler beim Erstellen des Eingabefeldes: %s\n", Tcl_GetStringResult(interp));
        Exit(1);
    }



// =====================0



    // Starte die Haupt-Ereignisschleife
    Tk_MainLoop();

    // Aufräumen
    Tcl_DeleteInterp(interp);

    return 0;
}




begin

end.

