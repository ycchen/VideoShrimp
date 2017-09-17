class Video < ApplicationRecord
  # Association declaration
  belongs_to :user

  # Paperclip attachments declaration
  has_attached_file :video_file
  has_attached_file :mp4_file
  has_attached_file :webm_file
  has_attached_file :ogg_file

  # Styles declaration makes paperclip to use imagemagick to resize image to given size
  has_attached_file :thumbnail, styles: { medium_nr: "250x150!" }

  # Paperclip requires to set attachment validators
  validates_attachment_content_type :video_file, content_type: /\Avideo/
  validates_attachment_content_type :mp4_file, content_type: /.*/
  validates_attachment_content_type :webm_file, content_type: /.*/
  validates_attachment_content_type :ogg_file, content_type: /.*/

  # We want video model always to have :video_file attachment
  validates_attachment_presence :video_file

  # Publish video makes it available
  def publish!
  	self.published = true
  	save
  end

  # Increment likes counter
  def like!
  	self.likes += 1
  	save
  end

  # Decrease likes counter
  def dislike!
  	self.likes -= 1
  	save
  end

  # Checks if all formats are already encoded, the simplest way
  def all_formates_encoded?
  	self.web_file.path && self.mp4_file.path && self.ogg_file.path ? true : false
  end


end
