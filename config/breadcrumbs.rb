  #--１階層--

crumb :root do
  link "トップページ", root_path
end


  #--２階層--

crumb :mypage do
  link "マイページ", mypage_user_path(current_user)
  parent :root
end


  #--マイページサイド欄--

crumb :notifications do
  link "お知らせ", notification_user_path(current_user)
  parent :mypage
end

crumb :todo do
  link "やることリスト", todo_user_path(current_user)
  parent :mypage
end

crumb :like do
  link "いいね！一覧", like_show_user_path(current_user)
  parent :mypage
end

crumb :forsell do
  link "出品した商品-出品中", forsell_user_path(current_user)
  parent :mypage
end

crumb :in_progress do
  link "出品した商品-取引中", in_progress_user_path(current_user)
  parent :mypage
end

crumb :completed do
  link "出品した商品-売却済み", completed_user_path(current_user)
  parent :mypage
end

crumb :all_evaluations do
  link "評価一覧", all_evaluations_user_path(current_user)
  parent :mypage
end

crumb :profile do
  link "プロフィール", profile_user_path(current_user)
  parent :mypage
end

crumb :deliveraddress do
  link "発送元・お届け先住所変更", new_product_purchase_path(current_user)
  parent :mypage
end

crumb :credit_card do
  link "支払い方法", new_user_credit_card_path(current_user)
  parent :mypage
end

crumb :identification do
  link "本人情報の登録", identification_user_path(current_user)
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_user_path(current_user)
  parent :mypage
end

  #------カテゴリー一覧-------
crumb :categories do
  link "カテゴリー一覧", category_index_path
  parent :root
end

crumb :category do |category|
  category_level1 = category.find(params[:id])
  category_level2 = category.find_by(id: category_level1.parent_id)
  category_level3 = category.find_by(id: category_level2&.parent_id)

  unless (category_level3.blank?)
    link category_level3.category, category_path(category_level2&.parent_id)
  end

  unless (category_level2.blank?)
    link category_level2.category, category_path(category_level1.parent_id)
  end

  link category_level1.category, category_path
  parent :categories
end


  #--ブランド--

crumb :brand do |brand|
  link "#{brand.brand}", brand_path(brand)
  parent :categories
end