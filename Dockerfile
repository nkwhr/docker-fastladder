FROM rails:4.1.6

RUN gem install foreman

RUN git clone https://github.com/fastladder/fastladder.git

WORKDIR /fastladder

RUN sed "s|socket: /var/run/mysqld/mysqld.sock|host: <%= ENV['MYSQL_HOST'] %>|g" config/database.yml.mysql | \
    sed "s|password:|password: <%= ENV['MYSQL_PASSWORD'] %>|g" > config/database.yml

RUN bundle install --without development test -j$(nproc)

ENV RAILS_ENV production

EXPOSE 5000

CMD git pull && \
    bundle -j$(nproc) && \
    bin/rake db:create db:migrate && \
    bin/rake assets:precompile && \
    SECRET_KEY_BASE=$(bin/rake secret) foreman start
