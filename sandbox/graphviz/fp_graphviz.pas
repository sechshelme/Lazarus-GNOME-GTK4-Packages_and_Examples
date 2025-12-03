unit fp_graphviz;

interface

const
  {$IFDEF Linux}
  libgvc = 'gvc';
  libcgraph = 'cgraph';
  {$ENDIF}

  {$IFDEF Windows}
 // ????
  {$ENDIF}

 type
   Tsize_t=SizeUInt;

   Pvmalloc_s=type Pointer; // Herkunft unbekannt

   PFILE=type Pointer;

implementation

end.

