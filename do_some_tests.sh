#!/bin/bash

if [ "$1" = "--help" ] ; then
	echo "Usage: static|fuzzing_DONT_WORK"
  exit 0
fi

IMAGE_NAME_BASE="libxml2-base"
IMAGE_NAME_SA="libxml2_sa"
IMAGE_NAME_FZ="NAIN"

DIR_BS="./base"
DIR_SA="./static-analysis"
DIR_FZ="NAIN"

if ! podman image exists "$IMAGE_NAME_BASE"; then
	echo "Nope"
	podman build -t "$IMAGE_NAME_BASE" "$DIR_BS"
else
	echo "Yes, I am"
fi

static_run() {
	podman build -t "$IMAGE_NAME_SA" "$DIR_SA" 
	podman run --rm -v $(pwd)/static-analysis/reports:/report "$IMAGE_NAME_SA"

}

case "$1" in
    	static)
		static_run
        ;;

	all|"")
        	echo "Usage: static|fuzzing_DONT_WORK"
        ;;
esac
