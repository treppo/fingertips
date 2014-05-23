Scout =
  search: ({provider, mapper, term}) ->
    provider
      .search term
      .then mapper.map

`export default Scout`
