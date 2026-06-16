# Airsailer APT Repository

Welcome to the official custom APT repository for the **[Airsailer](https://github.com/airsailer/airsailer)** cloud orchestrator ecosystem.

This repository provides up-to-date packages specifically tuned for the Airsailer platform. It was originally created to solve the issue of outdated LXC versions (like LXC 5.0.3 on Ubuntu 24.04) by providing the modern **LXC 7.0 LTS** branch with full security features enabled (AppArmor, seccomp, capabilities). This allows for proper E2E testing of our system container engine, **[Sail Containers](https://github.com/airsailer/sail-containers)**.

In the near future, this repository will also serve the core Airsailer platform binaries.

## 📦 Available Packages
* `lxc` (7.0 LTS branch — Custom build with strict security features enabled)
* `lxcfs` (7.0 LTS branch)
* `airsailer` *(Coming Soon)*

## 🐧 Supported Distributions
Currently, we provide `amd64` builds for:
* **Ubuntu 24.04 LTS** (`noble`)
* **Debian 13** (`trixie`)

---

## How to Use This Repository

To install packages from the Airsailer repository, you need to add our GPG signing key and configure your APT sources. Run the following commands in your terminal:

### 1. Download the Airsailer GPG Key
```bash
curl -fsSL https://repo.airsailer.io/airsailer-archive-keyring.asc | sudo gpg --dearmor -o /usr/share/keyrings/airsailer-archive-keyring.gpg
```

### 2. Add the Repository to your APT Sources
*The `$(lsb_release -cs)` command will automatically detect if you are on `noble` or `trixie`.*
```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/airsailer-archive-keyring.gpg] https://repo.airsailer.io $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/airsailer.list > /dev/null
```

### 3. Update APT and Install Packages
```bash
sudo apt update
sudo apt install lxc lxcfs
```

---

## ⚙️ Infrastructure & Automation

This repository is 100% automated for transparency and reliability.

1. **GitHub Actions:** Packages are automatically compiled from source inside isolated containers (`ubuntu:24.04` and `debian:trixie`) using GitHub Actions.
2. **FPM:** Compiled binaries are packaged into Debian (`.deb`) files using [FPM](https://github.com/jordansissel/fpm).
3. **Reprepro:** The `.deb` artifacts are ingested and cryptographically signed using `reprepro`.
4. **GitHub Pages:** The resulting static file structure is pushed to the `gh-pages` branch and served globally via GitHub Pages at `repo.airsailer.io`.

## 🌐 The Airsailer Ecosystem
This repository is just one piece of the puzzle. Check out the rest of the stack that powers Airsailer:
* **[Airsailer](https://github.com/airsailer/airsailer)** - The open-source Cloud Orchestrator.
* **[Sail Containers](https://github.com/airsailer/sail-containers)** - A highly efficient, opinionated System Container Engine and Node-Level Manager for LXC, built in Crystal.
* **[Alumna Backend](https://github.com/alumna/backend)** - High productivity, high-performance open-source backend.
* **[Alumna SQLite](https://github.com/alumna/sqlite)** - SQLite adapter for single-node database architecture.

## 🤝 Contributing & Issues
If you encounter any issues installing packages or have feature requests for our LXC builds, please [open an issue](../../issues) in this repository.

To learn more about the platform, visit [Airsailer.io](https://airsailer.io).
