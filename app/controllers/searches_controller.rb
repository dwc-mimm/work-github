class SearchesController < ApplicationController

def search
    @value = params["search"]["value"]         #データを代入
    @datas = Product.search_for(@value)          #def search_forを実行(引数に検索ワード)
end
=begin
  private

  def match(value)
    Product.where(name: value)
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Product.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
    Product.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Product.where("name LIKE ?", "%#{value}%")
  end


  def search_for(value)
    when 'match'
      match(value)
    end
    when 'forward'
      forward(value)
    end
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end

=end
end

