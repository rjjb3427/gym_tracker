gym-tracker
-----------

An easy way to follow your diet!

Demo
-----------

Deployed on Heroku (Con cada push al remote de heroku se re-deploya):

http://gym-tracker.herokuapp.com/


Stack
-----------

Server-Side

* Ruby On Rails
* authentication with Device
* authorization using CanCan
* unit testing with Shoulda

Client

* Coffeescript
* Bootstrap


Gems interesantes para mejorar la performance
--------------------------------------------

Bullet: Avisa si encuentra alguna query N+1 o si estamos haciendo eager loading al dope. 

Newrelic_rpm: Con newrelic podemos ver que consultas estan tardando mas y así tener una idea si hace falta algun indice. 
Tambíen nos da los tiempos de render (discriminado por accion y controller)


Screenshots
-----------

 ![GymTracker](https://raw.github.com/ascoppa/gym_tracker/master/screenshots/gym-tracker1.png)
 ![GymTracker](https://raw.github.com/ascoppa/gym_tracker/master/screenshots/gym-tracker2.png)
