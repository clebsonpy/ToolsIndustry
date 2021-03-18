from django.contrib.auth import authenticate, get_user_model
from rest_framework import authentication
from rest_framework import exceptions


class CustomizeAuthentication(authentication.BaseAuthentication):

    def authenticate(self, request):

        username = request.META.get('HTTP_USERNAME', None)
        token = request.META.get('HTTP_TOKEN', None)

        if not username or not token:
            raise exceptions.AuthenticationFailed('No credentials provided.')

        credentials = {
            get_user_model().USERNAME_FIELD: username,
            'password': token
        }

        user = authenticate(**credentials)

        if user is None:
            raise exceptions.AuthenticationFailed('Invalid username/password.')

        if not user.is_active:
            raise exceptions.AuthenticationFailed('User inactive or deleted.')

        return user, None
