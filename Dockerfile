FROM alpine
COPY etc/ /etc
COPY root/ /
RUN "chmod" "+x" "/install.sh"
RUN "chmod" "+x" "/start.sh"
RUN "/install.sh"
CMD ["/start.sh"]
