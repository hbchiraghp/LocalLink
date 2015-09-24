# encoding: utf-8

class UploadUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  include CarrierWave::MimeTypes
  
  process :set_content_type
  storage :file

  before :store, :remember_cache_id
  after :store, :delete_tmp_dir

  def default_url  
    "default.jpg"
    #[version_name, "default.png"].compact.join('_')
    # [:thumb, "default.jpg"].compact.join('_')
  end

  # store! nil's the cache_id after it finishes so we need to remember it for deletion
  def remember_cache_id(new_file)
    @cache_id_was = cache_id
  end

  def delete_tmp_dir(new_file)
    # make sure we don't delete other things accidentally by checking the name pattern
    if @cache_id_was.present? && @cache_id_was =~ /\A[\d]{8}\-[\d]{4}\-[\d]+\-[\d]{4}\z/
      FileUtils.rm_rf(File.join(root, cache_dir, @cache_id_was))
    end
    CarrierWave.clean_cached_files!
  end

  def store_dir
    "uploads/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w(jpg jpeg png gif)
  end
  
  process :resize_to_fit => [nil, 400] 

  version :thumb do   
    process :resize_to_fill => [100,100]
  end

end

