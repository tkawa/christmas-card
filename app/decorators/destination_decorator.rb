# coding: utf-8
module DestinationDecorator
  def status_label
    status = card.try(:status) || 'none'
    content_tag :span, status.humanize, class: ['label', status]
  end
end
