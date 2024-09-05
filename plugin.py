from openrgb import OpenRGBClient
from openrgb.orgb import Device
from openrgb.utils import RGBColor, DeviceType
import sys

def initialize_device():
    client = OpenRGBClient()
    all_devices = client.get_devices_by_type(DeviceType.KEYBOARD)
    if len(all_devices) == 0:
        raise Exception("No keyboards found")
    msi_keyboard = all_devices[0]

    return (client, msi_keyboard)

def turn_off_leds(device: Device):
    device.set_mode('off')

def set_profile(profile: str, client: OpenRGBClient):
    client.load_profile(profile)

if __name__ == "__main__":
    client, msi_keyboard = initialize_device()
    if "--sleep" in sys.argv:
        turn_off_leds(msi_keyboard)
    elif "--wake" in sys.argv:
        set_profile("White - Half", client)
    client.disconnect()
