require! {
  react: {Component, DOM, create-element}
  \react-redux : {connect}
  \fuse.js : Fuse
  \../actions.ls : {initialize, key-down-handler}
  \./Prompt.ls
  \./Lists.ls
}

class TabSwitcher extends Component
  component-will-mount: ->
    @props.dispatch initialize!

  render: ->
    DOM.div do
      style:
        width: \100%
      DOM.div do
        style:
          margin: '0 auto'
        create-element do
          Prompt
          on-key-down: (event)~> @props.dispatch key-down-handler event
      DOM.div do
        style:
          margin: '0 auto'
        create-element do
          Lists
          tabs: @props.filtered-tabs
          selected-row: @props.selected-row

module.exports =
  connect do
    (state)-> state
  <| TabSwitcher
