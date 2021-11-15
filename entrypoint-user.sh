#!/bin/bash
set -e

IP=`awk 'END{print $1}' /etc/hosts`

cd $WORKSPACE

case "$@" in
    serve)
        scons
        cd $WWW_DIR
        hugo serve --bind=$IP --baseURL="http://$IP:1313/" $@
        ;;
    build)
        scons
        cd $WWW_DIR
        hugo $@
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
