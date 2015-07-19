require! {
  react: {Component, DOM}
}

class List extends Component
  displayName: \List
  render: ->
    DOM.li do
      key: "list-#{@props.tab.id}"
      style:
        backgroundColor: if @props.isSelected then \#F0A97C else \#fff
      DOM.img do
        key: "list-#{@props.tab.id}-favicon"
        src: @props.tab.favIconUrl
        style:
          width: \16px
          height: \16px
          marginRight: \4px
      @props.tab.title

module.exports = List
