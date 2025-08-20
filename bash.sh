#Програма для зрочного використання фаєрвола
logs(){
	echo "$(date): $1" >> logs
}
while true; do 
echo "МЕНЮ"
echo "1) Статус фаєрвола"
echo "2) Відкрити порт"
echo "3) Закрити порт"
echo "4) Перезапустити"
echo "5) Вийти"
read -p "Введіть команду: " d
case $d in
1)
	sudo ufw status
	logs "Переглянуто статус"
	;;
2)
	read -p "Введіть порт: " port
	sudo ufw allow "$port"
	echo "Порт $port відкрито"
	logs "Порт $port відкрито"
	;;
3)
	read -p "Введіть порт: " port
        sudo ufw deny "$port"
	echo "Порт $port закрито"
	logs "Порт $port закрито"
	;;
4)
	sudo ufw reload
	echo "фаєрвол перезапущено"
	logs "фаєрвол перезапущено"
	;;
5)
	echo "До побачення"
	break
	;;
*)
	echo "Невірна команда"
	;;
esac
done
