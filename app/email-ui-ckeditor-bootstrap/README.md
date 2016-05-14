
###ajax email


**usage**

from the root of this email folder
turn on a web server 
the cheapest and usually already installed one is _python_.

```
cd email-ui-ckeditor-bootstrap
python -m SimpleHTTPServer 
```

then point your browser to [http://localhost:8000](http://localhost:8000)

very simple single page application that connects to a rails backend api
and has the ability to submit an email

combining this with the rails back end demonstrates how different 
clients can connect to the same API backend

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

