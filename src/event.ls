req, sender, callback <- chrome.runtime.onMessage.addListener

console.log req, sender

callback \hello
