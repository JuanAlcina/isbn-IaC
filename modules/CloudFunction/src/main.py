import functions_framework

from google.cloud import firestore

db = firestore.Client(project="masteris1", database="isbn-account-db")

@functions_framework.http
def accounts_api(request):

    if request.method == 'POST':
        data = request.get_json()
        doc = db.collection("accounts").document(data['id'])
        doc.set(data['details'])

    return 'Account with id={} created!'.format(data['id']), 201