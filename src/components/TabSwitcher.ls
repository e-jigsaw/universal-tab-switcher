require! {
  react: {Component, DOM, create-element}
  \../containers/prompt.ls : Prompt
  \../containers/lists.ls : Lists
}

class TabSwitcher extends Component
  component-will-mount: ->
    @props.initialize!

  render: ->
    DOM.div do
      style:
        width: \100%
      DOM.div do
        style:
          margin: '0 auto'
        create-element Prompt
      DOM.div do
        style:
          margin: '0 auto'
        create-element Lists

module.exports = TabSwitcher
