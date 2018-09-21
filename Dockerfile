FROM bitnami/redmine:3.4.6-debian-9
RUN install_packages build-essential libpq-dev pkg-config libmagickwand-dev
RUN install_packages default-libmysqlclient-dev
COPY plugins/ /opt/bitnami/redmine/plugins/

WORKDIR /opt/bitnami/redmine

#RUN /opt/bitnami/redmine/bin/bundle config --local frozein 0
#RUN /opt/bitnami/redmine/bin/bundle install --without development test
#RUN /opt/bitnami/redmine/bin/bundle config --local frozen 1

RUN /opt/bitnami/redmine/bin/bundle install --no-deployment --without test --without development

ENV RAILS_ENV="production"
