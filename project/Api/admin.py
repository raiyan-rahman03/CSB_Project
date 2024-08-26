from django.contrib import admin

# Register your models here.
from django.contrib import admin
from .models import *

admin.site.register(Test)
admin.site.register(TemporaryLabReport)
admin.site.register(ZoomToken)
@admin.register(Profile)
class ProfileAdmin(admin.ModelAdmin):

    search_fields = ('user__username', 'role')

@admin.register(LabReport)
class LabReportAdmin(admin.ModelAdmin):

    search_fields = ('user__username',)
    list_filter = ('report_date',)

@admin.register(LabReportImage)
class LabReportImageAdmin(admin.ModelAdmin):

    search_fields = ('lab_report__user__username',)
    list_filter = ('uploaded_at',)

@admin.register(Appointment)
class AppointmentAdmin(admin.ModelAdmin):
  
    search_fields = ('patient__username', 'doctor__username')
    list_filter = ('appointment_date', 'status')
