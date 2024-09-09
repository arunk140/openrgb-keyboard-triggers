## Setup

```
conda create --prefix ./conda/ python=3.10
conda activate ./conda/
pip install -r requirements.txt
```

Update 00openrgb-trigger ith the path to your trigger.sh script and copy it to the systemd sleep directory.
Also update /sys/class/power_supply/ADP1/online to the path of your power supply.

```
cp 00openrgb-trigger /usr/lib/systemd/system-sleep/00openrgb-trigger
```

## Usage

- Update the Python Script to configure your profiles.

- Enable the OpenRGB SDK Server from the OpenRGB App.

![image](https://github.com/user-attachments/assets/b8785cb8-826a-4a31-974b-4b1fb4089c14)

- Setup KDE Shortcuts to run the script - `trigger.sh`

![image](https://github.com/user-attachments/assets/8e8b30ef-6e9a-4d7a-82f5-45376dc566f9)
