FROM nvidia/cudagl:9.1-devel-centos7
MAINTAINER Joel Polizzi (jpolizzi@eng.ucsd.edu)
MAINTAINER Isaac Nealey (inealey@ucsd.edu)

RUN yum clean all && \
yum update -y && \
yum install kernel-devel -y && \
yum install compat-glibc-headers -y && \
yum groupinstall "Development Tools" -y && \
yum install epel-release -y && \
yum install glibc-headers -y && \
yum install yum-utils -y && \
yum install ImageMagick-devel -y && \
yum install openal-soft-devel -y && \
yum install autoconf -y && \
yum install git make unzip glew-devel glfw-devel portaudio portaudio-devel wget yasm-devel -y && \
yum install mlocate which -y && \
yum install cmake -y && \
yum install -y arts-devel && \
yum install -y freetype-devel && \
yum install -y freeglut-devel && \
yum install -y ImageMagick-c++-devel.x86_64 && \
yum install -y emacs && \
yum install -y screen && \
yum install -y gnuplot && \
yum install -y latex2html && \
yum install -y gsl-devel && \
yum install -y lapack-devel && \
yum install -y opencv-devel && \
yum install -y giflib-devel && \
yum install -y selinux-policy.noarch && \
yum install -y xorg-x11-apps && \
yum install -y glibc-devel.i686 && \
yum install -y libstdc++.i686 && \
yum install -y libstdc++.so.5 && \
yum install -y libstdc++.so.6 && \
yum install -y freeglut-devel.x86_64 && \
yum install -y python-devel.x86_64 && \
yum install -y libidn-devel.x86_64 && \
yum install -y e2fsprogs-devel.x86_64 && \
yum install -y ncurses-devel.i686 && \
yum install -y ncurses-devel.x86_64 && \
yum install -y zlib.i686 && \
yum install -y tcl-devel && \
yum install -y tk-devel && \
yum install -y recordmydesktop && \
yum install -y mxml-devel-2.9-1.el7.x86_64 && \
yum install -y glibc-static && \
yum install -y SDL-devel && \
yum reinstall -y libX11-devel-1.6.5-1.el7.x86_64 && \
yum reinstall -y xorg-x11-proto-devel-7.7-20.el7.noarch

RUN ln -s /usr/lib64/libhdf5.so.7 /usr/lib64/libhdf5.so.6

WORKDIR /etc/yum.repos.d/
RUN echo "[linuxtech]" > linuxtech.repo && \
echo "name=LinuxTECH" >> linuxtech.repo && \
echo "baseurl=http://pkgrepo.linuxtech.net/el6/release/" >> linuxtech.repo && \
echo "enabled=1" >> linuxtech.repo && \
echo "gpgcheck=1" >> linuxtech.repo && \
echo "gpgkey=http://pkgrepo.linuxtech.net/el6/release/RPM-GPG-KEY-LinuxTECH.NET" >> linuxtech.repo

RUN echo "[naulinux-school]" > naulinux-school.repo && \
echo "name=NauLinuc School" >> naulinux-school.repo && \
echo "baseurl=http://downloads.naulinux.ru/pub/NauLinux/6.2/x86_64/sites/School/RPMS/" >> naulinux-school.repo && \
echo "enabled=0" >> naulinux-school.repo && \
echo "gpgcheck=1" >> naulinux-school.repo && \
echo "gpgkey=http://downloads.naulinux.ru/pub/NauLinux/RPM-GPG-KEY-linux-ink" >> naulinux-school.repo

RUN updatedb && \
yum install -y gkrellm && \
yum install -y fltk-fluid && \
yum install -y mysql++-devel && \
yum install -y ntfs-3g && \
yum --enablerepo=naulinux-school install -y directfb-devel

RUN updatedb

WORKDIR /root/
RUN rpm -Uvh http://li.nux.ro/download/nux/dextop/el7/x86_64/nux-dextop-release-0-5.el7.nux.noarch.rpm
RUN yum install ffmpeg ffmpeg-devel -y

# RUN git clone https://github.com/openscenegraph/OpenSceneGraph.git
RUN git clone --branch OpenSceneGraph-3.6.2 https://github.com/openscenegraph/OpenSceneGraph.git

WORKDIR /root/OpenSceneGraph/
RUN sed -i '328i INCLUDE_DIRECTORIES (SYSTEM /usr/lib/x86_64-redhat-linux6E/include/)' CMakeLists.txt
RUN mkdir build
WORKDIR /root/OpenSceneGraph/build/
RUN cmake .. && \
make -j20 && \
make install

RUN echo "" >> ~/.bashrc && \
echo "export CALVR_HOME=/root/calvr" >> ~/.bashrc && \
echo "export CALVR_CONFIG_FILE=calvrdockerconfig.xml" >> ~/.bashrc

WORKDIR /root/
RUN git clone https://github.com/CalVR/calvr.git
WORKDIR /root/calvr/
RUN sed -i '10i INCLUDE_DIRECTORIES (SYSTEM /usr/lib/x86_64-redhat-linux6E/include/)' CMakeLists.txt && \
cmake . && \
make -j20 && \
make install

WORKDIR /root/
RUN git clone https://github.com/CalVR/calvr_plugins.git
WORKDIR /root/calvr_plugins/
RUN sed -i '42i INCLUDE_DIRECTORIES (SYSTEM /usr/lib/x86_64-redhat-linux6E/include/)' CMakeLists.txt && \
cmake -D CALVR_DIR=/root/calvr -D CALVR_INCLUDE_DIR=/root/calvr/include -D PLUGIN_MODELLOADER=ON \
-D PLUGIN_ARTIFACTVIS=ON -D PLUGIN_POINTS=ON -D PLUGIN_PANOVIEWLOD=ON -D PLUGIN_POINTSOOC=ON \
-D PLUGIN_POINTSWITHPANS=ON -D PLUGIN_IMAGEVIEWER=ON . && \ 
make -j20 && \
make install

ENV NVIDIA_DRIVER_CAPABILITIES compute,display

WORKDIR /root/calvr/bin
#CMD [./CalVR]

