require! {
  react: {Component, DOM, findDOMNode}
}

class Prompt extends Component
  displayName: \Prompt
  style:
    margin: '0 auto'
    width: \100%
    fontSize: \32px

  componentDidMount: ->
    findDOMNode @refs.input .focus!

  change: (event)->
    console.log event

  render: ->
    DOM.input do
      key: \prompt-input
      type: \text
      style: @style
      onKeyUp: @change
      ref: \input

module.exports = Prompt
