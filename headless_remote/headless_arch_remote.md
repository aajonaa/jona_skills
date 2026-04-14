1. The Problem: "The Monitor Power Gap"
When you turn off a modern monitor (especially via DisplayPort/HDMI), it stops sending EDID (Extended Display Identification Data) to your GPU.

The Bug: The NVIDIA driver sees the power cut as a physical "unplug" event.
The Crash: X11 (the display server) destroys the desktop session (DISPLAY=:0) because it thinks there is no screen to draw on.
The Result: Your RustDesk session freezes, turns black, or disconnects because the "source" desktop has disappeared.
2. The Solution: EDID Spoofing
We "tricked" the NVIDIA driver into believing your monitor is permanently plugged in and turned on by capturing its "identity card" (the EDID file) and forcing the driver to load it at boot.
3. Step-by-Step Implementation
Phase A: Identifying the Hardware Ports
Before capturing data, we had to find out exactly how the system sees your monitor.

Check the X11 Name:
Bash

xrandr
Result: We found your active display is named DP-5.
Check the Kernel Name:
Bash

grep -H "connected" /sys/class/drm/card*-*/status
Result: We found the physical hardware path is card1-DP-3.
Phase B: Capturing & Placing the Identity File
We needed to "copy" your monitor's brain into a file the system can read even when the monitor is off.

Extract the EDID:
Bash

cp /sys/class/drm/card1-DP-3/edid ~/edid.bin
Verify the File:
Bash

ls -l ~/edid.bin
Goal: Ensure the size is 256 bytes. (A size of 0 means the monitor was off or the path was wrong).
Move to System Folder:
Bash

sudo cp ~/edid.bin /etc/X11/edid.bin
Phase C: Creating the NVIDIA Rule
We told the NVIDIA driver to ignore reality and use our file instead.

Create the configuration directory:
Bash

sudo mkdir -p /etc/X11/xorg.conf.d
Create the configuration file:
Bash

sudo nano /etc/X11/xorg.conf.d/10-nvidia-edid.conf
Paste the specific instructions:
Plaintext

Section "Device"
    Identifier     "Device0"
    Driver         "nvidia"
    VendorName     "NVIDIA Corporation"
    BoardName      "GeForce RTX 4070 Ti SUPER"
    Option         "ConnectedMonitor" "DP-5"
    Option         "CustomEDID" "DP-5:/etc/X11/edid.bin"
EndSection
Note: We used DP-5 because that is how the NVIDIA X11 driver identifies your port.
Phase D: Applying Changes
Save and Exit: Press Ctrl+O, Enter, then Ctrl+X.
Reboot: ```bash
sudo reboot


4. Final Result
Your Arch system now treats the 256-byte edid.bin file as a "Virtual Monitor" that never sleeps.

Status: You can now physically turn off your monitor.
RustDesk: Your remote connection will remain perfectly active at 1920x1080, allowing you to control your KDE Plasma GUI from anywhere without a physical screen being powered on.