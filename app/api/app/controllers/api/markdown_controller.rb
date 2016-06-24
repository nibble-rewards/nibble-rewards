class Api::MarkdownController < ApplicationController
  def convert
    renderer = Redcarpet::Render::HTML.new(no_links: false, hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, tables: true, superscript: true)
    render :json => { markup: markdown.render(params[:source]) }
  end
end
