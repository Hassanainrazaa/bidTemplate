# myapp/serializers.py

from rest_framework import serializers
from .models import Users  # Ensure Users model is correctly imported

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = Users
        fields = '__all__'  # Or specify the fields you need: ['id', 'name', 'email', etc.]


class LoginSerializer(serializers.Serializer):

    username = serializers.CharField()
    password = serializers.CharField()


