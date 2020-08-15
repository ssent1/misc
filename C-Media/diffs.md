## Localizable.strings
| [] | new                                          | original                                       |
|:---|:---------------------------------------------|:-----------------------------------------------|
| [] | C-MediaUSBAudioDevice = "C-Media USB Audio"; | SampleUSBAudioCodecName = "USB-Audio Codec";   |
| [] | C-MediaUSBAudioOutputInterface = "RX-DT680"; | SampleUSBAudioOutputName = "USB-Audio Output"; |
| [] | C-MediaUSBAudioInputInterface = "ZM-Mic1";   | SampleUSBAudioInputName = "USB-Audio Input";   |

---
## Info.plist
| [] | key {XML line №}                   | type      | new value                      | original value                         |
|:---|:-----------------------------------|:----------|:-------------------------------|:---------------------------------------|
| [] | CFBundleIdentifier {L8}            | <string>  | tw.com.cmedia.C-MediaUSBAudio  | com.behringer.driver.BehringerUSBAudio |
| [] | <dict> {L19}                       | <key>     | C-Media USB Audio Device       | BehringerUSBAudioDevice                |
| [] | IOAudioDeviceLocalizedBundle {L30} | <string>  | C-MediaUSBAudio.kext           | BehringerUSBAudio.kext                 |
| [] | USB Product Name† {L31}            | <string>  | C-Media USB Audio Device       | Behringer Xenyx Control1USB            |
| [] | [idProduct][3] {L35,L64,L93}       | <integer> | 20                             | 10498                                  |
| [] | [idVendor][3] {L37,L66,L95}        | <integer> | 3468                           | 2235                                   |
| [] | <dict> {L39}                       | <key>     | C-MediaUSBAudioInputInterface  | BehringerUSBAudioInputInterface        |
| [] | bConfigurationValue {L59,88}       | <integer> | [1,1]                          | [1,1]                                  |
| [] | bInterfaceNumber {L61,90}          | <integer> | [1,2] → {1:"[→",2:"→]"}        | [1,2] → {1:"[→",2:"→]"}                |
| [] | USB Interface Name →]:{L57}        | <string>  | ZM-Mic1                        | Behringer Xenyx Control1USB In         |
| [] | USB Interface Name [→:{L85}        | <string>  | RX-DT680                       | Behringer Xenyx Control1USB            |
| [] | <dict> {L68}                       | <key>     | C-MediaUSBAudioOutputInterface | BehringerUSBAudioOutputInterface       |

---
## USB Hardware
| [] | vendor id      | product id     | name                                                      |
|:---|:---------------|:---------------|:------------|
| [] | 0x05AC (1452)  | 0x0220 (544)   | Apple Inc. » Apple Keyboard                               |
| [] | 0x0D8C (3468)  | 0x0014 (20)    | C-Media Electronics, Inc. » Audio Adapter (Unitek Y-247A) |
| [] | 0x8086 (32902) |                | Intel Corp.                                               |
| [] | 0x1004 (4100)  | 0x633e (25406) | LG Electronics, Inc. » LGE Android Phone                  |
| [] | 0x046D (1133)  | 0x0014 (50475) | Logitech Inc. » USB Receiver                              |

## Workflow / Checklist
### Find and Replace… strings
BehringerUSBAudio >> C-MediaUSBAudio

 []	*Device
 []	*.kext
 []	*InputInterface
 []	*OutputInterface

### Find and Replace… Product & Vendor ID numbers
 [] idVendor:  2235  >> 3468
 [] idProduct: 10498 >> 20

---
## Audio MIDI (Musical Instrument Digital Interface) Setup
| device     | [MIDI_name][1]      | [sound » →\]][2]    | [sound » [→][2]  | nickname | type           |
|:-----------|:--------------------|:--------------------|:-----------------|:---------|:---------------|
| mic        | Built-in Microphone | Internal Microphone | -                |          | Built-in       |
| 3.5mm I/O  | Built-in Output     | -                   | Headphones       |          | Headphone port |
| USB dongle | USB Audio Device    | USB Audio Device    | -                | ZM-Mic1  | USB            |
| USB dongle | USB Audio Device    | -                   | USB Audio Device | RX-DT680 | USB            |





<!-- RESOURCES & SOURCES -->
---
Tags: kernel extension, .kext, rename audio device

<small>updated: 20200815_164649</small>

[1]: file:///Applications/Utilities/Audio%20MIDI%20Setup.app
[2]: file:///System/Library/PreferencePanes/Sound.prefPane
[3]: file:///Applications/Utilities/System%20Information.app
[4]: https://codebeautify.org/hex-decimal-converter "Hex to Decimal"
