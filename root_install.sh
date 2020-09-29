#/bin/bash
#to uninstall call make uninstall in build directory, then remove build directory

#build tools
sudo apt install -y build-essential cmake git pkg-config

#GUI -->something's up with libgtkgl package
sudo apt install -y libgtk2.0-dev eog mirage libgtkglext1-dev

#python
sudo apt install -y python3-dev python3-tk python3-numpy python3-pip

#parallelism and linear algebra
sudo apt install -y libtbb2 libtbb-dev libatlas-base-dev gfortran

#media
sudo apt install -y libjpeg-dev libpng-dev libtiff-dev libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libgdal-dev

cd ~
git clone https://github.com/opencv/opencv.git
git clone https://github.com/opencv/opencv_contrib.git
git clone https://github.com/opencv/opencv_extra.git
cd ~/opencv_contrib
git checkout 3.4.7
git pull
cd ~/opencv
git checkout 3.4.7
git pull
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=ON \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=ON \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D OPENCV_TEST_DATA_PATH=~/opencv_extra/testdata \
    -D WITH_OPENGL=ON \
    -D WITH_TBB=ON \
    -D WITH_GDAL=ON \
    -D WITH_LIBV4L=ON \
    -D BUILD_EXAMPLES=ON \
    -D OPENCV_ENABLE_NONFREE=ON ..
make -j4
make install
