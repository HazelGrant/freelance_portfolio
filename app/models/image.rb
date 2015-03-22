class Image < ActiveRecord::Base
  belongs_to :portfolio_piece

  has_attached_file :photo, styles: { thumb: "100x100>" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def embed_url
    self.photo.url
  end
end
