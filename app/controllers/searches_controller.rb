class SearchesController < ApplicationController

def search
    @value = params["search"]["value"]         #データを代入
    @datas = search_for(@value)          #def search_forを実行(引数に検索ワード)
end

  private

  def match(value)
    Item.where(name: value)
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Item.where("name LIKE ?", "#{value}%")        
  end

  def backward(value)
    Item.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("name LIKE ?", "%#{value}%")
  end


  def search_for(value)
    when 'match'
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end