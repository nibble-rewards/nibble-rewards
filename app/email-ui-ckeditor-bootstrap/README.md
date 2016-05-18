###ajax email

#flow 
ui -> ajax -> rails api -> send-in blue api -> to: email address


__test online here__
[http://dragonmail.dragonwrench.com/](http://dragonwmail.dragonwrench.com)
_user_:test@nibble.rewards
_password_:l0y@lcu$t0m3r

very simple single page application that connects to a rails backend api
and has the ability to submit an email

combining this with the rails back end demonstrates how different 
clients can connect to the same API backend

**usage**

from the root of this email folder
turn on a web server 
the cheapest and usually already installed one is _python_.

```
cd email-ui-ckeditor-bootstrap
python -m SimpleHTTPServer 
```

then point your browser to [http://localhost:8000](http://localhost:8000)

**screen shots**

![login](http://upload.dragonwrench.com/uploads/Screen%20Shot%202016-05-14%20at%2012.03.36%20AM.png)
![compose](http://upload.dragonwrench.com/uploads/Screen%20Shot%202016-05-13%20at%2011.49.46%20PM.png)

- [X]  login using api.js
- [X] invalid login
- [X] email can be submitted from anyone to anyone
- [ ] templates split out
- [ ] session restored if refresh is hit
- [ ] logout link


```
.
├── css
│   └── email.css
├── index.html
├── js
│   ├── api.js
│   ├── email.js
│   └── util.js
├── templates
├── tmp
└── vendor
    ├── bootstrap
    │   └── css
    ├── ckeditor
    │   └── ckeditor.js
    └── jquery
        └── js
```


