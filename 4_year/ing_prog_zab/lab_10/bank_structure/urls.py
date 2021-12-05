from django.contrib import admin
from django.urls import path

from bank_structure.views import LoginView, TransactionView, TransactionViewCreate, NewClientView, CreditCardsView, \
    CreditCardViewCreate, NavigationView

urlpatterns = [
    path('admin/', admin.site.urls),
    
    path('', NavigationView.as_view(), name='main_page'),
    path('login/', LoginView.as_view(), name='login'),
    path('login/new/', NewClientView.as_view(), name='new_user'),
    path('credit_cards/', CreditCardsView.as_view(), name='cards_list'),
    path('credit_cards/new/', CreditCardViewCreate.as_view(), name='new_card'),
    path('transaction/', TransactionView.as_view(), name='transactions_list'),
    path('transaction/new/', TransactionViewCreate.as_view(), name='new_transaction'),
]
