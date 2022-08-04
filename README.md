# Docker usage

Arch does not provide any way to obtain `virt-win-reg`, which is required by this utility. I wrapped everything required in a container based on Ubuntu 22.04. The utility only needs access to the Windows disk.

`docker run -it --rm -v /your/drive/directory:/drives/ ghcr.io/jrcichra/kvm-mergeide /drives/windowsxp-file.img`

# kvm-mergeide

kvm-mergeide - Apply the mergeide.reg hack to kvm compatible windows images.

The mergeide fix relaxes the annoying windows requirements for same
hardware. This avoids 0x0000007B errors after you move system disks
to other hardware, e.g., from physical to virtual hardware.

This script applies the fix automatically.

More:

- http://support.microsoft.com/kb/314082

Tested on:

- Windows XP SP3
- Windows Server 2003
- Windows Server 2008 R2

## Install

    $ cd /opt
    $ git clone https://github.com/jakobadam/kvm-mergeide.git
    $ ln -s /opt/kvm-mergeide/kvm-mergeide.sh /usr/bin/kvm-mergeide

## Usage

    $ sudo kvm-mergeide WINDOWS_IMAGE

## TODO (maybe)

If there are situations where the control set of the registry hive is
not 001, mergeide_create_reg.py can extract the control set and create
a proper mergeide.reg. This should be incorporated into the shell script.
