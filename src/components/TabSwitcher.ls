require! {
  react: {Component, DOM, createElement}
  \fuse.js : Fuse
  \./Prompt.ls
  \./ListContainer.ls
}

class TabSwitcher extends Component
  (props)->
    @state =
      selectedRow: 0
      filteredTabs: props.tabs

  displayName: \TabSwitcher
  style:
    parent:
      width: \100%
    child:
      margin: '0 auto'

  onChange: ({keyCode, value})~>
    switch
      when keyCode is 38 and @state.selectedRow > 0
        @setState do
          selectedRow: @state.selectedRow - 1
      when keyCode is 40 and @state.selectedRow < @state.filteredTabs.length - 1
        @setState do
          selectedRow: @state.selectedRow + 1
      when keyCode is 13
        chrome.runtime.sendMessage do
          cmd: \set
          tab: @state.filteredTabs[@state.selectedRow]
      else
        filteredTabs = new Fuse do
          @props.tabs
          keys: [\title]
        .search value
        @setState do
          filteredTabs: if filteredTabs.length is 0 then @props.tabs else filteredTabs
          selectedRow: 0

  render: ->
    DOM.div do
      key: \TabSwitcherParent
      style: @style.parent
      DOM.div do
        key: \PromptContainer
        style: @style.child
        createElement do
          Prompt
          onChange: @onChange
      DOM.div do
        key: \ListContainerParent
        style: @style.child
        createElement do
          ListContainer
          tabs: @state.filteredTabs
          selectedRow: @state.selectedRow

module.exports = TabSwitcher
