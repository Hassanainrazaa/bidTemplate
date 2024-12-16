from django.contrib import admin
from django.urls import path
from myapp.views import UsersAPI, LoginAPI
urlpatterns = [
    path("users/", UsersAPI.as_view()),
    path("login/", LoginAPI.as_view()),

    path('admin/', admin.site.urls),
]
