//
//  C_Media_USB_Audio_Device.c
//  C-Media USB Audio Device
//
//  Created by Syd Salmon on 2020-08-16.
//  Copyright © 2020 Proganica Brand Development. All rights reserved.
//

#include <mach/mach_types.h>

kern_return_t C_Media_USB_Audio_Device_start(kmod_info_t * ki, void *d);
kern_return_t C_Media_USB_Audio_Device_stop(kmod_info_t *ki, void *d);

kern_return_t C_Media_USB_Audio_Device_start(kmod_info_t * ki, void *d)
{
    return KERN_SUCCESS;
}

kern_return_t C_Media_USB_Audio_Device_stop(kmod_info_t *ki, void *d)
{
    return KERN_SUCCESS;
}
