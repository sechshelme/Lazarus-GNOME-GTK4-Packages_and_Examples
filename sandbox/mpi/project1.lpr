program project1;

const
  MPI_LIB = 'mpi';

var
  ompi_mpi_comm_world: byte; external MPI_LIB Name 'ompi_mpi_comm_world';

  function MPI_Init(argc: PptrInt; argv: PPPChar): longint; cdecl; external MPI_LIB;
  function MPI_Comm_size(comm: Pointer; size: PLongInt): longint; cdecl; external MPI_LIB;
  function MPI_Comm_rank(comm: Pointer; rank: PLongInt): longint; cdecl; external MPI_LIB;
  function MPI_Finalize(): longint; cdecl; external MPI_LIB;

var
  welt_groesse: longint = 0;
  mein_rang: longint = 0;

begin
  MPI_Init(@argc, @argv);

  MPI_Comm_size(@ompi_mpi_comm_world, @welt_groesse);
  MPI_Comm_rank(@ompi_mpi_comm_world, @mein_rang);

  WriteLn('Hallo von Kern ', mein_rang:3, ' von insgesamt ', welt_groesse:3, ' Kernen!');

  MPI_Finalize();
end.
