#!/bin/bash

scp /home/gitlab-runner/builds/MLKTKBGA/0/students/DO6_CICD.ID_356283/gayespel_student.21_school.ru/DO6_CICD-1/src/cat/s21_cat two@10.10.0.2:/usr/local/bin/
scp /home/gitlab-runner/builds/MLKTKBGA/0/students/DO6_CICD.ID_356283/gayespel_student.21_school.ru/DO6_CICD-1/src/grep/s21_grep two@10.10.0.2:/usr/local/bin/
ssh two@10.10.0.2 ls -lah /usr/local/bin


