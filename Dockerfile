FROM msoap/shell2http

RUN apk --update add imagemagick curl tzdata
ENV TZ=America/Chicago
ADD entry.sh entry.sh
# CMD ["-export-all-vars", "-cache=3600", "/nyt", "./entry.sh"]
ENTRYPOINT [ "./entry.sh" ]