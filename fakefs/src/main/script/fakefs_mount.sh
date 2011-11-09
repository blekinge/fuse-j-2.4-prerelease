#!/bin/sh

#
# Usage: ./fakefs_mount.sh /mount/point -f [ -s ]
(
    HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
    echo "Script home dir $HOME"

    echo "Using this JDK_HOME=$JDK_HOME"
    JAVA_OPTS="$JAVA_OPTS -Dcom.sun.management.jmxremote"


	[[ "$3" == "-d" ]] && DEBUG="-Dorg.apache.commons.logging.Log=fuse.logging.FuseLog -Dfuse.logging.level=DEBUG"

	LD_LIBRARY_PATH=$HOME/jni:$HOME/lib $JDK_HOME/bin/java \
		-cp "$HOME/lib/*" \
		$DEBUG $JAVA_OPTS fuse.FakeFilesystem \
		-f -s $*
) &