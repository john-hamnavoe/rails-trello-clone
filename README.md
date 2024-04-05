# README

## Introduction

Very basic trello clone. [See here](https://rtc.hamnavoecode.com)

Makes use of new turbo morphing feature. 

The hardest part so far is trying to not refresh the editor open on a second browser. This [demo](https://github.com/basecamp/turbo-8-morphing-demo/tree/page-refreshes) project from 37 signals shows the problem if you have two browsers open and in browser one you have some text in Add Task input box but have not saved, adding a task in browser two will cause refresh and loss of data from the input box.

So far the best I have come up with is that when adding/editing tasks and lists a modal will pop up, it has ```data-turbo-permanent: ""``` so will not get refreshed by the broadcast refresh. The modal is closed when the form is submitted by checking the ```turbo:submit-end``` event I need to check for success and also redirection as the way I have implemented modals means this event fires when a new event occurs. I think overall this gives a better user experience, retaining the broadcast refreshes but not losing work on the browser that is refreshed. 

## Technology

* Ruby version 3.2.2

* Rails Version 7.1

* Stimulus

* Sortable js

* Tailwind

* acts_as_list

* view_component

* Turbo 8 - Morphing

* Database Postgresql 

  * rails db:migrate

* No tests 

* Run:

  * Deploy Database ```rails db:create db:migrate```
  * ./bin/dev

## Quick Walk Through of Implementation

### Create Rails App

```rails new APP_NAME --database postgresql --javascript esbuild --css tailwind```

#### Gems
```bundle add acts_as_list```
```bundle add view_component```

#### Yarn 
```yarn add sortablejs```
```yarn add @rails/request.js```
```yarn add @tailwindcss/aspect-ratio```
```yarn add @tailwindcss/forms```
```yarn add @tailwindcss/line-clamp```
```yarn add @tailwindcss/typography```

...tbc...

