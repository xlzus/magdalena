# RUN PROJECT
```
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
mkdocs serve
```

# Build and pusblish to github pages

- Commit changes to github
`mkdocs gh-deploy`
- above commando will create the site folder with all static files
- commit again to github to let pages get latest changes.

