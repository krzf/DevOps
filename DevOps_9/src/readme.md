# Part 1. Получение метрик и логов

1. Использовать docker swarm из первого проекта.


2. Написать при помощи библиотеки Micrometer сборщики следующих метрик приложения:  

Добавляем в pom.xml и в application.properties следующие сроки, спрингбут сделает метрики за нас

![alt text](part1/mictometrepom.png)  

![alt text](part1/propmicrometer.png)  


3. Добавить логи приложения с помощью Loki.

![alt text](image.png)  

![alt text](image-1.png)  

![alt text](part1/loki.png)


4. Создать новый стек для docker swarm из сервисов с Prometheus Server, Loki, node_exporter, blackbox_exporter, cAdvisor. Проверить получение метрик на порту 9090 через браузер.  


![alt text](part1/newstack.png)  

![alt text](part1/loki+services.png)  

![alt text](part1/9090metrics.png)  

![alt text](part1/prometheustargets.png)  

микрометер 

![alt text](part1/micrometer.png)




# Part 2. Визуализация
1. Развернуть grafana как новый сервис в стеке мониторинга.

![alt text](image-2.png)  


2. Добавить в grafana дашборд со следуюшими метриками:

количество нод;

![alt text](part2/NODESGRAFANA.png)  


количество контейнеров;  

![alt text](part2/runningcontaiers.png)  


количество стеков;  
![alt text](part2/stack.png)  


использование CPU по сервисам;  

![alt text](part2/CPUUSAGE.png)  




использование CPU по ядрам и узлам;  

![alt text](part2/cpuusageCORENODES.png)  




затраченная RAM;  

![alt text](part2/ramused.png)


доступная и занятая память;  

![alt text](part2/usedfreemem.png)  


количество CPU;  

![alt text](part2/cpus.png)  


доступность google.com; 

![alt text](part2/BBgrafana.png)

![alt text](part2/BB.png)

количество отправленных сообщений в rabbitmq;

![alt text](part2/rabbitsend.png)


количество обработанных сообщений в rabbitmq;

![alt text](part2/rabbitmqconsumed.png)  


количество бронирований;  

![alt text](<part2/ Bookingcount.png>)  


количество полученных запросов на gateway;  

![alt text](part2/reqgateway.png)  

количество полученных запросов на авторизацию пользователей;
![alt text](part2/auth.png)

логи приложения.

![alt text](part2/logs.png)


# Part 3. Отслеживание критических событий  

1. Развернуть alert manager как новый сервис в стеке монтиторинга.  
![alt text](image-3.png)  

2. Добавить следующие критические события:

доступная память меньше 100 мб;
затраченная RAM больше 1гб;
использование CPU по сервису превышает 10%.  

![alt text](image-4.png)



3. Настроить получение оповещений через личные email и телеграм.  

![alt text](image-5.png)  


![alt text](part3/tgbot.png)    

![alt text](part3/alermanager.png)

![alt text](part3/prometalert.png)
