# Rstudio for debian

Goal:

```
sudo apt install rstudio-server
```

works by default.

# Notes / TODO

* Dependencies
  * boost
```
libboost-atomic-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-atomic1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-atomic1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-chrono-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-chrono1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-chrono1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-date-time-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-date-time1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-date-time1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-filesystem-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-filesystem1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-filesystem1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-iostreams-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-iostreams1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-iostreams1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-locale1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-program-options-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-program-options1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-program-options1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-random-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-random1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-random1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-regex-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-regex1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-regex1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-serialization1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-serialization1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-system-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-system1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-system1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-thread-dev/testing,now 1.74.0.3 amd64 [installed]
libboost-thread1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost-thread1.74.0/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libboost1.74-dev/testing,now 1.74.0-16.1 amd64 [installed,automatic]
libref-util-xs-perl/testing,now 0.117-2 amd64 [installed,automatic]
libtype-tiny-xs-perl/testing,now 0.022-2 amd64 [installed,automatic]
```
    * RStudio uses vendored build?
    * Newer version than debian testing?
      * Set version explicitly in cmake overrides
  * yaml-cpp
```
libyaml-cpp-dev/testing,now 0.7.0+dfsg-8 amd64 [installed]
libyaml-cpp0.7/testing,now 0.7.0+dfsg-8 amd64 [installed]
```
    * Rstudio uses older version by default
    * Older version of yaml-cpp had different CMake pkgconfig variables?
      * so comment out checks in RStudio cmake
  * SOCI
```
libsoci-core4.0/testing,now 4.0.1-5 amd64 [installed,automatic]
libsoci-dev/testing,now 4.0.1-5 amd64 [installed]
libsoci-firebird4.0/testing,now 4.0.1-5 amd64 [installed,automatic]
libsoci-mysql4.0/testing,now 4.0.1-5 amd64 [installed,automatic]
libsoci-odbc4.0/testing,now 4.0.1-5 amd64 [installed,automatic]
libsoci-postgresql4.0/testing,now 4.0.1-5 amd64 [installed,automatic]
libsoci-sqlite3-4.0/testing,now 4.0.1-5 amd64 [installed]
```
    * `set(SOCI_LIBRARY_DIR "/usr/lib/x86_64-linux-gnu/")`
      * TODO this seems "bad" / arch specific?
  * GWT
    * Very old, no longer in debian apt repos
    * Vendored
    * Arch uses jdk8
    * oldest jdk in debian testing is jdk11
      * added JAVA_HOME to rules
      * requires flags to allow unrestricted reflection? disallowed by jdk19?
  * Node
    * Replaced all  find_program with default paths? not sure if that did anything
    * Also hardcoded in GWT ant build ?
    * RStudio uses old node, seems to work fine with the newer one in debian testing.
  * Tools dependencies
    * Are these really required to build? Can RStudio just use installed versions at runtime?
    * `set(RSTUDIO_DEPENDENCIES_DICTIONARIES_DIR "/usr/share/dict/")`
      * or should it be /usr/share/dictionaries? what's the difference?
    * `set(RSTUDIO_DEPENDENCIES_MATHJAX_DIR "/usr/share/javascript/mathjax/")`
      * `libjs-mathjax`
    * `set(RSTUDIO_DEPENDENCIES_PANDOC_DIR "/usr/bin")`
* Build issues
  * Tried setting `-DQUARTO_ENABLED=no` in rules
    * But 230MB of quarto is in generated package? How did it get there?
  * `dh_dwz` failure
    * For now, skipped
  * Many lint failures? Not surprising at this point TODO
  * TODO copy the rstudio postinstall/postrm to debian/


