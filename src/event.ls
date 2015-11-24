req, sender, callback <- chrome.runtime.on-message.add-listener

if req.cmd is \get
  chrome.tabs.query do
    {}
    (tabs)-> callback tabs

if req.cmd is \set
  window <- chrome.windows.update do
    req.tab.window-id
    focused: true
  chrome.tabs.update do
    req.tab.id
    active: true

true
