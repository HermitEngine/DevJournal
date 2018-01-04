#!/bin/bash
# Katie Harron - @pibby
# This bash script will setup a new Jekyll blog post in Markdown and open it for editing in Sublime Text 2

echo "Post Title: "
read title

ptitle=${title// /-}   # convert spaces in title to hyphens
plc=`echo "$ptitle" | tr '[:upper:]' '[:lower:]'`   # convert title to lowercase
pdate=`date +%Y-%m-%d` 	# create date as Year-Month-Date
filename=_posts/$pdate-$plc.md 	# location to create the new file as year-month-day-title.md
touch $filename 	# create the new blank post

echo "---
layout: post
title: $title
date: $pdate
categories: devblog
---" > $filename 	# fill out YAML Front Matter and insert into our new file

vim $filename
