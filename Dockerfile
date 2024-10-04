FROM sourceservers/cstrike:latest

# Variable for latest sourcemod download link & metamod download link
ENV SM_DOWNLOAD=https://sm.alliedmods.net/smdrop/1.11/sourcemod-1.11.0-git6968-linux.tar.gz
ENV MM_VERSION=https://mms.alliedmods.net/mmsdrop/1.11/mmsource-1.11.0-git1155-linux.tar.gz
ENV MAPCHOOSER="https://forums.alliedmods.net/attachment.php?attachmentid=110564&d=1349648196"

# Install unzip
RUN apt-get update && apt-get install -y unzip

# Copy sourcemod.tar.gz, metamod.tar.gz & mapchooser.zip to /tmp
COPY /bin/sourcemod.tar.gz /tmp
COPY /bin/metamod.tar.gz /tmp
COPY /bin/mapchooser.zip /tmp

# Install Metamod by copying addons folder to /server/cstrike
RUN tar -xzf /tmp/metamod.tar.gz -C /server/cstrike

# Install Sourcemod

RUN tar -xzf /tmp/sourcemod.tar.gz -C /server/cstrike

# Install Mapchooser
RUN unzip /tmp/mapchooser.zip -d /server/cstrike


# Remove downloaded files
RUN rm /tmp/sourcemod.tar.gz && \
    rm /tmp/metamod.tar.gz && \
    rm /tmp/mapchooser.zip

# Fix Permissions of addons folder
RUN chmod -R 755 /server/cstrike/addons

