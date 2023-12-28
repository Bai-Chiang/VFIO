virt-install \
    --name popos \
    --memory 8192 \
    --sysinfo host \
    --cpu host-passthrough,cache.mode=passthrough,topology.sockets=1,topology.cores=4,topology.threads=2 \
    --os-variant name='ubuntu22.04' \
    --cdrom "/var/lib/libvirt/images/pop-os_22.04_amd64_nvidia_36.iso" \
    --network network=default,model.type=virtio \
    --graphics none \
    --noautoconsole \
    --boot uefi,bootmenu.enable='yes' \
    --features smm.state=on,kvm.hidden.state=on \
    --tpm default \
    --disk path="/var/lib/libvirt/images/popos.qcow2",size=64,bus=virtio \
    --hostdev 01:00.0,type=pci \
    --hostdev 01:00.1,type=pci \
    --hostdev 0x046d:0xc542,type=usb \
    --hostdev 0x24ae:0x2010,type=usb \
    --xml xpath.create=./features/hyperv/vendor_id \
    --xml xpath.set=./features/hyperv/vendor_id/@state=on \
    --xml xpath.set=./features/hyperv/vendor_id/@value=whateverid \
    --xml xpath.create=./os/firmware/feature \
    --xml xpath.set=./os/firmware/feature/@enabled=no \
    --xml xpath.set=./os/firmware/feature/@name=secure-boot \
    --qemu-commandline="-acpitable" \
    --qemu-commandline=file=/var/lib/libvirt/qemu/SSDT1.dat \
    --iothreads 1 \
    --cputune vcpupin0.vcpu=0,vcpupin0.cpuset=2,vcpupin1.vcpu=1,vcpupin1.cpuset=8,vcpupin2.vcpu=2,vcpupin2.cpuset=3,vcpupin3.vcpu=3,vcpupin3.cpuset=9,vcpupin4.vcpu=4,vcpupin4.cpuset=4,vcpupin5.vcpu=5,vcpupin5.cpuset=10,vcpupin6.vcpu=6,vcpupin6.cpuset=5,vcpupin7.vcpu=7,vcpupin7.cpuset=11 \
    --xml xpath.create=./cputune/emulatorpin \
    --xml xpath.set=./cputune/emulatorpin/@cpuset='0,6' \
    --xml xpath.create=./cputune/iothreadpin \
    --xml xpath.set=./cputune/iothreadpin/@iothread=1 \
    --xml xpath.set=./cputune/iothreadpin/@cpuset='0,6'

