class AdministratorsController < ApplicationController
  require 'line/bot'

  def give_point
    @all_members = User.where.not("email LIKE ?","%admin%")
  end

  def give_point_result
    # 付与ポイント
    @point = params[:point].to_i

    # 当選者の人数
    @number_of_winner = params[:number_of_winner].to_i

    members_count = User.all.count - 1

    if @point <= 0 and @number_of_winner <= 0
      redirect_to administrators_give_point_path, alert: "1以上の数値を入力して下さい"
    elsif @point <= 0
      redirect_to administrators_give_point_path, alert: "ポイントは1以上の数値を入力して下さい"
    elsif @number_of_winner <= 0 or @number_of_winner > members_count
      redirect_to administrators_give_point_path, alert: "当選者数の数値に誤りがあります"
    end

    # 管理ユーザー以外のメンバー
    all_members = User.where.not("email LIKE ?","%admin%")

    # ユーザーをシャッフル
    shuffled_members = all_members.shuffle

    @winner = []
    @winner_id = []

    # 当選者の決定
    @number_of_winner.times do |i|
      @winner << shuffled_members[i]
    end

    @winner_current_point = []
    # 当選者が、現在所有しているポイントを計算
    @winner.each do |win|
      @winner_current_point << Point.where(user_id: win).sum(:point)
    end
  end

  def give_point_result_done
    
    winner = params[:winner].map {|w| w.to_i}
    point = params[:point].to_i

    # line bot送付先
    user_ids = []
    winner.each do |person|
      add_point = Point.new(user_id: person, point: point)
      add_point.save!
      line_token = User.find(person).line_token
      user_ids << line_token if line_token
    end

    message = {
      type: 'text',
      text: "おめでとうございます！#{point}ポイントゲットしました！"
    }
    client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV['LINE_CHANNEL_SECRET']
      config.channel_token = ENV['LINE_CHANNEL_TOKEN']
    }

    user_ids.each do |user|
      response = client.push_message(user, message)
      p response
    end

    redirect_to root_path, notice: '対象者にポイントを付与しました'
  end
end
