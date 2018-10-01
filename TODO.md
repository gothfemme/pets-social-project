USER:
username
email
location
bio
password_digest

POST:
title
image
user_id

COMMENT:
title
content
user_id
post_id

VOTE:
user_id
post_id

CATEGORY:
name (dog, cat, other type of pet?)

POST_CATEGORY_REL:
post_id
category_id


- user validation
- user creation
- votes should be unique


- posts index
  - should sort by top voted from within the past 7 days

- post show
  - show the post, but big, with any comments
