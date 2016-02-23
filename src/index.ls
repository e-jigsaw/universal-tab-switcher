require! {
  react: {create-element}
  redux: {create-store, apply-middleware}
  \react-redux : {Provider}
  \react-dom : {render}
  \redux-thunk : thunk-middleware
  \./containers/tab-switcher.ls : TabSwitcher
  \./reducers.ls
}

render do
  create-element do
    Provider
    store: apply-middleware(thunk-middleware)(create-store)(reducers)
    create-element TabSwitcher
  document.get-element-by-id \universal-tab-switcher
