       ______                                     _____           _           
       | ___ \                                   |_   _|         | |          
       | |_/ /___  ___ _____   _____ _ __ _   _    | | ___   ___ | |___       
       |    // _ \/ __/ _ \ \ / / _ \ '__| | | |   | |/ _ \ / _ \| / __|      
       | |\ \  __/ (_| (_) \ V /  __/ |  | |_| |   | | (_) | (_) | \__ \      
       \_| \_\___|\___\___/ \_/ \___|_|   \__, |   \_/\___/ \___/|_|___/      
                                           __/ |           AnarethoS
                                          |___/   Recovery Tools HP Edition
________________________________________________________________________________

           Recovery Tools 4.0.1 Windows 7 MBR for Hewlett-Packard (HP)
________________________________________________________________________________

  This package is a special Recovery Tools 4.0.1 package made for HP laptops
  running Windows 7 in MBR mode. It's based on the excellent work done by
  AnarethoS (www.anarethos.com).
   
  Major changes between the official AnarethoS package and this one are:
     * The HP F11 BIOS recovery key is working properly. When hitting this key 
       at startup, the Recovery Tools package will be run from the Recovery
       partition, by the BIOS boot-code.
     * The hard-disk is split in 2 partitions for the data, 1 for the OS
       (Size: 200GB) and the other for the user data.     
     * All the Recovery Tools were translated into French language. Read the 
       "readme.txt" file inside the "lang" directory to learn more.

  Everything was pre-configured in order to be ready-to-use on HP laptop
  running Windows 7 in MBR mode.
   ___           __ _                    _   _          
  / __|___ _ _  / _(_)__ _ _  _ _ _ __ _| |_(_)___ _ _  
_| (__/ _ \ ' \|  _| / _` | || | '_/ _` |  _| / _ \ ' \ ________________________
  \___\___/_||_|_| |_\__, |\_,_|_| \__,_|\__|_\___/_||_| 1. Configuration
                     |___/  

  The first thing to do before using this package is to install Windows AIK.
  You must install this software because Recovery Tools need ImageX and OscdImg
  from that Microsoft package. Get Windows AIK here:
  https://www.microsoft.com/en-us/download/details.aspx?id=5753

  Before installing Recovery Tools to the target computer, you can configure 3 
  little things:
      * The Recovery Tools language (when used from the target computer)
      * The size of the C:\ partition
      * The presence of a D:\ partition

  1. Configuring the Recovery Tools language:
     
     If your target computer is in the French language, go to the "lang"
     directory and follow the steps described in that directory.
     By default, the Recovery Tools language is set to English.

  2. Changing the C:\ partition size

     If you want to change the size of the OS partition (C:\) you need
     to modify these files: "AutoUnattend.xml" from the "AutoUnattend"
     directory and "ResetPartitions.txt" from the "Settings" directory.
     Search for the value 204801 (i.e. 204801 MB = 200 GB) in these files.

  3. Removing the presence of the D:\ partition
     
     It isn't recommended. But if you want to, just remove the entries
     from the "AutoUnattend.xml" from the "AutoUnattend" directory and in
     "ResetPartitions.txt" from the "Settings" directory.

     Please note, the original AnarethoS package was provided without a D:\
     partition.
  ___         _        _ _      _   _          
 |_ _|_ _  __| |_ __ _| | |__ _| |_(_)___ _ _  
__| || ' \(_-<  _/ _` | | / _` |  _| / _ \ ' \__________________________________ 
 |___|_||_/__/\__\__,_|_|_\__,_|\__|_\___/_||_| 2. Installation
                                               			
  This package is stand-alone, you don't need to use the official Recovery 
  Tools package from AnarethoS.

  Every steps below are done from the "Windows 7 Recovery Tools" directory from 
  the "package" directory.

   1. Plug an empty USB key to your host computer.
   
   2. Go to the "AutoUnattend" directory then copy the "AutoUnattend.xml" file
      to the root of the USB key plugged in step 1.

   3. Start the "01-Get_Required_Files.cmd" batch file in Administrator mode.
      You only need to do that once. This'll grab some required files from 
      various sources (e.g. Internet and Windows AIK).       
      Note: Don't worry about the Administrator mode. Nothing will be modified 
      on your computer (you can edit the batch script file if you want check).
	  
   4. Execute the "02-Update_Settings.cmd" file. Wait until the "install.zip"
      file is generated. Copy that file to the root of the same USB key plugged
      in step 1 (at this step, Recovery Tools is ready to be installed).
      	  
   5. Now plug this USB key to the target computer.
      Insert your official Windows 7 setup disk into the target computer.
   
   6. Run the Windows 7 installation. Windows 7 setup should start in "Audit"
      mode (i.e. the first setup screen is white instead of blue). Choose the
      Windows 7 edition you want to install then hit "Next". Wait until the
      installation completes.

   7. The computer should be on the Desktop, logged with the special
      'Administrator' account. CLOSE THAT SYSPREP WINDOW. DON'T TOUCH IT. NEVER.
	  
   8. Now it's time to install the HP drivers. Grab them from the HP website, 
      and install them. You can restart the computer as many times you want.
      The computer will remains in Audit mode until you install the Recovery
      Tools (see the next step below). By the way, it's a good idea to run 
      Windows Update now.
	  
   9. After you done setting up everything you want to, unzip the "install.zip"
      package on the Desktop. Run the "Install - Windows 7.cmd" batch file.
      This will install the Recovery Tools to the target computer.
	  
  10. Wait until the computer restart. After the "Windows 7 Capture" program 
      is done, the computer is ready for the end-user.
      
      Wow, you did it! everything is now ready!

     **********************************************************************
     ** Never redistribute this package without cleaning up everything.  **
     **                                                                  **
     ** To perform this operation, execute the following scripts:        **
     **   - "03-Package_Cleanup.cmd"                                     **
     **   - "04-Package_Remove_Licensed_Files.cmd"                       **
     **                                                                  **
     ** Thank you for your understanding.                                **
     **********************************************************************
  _   _                   
 | | | |___ __ _ __ _ ___ 
_| |_| (_-</ _` / _` / -_)______________________________________________________
  \___//__/\__,_\__, \___| 3. Usage
                |___/	 
  
  You have multiple possibilities to use the Recovery Tools on the target
  computer when installed with this package.

  When logged to Windows:
    1. Start the "Recovery Tools" from the Start Menu. From that menu, you'll be
       able to:
          a. Boot into the Recovery environment (WinRE), and from there, a new
             option is available allowing you to:
               - Browse the hard-disk (by using Double Commander)
               - Editing the Registry
               - Editing text files with Notepad
               - Restoring the computer to its initial state
          b. Create a set of DVDs containing everything to recreate the 
             configuration (including partition layout, softwares, etc.).
          c. Create an USB key (max 32 GB) to restore the computer (like the DVD
             option) or try to repair an existing Windows installation
          d. Run the embed Backup software from Windows.
    2. In %SYSTEMROOT%, you'll find a batch script called "FullRestore.cmd" that
       will restore the C:\ and SYSTEM drive to its initial state.
	   
  When starting the computer, if you hit the F11 key at boot, the Recovery tool 
  from the Recovery partition will start. This will allow you to restore the 
  computer to its initial state like the option in WinRE (so the Data partition
  won't be destroyed, at least for me).

  If you're restoring from the USB key or from the DVDs, everything will be
  destroyed, INCLUDING the Data partition.
  _  __                       _                 
 | |/ /_ _  _____ __ ___ _   | |__ _  _ __ _ ___
_| ' <| ' \/ _ \ V  V / ' \  | '_ \ || / _` (_-<________________________________
 |_|\_\_||_\___/\_/\_/|_||_| |_.__/\_,_\__, /__/ 4. Known Bugs
                                       |___/
									   
  There's some minor 'bugs' in that release. I wasn't able to fix them, but
  since they're minor, I'm just listing them here in case of someone want to
  investigate further.

   - Sometime, when restoring the computer to its initial state (i.e. using the
     Recovery program from WinRE), the RECOVERY partition (R:\ by default) is
     properly hidden but still visible in the "My Computer" icon. The partition
     disappear completely after rebooting the computer.
	
   - Sometime, when using the recovery tool from WinRE, the Data partition is
     assigned to letter E:\ instead of D:\. This is really minor and the Data
     partition can be changed manually after the restoration.
	 
  I think I won't try to fix these minor bugs. Up to you if you want to do so.
  _    _                     
 | |  (_)__ ___ _ _  ___ ___ 
_| |__| / _/ -_) ' \(_-</ -_)___________________________________________________
 |____|_\__\___|_||_/__/\___| 5. License
  
  I wasn't able to find the original license for the AnarethoS package.
  That's why I use the GNU GPL 3 license for the whole package.

  Please check the "license.txt" file for more details.
   ___            _ _ _      
  / __|_ _ ___ __| (_) |_ ___
_| (__| '_/ -_) _` | |  _(_-<___________________________________________________
  \___|_| \___\__,_|_|\__/__/ 6. Credits

  This package was tested a lot on my HP G62-a57SF laptop.
  I hope it'll be useful to you.

  Of course, every credits goes to AnarethoS for his nice work.
  For the HP F11 BIOS Key, credits goes to Snack, LaptoniC, and the MSFN board.

  If you are interested about technical details on the HP F11 BIOS key, check
  the 'source' directory.

  - SiZiOUS, 2015
    www.sizious.com - sizious (at) gmail (d0t) com - fb.com/sizious - @sizious

_____________________________________________________________________| EOF |____
