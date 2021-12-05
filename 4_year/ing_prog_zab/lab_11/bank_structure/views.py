from django.shortcuts import render
from django.contrib.auth import authenticate, login, logout
from django.utils.html import DOTS
from .models import Client, Transaction, CreditCard, Question
from django.views.generic import View
from django.http import HttpResponseRedirect
from django.core.paginator import Paginator
from django.db.models.signals import post_save
from django.dispatch import receiver

from django.views.generic.edit import CreateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.views.generic import TemplateView
from django.contrib.auth.forms import AuthenticationForm
from django.views.generic.edit import FormView


class TransactionView(View):

    def get(self, request):
        items = Transaction.objects.all()
        context = {"items": items}
        return render(request, "item_list.html", context)


class LoginView(FormView):

    form_class = AuthenticationForm
    template_name = 'login.html'
    success_url = '/'

    def get_initial(self):
        if self.request.user.is_authenticated:
            logout(self.request)

    def form_valid(self, form):
        if form.is_valid():
            user = form.get_user()
            login(self.request, user)
            return HttpResponseRedirect('/')
        else:
            return HttpResponseRedirect('/login/')
