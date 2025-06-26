from django.contrib import admin
from django.urls import path
from .views import TestView
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    # Cuando es una clase se utiliza .as_view() porque path requiere metodos
    path('test/', TestView.as_view()),
    path('admin/', admin.site.urls),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
