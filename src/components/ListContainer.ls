require! {
  react: {Component, DOM, createElement}
  \./List.ls
}

class ListContainer extends Component
  displayName: \ListContainer
  style:
    height: \600px
    overflow: \scroll
    listStyleType: \none
    backgroundColor: \#fff
    padding: 0
    fontSize: \16px
    margin: 0

  render: ->
    DOM.ul do
      key: \ListContainer
      style: @style
      for tab in @props.tabs then createElement List, tab

module.exports = ListContainer
