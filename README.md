# Motainai-admin-rails
I recently began developing this project to provide a back end service for https://github.com/jedharwood/TakeOutTheTrash. This project is still in it's infancy but I intend for it to; 
1) function as an admin portal for adding city/rule information to the database and verifying/implementing feedback requests from the decoupled UI, and; 
2) provide endpoints that will serve Json responses to the decoupled UI which will negate the need for Json server in that project. 

I'm part way through finishing the Add/Edit City functionality at the moment. After that I will be adding Add/Edit Rules functionality and also plan to abstract the database interactions out into repository classes which I can then mock in my tests. Once all that's in place I will add endpoints to serve Json responses to the React UI project that pairs with this one. 


