# github-repo-buttons

A lightweight library for embeddable GitHub star/watch/fork buttons.

[Demo.](https://refi64.com/github-repo-buttons)

## Downloading

```
# Using npm:
$ npm install --save github-repo-buttons
# Using yarn:
$ yarn add github-repo-buttons
```

## Usage

```html
<!-- Simple button: the this will display the stars -->
<div class="github-repo-button" repo="myuser/myrepo" stars></div>
<!-- and the watchers -->
<div class="github-repo-button" repo="myuser/myrepo" watchers></div>
<!-- and the forks -->
<div class="github-repo-button" repo="myuser/myrepo" forks></div>

<!-- By default the stars/watchers/forks icons are used just like on GitHub. If you want to
     use the GitHub logo instead like on the website, add the generic-icon attribute: -->
<div class="github-repo-button" repo="myuser/myrepo" stars generic-icon></div>

<!-- Instead of the class="github-repo-button" syntax you can also use a tag: -->
<github-repo-button repo="myuser/myrepo" stars></github-repo-button>
<!-- or an attribute -->
<div github-repo-button repo="myuser/myrepo" stars></div>

<!-- If you want to request the stars/watchers/forks from GitHub over HTTP instead of HTTPS,
     use the insecure-http attribute: -->
<div class="github-repo-button" repo="myuser/myrepo" stars insecure-http></div>
```
