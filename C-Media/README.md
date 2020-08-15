## Get USB Vendor & Product ID (hex & decimal) Values
- [] Get Vendor &/or Product ID, see table below
    - [] If not listed, 
        - [] Run [`System Information`][12]
        - [] `Hardware » USB`
    - [] Alternatively, go to <file:///Library/Extensions/> or <file:///System/Library/Extensions/>
        - [] , Right click to `Show Package Contents`
        - [] Open `Info.plist`
        - [] Get value from key `idVendor` & `idProduct`

##### USB Hardware
| [] | [vendor id][12]⁎ | [product id][12] | [name][12]                                                |
|:---|:-----------------|:-----------------|:----------------------------------------------------------|
| [] | 0x05AC (1452)    | 0x0220 (544)     | Apple Inc. » Apple Keyboard                               |
| [] | 0x0D8C (3468)    | 0x0014 (20)      | C-Media Electronics, Inc. » Audio Adapter (Unitek Y-247A) |
| [] | 0x8086 (32902)   |                  | Intel Corp.                                               |
| [] | 0x1004 (4100)    | 0x633e (25406)   | LG Electronics, Inc. » LGE Android Phone                  |
| [] | 0x046D (1133)    | 0x0014 (50475)   | Logitech Inc. » USB Receiver                              |

⁎ [hex to decimal][6]

## Create or Update USB Audio Override Kernel Extension (.kext) Driver
Create or update .kext via

[] [⤓ USB Audio Override Driver Sample Code][1]
[] [local copy][9]
[] [★ production version][10]

### Property List
Modify [`Info.plist`][10] property values.

#### C-Media Electronics Inc. USB Audio Device
[★ production version `Info.plist`][10]

## Localizable.strings
| [] | new                                          | original                                       |
|:---|:---------------------------------------------|:-----------------------------------------------|
| [] | C-MediaUSBAudioDevice = "C-Media USB Audio"; | SampleUSBAudioCodecName = "USB-Audio Codec";   |
| [] | C-MediaUSBAudioOutputInterface = "RX-DT680"; | SampleUSBAudioOutputName = "USB-Audio Output"; |
| [] | C-MediaUSBAudioInputInterface = "ZM-Mic1";   | SampleUSBAudioInputName = "USB-Audio Input";   |

##### Info.plist
| [] | key {XML line №}                   | type      | new value                      | original value                         |
|:---|:-----------------------------------|:----------|:-------------------------------|:---------------------------------------|
| [] | CFBundleIdentifier {L8}⁎           | <string>  | tw.com.cmedia.C-MediaUSBAudio  | com.behringer.driver.BehringerUSBAudio |
| [] | <dict> {L19}                       | <key>     | C-Media USB Audio Device       | BehringerUSBAudioDevice                |
| [] | IOAudioDeviceLocalizedBundle {L30} | <string>  | C-MediaUSBAudio.kext           | BehringerUSBAudio.kext                 |
| [] | USB Product Name {L31}†            | <string>  | C-Media USB Audio Device       | Behringer Xenyx Control1USB            |
| [] | [idProduct][3] {L35,L64,L93}‡      | <integer> | 20                             | 10498                                  |
| [] | [idVendor][3] {L37,L66,L95}‡       | <integer> | 3468                           | 2235                                   |
| [] | <dict> {L39}                       | <key>     | C-MediaUSBAudioInputInterface  | BehringerUSBAudioInputInterface        |
| [] | bConfigurationValue {L59,88}‡      | <integer> | [1,1]                          | [1,1]                                  |
| [] | bInterfaceNumber {L61,90}‡         | <integer> | [1,2] → {1:"[→",2:"→]"}        | [1,2] → {1:"[→",2:"→]"}                |
| [] | USB Interface Name →]:{L57}§       | <string>  | ZM-Mic1                        | Behringer Xenyx Control1USB In         |
| [] | USB Interface Name [→:{L85}§       | <string>  | RX-DT680                       | Behringer Xenyx Control1USB            |
| [] | <dict> {L68}                       | <key>     | C-MediaUSBAudioOutputInterface | BehringerUSBAudioOutputInterface       |

where I/O:

→] (input)  ≡ `bInterfaceNumber: 2` ⟶ `ZM-Mic1`  
[→ (output) ≡ `bInterfaceNumber: 1` ⟶ `RX-DT680`  

where path:

⁎ ≡ Information Property List  
† ≡ Information Property List » IOKitPersonalities » C-MediaUSBAudio » IOProviderMergeProperties  
‡ ≡ Information Property List » IOKitPersonalities » C-MediaUSBAudio(`In|Out`)putInterface » IOProviderMergeProperties » {multiple locations}  
§ ≡ Information Property List » IOKitPersonalities » C-MediaUSBAudio(`In|Out`)putInterface  » IOProviderMergeProperties » {multiple locations}  

##### Audio MIDI (Musical Instrument Digital Interface) Setup
| device     | [MIDI_name][1]      | [sound » →\]][2]    | [sound » [→][2]  | nickname | type           |
|:-----------|:--------------------|:--------------------|:-----------------|:---------|:---------------|
| mic        | Built-in Microphone | Internal Microphone | -                |          | Built-in       |
| 3.5mm I/O  | Built-in Output     | -                   | Headphones       |          | Headphone port |
| USB dongle | USB Audio Device    | USB Audio Device    | -                | ZM-Mic1  | USB            |
| USB dongle | USB Audio Device    | -                   | USB Audio Device | RX-DT680 | USB            |

### Find and Replace… strings
`⌥⌘F` or `Find and Replace…`
`BehringerUSBAudio` >> `C-MediaUSBAudio`

    [] *Device
    [] *.kext
    [] *InputInterface
    [] *OutputInterface

### Find and Replace… Product & Vendor ID numbers
    
    [] idVendor:  2235  >> 3468
    [] idProduct: 10498 >> 20

## Install USB Audio Override Driver (.kext) Workflow
[] Remove old version, if necessary

    sudo rm -rf /System/Library/Extensions/C_MediaUSBAudio.kext &>/dev/null && sudo touch /System/Library/Extensions

[] Get path to .kext 

    /Users/syd/Code/misc/C-Media/C-MediaUSBAudio.kext

[] Copy .kext to `/System/Library/Extensions`
    
    sudo cp -Rf /Users/syd/Code/misc/C-Media/C-MediaUSBAudio.kext /System/Library/Extensions

[] Reset & refresh .kext ownership (root, wheel) and permissions
    
    sudo chown -R root:wheel /System/Library/Extensions/C-MediaUSBAudio.kext/ && sudo chmod -R 755 /System/Library/Extensions/C-MediaUSBAudio.kext && sudo touch /System/Library/Extensions

[] Restart Mac
[] Verify updates

---
where:  
-R ≡ recursive  
-f ≡ overwrite, no prompt  

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
[] **USB Product Name**: Specified `IOUSBDevice`. This name is used as the device name (IOAudioDevice::setDeviceName) when the control interface doesn't have a name (USB Interface Name).
[] **USB Interface Name**: Specified `IOUSBInterface`. This control interface name is used as the device name if present, and take precedence over USB Product Name. The stream interface name is used as the engine description (IOAudioEngine::setDescription) when present.
[] **IOAudioDeviceLocalizedBundle**: Can be specified at the control interface or USB device. The localized bundle specified at the control interface take precedence over the one at USB device level. The localization bundle has the localized string for the USB Product Name/USB Interface Names.
[] **IOAudioEngineCoreAudioPlugIn**: Specified at the stream interface level. This is a string specifying the path to the CoreAudio plugin. 
[] **IOAudioEngineSampleOffset, IOAudioEngineInputSampleOffset, IOAudioEngineInputSampleLatency, IOAudioEngineOutputSampleLatency.**: Specified at the stream interface level. These values will override the ones that the AppleUSBAudio calculate based on the sample rate.
[] **idProduct and idVendor**: Change this to match your USB audio device.
[] **bInterfaceNumber and bConfigurationValue**: Change this to match the your USB  audio streaming/control interfaces.
[] **IOAudioDeviceConfigurationApplication**:  Used to specify a custom control panel application that users can launch from AMS. Replace `com.MySoftwareCompany.ControlPanelApp` with your app's bundle identifier.





<!-- RESOURCES & SOURCES -->
---
Tags: kernel extension, .kext, rename audio device

<small>updated: 20200815_164649</small>

[1]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/SampleUSBAudioOverrideDriver.zip "Download Sample Code - Developer"
[2]: https://www.tonymacx86.com/threads/rename-usb-audio-devices-custom-osx-usb-audio-class-driver.166398/ "Rename USB Audio devices, USB driver"
[3]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/Introduction/Intro.html "Intro: USB Audio Override Driver - Developer"
[4]: https://developer.apple.com/library/archive/samplecode/SampleUSBAudioOverrideDriver/Listings/ReadMe_txt.html "Documentation - Developer"
[5]: http://www.the-sz.com/products/usbid/index.php?v=0x0d8c&p=&n= "USB ID Database"
[6]: https://codebeautify.org/hex-decimal-converter "Hex to Decimal"
[7]: http://www.numberplanet.com/number/0d8c/index.html "The Number 3468 (hex 0x0D8C)"
[8]: https://developer.apple.com/download/more/ "Hardware IO Tools for Xcode 7.3"
[9]: <file:///Users/syd/Downloads/SampleUSBAudioOverrideDriver/SampleUSBAudioOverrideDriver.kext/Contents/Info.plist>
[10]: <file:///Users/syd/Code/misc/C-MediaUSBAudio.kext/Contents/Info.plist>
[11]: https://github.com/vulgo/IORegistryExplorer "vulgo/IORegistryExplorer: IORegistryExplorer 2.1"
[12]: <file:///Applications/Utilities/System%20Information.app>
[13]: file:///Applications/Utilities/Audio%20MIDI%20Setup.app
[14]: file:///System/Library/PreferencePanes/Sound.prefPane
