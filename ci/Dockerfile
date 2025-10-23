# ---------- base: shared toolchain ----------
FROM ubuntu:24.04 AS base

ARG LLVM_VERSION=21
ENV DEBIAN_FRONTEND=noninteractive
ENV CMAKE_GENERATOR=Ninja

# Prefer Clang toolchain by default
ENV CC=clang \
    CXX=clang++ \
    AR=llvm-ar \
    NM=llvm-nm \
    RANLIB=llvm-ranlib

RUN set -eux; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      ccache \
      ninja-build \
      pkg-config \
      gcovr \
      curl \
      ca-certificates \
      gnupg \
      lsb-release \
      software-properties-common \
      git \
      unzip \
      xz-utils; \
    rm -rf /var/lib/apt/lists/*

# LLVM from apt.llvm.org
RUN set -eux; \
    tmpdir="$(mktemp -d)"; \
    curl -fsSL https://apt.llvm.org/llvm.sh -o "${tmpdir}/llvm.sh"; \
    chmod +x "${tmpdir}/llvm.sh"; \
    "${tmpdir}/llvm.sh" "${LLVM_VERSION}" all; \
    rm -rf "${tmpdir}"; \
    update-alternatives --install /usr/bin/clang clang "/usr/bin/clang-${LLVM_VERSION}" 210 \
      --slave /usr/bin/clang++ clang++ "/usr/bin/clang++-${LLVM_VERSION}" \
      --slave /usr/bin/clangd clangd "/usr/bin/clangd-${LLVM_VERSION}" || true; \
    update-alternatives --set clang "/usr/bin/clang-${LLVM_VERSION}" || true; \
    if command -v "lld-${LLVM_VERSION}" >/dev/null 2>&1; then \
      update-alternatives --install /usr/bin/lld lld "/usr/bin/lld-${LLVM_VERSION}" 210 || true; \
    fi

# xmake (system-wide)
RUN set -eux; \
    tmpdir="$(mktemp -d)"; \
    curl -fsSL https://xmake.io/shget.text -o "${tmpdir}/xmake.sh"; \
    XMAKE_ROOT=y prefix=/usr/local bash "${tmpdir}/xmake.sh"; \
    rm -rf "${tmpdir}"; \
    xmake --version || true

# ---------- ci: headless, root-friendly ----------
FROM base AS ci
# In CI we keep root and allow xmake as root
ENV XMAKE_ROOT=y
WORKDIR /work
# (CI-specific extras would go here, if any)

# ---------- dev: nicer shell + non-root user ----------
FROM base AS dev
# Turn off root-specific behavior for local dev
ENV XMAKE_ROOT=
# Create a non-root user that won’t trash your git perms
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000
RUN set -eux; \
    groupadd -g "${GID}" "${USERNAME}" || true; \
    useradd -m -u "${UID}" -g "${GID}" -s /bin/bash "${USERNAME}" || true; \
    apt-get update -y; \
    apt-get install -y --no-install-recommends \
      gdb lldb bash-completion locales ripgrep less; \
    rm -rf /var/lib/apt/lists/*; \
    sed -i 's/^# \(en_CA.UTF-8 UTF-8\)/\1/' /etc/locale.gen && locale-gen
ENV LANG=en_CA.UTF-8
USER ${USERNAME}
WORKDIR /workspaces/project
