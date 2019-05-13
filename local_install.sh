#/bin/bash
#installs with CUDA if system has it

cd ~
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
git clone https://github.com/opencv/opencv_extra.git
cd ~/opencv_contrib
git checkout 3.4.2
git pull
cd ~/opencv
git checkout 3.4.2
git pull
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=~/.local/ \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D OPENCV_TEST_DATA_PATH=~/opencv_extra/testdata \
    -D WITH_OPENGL=ON \
    -D WITH_TBB=ON \
    -D WITH_GDAL=ON \
    -D WITH_CUDA=ON \
    -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda \
    -D BUILD_EXAMPLES=ON \
    -D OPENCV_ENABLE_NONFREE=ON ..
make -j4
make install
