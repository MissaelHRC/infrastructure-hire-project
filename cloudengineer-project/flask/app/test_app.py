import unittest
from app import app

class TestApp(unittest.TestCase):

    def setUp(self):
        # Create a test client
        self.app = app.test_client()
        self.app.testing = True

    def test_process_and_return_results(self):
        response = self.app.get('/results')
        data = response.get_json()
        print(data)
        # Assuming your processing logic returns expected results
        self.assertEqual(response.status_code, 200)

if __name__ == '__main__':
    unittest.main()
