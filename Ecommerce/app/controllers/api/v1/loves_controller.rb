class Api::V1::LovesController < Api::V1::BaseController
  skip_before_action :require_jwt
  before_action :load_user, only: %i[index unlove comment rate]

  def index
    product_favorite = @user.product_favorites.new(user_id: @user.id, product_id: params[:product_id])
    if product_favorite.save
      render json: success_message("Successfully",
                                   { product_favorite: ActiveModelSerializers::SerializableResource.new(product_favorite,
                                                                                                       each_serializer: LoveSerializer) })
    else
      render json: error_message(t("product id not_found"))
    end
  end

  def unlove
    product_favorite = @user.product_favorites.find_by(product_id: params[:product_id])
    if product_favorite
      product_favorite.delete
      render json: success_message("Successfully",
                                   { product_favorite: ActiveModelSerializers::SerializableResource.new(product_favorite,
                                                                                                       each_serializer: LoveSerializer) })
    else
      render json: error_message(t("product id not_found"))
    end
  end

  def comment
    comment = @user.comments.new(content: params[:comment], product_id: params[:product_id], user_id: @user.id)
    name = @user.username
    if comment.save
      render json: success_message("Successfully",
                                   { name: name,
                                    avatar: url_for(@user.avatar),
                                    comment: ActiveModelSerializers::SerializableResource.new(comment,
                                                                                              each_serializer: CommentSerializer) })
    else
      render json: error_message(t("comment id not_found"))
    end
  end

  def edit_comment
    comment = Comment.find_by(id: params[:comment_id])
    comment.content = params[:comment]
    if comment.save
      render json: success_message("Successfully",
                                   { comment: ActiveModelSerializers::SerializableResource.new(comment,
                                                                                              each_serializer: CommentSerializer) })
    else
      render json: error_message(t("comment id not_found"))
    end
  end

  def delete_comment
    comment = Comment.find_by(id: params[:comment_id])
    if comment
      comment.delete
      render json: success_message("Successfully")
    else
      render json: error_message(t("comment id not_found"))
    end
  end

  def rate
    data = []
    data << @user.order_items.this_status("1").pluck("product_order").map { |x| JSON.parse(x) }
    if @user.order_items.present? && data.flatten.pluck("id").include?(params[:product_id])
      rate = @user.product_rates.new(rate: params[:rate], product_id: params[:product_id], user_id: @user.id)
      product_rates = ProductRate.where(product_id: params[:product_id]).to_a
      sum_rate = product_rates.sum(&:rate)
      count_product = product_rates.size
      avg = count_product.zero? ? params[:rate] : sum_rate / count_product
      if rate.save
        render json: success_message("Successfully",
                                     { avg: avg,
                                      rate: ActiveModelSerializers::SerializableResource.new(rate,
                                                                                             each_serializer: RateSerializer) })
      end
    else
      render json: error_message("You have not purchased this product so cannot rated")
    end
  end

  private

  def load_user
    token = params[:token]
    hmac_secret = "rubyk01"
    decoded_token = JWT.decode token, hmac_secret, true, { algorithm: "HS256" }
    @user = User.find_by(api_token_digest: decoded_token.first["data"])
  end
end
