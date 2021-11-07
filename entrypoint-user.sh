#!/bin/bash
set -e

IP=`awk 'END{print $1}' /etc/hosts`

cd $WORKSPACE

case "$@" in
    serve)
        scons
        cd $WWW_DIR
        hugo serve --bind=$IP -D --baseURL="http://$IP:1313/"
        # installdeps_bundler_local
        # bundle exec jekyll serve --drafts --host=$(hostname -i | awk '{print $1}')
        # cd - &>/dev/null
        ;;
    build)
        scons
        cd $WWW_DIR
        hugo build --bind=$IP --baseURL="http://$IP:1313/"
        # installdeps_bundler_local

        # bundle exec jekyll build "${DRAFT:+--drafts}" --trace
        # cd - &>/dev/null
        ;;
    notebook)
        jupyter lab --ip $IP --notebook-dir /github/workspace/content/
        cd - &>/dev/null
        ;;
    clean)
        scons -c
        ;;
    *)
        $@
        ;;
esac
