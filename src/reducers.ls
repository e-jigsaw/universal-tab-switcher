require! {
  redux: {combine-reducers}
  \fuse.js : Fuse
  \./actions.ls
}

module.exports =
  combine-reducers do
    tabs: (state = [], action)->
      | action.type is actions.INITIALIZE => action.tabs
      | otherwise => state
    filtered-tabs: (state = [], action)->
      | action.type is actions.INITIALIZE => action.tabs
      | action.type is actions.UPDATE_FILTER =>
        new-filtered-tabs =
          new Fuse do
            action.tabs
            keys: [\title]
          .search action.text
        if new-filtered-tabs.length > 0 then new-filtered-tabs else action.tabs
      | otherwise => state
    selected-row: (state = 0, action)->
      | action.type is actions.SELECT_UP => state - 1
      | action.type is actions.SELECT_DOWN => state + 1
      | action.type is actions.UPDATE_FILTER => 0
      | otherwise => state
