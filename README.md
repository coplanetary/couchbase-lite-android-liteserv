LiteServ is an HTTP (ReST) interface to the Couchbase-Lite database running on the device/emulator.  

Here's how it fits into the picture:

![architecture.png](http://cl.ly/image/3i400h2Z0f1f/lite-serv-android.png)

LiteServ effectively _wraps_ [Couchbase Lite](https://github.com/couchbase/couchbase-lite-android) and provides an API that can be accessed via HTTP.

It is useful for:

* Using Couchbase-Lite inside of a LiteGap app (eg, a Couchbase-Lite app based on PhoneGap)
* Easy access to data in a Couchbase-Lite database via curl for debugging
* Testing 
* Doing _pull_ replications where something else is pulling data from Couchbase-Lite 

## Getting LiteServ 

```
git clone https://github.com/couchbaselabs/couchbase-lite-android-liteserv.git
```

## Import Project into Android Studio

**Note**: this project is known to work on Android Studio 0.4.3 and earlier 0.4.X versions, but is not working on Android Studio 0.4.4 or later due to this [Android Studio bug](https://code.google.com/p/android/issues/detail?id=65915)

Follow the instructions in the following sections of the Couchbase Lite Android README on [Importing Project into Android Studio](https://github.com/couchbase/couchbase-lite-android/blob/master/README.md):

## Building and deploying maven artifacts.

If you want to host and deploy your own maven artifacts, see the `extra/jenkins_build/upload_android_artifacts.sh` script.

## Building LiteServAndroid via Gradle command line

**Configure Android Studio SDK location**

* `cp local.properties.example local.properties`
* Customize `local.properties` according to your SDK installation directory

**Build**

- With specifying CBL version and storage type
```bash
$ ./gradlew clean && ./gradlew -Dversion=0.0.0-688 -Dstorage=SQLite assemble
```
- without parameters
```bash
$ ./gradlew clean && ./gradlew assemble
```

## Running Unit tests

See [Running unit tests for couchbase lite android](https://github.com/couchbase/couchbase-lite-android/wiki/Running-unit-tests-for-couchbase-lite-android)

## Running LiteServAndroid via Android Studio

Once the project is imported, just run the green arrow "play" button.  

## Running LiteServAndroid via Gradle command line

* Define an AVD (android virtual device) if you have not already done so.  This can be done by running `$ android avd` to launch the UI

* Launch the emulator with that AVD.  This can be done in the AVD manager UI, or on the command line via `$ emulator64-arm -avd <avd_name> -netspeed full -netdelay none` where `avd_name` is the name of the AVD you created in the previous step.

* Call `$ ./run_android_liteserv.sh 8080` to run it on port 8080.  This should install the app into the emulator and launch it, and then setup a port forwarding rule so that 8080 on your workstation is mapped to port 8080 on the emulator.

## NOTE
- Android Studio & JDK 1.8.x & Mac OSX => Unable to build application because of webserver-2.-3.jar from http://files.couchbase.com/maven2/com/couchbase/cblite/webserver/2-3/ which is integrated in couchbase-lite-java-listner. **Use JDK 1.7.x** instead of JDK 1.8.x



