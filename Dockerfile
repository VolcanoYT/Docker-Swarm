FROM repo.volcanoyt.com/base:novnc-alpine

RUN apk --no-cache add chromium obs-studio ffmpeg vlc openjdk8

WORKDIR $WORK

# Start bulid swarm from repo dev
# RUN apk --update --no-cache add maven && wget https://github.com/usgs/swarm/archive/master.zip && unzip master.zip -d $WORK && cd swarm-master && mvn install

COPY config_base $WORK/.config/
COPY etc_base /etc/
COPY app $WORK/

# Auto Start (Normal You can't find the auto folder because this is different for each user's config so if you want to run automatically, please set this)
# COPY auto/sw/ $WORK/sw/
# COPY auto/auto-sw.conf /etc/auto-sw.conf
# COPY auto/auto-obs.conf /etc/auto-obs.conf
# COPY auto/obs/service.json $WORK/.config/obs-studio/basic/profiles/yt_akbar/service.json
# RUN cat /etc/auto-sw.conf >> /etc/supervisord.conf && \
#     cat /etc/auto-obs.conf >> /etc/supervisord.conf

# Fix Permission
RUN chown -R $USER $WORK/ && \
    chmod -R 775 $WORK/

# Start Magic!
CMD ["/usr/bin/supervisord","-c","/etc/supervisord.conf"]