require! {
  react: {Component, DOM, createElement}
  \./Prompt.ls
}

class TabSwitcher extends Component
  displayName: \TabSwitcher
  style:
    parent:
      position: \fixed
      width: \100%
      top: \10px
    child:
      width: \60%
      margin: '0 auto'
  render: ->
    DOM.div do
      key: \TabSwitcherParent
      style: @style.parent
      DOM.div do
        key: \TabSwitcherChild
        style: @style.child
        createElement Prompt

module.exports = TabSwitcher
