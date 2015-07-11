req, sender, callback <- chrome.runtime.onMessage.addListener
chrome.tabs.query do
  {}
  (tabs)-> callback tabs
true
