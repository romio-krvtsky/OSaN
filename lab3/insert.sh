#!/bin/bash

exec 1>output.txt

table=$(cat data.csv)

table_name=$(echo "$table" | sed -n '1p')
column_names=$(echo "$table" | sed -n '2p')

table="$(echo "$file" | sed '1,2d')"

echo "$file" | awk "{ print \"insert into $table_name ($column_names) values (\" \$0 \");\" }"
