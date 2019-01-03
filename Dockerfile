FROM django_girls:1.1
COPY webapp/ ~/webapp
WORKDIR ~/webapp
CMD python3 manage.py runserver 0.0.0.0:$PORT
