# PLINK 1.9 and 2.0 Installer for macOS (ARM64 and x86_64)

This Bash script automates downloading, installing, and configuring **PLINK 1.9** and **PLINK 2.0** binaries on macOS, supporting Apple Silicon (ARM64) and Intel architectures.

---

## Features

- Downloads PLINK 2.0 (macOS ARM64 alpha 6.15 build, 4 June 2025)  
- Downloads PLINK 1.9 (macOS 64-bit stable beta 7.7, 22 Oct 2024)  
- Installs binaries into separate folders under `~/bin/plink1` and `~/bin/plink2`  
- Updates your shell profile (`.zshrc` or `.bash_profile`) to include PLINK executables in your `PATH`  
- Verifies successful installation by printing the installed versions  

---

## Usage

1. Open your Terminal.

1. Open your Terminal.

2. Launch the Script

Open your terminal and navigate to the directory where your script lives using the cd command

Then activate and run the script:

chmod +x R_Maintainer.sh
./R_Maintainer.sh

---

## How It Works

1. The script will download, unzip, and set executable permissions for PLINK 1.9 and 2.0.
2. It will update your shell profile to include PLINK directories in your PATH. If the entries already exist, it will skip modification.
3. The script applies the profile changes immediately for your current terminal session.
4. Finally, it verifies that plink1 and plink2 commands are available and prints their versions.

Installation Directories

PLINK 1.9 installed to: ~/bin/plink1/plink1
PLINK 2.0 installed to: ~/bin/plink2/plink2

---

## Requirements

-macOS system (Apple Silicon preferred for PLINK 2.0 ARM64 version)
-Internet connection to download binaries
-curl and unzip installed (default on macOS)

Enjoy running PLINK 1.9 and 2.0 on your Mac! 🧬🖥️

## License & Attribution

This script was created by Logan Cohen and is intended for educational and personal use.

---
- Program logic created by by Logan Cohen for use in an educational genomics setting on Apple Silicon (M3 Pro).
- Assistance with debugging and documentation was provided by Lyric (OpenAI’s GPT-4o model)