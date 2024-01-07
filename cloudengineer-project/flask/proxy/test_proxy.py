import unittest
from requests import get
from proxy import app

class TestApp(unittest.TestCase):

    def setUp(self):
        # Create a test client
        self.app = app.test_client()
        self.app.testing = True

    def test_health_check(self):
            response = self.app.get('/test')
            self.assertEqual(response.status_code, 200)
            self.assertEqual(response.data.decode('utf-8'), 'it works')

    def test_vulnerability_proxy(self):
            response = self.app.get('/vulns')
            self.assertEqual(response.status_code, 302)  # Redirect status code
            self.assertEqual(response.location, 'http://localhost:8001/results')

    #def test_evil_proxy(self):
    #        response = self.app.get('/evil')
    #        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
