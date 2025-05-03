# MakeMKV
```shell
udevadm info -q env -n /dev/sr0
https://forum.makemkv.com/forum/viewtopic.php?f=3&t=224
makemkvcon -r --cache=1 info disc:0 > makemkv.log
cat makemkv.log | grep DRV:02
makemkvcon --directio=true --noscan --cache 4096 -r backup disc:0 .
```



# NVENC
https://documentation.ubuntu.com/server/how-to/graphics/install-nvidia-drivers/index.html
nvidia-cuda-toolkit
nvidia-drivers-570-server

ii  libnvidia-cfg1-550-server:amd64       550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA binary OpenGL/GLX configuration library
ii  libnvidia-common-550-server           550.144.03-0ubuntu0.24.04.1             all          Shared files used by the NVIDIA libraries
ii  libnvidia-compute-550-server:amd64    550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA libcompute package
ii  libnvidia-container-tools             1.17.5-1                                amd64        NVIDIA container runtime library (command-line tools)
ii  libnvidia-container1:amd64            1.17.5-1                                amd64        NVIDIA container runtime library
ii  libnvidia-decode-550-server:amd64     550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA Video Decoding runtime libraries
ii  libnvidia-egl-wayland1:amd64          1:1.1.13-1build1                        amd64        Wayland EGL External Platform library -- shared library
ii  libnvidia-encode-550-server:amd64     550.144.03-0ubuntu0.24.04.1             amd64        NVENC Video Encoding runtime library
ii  libnvidia-extra-550-server:amd64      550.144.03-0ubuntu0.24.04.1             amd64        Extra libraries for the NVIDIA Server Driver
ii  libnvidia-fbc1-550-server:amd64       550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA OpenGL-based Framebuffer Capture runtime library
ii  libnvidia-gl-550-server:amd64         550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA OpenGL/GLX/EGL/GLES GLVND libraries and Vulkan ICD
ii  libnvidia-ml-dev:amd64                12.0.140~12.0.1-4build4                 amd64        NVIDIA Management Library (NVML) development files
ii  nvidia-compute-utils-550-server       550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA compute utilities
ii  nvidia-container-toolkit              1.17.5-1                                amd64        NVIDIA Container toolkit
ii  nvidia-container-toolkit-base         1.17.5-1                                amd64        NVIDIA Container Toolkit Base
ii  nvidia-cuda-dev:amd64                 12.0.146~12.0.1-4build4                 amd64        NVIDIA CUDA development files
ii  nvidia-cuda-gdb                       12.0.140~12.0.1-4build4                 amd64        NVIDIA CUDA Debugger (GDB)
ii  nvidia-cuda-toolkit                   12.0.140~12.0.1-4build4                 amd64        NVIDIA CUDA development toolkit
ii  nvidia-cuda-toolkit-doc               12.0.1-4build4                          all          NVIDIA CUDA and OpenCL documentation
ii  nvidia-dkms-550-server                550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA DKMS package
ii  nvidia-driver-550-server              550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA Server Driver metapackage
ii  nvidia-firmware-550-server-550.144.03 550.144.03-0ubuntu0.24.04.1             amd64        Firmware files used by the kernel module
ii  nvidia-kernel-common-550-server       550.144.03-0ubuntu0.24.04.1             amd64        Shared files used with the kernel module
ii  nvidia-kernel-source-550-server       550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA kernel source package
ii  nvidia-opencl-dev:amd64               12.0.140~12.0.1-4build4                 amd64        NVIDIA OpenCL development files
ii  nvidia-profiler                       12.0.146~12.0.1-4build4                 amd64        NVIDIA Profiler for CUDA and OpenCL
ii  nvidia-utils-550-server               550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA Server Driver support binaries
ii  nvidia-visual-profiler                12.0.146~12.0.1-4build4                 amd64        NVIDIA Visual Profiler for CUDA and OpenCL
ii  xserver-xorg-video-nvidia-550-server  550.144.03-0ubuntu0.24.04.1             amd64        NVIDIA binary Xorg driver
