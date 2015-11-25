action-types =
  <[
    INITIALIZE
    SEARCH_BY_WORDS
    SELECT_UP
    SELECT_DOWN
    UPDATE_FILTER
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
  chrome.runtime.sendMessage do
    cmd: \set
    tab: filtered-tabs[selected-row]

exports.update-filter = update-filter = (text, dispatch, get-state)-->
  dispatch do
    type: refs.UPDATE_FILTER
    text: text
    tabs: get-state!.tabs

exports.on-change-handler = (event, dispatch, get-state)-->
  dispatch update-filter event.target.value

exports.on-key-down-handler = (event, dispatch, get-state)-->
  {key-code} = event
  {selected-row, filtered-tabs} = get-state!
  switch
  | key-code is 38 and selected-row > 0 =>
    dispatch select-up!
  | key-code is 40 and selected-row < filtered-tabs.length - 1 =>
    dispatch select-down!
  | key-code is 13 =>
    dispatch select!
