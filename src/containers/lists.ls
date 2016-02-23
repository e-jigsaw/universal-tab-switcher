require! {
  \react-redux : {connect}
  \../components/Lists.ls
}

map-state-to-props = (state)->
  tabs: state.filtered-tabs
  selected-row: state.selected-row
map-dispatch-to-props = (dispatch)-> {}

module.exports = connect(map-state-to-props, map-dispatch-to-props)(Lists)
