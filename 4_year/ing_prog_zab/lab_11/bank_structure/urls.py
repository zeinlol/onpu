from os import name
from django.contrib import admin
from django.urls import path
from django.conf import settings
from django.conf.urls.static import static

from bank_structure.views import LoginView, TransactionView

urlpatterns = [
    path('admin/', admin.site.urls),

    path(r'^$', TransactionView.as_view(), name='item_list'),
    path('login/', LoginView.as_view(), name='login'),
    path('transaction/', TransactionView.as_view(), name='sales_list'),
    # path('history/', HistoryPriceView.as_view(), name='history_price'),
    #
    # path('transaction/new/', BuyViewCreate.as_view(), name='sale_new'),
]

if settings.DEBUG:
    urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
