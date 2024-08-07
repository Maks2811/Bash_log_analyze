{
echo "Отчет о логе веб-сервера"
echo "==========================="
awk 'END { print "Общее количество запросов:      " NR }' access.log
echo "Количество уникальных IP-адресов:       $(awk '{ print  $1 }' access.log | sort | uniq | wc -l )"

# sort - сортирует, uniq - удаляет дубликаты, wc -l - считает количество строк

echo
echo "Количество запросов по методам:"

echo "  $(awk '/GET/ {count++} END {print count}' access.log )  GET"
echo "  $(awk '/POST/ {count ++} END {print count}' access.log )  POST"

echo
echo "Самый популярный  URL: $(awk '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)"

# sort : сортирует, 
# uniq  -c :  выводит количество упоминаний каждого  уникального значения  столбца,
# sort -nr : сортирует по убыванию
# head -n 1 :  выводит первую строку
}>report.txt

echo "Отчет сохранен в файл: report.txt"