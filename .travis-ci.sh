bash .travis-ocaml.sh

export OPAMYES=1
eval $(opam config env)

opam repo add mirage-dev .
opam update -u
opam install mirage

git clone -b normalize-ipv4 git://github.com/yomimono/mirage-skeleton
cd mirage-skeleton
make MODE=${MODE}

opam install -y -j2 datakit datakit-server datakit-github datakit-client git-mirage charrua-unix logs-syslog
