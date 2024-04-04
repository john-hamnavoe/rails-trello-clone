# README

Very basic trello clone. [See here](https://rtc.hamnavoecode.com)

Makes use of new turbo morphing feature.

Problem with refresh if editor open and someone moves card will close maybe do something with ```turbo_permanent: ""```. However some problems with refresh in frames, will revisit if have time. Noticed in this [introduction](https://dev.37signals.com/a-happier-happy-path-in-turbo-with-morphing/) they have modals which maybe makes it easier. 

Uses:

* Ruby version 3.2.2

* Rails Version 7.1

* Stimulus

* Sortable js

* Tailwind

* acts_as_list

* Turbo 8 - Morhping

* Database Postgresql 

  * rails db:migrate

* No tests 

* Run:

  * Deploy Database ```rails db:create db:migrate```
  * ./bin/dev

