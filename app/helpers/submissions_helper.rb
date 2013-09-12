module SubmissionsHelper
  def verdict_tag(status)
    tag_class = case status
      when 'ac'
        'alert-success'
      when 'wa'
        'alert-danger'
      when 'waiting'
        ''
      else
        'alert-warning'
      end
    content_tag(:td, status.upcase, class: tag_class)
  end
end
