require! {
  react: {Component, DOM, createElement}
  \./List.ls
}

class ListContainer extends Component
  displayName: \ListContainer
  style:
    height: \600px
    listStyleType: \none
    backgroundColor: \#fff
    padding: 0
    fontSize: \16px
    margin: 0

  render: ->
    DOM.ul do
      key: \ListContainer
      style: @style
      for tab, i in @props.tabs
        createElement do
          List
          tab: tab
          isSelected: i is @props.selectedRow

module.exports = ListContainer
