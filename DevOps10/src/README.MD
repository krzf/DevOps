## Part 1. Использование готового манифеста

0. Установка kubectl и minikube

    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
    sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg
    sudo echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.32/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubectl

    minukube
    curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
    sudo dpkg -i minikube_latest_amd64.deb



1. Запустить окружение Kubernetes с памятью 4GB  

minikube start --memory=4g --driver=docker



2. Применить манифест из директории /src/example к созданному окружению Kubernetes

kubectl apply -f example/microservices.yml  

3. Запустить стандартную панель управления Kubernetes с помощью команды minikube dashboard

![alt text](part1/dashboard.png)  

4. Прокинуть тунели для доступа к развернутым сервиса с помощью команды minikube services

![alt text](part1/service.png)  



5. Удостовериться в работоспособности развернутого приложения, открыв в браузере страницу приложения (сервис apache)  

![alt text](part1/servicebrowser.png)   

## Part 2. Написание собственного манифеста  

1. Написать собственные yml-файлы манифестов для приложения из первого проекта (/src/services), реализующие следующее:

* карту конфигурации со значениями хостов БД и сервисов
* секреты с паролем и логином к БД и ключами межсервисной авторизации 
* поды и сервисы для всех модулей приложения: postgres, rabbitmq и 7 сервисов приложения.   
  ![alt text](image.png)  


2. Запустить приложение путем последовательного применения манифестов командой kubectl apply -f <манифест>.yaml.  

![alt text](part2/apply.png)


3. Проверить статус созданных объектов (секреты, конфигурационная карта, поды и сервисы) в кластере с помощью команд kubectl get <тип_объекта> <имя_объекта> и kubectl describe <тип_объекта> <имя_объекта>. Результат отобразить в отчете.  

![alt text](part2/getPodsServices.png)  


![alt text](part2/getSecrandCoonfig.png)   


![alt text](part2/describepods.png)  


![alt text](part2/descrtibepods2.png)  


![alt text](part2/decode.png)  


![alt text](part2/descconfig.png)  


![alt text](part2/descsecret.png)  


4. Проверить наличие правильных значений секретов, применив, например, команду: kubectl get secret my-secret -o jsonpath='{.data.password}' | base64 --decode для декодирования секрета.  
![alt text](part2/decode.png)  

5. Проверить логи приложения, запущенного в кластере командой kubectl logs <имя_контейнера>. Скриншот отобразить в отчете.  

![alt text](part2/logs.png)  



6. Прокинуть тунели для доступа к gateway service и session service.  

![alt text](part2/ports.png)  


7. Запустить функциональные тесты postman и удостовериться в работоспособности приложения.  

![alt text](part2/postnman.png)  


8. Запустить стандартную панель управления Kubernetes с помощью команды minikube dashboard. Отобразить в отчете следующую информацию в виде скриншотов с дашборда: текущее состояние узлов кластера, список запущенных Pod, а также другие метрики, такие как загрузка ЦП и память, логи Pod, конфигурации и секреты.  

![alt text](part2/nodes.png)  


![alt text](part2/pods.png)  


![alt text](part2/cpu.png)  


![alt text](part2/logsDASHBOARD.png)    


![alt text](part2/configmapoDASHBOASRD.png)  


![alt text](part2/secretdash.png)  

9. Обновить приложение (добавив новую зависимость в pom-файл), и пересобрать приложение со следующими стратегиями развертывания (замерить время переразвертывания приложения для каждого случая и отметить результаты в отчете):

* пересоздание (recreate)
* последовательное обновление (rolling)  

![alt text](part2/9.png)  

![alt text](part2/proof.png)
