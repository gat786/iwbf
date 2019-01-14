import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore


cred = credentials.Certificate('iwbf.json')
app = firebase_admin.initialize_app(cred)

db = firestore.client()

users = db.collection(u'users').document(u'lovelace')

users.set({
    u'first':u'ada',
    u'last':u'lovelace',
    u'born':1815
})