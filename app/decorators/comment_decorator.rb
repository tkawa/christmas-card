# coding: utf-8
module CommentDecorator
  def body_html
    sanitize(body).gsub(/\r\n|\r|\n/, "<br>").html_safe
  end
end
