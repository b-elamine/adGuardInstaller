#!/bin/bash

# Define variables
ADGUARD_DIR="/opt/AdGuardHome"
SERVICE_FILE="/etc/systemd/system/AdGuardHome.service"
DOWNLOAD_URL="https://github.com/AdguardTeam/AdGuardHome/releases/latest/download/AdGuardHome_linux_amd64.tar.gz"

# Function to uninstall AdGuard Home
uninstall_adguard() {
    if [ -d "$ADGUARD_DIR" ]; then
        echo "Stopping AdGuard Home service..."
        sudo systemctl stop AdGuardHome

        echo "Removing AdGuard Home directory..."
        sudo rm -rf "$ADGUARD_DIR"

        echo "Disabling AdGuard Home service..."
        sudo systemctl disable AdGuardHome

        if [ -f "$SERVICE_FILE" ]; then
            echo "Removing service file..."
            sudo rm "$SERVICE_FILE"
        fi

        echo "Reloading systemd..."
        sudo systemctl daemon-reload
    else
        echo "AdGuard Home is not installed, skipping uninstallation."
    fi
}

# Function to install AdGuard Home
install_adguard() {
    echo "Downloading AdGuard Home..."
    wget -O AdGuardHome.tar.gz "$DOWNLOAD_URL"

    echo "Extracting files..."
    tar -xvzf AdGuardHome.tar.gz

    echo "Moving AdGuard Home to /opt..."
    sudo mv AdGuardHome "$ADGUARD_DIR"

    echo "Installing AdGuard Home..."
    cd "$ADGUARD_DIR" || exit
    sudo ./AdGuardHome -s install

    echo "Starting AdGuard Home service..."
    sudo systemctl start AdGuardHome

    echo "Enabling AdGuard Home to start on boot..."
    sudo systemctl enable AdGuardHome
}

# Main script execution
uninstall_adguard
install_adguard

echo "AdGuard Home has been reinstalled successfully."
