#!/bin/bash

amount_of_requests=$(cat access.log | wc -l)
unique_cnt=$(awk '{print $1}' access.log | sort | uniq | wc -l)
requests_per_method=$(awk '{c[substr($6, 2)]++} END{for (i in c) print c[i], i}' access.log)
most_popular_url=$(awk '{c[$7]++} END {for (url in c) if (c[url] > max) {max = c[url]; result=url} print max, result}' access.log)

>report.txt
echo "Отчет о логе веб-сервера" >> report.txt
echo "========================" >> report.txt
echo "Общее количество запросов: $amount_of_requests" >> report.txt
echo "Количество уникальных IP-адресов: $unique_cnt" >> report.txt
echo -e "Количество запросов по методам:\n$requests_per_method" >> report.txt
echo "Самый популярный URL: $most_popular_url" >> report.txt

