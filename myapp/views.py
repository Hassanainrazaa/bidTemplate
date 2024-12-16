from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import Users

# myapp/views.py

from .serializers import UserSerializer, LoginSerializer  # Correct import for the serializer
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token




class UsersAPI(APIView):
    def get(self, request):
        queryset = Users.objects.all()
        serializer = UserSerializer(queryset, many=True)
        return Response({
            "status": True,  # Change "true" to True
            "data": serializer.data  # Wrap 'data' in quotes
        })

class LoginAPI(APIView):
    def post(self, request):
        data = request.data
        serializer = LoginSerializer(data=data)
        if not serializer.is_valid():
            return Response({"status" :False, "data": serializer.errors})

        username = serializer.data["username"]
        password = serializer.data["password"]

        user_information = authenticate(username = username, password = password)
        if user_information:
            token, _ = Token.objects.get_or_create(user=user_information)
            print(token)
            return Response({
                "status": True,  # Change "true" to True
                "data": {"token": str(token)}  # Wrap 'data' in quotes
            })
        print(username, password)
        return Response({
            "status": False,  # Change "true" to True
            "data": () # Wrap 'data' in quotes
        })

