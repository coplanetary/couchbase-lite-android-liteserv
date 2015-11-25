
# This script starts LiteServ, which provides an HTTP interface to the Couchbase-Lite database running on the device/emulator.
#
# This is useful for two things:
#  - Testing
#  - Viewing the data stored by Couchbase-Lite
# 
# How to run this script: 
# 
#  ./run_android_liteserv.sh <listen-port-number>  
#
# where listen-port-number is a port number, eg, 8080
#
# Pre-requisites:
#   - Emulator must be running

# make sure port was passed in
die () {
    echo >&2 "$@"
    exit 1
}
[ "$#" -eq 1 ] || die "1 argument required, $# provided"

# build and install to emulator
./gradlew clean && ./gradlew installDebug

# launch activity
adb shell am start -a android.intent.action.MAIN -n com.couchbase.liteservandroid/com.couchbase.liteservandroid.MainActivity --ei listen_port $*
# to disable the basic auth(for functional tests)
# adb shell am start -a android.intent.action.MAIN -n com.couchbase.liteservandroid/com.couchbase.liteservandroid.MainActivity --ei listen_port $* --es username "" --es password ""

# port mapping (only listens on localhost, unavailable from other machines on network)
adb forward tcp:$* tcp:$*

# make this port available to other machines on network.  
# (note: replace 10.17.51.92 with ethernet iface address)
# ./bin/node-http-proxy --port $* --host 10.17.51.92 --target localhost:$*

