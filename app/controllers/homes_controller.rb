class HomesController < ApplicationController
  def top
    @random = Blog.order("RANDOM()").limit(3)
    @blogs = Blog.all.page(params[:page]).reverse_order
    @tags = ActsAsTaggableOn::Tag.most_used
  end
  
  def rakuten
    if params[:keyword]
      items = RakutenWebService::Ichiba::Item.search(
        keyword: params[:keyword],
        hits: 15
      )
      @items = Array.new(15)
      items.each_with_index do |item, i|
        @items[i] = Game.new(
          name: item['itemName'],
          url: item['itemUrl'],
        )
        if item['imageFlag'] == 1
          @items[i].image_url = item['mediumImageUrls'][0]
        end
      end
      logger.debug(@items.inspect)
    end
  end

  def about
  end

end
