wget -q https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.16.1.tar.xz
tar -xvJf linux-4.16.1.tar.xz
cd linux-4.16.1.tar.xz
sudo apt-get install fakeroot build-essential ncurses-dev xz-utils libssl-dev
sudo make menuconfig
sudo make -j 4 && sudo make modules_install -j 4 && sudo make install -j 4