require! {
  react: {render, createElement}
  \./components/TabSwitcher.ls
}

tabs <- chrome.runtime.sendMessage cmd: \get
render do
  createElement TabSwitcher, tabs: tabs
  document.getElementById \universal-tab-switcher
