#!/usr/bin/env bash

if test -t 1; then
    # Determine if colors are supported...
    ncolors=$(tput colors)

    if test -n "$ncolors" && test "$ncolors" -ge 8; then
        BOLD="$(tput bold)"
        YELLOW="$(tput setaf 3)"
        GREEN="$(tput setaf 2)"
        NC="$(tput sgr0)"
    fi
fi

function init_project {
    if [ ! -e ./apps/frontend/.env ]; then
        cp ./apps/frontend/.env.example ./apps/frontend/.env
    fi
    if [ ! -e ./apps/backend/.env ]; then
        cp ./apps/backend/.env.example ./apps/backend/.env
    fi

    docker-compose down \
    && docker-compose build \
    && docker-compose up -d \
    && docker-compose exec frontend composer install \
    && docker-compose exec backend  composer install \
    && docker-compose exec frontend php artisan key:generate \
    && docker-compose exec backend php artisan key:generate \
    && echo "initialize project complete."
}

function display_help {
    echo "run.sh command Help"
    echo
    echo "${YELLOW}Usage:${NC}"
    echo "  run.sh COMMAND [options]"
    echo
    echo "${GREEN}COMMAND${NC}"
    echo "  init               initialize development environment."
    echo "  up [options]       up docker containers. (= docker-compose up)"
    echo "  down [options]     down docker containers. (= docker-compose down)"
    echo "  destroy            destroy development environment. (docker containers, network, images, volumes, vendor/*)"
    echo "  help               display help. (default)"
    echo
    echo "${GREEN}TIPS${NC}"
    echo "  undefined COMMAND are delegeted to docker-compose command."
    echo "  ex)"
    echo "    run.sh ps  ==>  docker-compose ps"
    echo
    exit 1
}


# ----------
# display help
# ----------
if [ $# -gt 0 ]; then
    if [ "$1" == "help" ]; then
        display_help
    fi
else
    display_help
fi

if [ "$1" == "up" ]; then
    # ----------
    # up
    # ----------
    shift 1
    docker-compose up "$@"

elif [ "$1" == "down" ]; then
    # ----------
    # down
    # ----------
    shift 1
    docker-compose down "$@"

elif [ "$1" == "destroy" ]; then
    # ----------
    # destroy
    # ----------
    shift 1
    docker-compose down --rmi all --volumes --remove-orphans \
    && rm -rf ./apps/frontend/vendor \
    && rm -rf ./apps/backend/vendor \
    && echo "destroy resources complete."

elif [ "$1" == "init" ]; then
    # ----------
    # init
    # ----------
    shift 1
    init_project

else
    ARGS+=("$@")
    docker-compose "${ARGS[@]}"
fi
