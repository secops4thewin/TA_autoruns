# TA_autoruns
This Splunk Add-On runs autoruns command line edition and parses the data ready for use in Splunk
## What is autoruns?
Autoruns, has the most comprehensive knowledge of auto-starting locations of any startup monitor, it shows you what programs are configured to run during system bootup or login, and when you start various built-in Windows applications like Internet Explorer, Explorer and media players. These programs and drivers include ones in your startup folder, Run, RunOnce, and other Registry keys. Autoruns reports Explorer shell extensions, toolbars, browser helper objects, Winlogon notifications, auto-start services, and much more. Autoruns goes way beyond other autostart utilities.

Autoruns URL [Here](https://docs.microsoft.com/en-us/sysinternals/downloads/autoruns)

## What does this app do?
This app will run the following command 
`autorunsc.exe -c -h -accepteula`
Then output the results to screen and index into Splunk.  Providing you with the following fields
- category
- company
- description
- enabled
- entry
- entry_location
- entry_time
- image_path
- imphash
- launch_string
- md5
- pesha1
- pesha256
- profile
- sha1
- sha256
- version

## What command does this run?
```autorunsc.exe -c -h -m -accepteula -a *```
- ```-m```	Hide Microsoft entries (signed entries if used with -v).
- ```-a```	Autostart entry selection: ```*```	All.
- ```-c```  Print output as CSV.
- ```-accepteula``` Accept the end user license agreement
- ```-h```  Show file hashes.
## How do I use this app?
Install the app on heavy forwarders, indexers and search heads for field extractions.

On the universal forwarder, create a [local](https://docs.splunk.com/Documentation/Splunk/8.0.1/Admin/Configurationfiledirectories) folder and add a file called [inputs.conf](https://docs.splunk.com/Documentation/Splunk/latest/Admin/inputsconf).  In  that file add the following lines.
```
[script://.\bin\win_autoruns.cmd]
disabled = 0
interval = 3600 # Modify this interval depending on how frequent you want the script to run
```
## How much this gonna cost me?
Since this app runs on a schedule you can have a small licensing footprint by increasing the interval that this runs.  

## Thanks   
Thanks to MS and Mark Russinovich for making a kick arse tool for defenders :)

    
