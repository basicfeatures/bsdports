module ApplicationHelper
  include Pagy::Frontend

  require "rinku"

  def timeago(date, format: :short)
    return if date.blank?

    content = I18n.l(date, format: format)
    tag.time(content, title: content, data: { controller: "timeago", timeago_datetime_value: date.iso8601 })
  end

  # SEO: Page titles and meta descriptions

  # https://developers.google.com/search/docs/advanced/appearance/title-link
  # https://stackoverflow.com/questions/3059704/rails-3-ideal-way-to-set-title-of-pages

  def page_title(title)
    content_for :page_title, title.to_s
  end

  def meta_description(body)
    content_for :meta_description, truncate(body.to_s, length: 148)
  end
end

