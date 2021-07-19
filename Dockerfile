FROM r-base:4.0.4

RUN apt-get update --fix-missing \
      && apt install -y --no-install-recommends dirmngr gnupg apt-transport-https ca-certificates software-properties-common sudo libblas-dev liblapack-dev gfortran


COPY . /usr/local/fsbench
# Run the setup, but first remove the purge tool which may have been built locally
# for a different architecture
RUN cd /usr/local/fsbench && rm -f tools/purge-disk-cache && make setup
