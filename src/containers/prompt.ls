require! {
  \react-redux : {connect}
  \../components/Prompt.ls
  \../actions.ls : {on-change-handler, on-key-down-handler}
}

map-state-to-props = (state)-> {}
map-dispatch-to-props = (dispatch)->
  on-change: (event)-> dispatch on-change-handler event
  on-key-down: (event)-> dispatch on-key-down-handler event

module.exports = connect(map-state-to-props, map-dispatch-to-props)(Prompt)
