#!/bin/sh

# DISCLAIMER:
#	Algo used is very simple -- date(s) are translated to UNIX timestamps
#	(in seconds) then translated to days. No specials cases (should they be) are
#	really handled. It means results can be WRONG.
#
# Usage:
#	calc_date_diff.sh date1 [date_2]
#
# for e. g.:
#	calc_date_diff.sh 2015-01-01
#	Days passed since: 164
# or:
#	calc_date_diff.sh 2015-01-01 2015-02-01
#	Days passed since: 31

arg_date1="$1"
arg_date2="$2"

date1_uts=$(date '+%s' -d "$arg_date1")

if [ -z "$arg_date2" ]; then
	date2_uts=$(date '+%s')
else
	date2_uts=$(date '+%s' -d "$arg_date2")
fi

date_diff_uts=$(($date1_uts - $date2_uts))
if [ $date_diff_uts -lt 0 ]; then
	date_diff_uts=$((0 - $date_diff_uts))
fi

date_diff_hr=$(($date_diff_uts/3600))
date_diff_day=$(( $date_diff_hr/24))

echo "Days passed since: $date_diff_day"

