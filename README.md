Some VFIO/PCI passthrough scripts I used when testing on fedora laptop.

- [ansible playbook](fedora.yml) for fedora to set up VFIO environment.
- install [scripts](virt-install_script/). Download all iso images as root to directories specified in the script.
  This should avoid any selinux permission change.
  Run these scripts as root.

Also see my [notes](https://wiki.archlinux.org/title/User:Bai-Chiang/VFIO_notes).
