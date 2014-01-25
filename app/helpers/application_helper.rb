module ApplicationHelper
  def cover_image(product)
    if product.contents.first.attachment.content_type and product.contents.first.attachment.content_type.include?("image")
      return product.contents.first.attachment.url
    else
      return product.image.attachment.url
    end
  end

end
