require! {
  react: {Component, DOM}
  \react-dom : {findDOMNode}
}

class Prompt extends Component
  componentDidMount: ->
    findDOMNode @refs.input .focus!

  render: ->
    DOM.input do
      key: \prompt-input
      type: \text
      style:
        margin: '0 auto'
        width: \100%
        fontSize: \32px
      on-change: @props.on-change
      on-key-down: @props.on-key-down
      ref: \input

module.exports = Prompt
