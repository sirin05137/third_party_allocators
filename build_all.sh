#!/bin/bash

# should use llvm-12

# build CAMP-fully
pushd CAMP-fully > /dev/null
	patch -p1 < ../patches/CAMP-fully.patch
	mkdir build && cd build
	cmake .. && make -j`nproc`
popd > /dev/null

# build CAMP-no-spatial
pushd CAMP-no-spatial > /dev/null
	patch -p1 < ../patches/CAMP-no-spatial.patch
	mkdir build && cd build
	cmake .. && make -j`nproc`
popd > /dev/null

# build MarkUs
pushd MarkUs > /dev/null
	patch -p1 < ../patches/MarkUs.patch
	./setup.sh
popd > /dev/null

# build ffmalloc
pushd ffmalloc > /dev/null
	make -j`nproc`
popd > /dev/null

# build hushvac
pushd hushvac > /dev/null
	make -j`nproc`
popd > /dev/null

# build jemalloc
pushd jemalloc > /dev/null
	./autogen.sh
	make -j`nproc`
popd > /dev/null

# build minesweeper-fully
pushd minesweeper-fully > /dev/null
	cd scripts
	./build_minesweeper.sh
popd > /dev/null

# build minesweeper-mostly
pushd minesweeper-mostly > /dev/null
	pushd minesweeper-public > /dev/null
		patch -p1 < ../../patches/minesweeper-mostly.patch
	popd > /dev/null
	cd scripts
	./build_minesweeper.sh
popd > /dev/null

