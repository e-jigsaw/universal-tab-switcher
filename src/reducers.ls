require! {
  redux: {combine-reducers}
  \./actions.ls
}

module.exports =
  combine-reducers do
    tabs: (state = [], action)->
      | action.type is actions.INITIALIZE => action.tabs
      | otherwise => state
    filtered-tabs: (state = [], action)->
      | action.type is actions.INITIALIZE => action.tabs
      | otherwise => state
    selected-row: (state = 0, action)->
      | action.type is actions.SELECT_UP => state - 1
      | action.type is actions.SELECT_DOWN => state + 1
      | otherwise => state
