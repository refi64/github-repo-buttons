require './github-repo-buttons.scss'

icons =
  stargazers: require '../node_modules/octicons/build/svg/star.svg'
  watchers: require '../node_modules/octicons/build/svg/eye.svg'
  forks: require '../node_modules/octicons/build/svg/repo-forked.svg'
  generic: require '../node_modules/octicons/build/svg/mark-github.svg'


throw new Error 'the fetch api is required!' if !fetch?


cache = {}


window.ghButtonInstall = (el) ->
  repo = el.getAttribute 'repo'
  scheme = if el.hasAttribute 'insecure-http'
    'http'
  else
    'https'

  [what, text] = if el.hasAttribute 'stars'
    ['stargazers', 'Star']
  else if el.hasAttribute 'watchers'
    ['watchers', 'Watch']
  else if el.hasAttribute 'forks'
    ['forks', 'Fork']
  else
    throw new Error 'github-repo-button element needs either stars, watchers, or forks'

  icon = icons[if el.hasAttribute('generic-icon') then 'generic' else what]

  count = if cache[repo]? then cache[repo][what]

  el.innerHTML = """
    <a class="gh-button-inside" href="https://github.com/#{repo}" target="_blank">
      <div class="gh-button-svg">#{icon}</div>
      #{text}
    </a>
    <a class="gh-button-count" href="https://github.com/#{repo}/#{what}" target="_blank">
      #{count ? '?'}
    </a>
  """

  svg = el.getElementsByClassName('gh-button-svg')[0].children[0]
  svg.setAttribute 'height', '16'
  svg.setAttribute 'width', '14'

  if !count?
    countEl = el.getElementsByClassName('gh-button-count')[0]

    fetch("#{scheme}://api.github.com/repos/#{repo}")
      .then (response) ->
        if !response.ok
          throw new Error "loading #{repo} #{what} failed"
        else
          response.json()
      .then (json) ->
        cache[repo] = {}

        cache[repo].stargazers = json.stargazers_count
        cache[repo].watchers = json.watchers_count
        cache[repo].forks = json.forks_count
        countEl.innerHTML = cache[repo][what]


SEL = 'github-repo-button, .github-repo-button, [github-repo-button]'

setup = ->
  for el in document.querySelectorAll SEL
    ghButtonInstall el

document.addEventListener 'DOMContentLoaded', setup
document.addEventListener 'WebComponentsLoaded', setup
