import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore
import extractor


cred = credentials.Certificate('iwbf.json')
app = firebase_admin.initialize_app(cred)

db = firestore.client()

users = db.collection(u'schedules').document(u'easy')

print(users.get('day1').to_dict())