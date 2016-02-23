require! {
  \react-redux : {connect}
  \../components/TabSwitcher.ls
  \../actions.ls : {initialize}
}

map-state-to-props = (state)-> {}
map-dispatch-to-props = (dispatch)->
  initialize: -> dispatch initialize!

module.exports = connect(map-state-to-props, map-dispatch-to-props)(TabSwitcher)
