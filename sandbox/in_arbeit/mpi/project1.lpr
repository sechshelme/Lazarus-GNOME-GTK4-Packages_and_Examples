program project1;

uses
  fp_mpi;

  procedure main;
  var
    welt_groesse: longint = 0;
    mein_rang: longint = 0;
  begin
    MPI_Init(@argc, @argv);

    MPI_Comm_size(@ompi_mpi_comm_world, @welt_groesse);
    MPI_Comm_rank(@ompi_mpi_comm_world, @mein_rang);

    WriteLn('Hallo von Kern ', mein_rang: 3, ' von insgesamt ', welt_groesse: 3, ' Kernen!');

    MPI_Finalize();
  end;

begin
  main;
end.
