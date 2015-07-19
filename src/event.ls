req, sender, callback <- chrome.runtime.onMessage.addListener
if req.cmd is \get
  chrome.tabs.query do
    {}
    (tabs)-> callback tabs
if req.cmd is \set
  window <- chrome.windows.update do
    req.tab.windowId
    focused: true
  chrome.tabs.update do
    req.tab.id
    active: true
true
