FROM quay.io/toolbx/arch-toolbox:latest

LABEL com.github.containers.toolbox="true" \
    name="arch-android-toolbox" \
    version="latest" \
    usage="This image is meant to be used with the toolbox or distrobox command" \
    summary="Arch Linux toolbox container preinstalled with Android Studio, Flutter, and Android SDK" \
    maintainer="Pratyay Mustafi <pratyaymustafi@outlook.com>"

# Copy setup scripts and package lists
COPY scripts/ /scripts/
COPY packages/ /packages/

# Set up environment variables
ENV JAVA_HOME="/usr/lib/jvm/java-17-openjdk"
ENV ANDROID_HOME="/opt/android-sdk"
ENV ANDROID_SDK_ROOT="/opt/android-sdk"
ENV FLUTTER_ROOT="/opt/flutter"
ENV PATH="${PATH}:${FLUTTER_ROOT}/bin:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/cmdline-tools/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/emulator:${ANDROID_HOME}/tools:${ANDROID_HOME}/tools/bin"

# Execute setup script and clean build artifacts
RUN chmod +x /scripts/*.sh && /scripts/android.sh
RUN rm -rf /scripts /packages
