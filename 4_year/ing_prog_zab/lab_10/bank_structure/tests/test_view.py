from django.test import TestCase

from bank_structure.models import CreditCard


class ExistItemNameTests(TestCase):
    
    def test_cards_items(self):
        response = self.client.get('/bank_structure/credit_cards/')
        items = CreditCard.objects.all()
        for resp_items, db_items in zip(response.context['items'], items):
            self.assertTrue(resp_items.name == db_items.name)
        self.assertQuerysetEqual(response.context['items'], items)
        self.assertTrue(len(response.context['items']) == len(items))
    
    def test_templates_items(self):
        response = self.client.get('/')
        self.assertEquals(response.status_code, 200)
