require! {
  react: {Component, DOM}
}

class Lists extends Component
  render: ->
    DOM.ul do
      style:
        height: \600px
        listStyleType: \none
        backgroundColor: \#fff
        padding: 0
        fontSize: \16px
        margin: 0
      @props.tabs.map (tab, i)~>
        DOM.li do
          key: "list-#{tab.id}"
          style:
            backgroundColor: if i is @props.selected-row then \#F0A97C else \#fff
          DOM.img do
            key: "list-#{tab.id}-favicon"
            src: tab.fav-icon-url
            style:
              width: \16px
              height: \16px
              marginRight: \4px
          tab.title

module.exports = Lists
