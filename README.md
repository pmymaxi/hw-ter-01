## Домашнее задание к занятию «Введение в Terraform»

STDOUT terraform --version

<img width="1102" height="205" alt="1" src="https://github.com/user-attachments/assets/17739c32-0271-455c-8d14-98196cb3980a" />

## Задание 1
2. По описанью файла” .gitignor” , установлено исключение файла personal.auto.tfvars при git push.
3. Результат state-файла созданного ресурсом **random_password**: "result": "5Y8DYnFPquCCm6rk"
4. Намеренные ошибки, допущенные в фале **main.tf**:
    - resource "docker_image" имеет type но не имеет lables ("type" "name"), исправлено на "docker_image" "nginx", в коде есть обращение к данному ресурсу.
    - resource "docker_container" "1nginx" Имя должно начинаться с буквы или символа подчеркивания и может содержать только буквы, цифры, знаки подчеркивания и тире. 
      resource "docker_container" "nginx"
    - name  = "example_${random_password.random_string_FAKE.resulT}" resulT -> result, random_string_FAKE -> random_string просто такого lables нет на ресурсе
  
5. Исправленный фрагмент кода и вывод команды ```docker ps```
```tf
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.name
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 9090
  }
}
```

<img width="1129" height="145" alt="5" src="https://github.com/user-attachments/assets/08a23cc0-179e-4dd5-af47-36cf3a56cf70" />


6. auto-approve - автоматическое выполнение без предварительного подтверждение плана применения. Опасность заключается в случайном удаление, изменение инфраструктуры. Может применяться при автоматизации процесса, как пример CI/CD pipeline, автоматический deploy, удобно, но требует контроля и анализа рисков.

<img width="1102" height="140" alt="6" src="https://github.com/user-attachments/assets/dfa3baca-79be-4926-bcee-577fa93304ad" />


7. Содержимое файла **terraform.tfstate** после destroy 
```tfstate
{
  "version": 4,
  "terraform_version": "1.12.0",
  "serial": 30,
  "lineage": "7c2b92e2-a2ee-b76b-5d93-769d9ed796a1",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

8. Docker образ не был удален, так как прописан аргумент keep_locally = true, при значении true docker образ не будет удален из локального хранилища. 
keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. If this is false, it will delete the image from the docker local storage on destroy operation.

## Дополнительное задание
Репозиторий дополнительного задания размещен в каталогах hw_vm и hw_docker.

