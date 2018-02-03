FROM ruby:2.4.3

# Add PostgreSQL repo
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" > /etc/apt/sources.list.d/pgdg.list; \
    curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Install PostgreSQL client libs, and make asset precompilation work
RUN apt-get update && \
    apt-get install -y \
    nodejs=0.10.29~dfsg-2 \
    postgresql-client-9.6=9.6.6-1.pgdg80+1 \
    --no-install-recommends && rm -rf /var/lib/apt/lists/*

ENV LANG C.UTF-8

WORKDIR /app
COPY .dockerignore ./
COPY Gemfile* ./

# You'll have to just copy your `id_rsa` key to the project directory to make deployment work.
RUN mkdir /root/.ssh && ln -sf /app/id_rsa /root/.ssh/

RUN gem install bundler
RUN bundle install
EXPOSE 3000
CMD ["bash"]
