$ ->
  $('.comment_body').editable(
    onblur: 'ignore'
    send: 'always'
    inputclass: 'span9'
    params: (standard) ->
      obj = {}
      data = {}
      obj[@options.name] = standard.value
      data[@options.resource] = obj
      data.name = data.value = data.pk = null
      data
    ajaxOptions: {
      type: 'PUT'
    }
  )
