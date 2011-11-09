#!/bin/sh

#
# Usage: ./zipfs_mount.sh file.zip /mount/point

(
    HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    echo "Script home dir $HOME"

    echo "Using this JDK_HOME=$JDK_HOME"

	[[ "$3" == "-d" ]] && DEBUG="-Dorg.apache.commons.logging.Log=fuse.logging.FuseLog -Dfuse.logging.level=DEBUG"
	
	LD_LIBRARY_PATH=$HOME/jni:$HOME/lib $JDK_HOME/bin/java \
		-cp "$HOME/lib/*" \
		$DEBUG fuse.zipfs.ZipFilesystem \
		-f -s "$2" "$1"
) &