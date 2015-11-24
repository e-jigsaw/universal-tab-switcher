action-types =
  <[
    INITIALIZE
    SEARCH_BY_WORDS
  ]>

action-types.map (type)-> exports[type] = type
refs =
  action-types.reduce do
    (prev, current)->
      prev[current] = current
      prev
    {}

exports.initialize = -> (dispatch, get-state)->
  tabs <- chrome.runtime.send-message cmd: \get
  dispatch do
    type: refs.INITIALIZE
    tabs: tabs

exports.search-by-words = (text)->
  type: refs.SEARCH_BY_WORDS
  text: text

exports.select-up = select-up = ->
  type: refs.SELECT_UP

exports.select-down = select-down = ->
  type: refs.SELECT_DOWN

exports.select = select = -> (dispatch, get-state)->
  {filtered-tabs, selected-row} = get-state!
  console.log \select
  # chrome.runtime.sendMessage do
  #   cmd: \set
  #   tab: filtered-tabs[selected-row]

exports.update-filter = update-filter = -> ->
  console.log \update
  # filteredTabs = new Fuse do
  #   @props.tabs
  #   keys: [\title]
  # .search value
  # @setState do
  #   filteredTabs: if filteredTabs.length is 0 then @props.tabs else filteredTabs
  #   selectedRow: 0

exports.key-down-handler = (event, dispatch, get-state)-->
  {key-code} = event
  {selected-row, filtered-tabs} = get-state!
  console.log selected-row, filtered-tabs
  switch
  | key-code is 38 and selected-row > 0 =>
    dispatch select-up!
  | key-code is 40 and selected-row < filtered-tabs.length - 1 =>
    dispatch select-down!
  | key-code is 13 =>
    dispatch select!
  | otherwise =>
    dispatch update-filter event
