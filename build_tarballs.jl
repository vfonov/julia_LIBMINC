using BinaryBuilder, Pkg

name = "LIBMINC"
version = v"2.4.9"
sources = [
    #ArchiveSource("https://github.com/BIC-MNI/libminc/archive/refs/heads/develop.tar.gz", "cad1b1797b83906f5a042648d20615bd077b01d3e6c4ed885ea37fe7e9a9c8b9"),
    #DirectorySource("/home/vfonov/src/libminc")
    GitSource("git@github.com:BIC-MNI/libminc.git","aa08255f0856e70fb001c5f9ee1f4e5a8c12d47d")
    GitSource("git@github.com:NIST-MNI/minc2-simple.git","e2d2d14ba15aff7dbcadeb3145f17d88bb4f3b72")
]

script = raw"""
cd ${WORKSPACE}/srcdir/libminc
mkdir build
cd build
cmake .. \
    -DCMAKE_INSTALL_PREFIX=${prefix} \
    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN} \
    -DCMAKE_BUILD_TYPE=Release \
    -DLIBMINC_BUILD_SHARED_LIBS:BOOL=ON \
    -DLIBMINC_MINC1_SUPPORT:BOOL=ON \
    -DBUILD_TESTING:BOOL=OFF \
    -DLIBMINC_USE_NIFTI:BOOL=OFF \
    -DLIBMINC_BUILD_EZMINC=OFF
make -j${nproc}
make install


cd ../../minc2-simple
mkdir build
cd build
cmake .. \
    -DCMAKE_INSTALL_PREFIX=${prefix} \
    -DCMAKE_TOOLCHAIN_FILE=${CMAKE_TARGET_TOOLCHAIN} \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_TESTING:BOOL=OFF \
    -DLIBMINC_DIR:PATH=$prefix/lib/cmake
make -j${nproc}
make install
    

install_license ${WORKSPACE}/srcdir/libminc/COPYING

"""

#platforms = supported_platforms()

platforms = [
    Platform("x86_64", "Linux";libc="glibc"),
]

#platforms = expand_cxxstring_abis(platforms)

products = [
    LibraryProduct("libminc2", :libminc2),
    LibraryProduct("libminc2-simple", :libminc2_simple)
]

dependencies = [
    Dependency("HDF5_jll",  compat="1.12.2"),
    Dependency("NetCDF_jll",v"v400.902.5+1"),
]

build_tarballs(ARGS, name, version, sources, script, platforms, products, dependencies)
