How stuff works
===============

1. Normal operation
-------------------
Read data from linuxtrack, send to device.
Use map of limits for all 6 coords to init device and to clip readings.
Use linuxtrack profile name (optional).

Should have buttons to start/stop tracker. When active, other modes can't be
used.

2. Calibration
--------------
Dialog showing limits for each axis.
Find limits mode - moving head will extend
limits.
Verify - just show values (axis sliders maybe?).
Center button - send centering command to linuxtrack.

3. Application list
-------------------
List of apps that trigger autostart of tracker.
Maybe show currently running aps to add?

If tabs are used, block tab switch when tracker is active?
