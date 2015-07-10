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

  render: ->
    DOM.input do
      key: \prompt-input
      style: @style
      ref: \input

module.exports = Prompt
