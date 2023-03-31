#!/bin/bash
sleep 7
python manage.py collectstatic --no-input
python manage.py makemigrations
python manage.py migrate

if [ -z "$(python manage.py shell -c 'from accounts.models import User; print(User.objects.filter(username="'"$DJANGO_SUPERUSER_USERNAME"'").exists())')" ]; then
    echo "Creating superuser..."
    python manage.py createsuperuser --noinput --username=$DJANGO_SUPERUSER_USERNAME --email=$DJANGO_SUPERUSER_EMAIL --name=$DJANGO_SUPERUSER_NAME
    echo "Superuser created."
    else
        echo "Superuser already exists."
fi
gunicorn lpn.wsgi:application -b 0.0.0.0:8000