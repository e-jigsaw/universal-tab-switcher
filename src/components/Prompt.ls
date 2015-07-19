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

  onKeyDown: (event)~>
    @props.onChange do
      keyCode: event.keyCode
      value: @refs.input.getDOMNode!.value

  render: ->
    DOM.input do
      key: \prompt-input
      type: \text
      style: @style
      onKeyDown: @onKeyDown
      ref: \input

module.exports = Prompt
