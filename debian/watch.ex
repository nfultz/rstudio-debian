# Example watch control file for uscan.
# Rename this file to "watch" and then you can run the "uscan" command
# to check for upstream updates and more.
# See uscan(1) for format.

# Compulsory line, this is a version 4 file.
version=4

# PGP signature mangle, so foo.tar.gz has foo.tar.gz.sig.
#opts="pgpsigurlmangle=s%$%.sig%"

# HTTP site (basic).
#http://example.com/downloads.html \
#  files/rstudio-([\d\.]+)\.tar\.gz debian uupdate

# Uncomment to examine an FTP server.
#ftp://ftp.example.com/pub/rstudio-(.*)\.tar\.gz debian uupdate

# SourceForge hosted projects.
# http://sf.net/rstudio/ rstudio-(.*)\.tar\.gz debian uupdate

# GitHub hosted projects.
#opts="filenamemangle=s%(?:.*?)?v?(\d[\d.]*)\.tar\.gz%<project>-$1.tar.gz%" \
#   https://github.com/<user>/rstudio/tags \
#   (?:.*?/)?v?(\d[\d.]*)\.tar\.gz debian uupdate

# GitLab hosted projects.
#opts="filenamemangle=s%(?:.*?)?v?@ANY_VERSION@(@ARCHIVE_EXT@)%<project>-$1$2%" \
#    https://gitlab.com/<user>/<project>/-/tags \
#    archive/v?@ANY_VERSION@/<project>-v?\d\S*@ARCHIVE_EXT@

# PyPI.
# https://pypi.debian.net/rstudio/rstudio-(.+)\.(?:zip|tgz|tbz|txz|(?:tar\.(?:gz|bz2|xz)))

# Direct Git.
# opts="mode=git" http://git.example.com/rstudio.git \
#   refs/tags/v([\d\.]+) debian uupdate




# Uncomment to find new files on GooglePages.
# http://example.googlepages.com/foo.html rstudio-(.*)\.tar\.gz
