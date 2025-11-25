# Hometask7  
Автор: Dembitska Ilona
Курс: IXT 

## Тема  
SSH Dynamic Port Forwarding (SOCKS-проксі) + Reverse Port Forwarding + локальний вебсервер

## Мета роботи
- Запустити EC2-інстанс на Ubuntu 22.04  
- Налаштувати динамічне SSH-переспрямування порту (`-D`) для роботи SOCKS-проксі  
- Налаштувати браузер на використання SOCKS-проксі та перевірити зовнішню IP-адресу  
- Запустити локальний Python HTTP-сервер  
- Налаштувати SSH-reverse порт-форвардинг (`-R`), щоб інстанс EC2 міг бачити локальний сервер  
- Змінити конфігурацію sshd через user-data (GatewayPorts yes)  
- Відкрити необхідні порти в Security Group  
- Завантажити скрипти та README на GitHub  


## Як запускати (3 Git Bash вікна)

### Вікно №1 — запуск EC2 + SOCKS proxy
cd /c/IXT/hometask7
bash run-instance.sh

ssh -i "IXT.pem" -D 8888 ubuntu@<EC2-IP>  
# створює SOCKS-проксі на localhost:8888


### Вікно №2 — локальний вебсервер
python -m http.server 8000  
# локальний сервер доступний на http://localhost:8000

Перевірка IP:
https://whatismyipaddress.com

### Вікно №3 — reverse SSH-тунель
cd /c/IXT/hometask7
ssh -i "IXT.pem" -R 9999:localhost:8000 ubuntu@<EC2-IP>  
# EC2 зможе бачити локальний сервер на порті 9999


## Перевірка у браузері (Firefox)

### Перевірка локального сервера
http://localhost:8000

### Перевірка reverse-трафіку через EC2
http://<EC2-IP>:9999

### Перевірка SOCKS-проксі
Налаштування Firefox:
SOCKS Host: 127.0.0.1
Port: 8888
