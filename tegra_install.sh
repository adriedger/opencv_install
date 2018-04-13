#/bin/bash
# for jestson tx2

#build tools
sudo apt install -y build-essential cmake git pkg-config

#GUI
sudo apt install -y libgtk2.0-dev

#python3
sudo apt install -y python3-dev python3-tk python3-numpy

#parallelism and linear algebra
sudo apt install -y libtbb2 libtbb-dev libatlas-base-dev gfortran

#media
sudo apt install -y libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgdal-dev

# GStreamer support
sudo apt-get install -y libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev 

cd ~
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
git clone https://github.com/opencv/opencv_extra.git
cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D OPENCV_TEST_DATA_PATH=~/opencv_extra/testdata \
    -D WITH_OPENGL=ON \
    -D WITH_TBB=ON \
    -D WITH_GDAL=ON \
    -D BUILD_opencv_python3=ON \
    -D WITH_FFMPEG=ON \
    -D WITH_GSTREAMER=ON \
    -D WITH_GSTREAMER_0_10=OFF \
    -D WITH_CUDA=ON \
    -D CUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda-8.0 \
    -D CUDA_ARCH_BIN=6.2 \
    -D CUDA_ARCH_PTX="" \
    -D INSTALL_C_EXAMPLES=ON \
    -D INSTALL_TESTS=ON \
    -D BUILD_EXAMPLES=ON ..
make
sudo make install
