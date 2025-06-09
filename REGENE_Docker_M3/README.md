# 🧬 REGENIE Docker Setup for M3 Pro running macOS Sequoia

This is a quick guide to run REGENIE in Docker using a wrapper script.  
Designed for compatibility with Apple Silicon (tested on M3 Pro running macOS Sequoia).

Apple’s M3 Pro uses ARM64, but most REGENIE Docker images are x86_64. This setup uses the official REGENIE image and a wrapper script to ensure smooth execution on Apple Silicon with local data access.

---

## 📦 Before You Begin

- Install Docker: https://www.docker.com/
- Create a folder containing your input data

---

## 🗂️ Required Files

Place the following files in the **same folder**:

1. `regenie_docker_custom.sh` – wrapper script to launch REGENIE in Docker  
2. `Dockerfile_REGENIE` – optional: used to build a compatible local image if you don't have one already.

This Docker image was pulled on **June 8, 2025** using:

```bash
docker pull ghcr.io/rgcgithub/regenie/regenie:v3.0.1.gz
```

---

## 🚀 Quickstart (3 Steps)

### 1. Edit the Script

Edit line 6 of `regenie_docker_custom.sh` to reflect the **full path** to the folder where your data files live:

**Example:**

Before:
```bash
DATA_DIR="/your/file/path/here"
```

After:
```bash
DATA_DIR="/Users/name/Documents/Data"
```

---

### 2. Launch the Script

Open your terminal and navigate to the directory where your script and Dockerfile live:

```bash
cd /Users/name/Documents/Data
```

Then activate the script:

```bash
chmod +x regenie_docker_custom.sh
./regenie_docker_custom.sh
```

If everything is set up correctly, REGENIE will launch and begin processing your data or display its help menu.

---

### 🛠️ Troubleshooting

- Ensure Docker is installed and running
- Check that architecture emulation is set to `linux/amd64` in Docker Desktop > Settings > Features > Experimental
- Confirm the data path in your script is correct and accessible
- You may need to allow permissions if macOS blocks script execution

---

### 📜 License & Attribution

This project uses the official [REGENIE Docker image](https://github.com/rgcgithub/regenie) pulled from:

```bash
ghcr.io/rgcgithub/regenie/regenie:v3.0.1.gz
```

- REGENIE is distributed under the MIT License. For full license details, see the [REGENIE GitHub repository](https://github.com/rgcgithub/regenie).
- Program logic created by by Logan Cohen for use in an educational genomics setting on Apple Silicon (M3 Pro).
- Assistance with debugging and documentation was provided by Lyric (OpenAI’s GPT-4o model)
