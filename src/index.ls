require! {
  react: {render, createElement}
  \./components/TabSwitcher.ls
}

createDiv = -> document.createElement \div

tabs <- chrome.runtime.sendMessage {}
container = document.getElementById \universal-tab-switcher
if container is null
  container = document.body.appendChild createDiv!
render do
  createElement TabSwitcher, tabs: tabs
  container
