# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...




     elsif relationship.follower_id == user.id
        content_tag(:div, (button_to 'Accept relationship', relationship_path(relationship.id), method: :put) +
                            (button_to 'Reject relationship', relationship_path(relationship.id), method: :delete))
      else
        content_tag(:p, 'Pending Response', class: 'button-relationship status pending')
      end