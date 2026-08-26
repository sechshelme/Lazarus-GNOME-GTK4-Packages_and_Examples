cmake ../nativefiledialog-extended/ -DNFD_PORTAL=ON -DBUILD_SHARED_LIBS=ON 


cmake ../nativefiledialog-extended/ \
  -DCMAKE_SYSTEM_NAME=Windows \
  -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc \
  -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ \
  -DNFD_PORTAL=OFF \
  -DBUILD_SHARED_LIBS=ON

