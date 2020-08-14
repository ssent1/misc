## Get USB Vendor & Product ID (hex & decimal) Values

- [] Get Vendor &/or Product ID, see table below
	- [] If not listed, 
		- [] Run [`System Information`][12]
		- [] `Hardware » USB`
	- [] Alternatively, go to <file:///Library/Extensions/> or <file:///System/Library/Extensions/>
		- [] , Right click to `Show Package Contents`
		- [] Open `Info.plist`
		- [] Get value from key `idVendor` & `idProduct`

| Vendor ID        | Product ID       | Name                                                      |
|:-----------------|:-----------------|:----------------------------------------------------------|
| 0x05AC (`1452`)  | 0x0220 (`544`)   | Apple Inc. » Apple Keyboard                               |
| 0x0D8C (`3468`)  | 0x0014 (`20`)    | C-Media Electronics, Inc. » Audio Adapter (Unitek Y-247A) |
| 0x8086 (`32902`) |                  | Intel Corp.                                               |
| 0x1004 (`4100`)  | 0x633e (`25406`) | LG Electronics, Inc. » LGE Android Phone                  |
| 0x046D (`1133`)  | 0x0014 (`50475`) | Logitech Inc. » USB Receiver                              |

## Create or Update USB Audio Override Kernel Extension (.kext) Driver
Create or update .kext via

- [] [⤓ USB Audio Override Driver Sample Code][1]
- [] [local copy][9]
- [] [★ production version][10]

### Property List
Modify [`Info.plist`][10] property values.

#### C-Media Electronics Inc. USB Audio Device
[★ production version `Info.plist`][10]

| Key                    | Type     | Value                                  |
|:-----------------------|:---------|:---------------------------------------|
| `Bundle identifier`⁎   | `String` | `tw.com.cmedia.driver.C_MediaUSBAudio` |
| `USB Product Name`†    | `String` | `C-Media USB Audio Adapter`            |
| `idProduct`‡           | `Number` | `20`                                   |
| `idVendor`‡            | `Number` | `3468`                                 |
| `bConfigurationValue`‡ | `Number` | ["`1`","`1`"]                          |
| `bInterfaceNumber`‡    | `Number` | ["`1`","`2`"]                          |
| `USB Interface Name`§  | `String` | →] = `Zalman ZM-Mic1`                  |
| `USB Interface Name`§  | `String` | [→ = `Panasonic RX-DT680 Stereo`       |

where I/O:

→] (input)  ≡ `bInterfaceNumber: 2` ⟶ `Zalman ZM-Mic1`  
[→ (output) ≡ `bInterfaceNumber: 1` ⟶ `Panasonic RX-DT680 Stereo`  

where path:

⁎ ≡ Information Property List  
† ≡ Information Property List » IOKitPersonalities » C_MediaUSBAudio » IOProviderMergeProperties  
‡ ≡ Information Property List » IOKitPersonalities » C_MediaUSBAudio(`In|Out`)putInterface » IOProviderMergeProperties » {multiple locations}  
§ ≡ Information Property List » IOKitPersonalities » C_MediaUSBAudio(`In|Out`)putInterface  » IOProviderMergeProperties » {multiple locations}  

### Find and Replace… strings

`⌥⌘F` | `Find and Replace…`
`BehringerUSBAudio` >> `C_MediaUSBAudio`

	*Device
	*.kext
	*InputInterface
	*OutputInterface

 ### Find and Replace… Product & Vendor ID numbers
	
	idVendor:  `2235`  >> `3468`
	idProduct: `10498` >> `20`

as at 14-Aug-20 12:42:50 EDT

## Install USB Audio Override Driver (.kext)
- [x] Get path to .kext 
	- [x] `/Users/syd/Code/misc/C_MediaUSBAudio.kext`
- [x] Copy .kext to `/System/Library/Extensions`
	- [x] `sudo cp -rf /Users/syd/Code/misc/C_MediaUSBAudio.kext /System/Library/Extensions`
- [x] Set .kext ownership (root, wheel) and permissions to:
	- [x] `sudo chown -R root:wheel /Users/syd/Code/misc/C_MediaUSBAudio.kext && sudo chmod -R 755 /Users/syd/Code/misc/C_MediaUSBAudio.kext`
- [x] Update macOS regarding change to `/System/Library/Extensions` by:
	- [x] `sudo touch /System/Library/Extensions`
- [x] Restart Mac
- [] Verify updates


-------------------------------------------------
## DOCUMENTATION
### Sample USB Audio Override Driver
[⤓ USB Audio Override Driver Sample Code][1]

### ReadMe.txt
You can read an unmodified version at [Project Documentation - Developer][4]
 
#### SampleUSBAudioOverrideDriver
This project is a codeless kext that allows it to override certain properties of the USB audio device. 

There is only an `Info.plist` and **localized strings** to modify.

Modify the `Info.plist` entry `IOPropertyMatch` to match to the hex values of the `idVendor` and `idProduct` of your device. Also modify `bInterfaceNumber` and `bConfigurationValue` to match to the USB interfaces.
 
You can discover these values by running [`System Information`][12] and going to `Hardware » USB`.
 
Here are list of properties that you might want to change/add:

- [] `USB Product Name`
- [] `USB Interface Name`
- [] `IOAudioDeviceLocalizedBundle`
- [] `IOAudioEngineCoreAudioPlugIn`
- [] Sample Offset &/or Latency
	- [] `IOAudioEngineSampleOffset`
	- [] `IOAudioEngineInputSampleOffset`
	- [] `IOAudioEngineInputSampleLatency`
	- [] `IOAudioEngineOutputSampleLatency`
- [] `idProduct and idVendor`
- [] `bInterfaceNumber and bConfigurationValue`
- [] `IOAudioDeviceConfigurationApplication`
 
The target produces `SampleUSBAudioOverrideDriver.kext` which must be copied to the /System/Library/Extensions folder of the boot volume by an administrator using a command like (from the project folder):
 
    sudo cp -rf ./build/SampleUSBAudioOverrideDriver.kext /System/Library/Extensions
 
Your override kext must have the correct ownership (root , wheel) and permissions:
 
    sudo chown -R root:wheel SampleUSBAudioOverrideDriver.kext
    sudo chmod -R 755 SampleUSBAudioOverrideDriver.kext
 
Then you must notify the operating system that the contents of the kernel extension directory has changed by "touching the directory":
 
    sudo touch /System/Library/Extensions
 
Restart the system.
 
After restarting the system, the override kext should automatically load when the device specified in the Info.plist (accessible from the `Targets » SampleUSBAudioOverrideDriver » Get Info » Properties`) is attached. The specified properties will be merged into the USB device & interfaces.

##### Property Descriptions 
- [] **USB Product Name**: Specified `IOUSBDevice`. This name is used as the device name (IOAudioDevice::setDeviceName) when the control interface doesn't have a name (USB Interface Name).
- [] **USB Interface Name**: Specified `IOUSBInterface`. This control interface name is used as the device name if present, and take precedence over USB Product Name. The stream interface name is used as the engine description (IOAudioEngine::setDescription) when present.
- [] **IOAudioDeviceLocalizedBundle**: Can be specified at the control interface or USB device. The localized bundle specified at the control interface take precedence over the one at USB device level. The localization bundle has the localized string for the USB Product Name/USB Interface Names.
- [] **IOAudioEngineCoreAudioPlugIn**: Specified at the stream interface level. This is a string specifying the path to the CoreAudio plugin. 
- [] **IOAudioEngineSampleOffset, IOAudioEngineInputSampleOffset, IOAudioEngineInputSampleLatency, IOAudioEngineOutputSampleLatency.**: Specified at the stream interface level. These values will override the ones that the AppleUSBAudio calculate based on the sample rate.
- [] **idProduct and idVendor**: Change this to match your USB audio device.
- [] **bInterfaceNumber and bConfigurationValue**: Change this to match the your USB  audio streaming/control interfaces.
- [] **IOAudioDeviceConfigurationApplication**:  Used to specify a custom control panel application that users can launch from AMS. Replace `com.MySoftwareCompany.ControlPanelApp` with your app's bundle identifier.





<!-- [] RESOURCES & SOURCES -->
---
Tags: kernel extension, .kext, rename audio device

[1]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/SampleUSBAudioOverrideDriver.zip "Download Sample Code - Developer"
[2]: https://www.tonymacx86.com/threads/rename-usb-audio-devices-custom-osx-usb-audio-class-driver.166398/ "Rename USB Audio devices, USB driver"
[3]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/Introduction/Intro.html "Intro: USB Audio Override Driver - Developer"
[4]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/Listings/ReadMe_txt.html "Documentation - Developer"
[5]: http://www.the-sz.com/products/usbid/index.php?v=0x0d8c&p=&n= "USB ID Database"
[6]: https://codebeautify.org/hex-decimal-converter "Hex to Decimal"
[7]: http://www.numberplanet.com/number/0d8c/index.html "The Number 3468 (hex 0x0D8C)"
[8]: https://developer.apple.com/download/more/ "Hardware IO Tools for Xcode 7.3"
[9]: <file:///Users/syd/Downloads/SampleUSBAudioOverrideDriver/SampleUSBAudioOverrideDriver.kext/Contents/Info.plist>
[10]: <file:///Users/syd/Code/misc/C_MediaUSBAudio.kext/Contents/Info.plist>
[11]: https://github.com/vulgo/IORegistryExplorer "vulgo/IORegistryExplorer: IORegistryExplorer 2.1"
[12]: <file:///Applications/Utilities/System%20Information.app>
