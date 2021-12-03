from django.contrib import admin

from bank_structure.models import Client, Question, Transaction, CreditCard, Admin


@admin.register(Client)
class ClientAdmin(admin.ModelAdmin):
    list_display = ['user']


@admin.register(Admin)
class AdminAdmin(admin.ModelAdmin):
    list_display = ['user']


@admin.register(CreditCard)
class CreditCardAdmin(admin.ModelAdmin):
    list_display = ['number', 'cvv2', 'balance', 'expiration_date', 'owner']


@admin.register(Transaction)
class TransactionAdmin(admin.ModelAdmin):
    list_display = ['sender', 'receiver', 'value', 'status', 'date']


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = ['question', 'answer', 'state', 'author', 'receiver', 'date']
