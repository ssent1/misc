# blueutil

> Bluetooth CLI for macOS. Get/set bluetooth power and discoverable state.

## Usage

```vim
" syntax
blueutil [options]

" basic
blueutil                                                                                                                    TSTP ✘  12m 31s     16:48:07 
Power: 1
Discoverable: 0

blueutil -v
2.9.0

" status
-p, --power              # output power state as 1 or 0
-p, --power STATE        # set power state
-d, --discoverable       # output discoverable state as 1 or 0
-d, --discoverable STATE # set discoverable state

" connection
--favourites      # list favourite devices; --favorites
--inquiry [T]     # inquiry devices in range, 10 seconds duration by default excluding time for name updates
--paired          # list paired devices
--recent [N]      # list recently used devices, 10 by default, 0 to list all
--connected       # list connected devices
--info ID         # show information about device
--is-connected ID # connected state of device as 1 or 0
--connect ID      # create a connection to device

" pairing
--disconnect ID       # close the connection to device
--pair ID [PIN]       # pair with device, optional PIN of up to 16 characters will be used instead of interactive input if requested in specific pair mode
--unpair ID           # EXPERIMENTAL unpair the device
--add-favourite ID    # add to favourites; also: --add-favorite ID
--remove-favourite ID # remove from favourites; also: --remove-favorite ID
--format FORMAT       # change output format of info and all listing commands

" EXPERIMENTAL 
--wait-connect ID [TIMEOUT]                # wait for device to connect
--wait-disconnect ID [TIMEOUT]             # wait for device to disconnect
--wait-rssi ID OP VALUE [PERIOD [TIMEOUT]] # wait for device RSSI value which is 0 for golden range, -129 if it cannot be read (e.g. device is disconnected)

" help
-h, --help    # show help
-v, --version # show version

" parameters
STATE  : {1=on,0=off,toggle}
ID : MAC address {xxxxxxxxxxxx,xx-xx-xx-xx-xx-xx,xx:xx:xx:xx:xx:xx,device_name}
OP  : {>,>=,<,<=,=,!=,gt,ge,lt,le,eq,ne}
PERIOD : seconds, default=1
TIMEOUT : seconds, default=0 {no timeout}
FORMAT  =
  default - human readable text output not intended for consumption by scripts
  new-default - human readable comma separated key-value pairs (EXPERIMENTAL, THE BEHAVIOUR MAY CHANGE)
  json - compact JSON
  json-pretty - pretty printed JSON

Due to possible problems, blueutil will refuse to run as root user (see https://github.com/toy/blueutil/issues/41).
Use environment variable BLUEUTIL_ALLOW_ROOT=1 to override (sudo BLUEUTIL_ALLOW_ROOT=1 blueutil …).

Exit codes:
   0 Success
   1 General failure
  64 Wrong usage like missing or unexpected arguments, wrong parameters
  69 Bluetooth or interface not available
  70 Internal error
  71 System error like shortage of memory
  75 Timeout error
```

## sources

Tags: system administration, sysadmin, network admin, macos, linux, command line, cli

^ 2022-09-09T16:31:39-0400\
% 2023-01-04T10:53:58-0400

<!-- SOURCES & RESOURCES -->

[1]: https://github.com/toy/blueutil "blueutil"

