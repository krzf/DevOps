В этом проекте мы развертываем микросервисное приложение в Kubernetes, используя Minikube.
Создаем YAML-манифесты для всех компонентов системы:
ConfigMap для хранения параметров БД и сервисов.
Secrets для хранения учетных данных БД и ключей межсервисного взаимодействия.
Pods и Services для PostgreSQL, RabbitMQ и 7 микросервисов (по одной реплике).
Запускаем функциональные тесты Postman.


