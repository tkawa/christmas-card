# coding: utf-8
module DestinationDecorator
  def status_label
    content_tag :span, (card.try(:status) || 'none').humanize, class: 'label'
  end
end
