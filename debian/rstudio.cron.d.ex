#
# Regular cron jobs for the rstudio package.
#
0 4	* * *	root	[ -x /usr/bin/rstudio_maintenance ] && /usr/bin/rstudio_maintenance
