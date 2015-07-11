require! {
  react: {Component, DOM, createElement}
  \./Prompt.ls
  \./ListContainer.ls
}

class TabSwitcher extends Component
  displayName: \TabSwitcher
  style:
    parent:
      position: \fixed
      width: \100%
      top: \10px
      zIndex: 99999999
    child:
      width: \60%
      margin: '0 auto'

  render: ->
    DOM.div do
      key: \TabSwitcherParent
      style: @style.parent
      DOM.div do
        key: \PromptContainer
        style: @style.child
        createElement Prompt
      DOM.div do
        key: \ListContainerParent
        style: @style.child
        createElement ListContainer, tabs: @props.tabs

module.exports = TabSwitcher
