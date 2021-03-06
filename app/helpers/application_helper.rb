module ApplicationHelper
  ALERTS = { alert: "danger", notice: "primary" }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author:, repo:)
    link_to t("helpers.application_helper.repo"), "https://github.com/#{author}/#{repo}", target: "_blank"
  end

  def show_flash(type)
    tag.p(flash[type], class: "flash #{type}") if flash[type]
  end

  def alert_type(key)
    ALERTS[key.to_sym]
  end
end
