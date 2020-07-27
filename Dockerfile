FROM python:3.7-slim

# install crontab
RUN apt-get update && apt-get -y install -qq cron

ENV CONTAINER_HOME=/opt/
WORKDIR $CONTAINER_HOME

ADD runner.py .

COPY test-cron /etc/cron.d/test-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/test-cron

RUN crontab /etc/cron.d/test-cron

RUN touch /var/log/cron.log

# Setup enviornment variables
ENV TESTING=1
RUN echo "export TESTING=$TESTING" >> $HOME/.bashrc

CMD cron && tail -f /var/log/cron.log