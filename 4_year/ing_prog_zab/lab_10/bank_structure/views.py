from django.contrib.auth import login, logout, authenticate
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic import View
from django.views.generic.edit import CreateView, FormView

from .models import CreditCard, Transaction, Client


class TransactionView(View):
    def get(self, request):
        items = Transaction.objects.all()
        context = {"items": items}
        return render(request, "transactions_list.html", context)


class NavigationView(View):
    def get(self, request):
        context = {}
        return render(request, "main_page.html", context)


class CreditCardsView(View):
    def get(self, request):
        items = CreditCard.objects.all()
        context = {"items": items}
        return render(request, "cards_list.html", context)


class TransactionViewCreate(CreateView):
    model = Transaction
    template_name = 'new_transaction.html'
    fields = ['sender', 'receiver', 'value']

    def post(self, request, **kwargs):
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            sender = form.cleaned_data.get('sender')
            print(sender)
            # sender = Client.objects.get()
            receiver_card = form.cleaned_data.get('receiver')
            value = form.cleaned_data.get('value')
            new_transaction = Transaction(
                    sender=sender,
                    receiver=receiver_card,
                    value=value,
            )
            new_transaction.save()
        items = Transaction.objects.all()
        context = {"items": items}
        return render(request, "transactions_list.html", context)

class CreditCardViewCreate(CreateView):
    model = CreditCard
    template_name = 'new_card.html'
    fields = ['number', 'cvv2', 'owner', 'expiration_date', 'balance']


class LoginView(FormView):
    form_class = AuthenticationForm
    template_name = 'login.html'
    success_url = '/bank_structure/'
    
    def get_initial(self):
        if self.request.user.is_authenticated:
            logout(self.request)
    
    def form_valid(self, form):
        if form.is_valid():
            user = form.get_user()
            login(self.request, user)
            return HttpResponseRedirect('/bank_structure/')
        else:
            return HttpResponseRedirect('/login/')


class NewClientView(CreateView):
    
    def post(self, request, **kwargs):
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
        items = Transaction.objects.all()
        context = {"items": items}
        return render(request, "main_page.html", context)
    
    def get(self, request, **kwargs):
        form = UserCreationForm()
        return render(request, 'new_user.html', {'form': form})
