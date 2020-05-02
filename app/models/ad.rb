# frozen_string_literal: true

class Ad < ApplicationRecord
  # Constants
  QTT_PER_PAGE = 6

  # RatyRate gem
  ratyrate_rateable 'quality'

  # Callbacks
  before_save :md_to_html

  # Associations
  belongs_to :member
  belongs_to :category, counter_cache: true
  has_many :comments, dependent: :destroy

  # Validates
  validates :title, :description_md, :description_short, :category, presence: true
  validates :picture, :finish_date, presence: true
  validates :price, numericality: { greater_than: 0 }

  # Scopes
  scope :descending_order, lambda { |page|
    order(created_at: :desc).page(page).per(QTT_PER_PAGE)
  }

  scope :to_the, ->(member) { where(member: member) }
  scope :by_category, ->(id, page) { where(category: id).page(page).per(QTT_PER_PAGE) }

  scope :random, ->(quantity) { limit(quantity).order('RANDOM()') }

  scope :search, lambda { |term, page|
    where('lower(title) LIKE ?', "%#{term.downcase}%").page(page).per(QTT_PER_PAGE)
  }

  # paperclip
  has_attached_file :picture,
                    styles: { large: '800x300#', medium: '320x150#', thumb: '100x100>' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :picture, content_type: %r{\Aimage/.*\z}

  # gem money-rails
  monetize :price_cents

  def second
    self[1]
  end

  def third
    self[2]
  end

  private

  def md_to_html
    renderer = Redcarpet::Render::HTML.new(options_md_to_html)
    markdown = Redcarpet::Markdown.new(renderer, extensions_md_to_html)
    self.description = markdown.render(description_md).html_safe
  end

  def options_md_to_html
    {
      filter_html: true,
      link_attributes: {
        rel: 'nofollow',
        target: '_blank'
      }
    }
  end

  def extensions_md_to_html
    {
      space_after_headers: true,
      autolink: true
    }
  end
end
