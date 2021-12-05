from django.test import TestCase
from django.test.client import Client
from django.contrib.auth.models import User


class StatusCodeTests(TestCase):
    
    def test_main_url(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)
    
    def test_create_new_client_url(self):
        response = self.client.get('/bank_structure/login/new/')
        self.assertEqual(response.status_code, 200)
    
    def test_login_url(self):
        response = self.client.get('/bank_structure/login/')
        self.assertEqual(response.status_code, 200)
    
    def test_new_transaction_url(self):
        response = self.client.get('/bank_structure/transaction/new/')
        self.assertEquals(response.status_code, 200)
        self.user = User.objects.create_user('admin', 'admin@tes.com', 'admin')
        self.client.login(username='admin', password='admin')
        response = self.client.get('/bank_structure/transaction/new/')
        self.assertEquals(response.status_code, 200)
    
    def test_new_card_url(self):
        response = self.client.get('/bank_structure/credit_cards/new/')
        self.assertEquals(response.status_code, 200)
        self.user = User.objects.create_user('admin', 'admin@tes.com', 'admin')
        self.client.login(username='admin', password='admin')
        response = self.client.get('/bank_structure/credit_cards/new/')
        self.assertEquals(response.status_code, 200)
    
    def test_add_new_user(self):
        c = Client()
        response = c.post('/admin/bank_stucture/client/add/', {
            'username': 'test',
            'password': 'admin123',
            'password_confirmation': 'admin123',
        }, follow=True)
        self.assertEqual(response.status_code, 200)
