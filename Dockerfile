FROM alpine:edge

ENV USER=YUKI \
    WORK=/home/YUKI \
    NO_VNC_PORT=6080 \
    VNC_PORT=5901 \    
    VNC_COL_DEPTH=24 \
    VNC_RESOLUTION=1920x1080 \
    VNC_PW=demo

EXPOSE $VNC_PORT $NO_VNC_PORT

# Add new user
RUN addgroup $USER && adduser -G $USER -s /bin/sh -D $USER

# Setup testing repo
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install basic packages
RUN apk --update --no-cache add \
    bash sudo wget ca-certificates supervisor unzip \
    ttf-dejavu mesa-dri-swrast xvfb x11vnc novnc openjdk8

# Install GUI
RUN apk --no-cache add \
    openbox tint2

# Install add-one
RUN apk --no-cache add \
    xfce4-terminal nautilus chromium obs-studio ffmpeg

# Set lang
# ENV LC_ALL C.UTF-8 \
#    LANG en_US.UTF-8 \
#    LANGUAGE en_US.UTF-8

# Set Working Folder
WORKDIR $WORK

# Start bulid swarm from repo dev
# RUN apk --update --no-cache add maven && wget https://github.com/usgs/swarm/archive/master.zip && unzip master.zip -d $WORK && cd swarm-master && mvn install

# Copy folder config
COPY config $WORK/.config/

# Copy folder app
COPY app $WORK/

# Copy folder etc
COPY etc /etc/

# Auto Start (Normal You can't find the auto folder because this is different for each user's config so if you want to run automatically, please set this)
COPY auto/sw/ $WORK/sw/
COPY auto/auto-sw.conf /etc/auto-sw.conf
COPY auto/auto-obs.conf /etc/auto-obs.conf
COPY auto/obs/service.json $WORK/.config/obs-studio/basic/profiles/yt_akbar/service.json
RUN cat /etc/auto-sw.conf >> /etc/supervisord.conf && \
    cat /etc/auto-obs.conf >> /etc/supervisord.conf

# Fix NoVNV index file no found
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Fix Permission
RUN chown -R $USER $WORK/ && \
    chmod -R 775 $WORK/

# Start Magic!
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]