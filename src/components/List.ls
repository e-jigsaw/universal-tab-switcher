require! {
  react: {Component, DOM}
}

class List extends Component
  displayName: \List
  render: ->
    console.log @props
    DOM.li do
      key: "list-#{@props.id}"
      DOM.img do
        key: "list-#{@props.id}-favicon"
        src: @props.favIconUrl
        style:
          width: \16px
          height: \16px
          marginRight: \4px
      @props.title

module.exports = List
