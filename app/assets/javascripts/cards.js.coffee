$ ->
  $('.comment_body, .reply_body').editable(
    onblur: 'ignore'
    inputclass: 'span9'
  )
  $('.reply_name').editable(
    onblur: 'ignore'
    inputclass: 'span4'
  )
