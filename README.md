# g_books

g_books is a Flutter app based on the Google books API. The initial endpoint at the start of the app is https://www.googleapis.com/books/v1/volumes?q=peace. 

The query parameter 'q' is changed to the user's search term from the textfield. A debounce function is used to restrict flutter from sending a request on every key pressed.

Firebase email and gmail auth is implemented. User can add books to their 'favorites' collection on Firestore.
