require! {
  react: {render, createElement}
  \./components/TabSwitcher.ls
}

createDiv = -> document.createElement \div

event <- document.addEventListener do
  \keyup

if event.ctrlKey and event.keyCode is 84
  console.log chrome.runtime
  host = document.getElementById \universal-tab-switcher
  if host is null
    host = document.body.appendChild createDiv!
  shadowRoot = if host.shadowRoot? then host.shadowRoot else host.createShadowRoot!
  container = shadowRoot.appendChild createDiv!
  render do
    createElement TabSwitcher
    container
