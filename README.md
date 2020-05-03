
Airflow Docker Container with Python 2.7 and Python 3.6

Dockerfiles contain the working Airflow 1.10.10 with  Python 2.7 and Python 3.6. you can choose the Bundle version respectively.

1. Centos 7 
2. Python 2.7 &  Python 3.6 you can choose by your own folder. 
3. airflow-python-xx contain

4.ensure the folder is available on your environment local_host 
5. ensure permission 777.

[root@Ezhil_Host_Machine Docker_Worker_Home]# ll /docker-airflow
total 0
drwxrwxrwx 2 root root 32 May  3 17:03 dags
drwxrwxrwx 5 root root 64 May  3 18:32 logs
drwxrwxrwx 3 root root 18 May  3 18:51 mariadb_data

[root@Ezhil_Host_Machine Docker_Worker_Home]# ll /docker-airflow_3.7/
total 0
drwxrwxrwx 2 root root  6 May  3 20:24 dags
drwxrwxrwx 2 root root  6 May  3 20:24 logs
drwxrwxrwx 3 root root 18 May  3 20:32 mariadb_data



# DockerFiles


Flower URL
http://x.x.x.x:5555/


Airflow Web URL
http://x.x.x.x:8080/

