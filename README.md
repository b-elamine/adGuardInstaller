# AdGuard Home Installation Script

This script automates the uninstallation and reinstallation of AdGuard Home on Ubuntu. It checks if AdGuard Home is already installed and handles the installation process accordingly.

## Features

- Uninstalls existing AdGuard Home installation if present.
- Downloads and installs the latest version of AdGuard Home.
- Sets up AdGuard Home as a systemd service to start on boot.

## Prerequisites

- Ubuntu (or compatible) system.
- `wget` must be installed. You can install it using:
  ```bash
  sudo apt update && sudo apt install wget
