#!/usr/bin/env bash
set -euo pipefail

# 1. Define installation directories
INSTALL_ROOT="$HOME/bin"
PLINK1_DIR="$INSTALL_ROOT/plink1"
PLINK2_DIR="$INSTALL_ROOT/plink2"

mkdir -p "$PLINK1_DIR" "$PLINK2_DIR"

# 2. Downloads and installs PLINK 2.0 (macOS ARM64 build, alpha 6.15, 4 Jun 2025)
echo "Installing PLINK 2.0…"
cd "$PLINK2_DIR"
curl -L -o plink2.zip   https://s3.amazonaws.com/plink2-assets/alpha6/plink2_mac_arm64_20250604.zip   || { echo "Download failed"; exit 1; }
unzip -o plink2.zip
chmod +x plink2

# 3. Downloads & installs PLINK 1.9 (macOS 64-bit stable beta 7.7, 22 Oct 2024)
echo "Installing PLINK 1.9…"
cd "$PLINK1_DIR"
curl -L -o plink1.zip   https://s3.amazonaws.com/plink1-assets/plink_mac_20241022.zip   || { echo "Download failed"; exit 1; }
unzip -o plink1.zip
mv plink plink1   # rename the files avoid conflict
chmod +x plink1

# 4. Updates the shell profile so you can run both programs
PROFILE="$HOME/.zshrc"
[ "$(basename "$SHELL")" = "bash" ] && PROFILE="$HOME/.bash_profile"

EXPORT_LINE='export PATH="$HOME/bin/plink2:$HOME/bin/plink1:$PATH"'
if ! grep -Fxq "$EXPORT_LINE" "$PROFILE"; then
  echo "$EXPORT_LINE" >> "$PROFILE"
  echo "Updated PATH in $PROFILE"
else
  echo "PATH already contains PLINK entries"
fi

# 5. Apply changes to current session
source "$PROFILE"

# 6. Verify installs
echo
echo "Verifying installations…"
if command -v plink2 >/dev/null; then
  echo "PLINK 2.0: $(plink2 --version | head -n1)"
else
  echo "plink2 not found in \$PATH"
fi

if command -v plink1 >/dev/null; then
  echo "PLINK 1.9: $(plink1 --version | head -n1)"
else
  echo "plink1 not found in \$PATH"
fi
