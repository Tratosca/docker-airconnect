FROM alpine
COPY etc/ /etc
COPY root/ /
RUN /install.sh
CMD /start.sh