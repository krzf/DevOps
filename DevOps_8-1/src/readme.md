# Part 1. Удаленное конфигурирование узла через Ansible


/etc/ssh/sshd_config на наличие строчки PasswordAuthentication yes 
коммичу строчку
![alt text](part1/sshconfig.png)

* Зайти на manager.
* На manager проверить подключение к node01 через ssh по приватной сети.
* Сгенерировать ssh-ключ для подключения к node01 из manager (без passphrase).  


![alt text](part1/copyssh.png)  

![alt text](part1/sshnopass.png)  

* Установить Ansible на менеджер и создать папку ansible, в которой создать inventory-файл.
* Использовать модуль ping для проверки подключения через Ansible.
* Результат выполнения модуля поместить в отчет.   

sudo add-apt-repository ppa:ansible/ansible  

sudo apt update  

sudo apt install ansible  


![alt text](part1/PING.png)  


3. Написать первый плейбук для Ansible, который выполняет apt update, устанавливает docker, docker-compose, копирует compose-файл из manager'а и разворачивает микросервисное приложение.  

![alt text](part1/PLAYBOOK1.png)  

![alt text](part1/playbook1.png)

Здесь у меня через деплой, с прошлого проекта используется nginx для проксирования зачем то, можно убрать и поставить компоуз в ТЗ не написано как нужно. Можно и так и так.




4. Прогнать заготовленные тесты через postman и удостовериться, что все они проходят успешно. В отчете отобразить результаты тестирования.  

![src/part1/postman1.png  ](part1/postman1.png)




5. Сформировать три роли:



* роль application выполняет развертывание микросервисного приложения при помощи docker-compose,
* apache устанавливает и запускает стандартный apache сервер
* postgres устанавливает и запускает postgres, создает базу данных с произвольной таблицей и добавляет в нее три произвольные записи.
* Назначить первую роль node01 и вторые две роли node02, проверить postman-тестами работоспособность микросервисного приложения, удостовериться в доступности postgres и apache-сервера. Для Apache веб-страница должна открыться в браузере. Что касается PostgreSQL, необходимо подключиться с локальной машины и отобразить содержимое ранее созданной таблицы с данными.
  
меняем конфиг чтобы не запрашивал пароль, какие то с ним проблемы  


![alt text](part1/trustp1.png)  

![alt text](part1/psqltrust.png)  

![alt text](part1/apache.png)  

![alt text](part1/table.png)  

для подключение к БД с локльной машины:  
на виртаулке  
sudo nano /etc/postgresql/12/main/pg_hba.conf  
разрешаем для локальной машины подключение без пароля  
host    all             all             0.0.0.0/0               trust  
sudo nano /etc/postgresql/12/main/postgresql.conf   
listen_addresses = '*'  
sudo systemctl restart postgresql  
и подключаемся  psql -h 192.168.50.12 -U postgres -d postgres


![alt text](part1/fromlocal.png)

![alt text](part1/postmanlast.png)

Созданные в этом разделе файлы разместить в папке src\ansible01 в личном репозитории.


# Part 2. Service Discovery  


1. Написать два конфигурационный файла для consul (информация по consul в материалах):
![alt text](part2/cclient.png)  

![alt text](part2/consulserver.png)

2. Создать с помощью Vagrant четыре машины - consul_server, api, manager и db.
![alt text](part2/vagrant.png)

3. Написать плейбук для ansible и четыре роли:    
/ansible02  
![alt text](part2/playbookstart.png)  


4. Проверить работоспособность CRUD-операций над сервисом отелей. В отчете отобразить результаты тестирования.  

наш сервис  
![alt text](part2/hservice.png)  

наш консул на порте 8500  
![alt text](part2/consul.png) 
проверяем доступность микросервиса  
![alt text](part2/browser.png)  

![alt text](part2/testcurl.png)  
круд тесты гет пост  
![alt text](part2/crudGET.png)  

![alt text](part2/crudPOST.png)  
круд тесты гет пост  в постмане  


![alt text](part2/getafterpostPOSTMAN.png) 

![alt text](part2/POSTpostman.png)
