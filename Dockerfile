FROM ruby:2.4
# update the operating system:
RUN apt-get update
# installing vi, git, cloning my rep

RUN apt-get install git 
RUN apt-get install -y npm

RUN git clone -b sqlite3 https://github.com/TamikoT/api-muncher
WORKDIR api-muncher

# Install the Rails Gems and prepare the database:
RUN bundle install
RUN bundle exec rails db:migrate

# default command: run the web server on port 3000:
CMD ["rails", "server", "-b", "0.0.0.0"]