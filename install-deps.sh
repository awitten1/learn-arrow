#!/bin/bash

set -eux

cd $(dirname $(realpath $0))

install_deps() {
    sudo apt install -y build-essential cmake \
        ninja-build
}

install_arrow() {
    mkdir -p deps
    mkdir -p deps/sources
    mkdir -p deps/install
    mkdir -p deps/build

    local install_dir=$(realpath deps/install)
    local build_dir=$(realpath deps/build/arrow)
    pushd deps/sources

    if [ ! -d arrow ]; then
        git clone --branch=apache-arrow-21.0.0 git@github.com:apache/arrow.git
    fi
    cmake -S arrow/cpp -B $build_dir -DCMAKE_INSTALL_PREFIX=$install_dir -G Ninja --preset ninja-release
    cmake --build $build_dir -j14
    cmake --install $build_dir
    popd
}

install_deps
install_arrow