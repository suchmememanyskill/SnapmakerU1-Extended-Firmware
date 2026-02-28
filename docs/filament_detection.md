---
title: Filament Detection
---

# Filament Detection

**Available in: Extended firmware only**

The extended firmware supports an alternative filament detection system that recognizes tagged spools from multiple manufacturers.

## Detection Systems

- **None** - Disable internal detection system for tagged filament. This is useful if you want to use external readers.
- **Snapmaker** - Snapmaker's official filament detection system (default)
- **Alternate/Sims** - Custom filament detection system using the [filament-detect](https://github.com/suchmememanyskill/filament-detect) project, with support for multiple spool tagging formats

## Configuration

Navigate to the [firmware-config](firmware_config.md) web interface, go to the Filament Detection section, and select a different filament detection system.

If you use Snapmaker Orca, unless you specifically set up all filament brands, they will not show up in the filament dropdown. To label all filament as 'Generic', set "Label All Filament as Generic" to **Enabled** as well.

## External Filament Detection Systems

- [wasikuss/snapmaker-u1-remote-rfid-reader](https://github.com/wasikuss/snapmaker-u1-remote-rfid-reader) - An ESP32 based handheld RFID reader

## Supported Tags in Alternate/Sims

The Sims detection system supports the following tags:

| System | Enabled by default | Remarks |
|--------|-------------------|--------------------------|
| Bambu | No | Requires additional configuration (see below) |
| Creality | No | Requires additional configuration (see below) |
| Anycubic | Yes | - |
| Snapmaker | Yes | - |
| Elegoo | Yes | Elegoo spools tagged with RFID work unreliably |
| [OpenSpool](https://openspool.io/) | Yes | - |
| TigerTag | Yes | Fully offline implementation |


### Bambu / Creality Spool Configuration

Bambu and Creality tagged spools require additional authentication keys to read. To configure them:

**Step 1:** Copy the example configuration file and rename it:
```bash
cp /oem/printer_data/config/extended/filament-detect/additional_processors.cfg.example /oem/printer_data/config/extended/filament-detect/additional_processors.cfg
```

**Step 2:** Edit `/oem/printer_data/config/extended/filament-detect/additional_processors.cfg` and uncomment/fill in the relevant sections:

For **Bambu** spools:
```ini
[bambu_lab_tag_processor]
key = <your 32 hex character key>
```

For **Creality** spools:
```ini
[creality_tag_processor]
key = <your 32 hex character key>
encryption_key = <your 32 hex character key>
```

**Step 3:** Restart the filament detection service via [SSH](ssh_access.md):
```bash
/etc/init.d/S99filament-detect restart
```
