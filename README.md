# Library

In this library you could be able to set aside any book that you want.
First at all, you need to be registered before to any action.

How this Library going to store a lot of book, it has a pagination,
each page display 5 books.

There are some Categories that the Admin going to create,
in this section you can be able to check what the category is about.


## Admin section

In this section, the admin gonna be able to CRUD books, and also for categories.
And also could change the status of the book to Available/Not Available with a simple click in the section that correspond.

* Before to store a book on the DB, the admin must to have at least one Category.
* if there aren't any book a text going to be displayed.
* If there are one book at least, the info gonna be shown in a table.


## Admin User for testing

The user with Admin privileges is:

* User: admin@maniak.com.mx
* Password: admin123

## Conditions

* Book
  * Name, author: Valid values without numbers

* Category
  * Name, author: Valid values without numbers

* Users
  * Name, Last Name: Valid values without numbers
  * Email: Valid email

> Even the letter "ñ" is not allowed

## Host

* The Library is hosted in AWS (EC2)
* Use postgres


#Specifications

* Ubuntu 16.04
* ruby 2.3.0
* rails 5.0.2
