About the HP F11 BIOS Key
---

All the magic is done in "Installer\Addons" directory.

Basically the HP F11 BIOS Key is working again because the Recovery partition 
is 'tagged' with the "RECOVERY" magic word by the HP Tag program that you'll 
find there.

All the rest of the work is done by the original MBRINST tool made by the 
XSS company (www.xss.com). The MBR.INI file was adapted in order to allow that
kind of installation. But the software itself isn't modified at all...

The HP Recovery Boot Sector Tag tool ('hptag') was made by me, and it's based 
on the work done by Snack, LaptoniC, and all MSFN board.
MSFN: www.msfn.org/board/topic/131620-hp-notebook-the-recovery-partition-could-not-be-found/

SiZiOUS, 2015
www.sizious.com - sizious (at) gmail (d0t) com - fb.com/sizious - @sizious

- eof -
