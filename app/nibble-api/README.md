### dependencies

ruby > 2.2.x
postgres

I may move this to rails 5 as we can take advantage of some of those
new features like action cable ... i.e instead of ajax we can use a websocket

for that _redis_ will become a dependency which 
will probably we necessary for large volume type UX
essentially it helps with QUEUE-ing background processing

it also has a PUBSUB connection for sockets and server side events


### installation
1. bundle 

```
cd app/nibble-api 
bundle 
```

2. create a .env file

```
 #at rails root 
 cat .env.example >> .env 
```

vist https://app-smtp.sendinblue.com/ to setup a free account allowing 300 emails per day 


3. create a seed file or add a user or users to the system

 #from rails root

``` 
  cat db/seeds.rb.example > db/seeds.rb
```
edit the seeds.rb to any username password to your liking ... if there's more than one by all means

4. finally setup db

```
rake db:setup
```

5. test a email by pasting the following within an irb console:

```ruby
  email = {
    :from => Faker::Internet.email,                                               
    :to => 'target@gmail.com',                       #can be a CSV or emails
    :subject => 'this a test',                                                    
    :body => "Don't forget to get some dish soap"                                 
    :bcc => '',                                                                   
    :cc => '',                                                                    
  }
  Reminder.reminder_email(email).deliver_now
```

you can trouble shoot through the send in blue console ... this essentially ensures that we have most of the rails part setup
the next is to cherry pick in the square up POS ... or focus strictly on rewards XP

token based authentication:
follow similar approach when generating curl.bash from curl.bash.example by editing the following lines:
export USER='USER_FROM_SEED_FILE'
export PASS='PASSWORD_FROM_SEED_FILE_OR_added_user'

to match a user from seeds or a manually (ux or console ) added user

```curl
time curl -s -H "Accept: application/json"  \
             -H "Content-Type: application/json"  \
             -H "x-auth-token: $token"  \
             -X POST $host/api/email  \
             -d "{\"from\":\"no_reply%40195ccfa3063df0dfd5dc177cc68b42bf.com\",\"to\":\"$to\",\"cc\":\"\",\"bcc\":\"\",\"subject\":\"testing cURL transaction\",\"body\":\"this is a test\"}" | python -mjson.tool
```


I'll send a link to a private repo to demonstrate it's use (_work in progress_)

